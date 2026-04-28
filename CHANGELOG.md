# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.4.0] - 2026-04-28

### Added
- `KitCurves` preset curve constants: `gentleEntry`, `elasticBounce`, `smoothExit`, `softSpring`
- `onStatusChanged` callback on `FadeIn`, `SlideIn`, `ScaleIn` for fine-grained animation status reactions

### Fixed
- Barrel re-export chain — `lib/philiprehberger_animation_kit.dart` now exports each `src/` file directly, with `lib/animation_kit.dart` re-exporting the primary barrel

## [0.3.0] - 2026-04-05

### Added
- `AnimationDelay` widget for delaying child appearance with an opacity transition

## [0.2.0] - 2026-04-02

### Added
- `reverse` parameter on `FadeIn`, `SlideIn`, `ScaleIn`, `Bounce` to run animations backward
- `onComplete` callback on `FadeIn`, `SlideIn`, `ScaleIn`, `Bounce`
- `AnimationChain` widget for sequential multi-child animations
- `RepeatAnimation` widget for looping animations with optional count
- `AnimatedVisibility` widget for boolean-driven fade in/out

## [0.1.0] - 2026-04-01

### Added
- Initial release
- FadeIn, SlideIn, ScaleIn, Bounce, Shake, and Pulse animation widgets
- AnimationSequence for staggered reveal effects
- SpringWidget for spring physics positioning
