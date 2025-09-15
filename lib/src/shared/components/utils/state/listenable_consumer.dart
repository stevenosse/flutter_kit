import 'package:flutter/material.dart';

/// A widget that combines the functionality of a listener and builder for a [Listenable] object.
///
/// This widget is optimized to both listen for changes in a [Listenable] and rebuild
/// the UI when those changes occur. It's similar to combining [ValueListenableBuilder]
/// with a listener pattern, but in a single widget.
///
/// The [listener] callback is invoked whenever the [listenable] notifies its listeners,
/// but outside of the build phase to avoid unnecessary rebuilds.
///
/// The [builder] callback is used to build the widget tree and is called when the
/// [listenable] notifies its listeners.
class ListenableConsumer<T extends Listenable> extends StatefulWidget {
  /// The listenable object to listen to.
  final T listenable;

  /// Builder function that constructs the widget tree.
  final Widget Function(BuildContext context, T listenable) builder;

  /// Listener function that is called when the listenable notifies its listeners.
  /// This is called before the widget rebuilds.
  final void Function(BuildContext context, T listenable) listener;

  const ListenableConsumer({
    super.key,
    required this.listenable,
    required this.builder,
    required this.listener,
  });

  @override
  State<ListenableConsumer<T>> createState() => _ListenableConsumerState<T>();
}

class _ListenableConsumerState<T extends Listenable> extends State<ListenableConsumer<T>> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(_handleChange);
    _callListener();
  }

  @override
  void didUpdateWidget(ListenableConsumer<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenable != widget.listenable) {
      oldWidget.listenable.removeListener(_handleChange);
      widget.listenable.addListener(_handleChange);
      _callListener();
    }
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_handleChange);
    super.dispose();
  }

  void _callListener() {
    if (mounted) {
      widget.listener(context, widget.listenable);
    }
  }

  void _handleChange() {
    _callListener();
    if (mounted) {
      Future.microtask(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.listenable);
  }
}
