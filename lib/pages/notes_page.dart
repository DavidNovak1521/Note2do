import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note2do/routes/app_routes.gr.dart';
import 'package:note2do/style/my_colors.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/note_item.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  void goToNoteEditing(BuildContext context) {
    AutoRouter.of(context).push(NoteEditingRoute());
  }

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
                key: ValueKey(favoriteNotes[index].id),
                onDismissed: (direction) =>
                    Provider.of<Notes>(context, listen: false)
                        .removeNote(favoriteNotes[index].id),
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
                    (context, index) => Dismissible(
                      key: ValueKey(notes[index].id),
                      onDismissed: (direction) =>
                          Provider.of<Notes>(context, listen: false)
                              .removeNote(notes[index].id),
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
                      style: GoogleFonts.montserrat(
                        color: MyColors.dark,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
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
