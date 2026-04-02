// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:philiprehberger_animation_kit/animation_kit.dart';

/// Basic fade-in example.
///
/// ```dart
/// FadeIn(
///   duration: Duration(milliseconds: 500),
///   curve: Curves.easeIn,
///   child: Text('Hello, World!'),
/// )
/// ```
void _fadeInExample() {}

/// Slide in from various directions.
///
/// ```dart
/// // Slide from left (default)
/// SlideIn(child: Text('From left'))
///
/// // Slide from right
/// SlideIn.fromRight(child: Text('From right'))
///
/// // Slide from top
/// SlideIn.fromTop(child: Text('From top'))
///
/// // Slide from bottom with custom duration
/// SlideIn.fromBottom(
///   duration: Duration(milliseconds: 500),
///   child: Text('From bottom'),
/// )
/// ```
void _slideInExample() {}

/// Scale in from zero to full size.
///
/// ```dart
/// ScaleIn(
///   duration: Duration(milliseconds: 400),
///   curve: Curves.easeOutBack,
///   child: Icon(Icons.star, size: 48),
/// )
/// ```
void _scaleInExample() {}

/// Bounce with elastic overshoot.
///
/// ```dart
/// Bounce(
///   duration: Duration(milliseconds: 800),
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.blue,
///     child: Center(child: Text('Boing!')),
///   ),
/// )
/// ```
void _bounceExample() {}

/// Shake widget horizontally.
///
/// ```dart
/// Shake(
///   magnitude: 12.0,
///   oscillations: 4,
///   child: Text('Error!', style: TextStyle(color: Colors.red)),
/// )
/// ```
void _shakeExample() {}

/// Repeating pulse scale animation.
///
/// ```dart
/// Pulse(
///   minScale: 0.9,
///   maxScale: 1.1,
///   duration: Duration(milliseconds: 1000),
///   child: Icon(Icons.favorite, color: Colors.red, size: 48),
/// )
/// ```
void _pulseExample() {}

/// Staggered animation sequence.
///
/// ```dart
/// AnimationSequence(
///   staggerDelay: Duration(milliseconds: 150),
///   children: [
///     Text('First'),
///     Text('Second'),
///     Text('Third'),
///   ],
/// )
/// ```
void _sequenceExample() {}

/// Spring physics positioning.
///
/// ```dart
/// SpringWidget(
///   target: Offset(100.0, 50.0),
///   stiffness: 300.0,
///   damping: 15.0,
///   child: Container(
///     width: 60,
///     height: 60,
///     decoration: BoxDecoration(
///       color: Colors.green,
///       shape: BoxShape.circle,
///     ),
///   ),
/// )
/// ```
void _springExample() {}

/// Full app example combining multiple animations.
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Animation Kit Demo')),
        body: const Padding(
          padding: EdgeInsets.all(24.0),
          child: AnimationSequence(
            staggerDelay: Duration(milliseconds: 200),
            children: [
              FadeIn(child: Text('Fade in')),
              SlideIn.fromLeft(child: Text('Slide from left')),
              ScaleIn(child: Text('Scale in')),
              Bounce(child: Text('Bounce')),
            ],
          ),
        ),
      ),
    );
  }
}
