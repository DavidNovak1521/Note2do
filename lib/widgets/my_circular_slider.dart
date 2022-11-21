import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../style/my_colors.dart';

class MyCircularSlider extends StatefulWidget {
  final double maxValue;
  final double initValue;
  final Color color;
  const MyCircularSlider({
    super.key,
    required this.maxValue,
    required this.initValue,
    required this.color,
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
        size: MediaQuery.of(context).size.width * 0.20,
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
          trackColor: MyColors.grey,
          progressBarColor: widget.color,
          dotColor: widget.color,
        ),
      ),
      innerWidget: ((_) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            '${widget.initValue.toInt()} / ${widget.maxValue.toInt()}',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.dark,
            ),
          ),
        );
      }),
    );
  }
}
