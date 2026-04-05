import 'package:flutter/material.dart';

/// Delays the appearance of a child widget by a configurable duration,
/// then reveals it with an opacity transition.
///
/// Useful for staggering animations in a list or layout.
class AnimationDelay extends StatefulWidget {
  /// The widget to reveal after the delay.
  final Widget child;

  /// How long to wait before starting the opacity transition.
  final Duration delay;

  /// Duration of the fade-in transition after the delay elapses.
  final Duration duration;

  /// Curve applied to the opacity transition.
  final Curve curve;

  /// Called when the fade-in transition completes.
  final VoidCallback? onComplete;

  /// Create an [AnimationDelay] widget.
  const AnimationDelay({
    super.key,
    required this.child,
    required this.delay,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
    this.onComplete,
  });

  @override
  State<AnimationDelay> createState() => _AnimationDelayState();
}

class _AnimationDelayState extends State<AnimationDelay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    if (widget.onComplete != null) {
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete!();
        }
      });
    }
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
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
