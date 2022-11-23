import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
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
          // DAY
          SliverToBoxAdapter(
            child: (toDosDay.isNotEmpty)
                ? Row(
                    children: [
                      Text(
                        'Today',
                        style: GoogleFonts.montserrat(
                          color: MyColors.dark,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
              (context, index) => Dismissible(
                key: ValueKey(toDosDay[index].id),
                onDismissed: (direction) =>
                    Provider.of<ToDos>(context, listen: false)
                        .removeToDo(toDosDay[index].id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
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
                        style: GoogleFonts.montserrat(
                          color: MyColors.dark,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
              (context, index) => Dismissible(
                key: ValueKey(toDosWeek[index].id),
                onDismissed: (direction) =>
                    Provider.of<ToDos>(context, listen: false)
                        .removeToDo(toDosWeek[index].id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
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
                        style: GoogleFonts.montserrat(
                          color: MyColors.dark,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
              (context, index) => Dismissible(
                key: ValueKey(toDosMonth[index].id),
                onDismissed: (direction) =>
                    Provider.of<ToDos>(context, listen: false)
                        .removeToDo(toDosMonth[index].id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
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
