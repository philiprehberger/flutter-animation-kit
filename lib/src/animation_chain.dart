import 'package:flutter/material.dart';

/// Renders children one at a time with sequential fade and slide animations.
class AnimationChain extends StatefulWidget {
  /// The list of child widgets to animate in sequence.
  final List<Widget> children;

  /// Duration of each animation step.
  final Duration stepDuration;

  /// Curve applied to each animation step.
  final Curve curve;

  /// Create an [AnimationChain].
  const AnimationChain({
    super.key,
    required this.children,
    this.stepDuration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimationChain> createState() => _AnimationChainState();
}

class _AnimationChainState extends State<AnimationChain>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _fadeAnimations = [];
  final List<Animation<Offset>> _slideAnimations = [];
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.children.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: widget.stepDuration,
      );
      final curved = CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      );
      _controllers.add(controller);
      _fadeAnimations.add(curved);
      _slideAnimations.add(
        Tween<Offset>(
          begin: const Offset(0.0, 0.2),
          end: Offset.zero,
        ).animate(curved),
      );
    }
    _startNext();
  }

  void _startNext() {
    if (_currentStep >= widget.children.length) return;
    final controller = _controllers[_currentStep];
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _currentStep++;
        _startNext();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.children.length, (i) {
        if (i > _currentStep) {
          return Opacity(opacity: 0.0, child: widget.children[i]);
        }
        return FadeTransition(
          opacity: _fadeAnimations[i],
          child: SlideTransition(
            position: _slideAnimations[i],
            child: widget.children[i],
          ),
        );
      }),
    );
  }
}
