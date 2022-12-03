import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../providers/deleted_notes.dart';
import '../style/my_colors.dart';
import '../style/my_texts.dart';
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
    final deletedNotes = Provider.of<DeletedNotes>(context, listen: false);
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
                              bigger: true,
                            )
                          : Text(
                              'No goals!\nCreate one.',
                              textAlign: TextAlign.center,
                              style: missingMessageTextStyle,
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
              (context, index) => Slidable(
                key: ValueKey(goals[index].id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      deletedNotes.addNote(goals[index]);
                      Provider.of<Goals>(context, listen: false)
                          .removeGoal(goals[index].id);
                    },
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        deletedNotes.addNote(goals[index]);
                        Provider.of<Goals>(context, listen: false)
                            .removeGoal(goals[index].id);
                      },
                      foregroundColor: MyColors.deleteRed,
                      icon: Icons.delete_rounded,
                      label: 'Delete',
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  child: ChangeNotifierProvider.value(
                    value: goals[index],
                    child: const GoalItem(),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 30,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
