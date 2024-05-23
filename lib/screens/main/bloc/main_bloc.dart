import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/models/entities/pills_taking_entity.dart';
import 'package:alert/models/pill.dart';
import 'package:alert/services/address_db.dart';
import 'package:alert/services/contact_db.dart';
import 'package:alert/services/location_service.dart';
import 'package:alert/services/pills_containers_extractor.dart';
import 'package:alert/services/pills_db.dart';
import 'package:alert/services/pills_taking_db.dart';
import 'package:alert/services/ulr_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ContactDb contactDb;
  final PillsDb pillsDb;
  final PillsTakingDb pillstakingDb;
  final AddressDb addressDb;
  final PillsContainerExtractor pillsContainerExtractor;
  final LocationService locationService;
  final UrlService urlService;
  MainBloc(
      {required this.contactDb,
      required this.pillsDb,
      required this.pillstakingDb,
      required this.addressDb,
      required this.pillsContainerExtractor,
      required this.locationService,
      required this.urlService})
      : super(const MainState()) {
    on<LoadingEvent>(_onLoad);
    on<UpdateContactEvent>(_updateContact);
    on<UpdatePillEvent>(_updatePill);
    on<AddPillTakingEvent>(_addPillTaking);
    on<UpdateAddressEvent>(_updateAddress);
    on<LostEvent>(_lostHandle);
    on<SosEvent>(_sosHandle);
  }
  Future<void> _sosHandle(SosEvent event, Emitter<MainState> emitter) async {
    await urlService
        .sendSMS(state.contacts, "Potrzebuję pomocy!")
        .then((value) async {
      await urlService.callForHelp();
    });
  }

  Future<void> _lostHandle(LostEvent event, Emitter<MainState> emitter) async {
    emitter(state.copyWith(loadingState: MainLoadingState.loading));
    LocationData? location = await locationService.getLocation();
    if (location != null) {
      await urlService.sendSMS(state.contacts,
          "Zgubiłem się! Szukaj mnie na współrzędnych: ${location.latitude}, ${location.longitude}");
    }
    await MapsLauncher.launchQuery(
        '${state.address?.postalCode}, ${state.address?.city} ${state.address?.street} ${state.address?.houseNumer}');
    emitter(state.copyWith(loadingState: MainLoadingState.loaded));
  }

  Future<void> _updateAddress(
      UpdateAddressEvent event, Emitter<MainState> emitter) async {
    emitter(state.copyWith(loadingState: MainLoadingState.loading));
    switch (event.updateMode) {
      case EditMode.add:
        await addressDb.saveAddress(event.address);
        break;
      case EditMode.update:
        await addressDb.updateContact(event.address);
        break;
      case EditMode.delete:
    }
    add(LoadingEvent());
  }

  Future<void> _onLoad(LoadingEvent event, Emitter<MainState> emitter) async {
    var address = await addressDb.getAddress();
    var contacts = await contactDb.getContacts();
    var pills = await pillsDb.getPills();
    var takings = await pillstakingDb.getPills();
    var container = pillsContainerExtractor.getContainers(pills, takings);
    emitter(state.copyWith(
        address: address,
        firstTimeRunning: address == null,
        pillsEntities: pills,
        contacts: contacts,
        pills: container,
        loadingState: MainLoadingState.loaded));
  }

  Future<void> _updateContact(
      UpdateContactEvent event, Emitter<MainState> emitter) async {
    emitter(state.copyWith(loadingState: MainLoadingState.loading));
    switch (event.updateMode) {
      case EditMode.add:
        await contactDb.saveContact(event.contact);
        break;
      case EditMode.delete:
        await contactDb.deleteContact(event.contact);
        break;
      case EditMode.update:
        await contactDb.updateContact(event.contact);
        break;
    }
    add(LoadingEvent());
  }

  Future<void> _updatePill(
      UpdatePillEvent event, Emitter<MainState> emitter) async {
    switch (event.updateMode) {
      case EditMode.add:
        await pillsDb.savePill(event.pill);
        break;
      case EditMode.delete:
        await pillsDb.deletePill(event.pill);
        break;
      case EditMode.update:
        await pillsDb.updatePill(event.pill);
        break;
    }
    add(LoadingEvent());
  }

  Future<void> _addPillTaking(
      AddPillTakingEvent event, Emitter<MainState> emitter) async {
    var now = DateTime.now();
    await pillstakingDb.savePill(PillsTakingEntity(
        date: DateTime(now.year, now.month, now.day),
        hour: event.hour,
        isTaken: event.isTaken,
        pillId: event.pill.id));
    add(LoadingEvent());
  }
}
