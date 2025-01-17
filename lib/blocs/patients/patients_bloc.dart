import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc() : super(PatientsInitial());

  @override
  Stream<PatientsState> mapEventToState(
    PatientsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
