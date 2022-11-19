import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../routes/app_routes.dart';
import '../style/my_colors.dart';
import '../widgets/my_app_bar.dart';
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
      'icon': const Icon(Icons.home_rounded),
    },
    {
      'label': 'Notes',
      'page': const NotesTab(),
      'icon': const Icon(Icons.note_rounded),
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
      'icon': const Icon(Icons.work_rounded),
    },
    {
      'label': 'Goals',
      'page': const GoalsTab(),
      'icon': const Icon(Icons.push_pin_rounded),
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
      child: ColoredBox(
        color: MyColors.white,
        child: BottomAppBar(
          color: MyColors.dark,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          elevation: 0,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
            selectedIconTheme: IconThemeData(
              size: 30,
              color: MyColors.white,
            ),
            items: pages
                .map(
                  (page) => BottomNavigationBarItem(
                    icon: page['icon'],
                    label: page['label'],
                  ),
                )
                .toList(),
          ),
        ),
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
        backgroundColor: MyColors.dark,
        animationDuration: const Duration(milliseconds: 0),
        appBarBuilder: (context, tabsRouter) => const MyAppBar(),
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
