import 'package:bloc/bloc.dart';
import 'package:utility/log/log.dart';

class BlocLogger extends BlocDelegate {
  static const String TAG = 'BlocLogger';
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    Log.info(TAG, 'On Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Log.info(TAG, 'On Transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    Log.warning(TAG, 'On Error: $error');
  }
}
