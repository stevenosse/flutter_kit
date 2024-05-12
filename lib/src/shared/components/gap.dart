import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final bool _useSliver;

  final double? width;
  final double? height;

  const Gap.vertical({
    super.key,
    required this.height,
  })  : width = null,
        _useSliver = false;

  const Gap.horizontal({
    super.key,
    required this.width,
  })  : height = null,
        _useSliver = false;

  const Gap.all({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        _useSliver = false;

  const Gap.vSliver({
    super.key,
    required this.height,
  })  : width = null,
        _useSliver = true;

  const Gap.hSliver({
    super.key,
    required this.width,
  })  : height = null,
        _useSliver = true;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(width: width, height: height);

    return _useSliver ? SliverToBoxAdapter(child: child) : child;
  }
}
