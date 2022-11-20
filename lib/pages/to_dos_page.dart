import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/to_do_item.dart';

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

  ToDosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'To Do\'s'),
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
