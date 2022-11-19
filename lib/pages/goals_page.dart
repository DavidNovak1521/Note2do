import 'package:flutter/material.dart';

import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MyTitleText(text: 'Goals'),
          ),
        ],
      ),
    );
  }
}
