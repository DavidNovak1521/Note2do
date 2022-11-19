import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: MyTitleText(text: 'Home Page'),
    );
  }
}
