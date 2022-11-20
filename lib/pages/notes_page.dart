import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/note_item.dart';

class NotesPage extends StatelessWidget {
  final List<Map<String, String>> tempNotes = [
    {
      'title': 'Cím 1',
      'text': 'Első szöveg',
    },
    {
      'title': 'Cím 2',
      'text': 'Második, de már hosszabb szöveg',
    },
    {
      'title': 'Cím 3',
      'text': 'Harmadik, de még az előzőnél is hosszabb szöveg tesztelni',
    },
    {
      'title': 'Cím 4',
      'text':
          'Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. ',
    },
    {
      'title': 'Cím 5, ami hosszabb',
      'text': 'Valami szöveg',
    },
    {
      'title': 'Cím 6, ami még hosszabb, mint az előző tesztelni',
      'text': 'Valami szöveg',
    },
    {
      'title': 'Cím 7',
      'text': 'Valami szöveg',
    },
    {
      'title': 'Cím 8',
      'text': 'Valami szöveg',
    },
    {
      'title': 'Cím 9',
      'text': 'Valami szöveg',
    },
    {
      'title': 'Cím 10',
      'text': 'Valami szöveg',
    },
  ];

  NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Notes'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: NoteItem(
                  title: tempNotes[index]['title']!,
                  text: tempNotes[index]['text']!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
