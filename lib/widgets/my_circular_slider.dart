import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../style/my_colors.dart';
import '../style/my_texts.dart';

class MyCircularSlider extends StatefulWidget {
  final double maxValue;
  final double initValue;
  final Color color;
  final bool bigger;

  const MyCircularSlider({
    super.key,
    required this.maxValue,
    required this.initValue,
    required this.color,
    this.bigger = false,
  });

  @override
  State<MyCircularSlider> createState() => _MyCircularSliderState();
}

class _MyCircularSliderState extends State<MyCircularSlider> {
  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
      max: widget.maxValue,
      initialValue: widget.initValue,
      appearance: CircularSliderAppearance(
        size: widget.bigger
            ? MediaQuery.of(context).size.width * 0.20
            : MediaQuery.of(context).size.width * 0.15,
        angleRange: 360,
        startAngle: 270,
        animationEnabled: false,
        customWidths: CustomSliderWidths(
          progressBarWidth: 6,
          trackWidth: 6,
          handlerSize: 8,
        ),
        customColors: CustomSliderColors(
          hideShadow: true,
          trackColor: MyColors.grey2,
          progressBarColor: widget.color,
          dotColor: widget.color,
        ),
      ),
      innerWidget: ((_) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            '${widget.initValue.toInt()} / ${widget.maxValue.toInt()}',
            style: circularSliderTextStyle,
          ),
        );
      }),
    );
  }
}
