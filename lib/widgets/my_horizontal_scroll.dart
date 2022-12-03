import 'package:flutter/material.dart';

import '../style/my_texts.dart';

class MyHorizontalScroll extends StatelessWidget {
  final int count;
  final Color color;
  final List<String> labels;

  const MyHorizontalScroll({
    super.key,
    required this.count,
    required this.color,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 2 / 5,
      child: ListView.builder(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 2 / 5,
          height: MediaQuery.of(context).size.width * 2 / 5,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            labels[index],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: horizontalScrollTextStyle,
          ),
        ),
      ),
    );
  }
}
