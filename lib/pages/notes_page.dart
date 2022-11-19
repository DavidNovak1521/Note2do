import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Notes'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => Container(
                height: 100,
                color: Colors.amber,
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
