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
    final toDos = Provider.of<ToDos>(context).toDos;
    final int numberOfDone = toDos.where((todo) => todo.isDone).length;

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                children: [
                  const Expanded(
                    child: MyTitleText(text: 'To do\'s'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: (toDos.isNotEmpty)
                          ? MyCircularSlider(
                              initValue: numberOfDone.toDouble(),
                              maxValue: toDos.length.toDouble(),
                              color: MyColors.secondaryBlue,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: toDos.length,
              (context, index) => Dismissible(
                key: ValueKey(toDos[index].id),
                onDismissed: (direction) =>
                    Provider.of<ToDos>(context, listen: false)
                        .removeToDo(toDos[index].id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ChangeNotifierProvider.value(
                    value: toDos[index],
                    child: const ToDoItem(),
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
