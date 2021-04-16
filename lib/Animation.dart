// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// class FadeAnimation extends StatelessWidget {
//   final double dilay;
//   final Widget child;

//   const FadeAnimation({this.dilay, this.child});

//   @override
//   Widget build(BuildContext context) {
//     final _tween = MultiTrackTween([
//       Track('opacity').add(Duration(seconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translateY").add(
//           Duration(seconds: 500), Tween(begin: -30.0, end: 0.0),
//           curve: Curves.ease),
//     ]);
//     return ControlledAnimation(
//         delay: Duration(milliseconds: (500 * dilay).round()),
//         duration: _tween.duration,
//         tween: _tween,
//         child: child,
//         builderWithChild: (context, child, animation) => Opacity(
//               opacity: animation["opacity"],
//               child: Transform.translate(
//                 offset: Offset(0, animation["translateY"]),
//                 child: child,
//               ),
//             ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
