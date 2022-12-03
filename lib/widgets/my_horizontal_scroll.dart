import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/deleted_notes.dart';
import '../style/my_colors.dart';
import '../style/my_texts.dart';

class MyHorizontalScroll extends StatelessWidget {
  final int count;
  final Color color;
  final List<String> labels;
  final List<String> ids;
  final IconData icon;

  const MyHorizontalScroll({
    super.key,
    required this.count,
    required this.color,
    required this.labels,
    required this.ids,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 2 / 5,
      child: ListView.builder(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (color == MyColors.grey3)
              ? () => Provider.of<DeletedNotes>(context, listen: false)
                  .restoreNote(context, ids[index])
              : null,
          child: Container(
            width: MediaQuery.of(context).size.width * 2 / 5,
            height: MediaQuery.of(context).size.width * 2 / 5,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labels[index],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: horizontalScrollTextStyle,
                ),
                Icon(
                  icon,
                  size: 24,
                  color: MyColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
