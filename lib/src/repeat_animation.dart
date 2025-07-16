import 'package:flutter/material.dart';

/// Wraps a child with a repeating opacity animation.
class RepeatAnimation extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Number of times to repeat. Null means forever.
  final int? count;

  /// Whether to ping-pong the animation (forward then backward).
  final bool reverse;

  /// Duration of one animation cycle.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Create a [RepeatAnimation].
  const RepeatAnimation({
    super.key,
    required this.child,
    this.count,
    this.reverse = false,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
  });

  @override
  State<RepeatAnimation> createState() => _RepeatAnimationState();
}

class _RepeatAnimationState extends State<RepeatAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  int _completedCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    if (widget.count == null) {
      _controller.repeat(reverse: widget.reverse);
    } else {
      _controller.addStatusListener(_onStatus);
      _controller.forward();
    }
  }

  void _onStatus(AnimationStatus status) {
    if (widget.count == null) return;

    if (widget.reverse) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _completedCount++;
        if (_completedCount < widget.count!) {
          _controller.forward();
        }
      }
    } else {
      if (status == AnimationStatus.completed) {
        _completedCount++;
        if (_completedCount < widget.count!) {
          _controller.reset();
          _controller.forward();
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
