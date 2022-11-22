import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/note_item.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context).notes;

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
                  title: notes[index].title,
                  text: notes[index].text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
