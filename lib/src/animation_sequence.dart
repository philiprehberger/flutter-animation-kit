import 'package:flutter/material.dart';

/// Runs child animations in sequence with configurable delays.
class AnimationSequence extends StatefulWidget {
  /// The list of child widgets to animate in sequence.
  final List<Widget> children;

  /// Delay between each child becoming visible.
  final Duration staggerDelay;

  /// Create an [AnimationSequence].
  const AnimationSequence({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 100),
  });

  @override
  State<AnimationSequence> createState() => _AnimationSequenceState();
}

class _AnimationSequenceState extends State<AnimationSequence> {
  final List<bool> _visible = [];

  @override
  void initState() {
    super.initState();
    _visible.addAll(List.filled(widget.children.length, false));
    _staggerShow();
  }

  Future<void> _staggerShow() async {
    for (var i = 0; i < widget.children.length; i++) {
      await Future.delayed(widget.staggerDelay);
      if (mounted) {
        setState(() => _visible[i] = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.children.length, (i) {
        return AnimatedOpacity(
          opacity: _visible[i] ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: widget.children[i],
        );
      }),
    );
  }
}
