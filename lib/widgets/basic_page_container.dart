import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class BasicPageContainer extends StatelessWidget {
  final bool needsMask;
  final Widget child;

  const BasicPageContainer({
    super.key,
    required this.child,
    this.needsMask = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: needsMask
          ? ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  MyColors.white,
                ],
                stops: const [0.0, 0.95, 1.0],
              ).createShader(bounds),
              blendMode: BlendMode.dstOut,
              child: child,
            )
          : child,
    );
  }
}
