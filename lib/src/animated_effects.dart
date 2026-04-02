import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Fade in a child widget.
class FadeIn extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of the fade animation.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Delay before the animation starts.
  final Duration delay;

  /// Create a [FadeIn] animation.
  const FadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
    this.delay = Duration.zero,
  });

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
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

/// Slide in a child widget from a given direction.
class SlideIn extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of the slide animation.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Delay before the animation starts.
  final Duration delay;

  /// Starting offset for the slide. Defaults to sliding in from the left.
  final Offset begin;

  /// Create a [SlideIn] animation.
  const SlideIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
    this.begin = const Offset(-1.0, 0.0),
  });

  /// Slide in from the left.
  const SlideIn.fromLeft({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
  }) : begin = const Offset(-1.0, 0.0);

  /// Slide in from the right.
  const SlideIn.fromRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
  }) : begin = const Offset(1.0, 0.0);

  /// Slide in from the top.
  const SlideIn.fromTop({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
  }) : begin = const Offset(0.0, -1.0);

  /// Slide in from the bottom.
  const SlideIn.fromBottom({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
  }) : begin = const Offset(0.0, 1.0);

  @override
  State<SlideIn> createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<Offset>(
      begin: widget.begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
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
    return SlideTransition(position: _animation, child: widget.child);
  }
}

/// Scale in a child widget from 0 to 1.
class ScaleIn extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of the scale animation.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Delay before the animation starts.
  final Duration delay;

  /// Create a [ScaleIn] animation.
  const ScaleIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.delay = Duration.zero,
  });

  @override
  State<ScaleIn> createState() => _ScaleInState();
}

class _ScaleInState extends State<ScaleIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
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
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}

/// Bounce in a child widget with an elastic overshoot effect.
class Bounce extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of the bounce animation.
  final Duration duration;

  /// Curve applied to the animation. Defaults to [Curves.elasticOut].
  final Curve curve;

  /// Delay before the animation starts.
  final Duration delay;

  /// Create a [Bounce] animation.
  const Bounce({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.elasticOut,
    this.delay = Duration.zero,
  });

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
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
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}

/// Shake a child widget horizontally using a sine-based offset.
class Shake extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of the shake animation.
  final Duration duration;

  /// Delay before the animation starts.
  final Duration delay;

  /// Maximum horizontal displacement in logical pixels.
  final double magnitude;

  /// Number of oscillations during the animation.
  final int oscillations;

  /// Create a [Shake] animation.
  const Shake({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.magnitude = 10.0,
    this.oscillations = 3,
  });

  @override
  State<Shake> createState() => _ShakeState();
}

class _ShakeState extends State<Shake> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
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
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        final sineValue = math.sin(
          _controller.value * widget.oscillations * 2 * math.pi,
        );
        final decay = 1.0 - _controller.value;
        return Transform.translate(
          offset: Offset(sineValue * widget.magnitude * decay, 0.0),
          child: child,
        );
      },
    );
  }
}

/// Pulse a child widget with a repeating scale animation.
class Pulse extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Duration of one pulse cycle.
  final Duration duration;

  /// Curve applied to the animation.
  final Curve curve;

  /// Minimum scale factor.
  final double minScale;

  /// Maximum scale factor.
  final double maxScale;

  /// Create a [Pulse] animation.
  const Pulse({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.minScale = 0.95,
    this.maxScale = 1.05,
  });

  @override
  State<Pulse> createState() => _PulseState();
}

class _PulseState extends State<Pulse> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
