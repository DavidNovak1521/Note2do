import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/to_do_item.dart';
import '../widgets/my_circular_slider.dart';

// ignore: must_be_immutable
class ToDosPage extends StatelessWidget {
  final List<Map<String, dynamic>> tempToDos = [
    {
      'text': 'Első teendő',
      'isDone': true,
    },
    {
      'text': 'Második, de már hosszabb teendő',
      'isDone': true,
    },
    {
      'text': 'Harmadik, de még az előzőnél is hosszabb teendő tesztelni',
      'isDone': false,
    },
    {
      'text':
          'Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. ',
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
  int numberOfDone = 0;

  ToDosPage({super.key}) {
    numberOfDone = tempToDos.where((todo) => todo['isDone']).length;
  }

  @override
  Widget build(BuildContext context) {
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
                        maxValue: tempToDos.length.toDouble(),
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
                  text: tempToDos[index]['text'],
                  isDone: tempToDos[index]['isDone'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
