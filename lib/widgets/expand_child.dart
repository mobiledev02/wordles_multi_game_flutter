// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ExpandChild extends StatefulWidget {
  final Widget? child;
  final bool expand;
  final animationTime;
  final Curve curve;
  const ExpandChild({
    super.key,
    this.expand = true,
    this.child,
    this.curve = Curves.fastOutSlowIn,
    this.animationTime = 800,
  });

  @override
  _ExpandChildState createState() => _ExpandChildState();
}

class _ExpandChildState extends State<ExpandChild>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;
  late Tween<double> alphaTween;
  late Animation<double> _childOpacity;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.animationTime,
      ),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.curve,
    );

    alphaTween = Tween(begin: 0.0, end: 1.0);

    _childOpacity = alphaTween.animate(animation);
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandChild oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _childOpacity,
      child: SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child,
      ),
    );
  }
}
