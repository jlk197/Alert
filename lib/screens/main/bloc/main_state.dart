part of 'main_bloc.dart';

enum MainLoadingState { loading, loaded }

class MainState extends Equatable {
  final MainLoadingState loadingState;
  final List<ContactEntity> contacts;
  final List<PillEntity> pillsEntities;
  final Map<String, List<Pill>> pills;
  final bool firstTimeRunning;
  final AddressEntity? address;

  const MainState(
      {this.loadingState = MainLoadingState.loading,
      this.contacts = const [],
      this.pills = const {},
      this.firstTimeRunning = false,
      this.address,
      this.pillsEntities = const []});

  MainState copyWith(
      {MainLoadingState? loadingState,
      List<ContactEntity>? contacts,
      Map<String, List<Pill>>? pills,
      bool? firstTimeRunning,
      AddressEntity? address,
      List<PillEntity>? pillsEntities}) {
    return MainState(
        loadingState: loadingState ?? this.loadingState,
        contacts: contacts ?? this.contacts,
        pills: pills ?? this.pills,
        firstTimeRunning: firstTimeRunning ?? this.firstTimeRunning,
        address: address ?? this.address,
        pillsEntities: pillsEntities ?? this.pillsEntities);
  }

  @override
  List<Object?> get props =>
      [loadingState, contacts, pills, firstTimeRunning, address, pillsEntities];
}
