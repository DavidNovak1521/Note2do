import 'package:flutter/material.dart';
import 'package:note2do/style/my_colors.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/note_item.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteNotes = Provider.of<Notes>(context).favoriteNotes;
    final notes = Provider.of<Notes>(context).notes;

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Notes'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: favoriteNotes.length,
              (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 7.5),
                child: NoteItem(
                  title: favoriteNotes[index].title,
                  text: favoriteNotes[index].text,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 30,
              color: MyColors.dark,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: notes.length,
              (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 7.5),
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
