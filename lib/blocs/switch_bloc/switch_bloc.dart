

import 'package:simple_to_do/blocs/switch_bloc/switch_event.dart';
import 'package:simple_to_do/blocs/switch_bloc/switch_state.dart';

import '../bloc_exports.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        const SwitchState(switchValue: true),
      );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(
        const SwitchState(switchValue: false),
      );
    });
  }
}

