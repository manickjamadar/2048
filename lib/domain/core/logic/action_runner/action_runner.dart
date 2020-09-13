import 'package:twozerofoureight/domain/core/logic/actor/actor.dart';

class ActionRunner<T> {
  final Actor<T> actor;

  const ActionRunner(this.actor);

  T run() {
    return actor.act();
  }

  ActionRunner<T> chain(Actor<T> Function(T item) actor) {
    return ActionRunner(actor(run()));
  }
}
