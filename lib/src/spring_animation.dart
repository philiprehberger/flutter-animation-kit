import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// Widget that applies spring physics to its child's position.
class SpringWidget extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Target offset for the spring animation.
  final Offset target;

  /// Stiffness of the spring. Higher values produce faster oscillation.
  final double stiffness;

  /// Damping ratio of the spring. Higher values reduce oscillation.
  final double damping;

  /// Create a [SpringWidget].
  const SpringWidget({
    super.key,
    required this.child,
    this.target = Offset.zero,
    this.stiffness = 200.0,
    this.damping = 10.0,
  });

  @override
  State<SpringWidget> createState() => _SpringWidgetState();
}

class _SpringWidgetState extends State<SpringWidget>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  double _currentX = 0.0;
  double _currentY = 0.0;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController.unbounded(vsync: this);
    _yController = AnimationController.unbounded(vsync: this);
    _xController.addListener(() {
      setState(() => _currentX = _xController.value);
    });
    _yController.addListener(() {
      setState(() => _currentY = _yController.value);
    });
    _animateToTarget();
  }

  @override
  void didUpdateWidget(covariant SpringWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.target != widget.target ||
        oldWidget.stiffness != widget.stiffness ||
        oldWidget.damping != widget.damping) {
      _animateToTarget();
    }
  }

  void _animateToTarget() {
    final springDescription = SpringDescription(
      mass: 1.0,
      stiffness: widget.stiffness,
      damping: widget.damping,
    );

    final xSimulation = SpringSimulation(
      springDescription,
      _currentX,
      widget.target.dx,
      0.0,
    );
    final ySimulation = SpringSimulation(
      springDescription,
      _currentY,
      widget.target.dy,
      0.0,
    );

    _xController.animateWith(xSimulation);
    _yController.animateWith(ySimulation);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_currentX, _currentY),
      child: widget.child,
    );
  }
}
