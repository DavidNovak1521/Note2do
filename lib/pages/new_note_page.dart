import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: MyTitleText(text: 'New Note'),
    );
  }
}
