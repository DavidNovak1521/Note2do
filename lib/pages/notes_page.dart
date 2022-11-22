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
              (context, index) => Dismissible(
                key: ValueKey<int>(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  child: ChangeNotifierProvider.value(
                    value: favoriteNotes[index],
                    child: NoteItem(),
                  ),
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
              (context, index) => Dismissible(
                key: ValueKey(notes[index].id),
                onDismissed: (direction) =>
                    Provider.of<Notes>(context, listen: false)
                        .removeNote(notes[index].id),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  child: ChangeNotifierProvider.value(
                    value: notes[index],
                    child: NoteItem(),
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
