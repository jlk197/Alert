part of 'main_bloc.dart';

enum EditMode { add, delete, update }

sealed class MainEvent {}

class LoadingEvent extends MainEvent {}

class UpdateContactEvent extends MainEvent {
  final EditMode updateMode;
  final ContactEntity contact;
  UpdateContactEvent(this.updateMode, this.contact);
}

class UpdatePillEvent extends MainEvent {
  final PillEntity pill;
  final EditMode updateMode;
  UpdatePillEvent(this.updateMode, this.pill);
}

class AddPillTakingEvent extends MainEvent {
  final Pill pill;
  final String hour;
  final bool isTaken;
  AddPillTakingEvent(
      {required this.pill, required this.hour, required this.isTaken});
}

class UpdateAddressEvent extends MainEvent {
  final AddressEntity address;
  final EditMode updateMode;
  UpdateAddressEvent(this.address, this.updateMode);
}

class LostEvent extends MainEvent {}

class SosEvent extends MainEvent {}
