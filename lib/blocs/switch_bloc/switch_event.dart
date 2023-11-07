
import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends  Equatable {
  const SwitchEvent();
}

class SwitchOnEvent extends SwitchEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SwitchOffEvent extends SwitchEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}