import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bridges a Bloc/Cubit's state stream to a [Listenable] so it can drive
/// go_router's `refreshListenable` — go_router has no built-in bloc support.
class BlocListenable<B extends BlocBase<Object?>> extends ChangeNotifier {
  BlocListenable(this._bloc) {
    _subscription = _bloc.stream.listen((_) => notifyListeners());
  }

  final B _bloc;
  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
