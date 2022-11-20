import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/goal_item.dart';
import '../widgets/my_circular_slider.dart';
import '../providers/goals.dart';

// ignore: must_be_immutable
class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = Provider.of<Goals>(context).goals;
    final int numberOfDone = goals.where((goal) => goal.isDone).length;

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  const Expanded(
                    child: MyTitleText(text: 'Goals'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: MyCircularSlider(
                        initValue: numberOfDone.toDouble(),
                        maxValue: goals.length.toDouble(),
                        color: MyColors.tertiaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: GoalItem(
                  text: goals[index].text,
                  isDone: goals[index].isDone,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
