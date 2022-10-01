import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CryptoListItemAnimationWrapper extends StatefulWidget {
  const CryptoListItemAnimationWrapper({
    Key? key,
    required this.index,
    this.keepAlive = false,
    required this.child,
  }) : super(key: key);

  final int index;
  final bool keepAlive;
  final Widget child;

  @override
  State<CryptoListItemAnimationWrapper> createState() =>
      _CryptoListItemAnimationWrapperState();
}

class _CryptoListItemAnimationWrapperState
    extends State<CryptoListItemAnimationWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> opacityAnimation;
  late final Animation<double> leftAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0.5, 1, curve: Curves.easeIn)),
    );

    leftAnimation = Tween<double>(begin: -150, end: 0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0, 1, curve: Curves.easeIn)),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: (widget.index % 4) * 250), () {
        animationController.forward();
      });
    });
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
            offset: Offset(leftAnimation.value, 0),
            child: Opacity(opacity: opacityAnimation.value, child: child!));
      },
      child: widget.child,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
