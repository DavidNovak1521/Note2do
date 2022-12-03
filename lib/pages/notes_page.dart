import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../routes/app_routes.gr.dart';
import '../style/my_colors.dart';
import '../providers/note.dart';
import '../providers/notes.dart';
import '../providers/deleted_notes.dart';
import '../style/my_texts.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/note_item.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  void goToNoteEditing(BuildContext context, Note note) {
    AutoRouter.of(context).push(NoteEditingRoute(note: note));
  }

  @override
  Widget build(BuildContext context) {
    final favoriteNotes = Provider.of<Notes>(context).favoriteNotes;
    final notes = Provider.of<Notes>(context).notes;
    final deletedNotes = Provider.of<DeletedNotes>(context, listen: false);

    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Notes'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: favoriteNotes.length,
              (context, index) => Slidable(
                key: ValueKey(favoriteNotes[index].id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      deletedNotes.addNote(favoriteNotes[index]);
                      Provider.of<Notes>(context, listen: false)
                          .removeNote(favoriteNotes[index].id);
                    },
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        deletedNotes.addNote(favoriteNotes[index]);
                        Provider.of<Notes>(context, listen: false)
                            .removeNote(favoriteNotes[index].id);
                      },
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
                    value: favoriteNotes[index],
                    child: NoteItem(routeFunction: goToNoteEditing),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: (notes.isNotEmpty && favoriteNotes.isNotEmpty)
                ? Divider(
                    height: 30,
                    color: MyColors.dark,
                  )
                : null,
          ),
          (notes.isNotEmpty || favoriteNotes.isNotEmpty)
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: notes.length,
                    (context, index) => Slidable(
                      key: ValueKey(notes[index].id),
                      startActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () {
                            deletedNotes.addNote(notes[index]);
                            Provider.of<Notes>(context, listen: false)
                                .removeNote(notes[index].id);
                          },
                        ),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deletedNotes.addNote(notes[index]);
                              Provider.of<Notes>(context, listen: false)
                                  .removeNote(notes[index].id);
                            },
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
                          value: notes[index],
                          child: NoteItem(routeFunction: goToNoteEditing),
                        ),
                      ),
                    ),
                  ),
                )
              : SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      'No notes! Create one.',
                      textAlign: TextAlign.center,
                      style: missingMessageTextStyle,
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
