import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/my_colors.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.dark,
      title: SvgPicture.asset(
        'assets/images/note2do_appbar_image.svg',
        color: MyColors.white,
        width: MediaQuery.of(context).size.width * 0.35,
      ),
      centerTitle: true,
    );
  }
}
