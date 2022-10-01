import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorizontalContentAnimationWrapper extends StatefulWidget {
  const HorizontalContentAnimationWrapper({
    Key? key,
    this.keepAlive = false,
    required this.horizontalValue,
    required this.child,
  }) : super(key: key);

  final bool keepAlive;
  final double horizontalValue;
  final Widget child;

  @override
  State<HorizontalContentAnimationWrapper> createState() =>
      _HorizontalContentAnimationWrapperState();
}

class _HorizontalContentAnimationWrapperState
    extends State<HorizontalContentAnimationWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> opacityAnimation;
  late final Animation<double> horizontalAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0.4, 0.75, curve: Curves.easeIn)),
    );

    horizontalAnimation =
        Tween<double>(begin: widget.horizontalValue, end: 0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0.4, 0.75, curve: Curves.easeIn)),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(horizontalAnimation.value, 0),
            child: Opacity(opacity: opacityAnimation.value, child: child!));
      },
      child: widget.child,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
