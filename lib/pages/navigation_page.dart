import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../routes/app_routes.dart';
import '../style/my_colors.dart';
import '../widgets/my_floating_button.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Map<String, dynamic>> pages = [
    {
      'label': 'Home',
      'page': const HomeTab(),
      'icon': const Icon(Icons.home_outlined),
    },
    {
      'label': 'Notes',
      'page': const NotesTab(),
      'icon': const Icon(Icons.note_outlined),
    },
    {
      // not clickable
      'label': '',
      'page': const NewNoteTab(),
      'icon': const SizedBox(),
    },
    {
      'label': 'To Do',
      'page': const ToDosTab(),
      'icon': const Icon(Icons.work_outline),
    },
    {
      'label': 'Goals',
      'page': const GoalsTab(),
      'icon': const Icon(Icons.push_pin_outlined),
    },
  ];
  final myTabsRouterNotifier = ValueNotifier<TabsRouter?>(null);

  Widget buildBottomBar(
    BuildContext context,
    TabsRouter myTabsRouter,
  ) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: MyColors.dark,
        onTap: (index) async {
          if (index != 2) {
            if (AutoRouter.of(context).canPop() &&
                index == myTabsRouter.activeIndex &&
                AutoRouter.of(context).currentPath.split('/').last !=
                    'default') {
              AutoRouter.of(context).popTop();
            }
            myTabsRouter.setActiveIndex(index);
          }
        },
        currentIndex: myTabsRouter.activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.white,
        unselectedItemColor: MyColors.white.withOpacity(0.5),
        items: pages
            .map(
              (page) => BottomNavigationBarItem(
                icon: page['icon'],
                label: page['label'],
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showActionButton =
        MediaQuery.of(context).viewInsets.bottom == 0.0;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AutoTabsScaffold(
        animationDuration: const Duration(milliseconds: 0),
        appBarBuilder: (context, tabsRouter) => AppBar(
          title: const Text('Note2do'),
          backgroundColor: MyColors.dark,
        ),
        routes: pages
            .map((page) => page['page'] as PageRouteInfo<dynamic>)
            .toList(),
        bottomNavigationBuilder: (_, tabsRouter) {
          myTabsRouterNotifier.value = tabsRouter;
          return buildBottomBar(context, myTabsRouterNotifier.value!);
        },
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: showActionButton
            ? ValueListenableBuilder(
                valueListenable: myTabsRouterNotifier,
                builder: (context, TabsRouter? data, _) {
                  return data == null
                      ? Container()
                      : MyFloatingButton(tabsRouter: data);
                },
              )
            : null,
      ),
    );
  }
}
