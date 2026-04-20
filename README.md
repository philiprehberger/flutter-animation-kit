# philiprehberger_animation_kit

[![Tests](https://github.com/philiprehberger/flutter-animation-kit/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/flutter-animation-kit/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/philiprehberger_animation_kit.svg)](https://pub.dev/packages/philiprehberger_animation_kit)
[![Last updated](https://img.shields.io/github/last-commit/philiprehberger/flutter-animation-kit)](https://github.com/philiprehberger/flutter-animation-kit/commits/main)

Prebuilt animation primitives with timeline sequencing and spring physics

## Requirements

- Flutter >= 3.24
- Dart >= 3.6

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  philiprehberger_animation_kit: ^0.3.0
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:philiprehberger_animation_kit/animation_kit.dart';

FadeIn(
  duration: Duration(milliseconds: 500),
  child: Text('Hello, World!'),
)
```

### Slide In

```dart
SlideIn.fromRight(child: Text('From right'))
SlideIn.fromBottom(
  duration: Duration(milliseconds: 500),
  child: Text('From bottom'),
)
```

### Scale In

```dart
ScaleIn(
  curve: Curves.easeOutBack,
  child: Icon(Icons.star, size: 48),
)
```

### Bounce

```dart
Bounce(
  duration: Duration(milliseconds: 800),
  child: Text('Boing!'),
)
```

### Shake

```dart
Shake(
  magnitude: 12.0,
  oscillations: 4,
  child: Text('Error!', style: TextStyle(color: Colors.red)),
)
```

### Pulse

```dart
Pulse(
  minScale: 0.9,
  maxScale: 1.1,
  child: Icon(Icons.favorite, color: Colors.red, size: 48),
)
```

### Reverse & onComplete

```dart
FadeIn(
  reverse: true,
  onComplete: () => print('Done!'),
  child: Text('Fading out'),
)
```

### Animation Chain

```dart
AnimationChain(
  stepDuration: Duration(milliseconds: 400),
  children: [
    Text('Step 1'),
    Text('Step 2'),
    Text('Step 3'),
  ],
)
```

### Repeat Animation

```dart
RepeatAnimation(
  count: 3,
  reverse: true,
  child: Icon(Icons.notifications, size: 32),
)
```

### Animated Visibility

```dart
AnimatedVisibility(
  visible: _isVisible,
  duration: Duration(milliseconds: 300),
  child: Text('Now you see me'),
)
```

### Animation Sequence

```dart
AnimationSequence(
  staggerDelay: Duration(milliseconds: 150),
  children: [
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

### Animation Delay

```dart
AnimationDelay(
  delay: Duration(milliseconds: 500),
  duration: Duration(milliseconds: 300),
  child: Text('Appears after 500ms'),
)
```

### Spring Physics

```dart
SpringWidget(
  target: Offset(100.0, 50.0),
  stiffness: 300.0,
  damping: 15.0,
  child: Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.green,
      shape: BoxShape.circle,
    ),
  ),
)
```

## API

| Widget | Description |
|--------|-------------|
| `FadeIn` | Fade in a child widget with configurable duration, curve, and delay |
| `SlideIn` | Slide in from a direction (left, right, top, bottom) |
| `ScaleIn` | Scale from 0 to 1 with configurable curve |
| `Bounce` | Scale with elastic overshoot (Curves.elasticOut) |
| `Shake` | Horizontal shake using sine-based offset with decay |
| `Pulse` | Repeating scale animation (grows and shrinks) |
| `AnimationChain` | Sequential multi-child animations with fade and slide |
| `RepeatAnimation` | Looping opacity animation with optional repeat count |
| `AnimatedVisibility` | Boolean-driven fade in/out with layout removal |
| `AnimationDelay` | Delays child appearance then fades in with configurable duration |
| `AnimationSequence` | Staggered reveal of child widgets in sequence |
| `SpringWidget` | Spring physics positioning with configurable stiffness and damping |

## Development

```bash
flutter pub get
flutter analyze
flutter test
```

## Support

If you find this project useful:

⭐ [Star the repo](https://github.com/philiprehberger/flutter-animation-kit)

🐛 [Report issues](https://github.com/philiprehberger/flutter-animation-kit/issues?q=is%3Aissue+is%3Aopen+label%3Abug)

💡 [Suggest features](https://github.com/philiprehberger/flutter-animation-kit/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)

❤️ [Sponsor development](https://github.com/sponsors/philiprehberger)

🌐 [All Open Source Projects](https://philiprehberger.com/open-source-packages)

💻 [GitHub Profile](https://github.com/philiprehberger)

🔗 [LinkedIn Profile](https://www.linkedin.com/in/philiprehberger)

## License

[MIT](LICENSE)
