import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }
class CustomFadeShort extends StatelessWidget {
  final double delay;
  final Widget child;
  dynamic tween ;

  CustomFadeShort(this.delay, {this.child}){
  tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
        Duration(milliseconds: 250),)
      ..add(
        AniProps.translateY,
        Tween(begin: 30.0, end: 1.0),
        Duration(milliseconds: 250),
      );
  }


  @override
  Widget build(BuildContext context) {
    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (150 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)), child: child),
      ),
    );
  }
}
