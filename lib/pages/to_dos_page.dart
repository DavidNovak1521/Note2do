import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
import '../style/my_texts.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/to_do_item.dart';
import '../widgets/my_circular_slider.dart';
import '../providers/to_dos.dart';

class ToDosPage extends StatelessWidget {
  const ToDosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toDosDay = Provider.of<ToDos>(context).toDosDay;
    final toDosWeek = Provider.of<ToDos>(context).toDosWeek;
    final toDosMonth = Provider.of<ToDos>(context).toDosMonth;
    final int numberOfDoneDay = toDosDay.where((todo) => todo.isDone).length;
    final int numberOfDoneWeek = toDosWeek.where((todo) => todo.isDone).length;
    final int numberOfDoneMonth =
        toDosMonth.where((todo) => todo.isDone).length;

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                children: [
                  const MyTitleText(text: 'To do\'s'),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: (toDosDay.isNotEmpty ||
                              toDosDay.isNotEmpty ||
                              toDosMonth.isNotEmpty)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                toDosDay.isNotEmpty
                                    ? MyCircularSlider(
                                        initValue: numberOfDoneDay.toDouble(),
                                        maxValue: toDosDay.length.toDouble(),
                                        color: MyColors.secondaryBlue,
                                      )
                                    : Container(),
                                toDosWeek.isNotEmpty
                                    ? MyCircularSlider(
                                        initValue: numberOfDoneWeek.toDouble(),
                                        maxValue: toDosWeek.length.toDouble(),
                                        color: MyColors.secondaryBlue,
                                      )
                                    : Container(),
                                toDosMonth.isNotEmpty
                                    ? MyCircularSlider(
                                        initValue: numberOfDoneMonth.toDouble(),
                                        maxValue: toDosMonth.length.toDouble(),
                                        color: MyColors.secondaryBlue,
                                      )
                                    : Container(),
                              ],
                            )
                          : Text(
                              'No to do\'s!\nCreate one.',
                              textAlign: TextAlign.center,
                              style: missingMessageTextStyle,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // DAY
          SliverToBoxAdapter(
            child: (toDosDay.isNotEmpty)
                ? Row(
                    children: [
                      Text(
                        'Today',
                        style: toDoTypeTextStyle,
                      ),
                      Expanded(
                        child: Divider(
                          height: 30,
                          color: MyColors.dark,
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: toDosDay.length,
              (context, index) => Slidable(
                key: ValueKey(toDosDay[index].id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () =>
                        Provider.of<ToDos>(context, listen: false)
                            .removeToDo(toDosDay[index].id),
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          Provider.of<ToDos>(context, listen: false)
                              .removeToDo(toDosDay[index].id),
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
                    value: toDosDay[index],
                    child: const ToDoItem(),
                  ),
                ),
              ),
            ),
          ),
          // WEEK
          SliverToBoxAdapter(
            child: (toDosWeek.isNotEmpty)
                ? Row(
                    children: [
                      Text(
                        'This week',
                        style: toDoTypeTextStyle,
                      ),
                      Expanded(
                        child: Divider(
                          height: 30,
                          color: MyColors.dark,
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: toDosWeek.length,
              (context, index) => Slidable(
                key: ValueKey(toDosWeek[index].id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () =>
                        Provider.of<ToDos>(context, listen: false)
                            .removeToDo(toDosWeek[index].id),
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          Provider.of<ToDos>(context, listen: false)
                              .removeToDo(toDosWeek[index].id),
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
                    value: toDosWeek[index],
                    child: const ToDoItem(),
                  ),
                ),
              ),
            ),
          ),
          // MONTH
          SliverToBoxAdapter(
            child: (toDosMonth.isNotEmpty)
                ? Row(
                    children: [
                      Text(
                        'This month',
                        style: toDoTypeTextStyle,
                      ),
                      Expanded(
                        child: Divider(
                          height: 30,
                          color: MyColors.dark,
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: toDosMonth.length,
              (context, index) => Slidable(
                key: ValueKey(toDosMonth[index].id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () =>
                        Provider.of<ToDos>(context, listen: false)
                            .removeToDo(toDosMonth[index].id),
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          Provider.of<ToDos>(context, listen: false)
                              .removeToDo(toDosMonth[index].id),
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
                    value: toDosMonth[index],
                    child: const ToDoItem(),
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
