import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/to_do_item.dart';
import '../widgets/my_circular_slider.dart';
import '../providers/to_dos.dart';

// ignore: must_be_immutable
class ToDosPage extends StatelessWidget {
  const ToDosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toDos = Provider.of<ToDos>(context).toDos;
    final int numberOfDone = toDos.where((todo) => todo.isDone).length;

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  const Expanded(
                    child: MyTitleText(text: 'To Do\'s'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: MyCircularSlider(
                        initValue: numberOfDone.toDouble(),
                        maxValue: toDos.length.toDouble(),
                        color: MyColors.secondaryBlue,
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
                child: ToDoItem(
                  toDo: toDos[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
