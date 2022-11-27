import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:note2do/pages/goals_page.dart';
import 'package:note2do/pages/home_page.dart';
import 'package:note2do/pages/navigation_page.dart';
import 'package:note2do/pages/new_note_page.dart';
import 'package:note2do/pages/note_editing_page.dart';
import 'package:note2do/pages/notes_page.dart';
import 'package:note2do/pages/to_dos_page.dart';

export 'app_routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: NavigationPage,
      path: '/navigation',
      initial: true,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'default',
              page: HomePage,
              initial: true,
            ),
            AutoRoute(
              path: 'editing',
              page: NoteEditingPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'notes',
          name: 'NotesTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'default',
              page: NotesPage,
              initial: true,
            ),
            AutoRoute(
              path: 'editing',
              page: NoteEditingPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'new_note',
          name: 'NewNoteTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'default',
              page: NewNotePage,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          path: 'to_dos',
          name: 'ToDosTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'default',
              page: ToDosPage,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          path: 'goals',
          name: 'GoalsTab',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'default',
              page: GoalsPage,
              initial: true,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
