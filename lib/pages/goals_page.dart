import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/goal_item.dart';

class GoalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> tempGoals = [
    {
      'text': 'Első cél',
      'isDone': true,
    },
    {
      'text': 'Második, de már hosszabb cél',
      'isDone': true,
    },
    {
      'text': 'Harmadik, de még az előzőnél is hosszabb cél tesztelni',
      'isDone': false,
    },
    {
      'text':
          'Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. ',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 5',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 6',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 7',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 8',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 9',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 10',
      'isDone': false,
    },
  ];

  GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Goals'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: GoalItem(
                  text: tempGoals[index]['text'],
                  isDone: tempGoals[index]['isDone'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
