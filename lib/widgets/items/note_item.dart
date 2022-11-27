import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../style/my_colors.dart';
import '../../providers/note.dart';

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
        onTap: () => routeFunction(context),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(
          note.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MyColors.white,
          ),
        ),
        subtitle: Text(
          note.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyColors.white.withOpacity(0.5),
          ),
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
