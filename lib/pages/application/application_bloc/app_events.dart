abstract class AppEvent {
  const AppEvent();
}

class TriggerApEvent extends AppEvent {
  final int index;

  TriggerApEvent(this.index) : super();
}
