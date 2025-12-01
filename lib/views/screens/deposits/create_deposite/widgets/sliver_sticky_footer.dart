import 'package:flutter/material.dart';

class SliverStickyFooter extends StatelessWidget {
  const SliverStickyFooter({
    super.key,
    this.bottomPadding,
    required this.children,
  });

  ///give it as row double don't use .h it already used
  final double? bottomPadding;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding ?? 30),
          child: Column(
            mainAxisSize: MainAxisSize.min, // More appropriate
            children: children,
          ),
        ),
      ),
    );
  }
}
