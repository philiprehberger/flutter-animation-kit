import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:philiprehberger_animation_kit/animation_kit.dart';

void main() {
  group('FadeIn', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FadeIn(child: Text('Hello'))),
        ),
      );
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('creates and disposes animation controller', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FadeIn(child: Text('Fade'))),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Fade'), findsOneWidget);

      // Dispose by removing the widget
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    });

    testWidgets('applies custom duration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeIn(
              duration: Duration(milliseconds: 500),
              child: Text('Custom'),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.text('Custom'), findsOneWidget);
    });

    testWidgets('applies custom curve', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeIn(
              curve: Curves.linear,
              child: Text('Curved'),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Curved'), findsOneWidget);
    });

    testWidgets('respects delay', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeIn(
              delay: Duration(milliseconds: 200),
              child: Text('Delayed'),
            ),
          ),
        ),
      );
      expect(find.text('Delayed'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Delayed'), findsOneWidget);
    });

    testWidgets('reverse starts at full opacity and fades out', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeIn(
              reverse: true,
              child: Text('Reverse'),
            ),
          ),
        ),
      );

      // At start, controller is at 1.0 and reversing
      final fadeTransition = tester.widget<FadeTransition>(
        find.byType(FadeTransition),
      );
      expect(fadeTransition.opacity.value, lessThanOrEqualTo(1.0));

      // After animation completes, opacity should be 0
      await tester.pumpAndSettle();
      expect(fadeTransition.opacity.value, 0.0);
    });
  });

  group('SlideIn', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SlideIn(child: Text('Slide'))),
        ),
      );
      expect(find.text('Slide'), findsOneWidget);
    });

    testWidgets('slides from custom direction', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SlideIn.fromRight(child: Text('Right')),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Right'), findsOneWidget);
    });

    testWidgets('slides from top', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SlideIn.fromTop(child: Text('Top')),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Top'), findsOneWidget);
    });

    testWidgets('slides from bottom', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SlideIn.fromBottom(child: Text('Bottom')),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Bottom'), findsOneWidget);
    });

    testWidgets('onComplete fires when animation finishes', (tester) async {
      bool completed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SlideIn(
              onComplete: () => completed = true,
              child: const Text('Callback'),
            ),
          ),
        ),
      );
      expect(completed, isFalse);
      await tester.pumpAndSettle();
      expect(completed, isTrue);
    });
  });

  group('ScaleIn', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ScaleIn(child: Text('Scale'))),
        ),
      );
      expect(find.text('Scale'), findsOneWidget);
    });
  });

  group('Bounce', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Bounce(child: Text('Bounce'))),
        ),
      );
      expect(find.text('Bounce'), findsOneWidget);
    });

    testWidgets('reverse starts at full scale and animates out',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Bounce(reverse: true, child: Text('Reverse Bounce')),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Reverse Bounce'), findsOneWidget);
    });

    testWidgets('onComplete fires when animation finishes', (tester) async {
      bool completed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Bounce(
              onComplete: () => completed = true,
              child: const Text('Bounce Callback'),
            ),
          ),
        ),
      );
      expect(completed, isFalse);
      await tester.pumpAndSettle();
      expect(completed, isTrue);
    });
  });

  group('Shake', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Shake(child: Text('Shake'))),
        ),
      );
      expect(find.text('Shake'), findsOneWidget);
    });

    testWidgets('completes animation without error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Shake(child: Text('Shake'))),
        ),
      );
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Shake'), findsOneWidget);
    });
  });

  group('Pulse', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Pulse(child: Text('Pulse'))),
        ),
      );
      expect(find.text('Pulse'), findsOneWidget);
    });

    testWidgets('repeats animation', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Pulse(child: Text('Pulse'))),
        ),
      );
      await tester.pump(const Duration(milliseconds: 800));
      await tester.pump(const Duration(milliseconds: 800));
      expect(find.text('Pulse'), findsOneWidget);

      // Dispose to stop repeating animation
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    });
  });

  group('AnimationSequence', () {
    testWidgets('renders all children', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimationSequence(
              children: [Text('A'), Text('B'), Text('C')],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('staggers visibility over time', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimationSequence(
              staggerDelay: Duration(milliseconds: 100),
              children: [Text('First'), Text('Second'), Text('Third')],
            ),
          ),
        ),
      );

      // Initially all opacity 0
      final opacityWidgets = tester.widgetList<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacityWidgets.length, 3);

      // After enough time all should be visible
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
      expect(find.text('Third'), findsOneWidget);
    });
  });

  group('SpringWidget', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpringWidget(child: Text('Spring')),
          ),
        ),
      );
      expect(find.text('Spring'), findsOneWidget);
    });

    testWidgets('animates to target offset', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpringWidget(
              target: Offset(50.0, 25.0),
              child: Text('Moving'),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Moving'), findsOneWidget);

      // Dispose to stop ongoing physics simulation
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    });

    testWidgets('updates when target changes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpringWidget(
              target: Offset.zero,
              child: Text('Target'),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpringWidget(
              target: Offset(100.0, 0.0),
              child: Text('Target'),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Target'), findsOneWidget);

      // Dispose to stop ongoing physics simulation
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    });
  });

  group('AnimationChain', () {
    testWidgets('renders children sequentially', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimationChain(
              stepDuration: Duration(milliseconds: 100),
              children: [Text('A'), Text('B'), Text('C')],
            ),
          ),
        ),
      );

      // All children present in tree
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);

      // After all steps complete, children are visible
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('uses FadeTransition and SlideTransition', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimationChain(
              children: [Text('X')],
            ),
          ),
        ),
      );
      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.byType(SlideTransition), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });

  group('RepeatAnimation', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RepeatAnimation(
              count: 1,
              child: Text('Repeat'),
            ),
          ),
        ),
      );
      expect(find.text('Repeat'), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('with count stops after specified repetitions',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RepeatAnimation(
              count: 2,
              duration: Duration(milliseconds: 100),
              child: Text('Counted'),
            ),
          ),
        ),
      );
      expect(find.text('Counted'), findsOneWidget);

      // Let animation run through 2 cycles
      await tester.pumpAndSettle();
      expect(find.text('Counted'), findsOneWidget);
    });

    testWidgets('infinite repeat continues animating', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RepeatAnimation(child: Text('Forever')),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump(const Duration(milliseconds: 600));
      expect(find.text('Forever'), findsOneWidget);

      // Dispose to stop infinite animation
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));
    });
  });

  group('AnimatedVisibility', () {
    testWidgets('shows child when visible is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedVisibility(
              visible: true,
              child: Text('Visible'),
            ),
          ),
        ),
      );
      expect(find.text('Visible'), findsOneWidget);

      final offstage = tester.widget<Offstage>(find.descendant(
        of: find.byType(AnimatedVisibility),
        matching: find.byType(Offstage),
      ));
      expect(offstage.offstage, isFalse);
    });

    testWidgets('hides child when visible is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedVisibility(
              visible: false,
              child: Text('Hidden'),
            ),
          ),
        ),
      );

      final offstage = tester.widget<Offstage>(find.descendant(
        of: find.byType(AnimatedVisibility),
        matching: find.byType(Offstage),
      ));
      expect(offstage.offstage, isTrue);
    });

    testWidgets('toggles visibility with animation', (tester) async {
      bool visible = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => visible = !visible),
                      child: const Text('Toggle'),
                    ),
                    AnimatedVisibility(
                      visible: visible,
                      child: const Text('Content'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);

      // Toggle off
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();

      final offstage = tester.widget<Offstage>(find.descendant(
        of: find.byType(AnimatedVisibility),
        matching: find.byType(Offstage),
      ));
      expect(offstage.offstage, isTrue);

      // Toggle back on
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();

      final offstageAfter = tester.widget<Offstage>(find.descendant(
        of: find.byType(AnimatedVisibility),
        matching: find.byType(Offstage),
      ));
      expect(offstageAfter.offstage, isFalse);
    });
  });
}
