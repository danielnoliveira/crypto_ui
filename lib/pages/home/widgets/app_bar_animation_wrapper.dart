import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarAnimationWrapper extends StatefulWidget {
  const AppBarAnimationWrapper({
    Key? key,
    required this.keepAlive,
    required this.child,
  }) : super(key: key);

  final bool keepAlive;
  final Widget child;

  @override
  State<AppBarAnimationWrapper> createState() => _AppBarAnimationWrapperState();
}

class _AppBarAnimationWrapperState extends State<AppBarAnimationWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> opacityAnimation;
  late final Animation<double> topAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0, 0.75, curve: Curves.easeIn)),
    );

    topAnimation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0, 0.75, curve: Curves.easeIn)),
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
            offset: Offset(0, topAnimation.value),
            child: Opacity(opacity: opacityAnimation.value, child: child!));
      },
      child: widget.child,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
