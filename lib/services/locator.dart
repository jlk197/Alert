import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/services/address_db.dart';
import 'package:alert/services/contact_db.dart';
import 'package:alert/services/local_db.dart';
import 'package:alert/services/location_service.dart';
import 'package:alert/services/pills_containers_extractor.dart';
import 'package:alert/services/pills_db.dart';
import 'package:alert/services/pills_taking_db.dart';
import 'package:alert/services/ulr_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<LocalDb>(() => LocalDb());
  locator.registerLazySingleton<ContactDb>(
      () => ContactDb(locator.get<LocalDb>()));
  locator.registerLazySingleton<PillsDb>(() => PillsDb(locator.get<LocalDb>()));
  locator.registerLazySingleton<PillsTakingDb>(
      () => PillsTakingDb(locator.get<LocalDb>()));
  locator.registerLazySingleton<AddressDb>(
      () => AddressDb(locator.get<LocalDb>()));
  locator.registerLazySingleton<PillsContainerExtractor>(
      () => PillsContainerExtractor());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<UrlService>(() => UrlService());
  locator.registerLazySingleton<MainBloc>(() => MainBloc(
        contactDb: locator.get<ContactDb>(),
        pillsDb: locator.get<PillsDb>(),
        pillstakingDb: locator.get<PillsTakingDb>(),
        addressDb: locator.get<AddressDb>(),
        pillsContainerExtractor: locator.get<PillsContainerExtractor>(),
        locationService: locator.get<LocationService>(),
        urlService: locator.get<UrlService>(),
      ));
}
