
import 'package:equatable/equatable.dart';

 class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});
  @override
  // TODO: implement props
  List<Object?> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue}) : super(switchValue: switchValue);

}