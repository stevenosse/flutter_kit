import 'package:flutter/foundation.dart';

/// Base class for application view models.
///
/// A view model exposes UI state and notifies listeners when the state changes.
abstract class ViewModel<T> extends ChangeNotifier {
  ViewModel(this.state);

  T state;

  /// Update the view model state and notify listeners.
  @protected
  void updateState(T newState) {
    state = newState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
