import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/goal_item.dart';
import '../widgets/my_circular_slider.dart';
import '../providers/goals.dart';

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
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                children: [
                  const Expanded(
                    child: MyTitleText(text: 'Goals'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: (goals.isNotEmpty)
                          ? MyCircularSlider(
                              initValue: numberOfDone.toDouble(),
                              maxValue: goals.length.toDouble(),
                              color: MyColors.tertiaryBlue,
                            )
                          : Text(
                              'No goals!\nCreate one.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                color: MyColors.dark,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: goals.length,
              (context, index) => Dismissible(
                key: ValueKey(goals[index].id),
                onDismissed: (direction) =>
                    Provider.of<Goals>(context, listen: false)
                        .removeGoal(goals[index].id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ChangeNotifierProvider.value(
                    value: goals[index],
                    child: const GoalItem(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
