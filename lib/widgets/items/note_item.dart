import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../style/my_colors.dart';
import '../../providers/note.dart';
import '../../style/my_texts.dart';

class NoteItem extends StatelessWidget {
  final Function routeFunction;
  const NoteItem({
    super.key,
    required this.routeFunction,
  });

  @override
  Widget build(BuildContext context) {
    final note = Provider.of<Note>(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () => routeFunction(context, note),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(
          note.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: noteItemTitleTextStyle,
        ),
        subtitle: Text(
          note.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: noteItemTextTextStyle,
        ),
        trailing: IconButton(
          onPressed: () => note.changeFavoriteStatus(context),
          icon: Icon(note.isFavorite
              ? Icons.star_rounded
              : Icons.star_outline_rounded),
          color: MyColors.white,
        ),
      ),
    );
  }
}
