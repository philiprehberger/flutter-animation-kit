import 'package:flutter/material.dart';

/// Fades a child in or out based on a [visible] boolean.
class AnimatedVisibility extends StatefulWidget {
  /// Whether the child should be visible.
  final bool visible;

  /// The widget to show or hide.
  final Widget child;

  /// Duration of the fade animation.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Create an [AnimatedVisibility] widget.
  const AnimatedVisibility({
    super.key,
    required this.visible,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedVisibility> createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility> {
  bool _offstage = false;

  @override
  void initState() {
    super.initState();
    _offstage = !widget.visible;
  }

  @override
  void didUpdateWidget(covariant AnimatedVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible) {
      setState(() => _offstage = false);
    }
  }

  void _onAnimationEnd() {
    if (!widget.visible) {
      setState(() => _offstage = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: _offstage,
      child: AnimatedOpacity(
        opacity: widget.visible ? 1.0 : 0.0,
        duration: widget.duration,
        curve: widget.curve,
        onEnd: _onAnimationEnd,
        child: widget.child,
      ),
    );
  }
}
