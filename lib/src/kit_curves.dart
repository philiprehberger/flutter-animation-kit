import 'package:flutter/animation.dart';

/// Preset animation curves for common motion design needs.
///
/// Use these alongside the standard [Curves] from Flutter when you want
/// expressive entry, exit, and spring-like motion without hand-tuning bezier
/// control points.
class KitCurves {
  const KitCurves._();

  /// A gentle, decelerating entry curve (easeOutExpo-like).
  ///
  /// Best for content reveals where the element should arrive softly without
  /// any overshoot. Pairs well with `FadeIn` and `SlideIn`.
  static const Curve gentleEntry = Cubic(0.16, 1, 0.3, 1);

  /// An elastic, bouncy curve that overshoots and settles.
  ///
  /// Useful for playful attention-grabbing reveals such as success badges,
  /// achievement icons, or callouts. Equivalent to [Curves.elasticOut].
  static const Curve elasticBounce = Curves.elasticOut;

  /// A smooth, accelerating exit curve (easeInQuint-like).
  ///
  /// Best for elements leaving the screen — they ease in slowly, then
  /// accelerate away. Pairs well with reverse animations.
  static const Curve smoothExit = Cubic(0.7, 0, 0.84, 0);

  /// A spring-like curve with subtle overshoot, mimicking a soft physics
  /// spring without the cost of a real simulation.
  ///
  /// Useful for buttons, cards, and toggle states where you want a tactile
  /// feel but not full elastic bounce.
  static const Curve softSpring = Cubic(0.34, 1.56, 0.64, 1);
}
