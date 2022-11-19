import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

class ToDosPage extends StatelessWidget {
  const ToDosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'To Do\'s'),
          ),
        ],
      ),
    );
  }
}
