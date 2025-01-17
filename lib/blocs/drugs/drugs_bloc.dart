import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drugs_event.dart';
part 'drugs_state.dart';

class DrugsBloc extends Bloc<DrugsEvent, DrugsState> {
  DrugsBloc() : super(DrugsInitial()) {
    on<DrugsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
