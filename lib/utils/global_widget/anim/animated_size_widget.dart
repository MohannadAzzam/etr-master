import 'package:flutter/widgets.dart';

class AnimatedSizeWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const AnimatedSizeWidget({
    Key key,
    @required this.child,
    @required this.duration,
  }) : super(key: key);

  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: widget.duration,
      child: widget.child,
      curve: Curves.easeInOut,
    );
  }
}