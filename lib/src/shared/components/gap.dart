import 'package:flutter/material.dart';

abstract class Gap extends StatelessWidget {
  const Gap({super.key});

  const factory Gap.horizontal({
    Key? key,
    required double width,
  }) = _HGap;

  const factory Gap.vertical({
    Key? key,
    required double height,
  }) = _VGap;

  const factory Gap.horizontalSliver({
    Key? key,
    required double width,
  }) = _HGapSliver;

  const factory Gap.verticalSliver({
    Key? key,
    required double height,
  }) = _VGapSliver;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class _VGap extends Gap {
  const _VGap({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class _VGapSliver extends StatelessWidget implements _VGap {
  const _VGapSliver({
    super.key,
    required this.height,
  });

  @override
  final double height;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(child: SizedBox(height: height));
}

class _HGap extends Gap {
  const _HGap({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

class _HGapSliver extends StatelessWidget implements _HGap {
  const _HGapSliver({
    super.key,
    required this.width,
  });

  @override
  final double width;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(child: SizedBox(width: width));
}
