// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i10;

import '../pages/goals_page.dart' as _i8;
import '../pages/home_page.dart' as _i3;
import '../pages/navigation_page.dart' as _i1;
import '../pages/new_note_page.dart' as _i6;
import '../pages/note_editing_page.dart' as _i4;
import '../pages/notes_page.dart' as _i5;
import '../pages/to_dos_page.dart' as _i7;
import '../providers/note.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    NavigationRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NavigationPage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NotesTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NewNoteTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ToDosTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    GoalsTab.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    NoteEditingRoute.name: (routeData) {
      final args = routeData.argsAs<NoteEditingRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NoteEditingPage(
          key: args.key,
          note: args.note,
        ),
      );
    },
    NotesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NotesPage(),
      );
    },
    NewNoteRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.NewNotePage(),
      );
    },
    ToDosRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ToDosPage(),
      );
    },
    GoalsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.GoalsPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/navigation',
          fullMatch: true,
        ),
        _i9.RouteConfig(
          NavigationRoute.name,
          path: '/navigation',
          children: [
            _i9.RouteConfig(
              HomeTab.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i9.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: HomeTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i9.RouteConfig(
                  HomeRoute.name,
                  path: 'default',
                  parent: HomeTab.name,
                ),
                _i9.RouteConfig(
                  NoteEditingRoute.name,
                  path: 'editing',
                  parent: HomeTab.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              NotesTab.name,
              path: 'notes',
              parent: NavigationRoute.name,
              children: [
                _i9.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NotesTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i9.RouteConfig(
                  NotesRoute.name,
                  path: 'default',
                  parent: NotesTab.name,
                ),
                _i9.RouteConfig(
                  NoteEditingRoute.name,
                  path: 'editing',
                  parent: NotesTab.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              NewNoteTab.name,
              path: 'new_note',
              parent: NavigationRoute.name,
              children: [
                _i9.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NewNoteTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i9.RouteConfig(
                  NewNoteRoute.name,
                  path: 'default',
                  parent: NewNoteTab.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              ToDosTab.name,
              path: 'to_dos',
              parent: NavigationRoute.name,
              children: [
                _i9.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ToDosTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i9.RouteConfig(
                  ToDosRoute.name,
                  path: 'default',
                  parent: ToDosTab.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              GoalsTab.name,
              path: 'goals',
              parent: NavigationRoute.name,
              children: [
                _i9.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: GoalsTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i9.RouteConfig(
                  GoalsRoute.name,
                  path: 'default',
                  parent: GoalsTab.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.NavigationPage]
class NavigationRoute extends _i9.PageRouteInfo<void> {
  const NavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          path: '/navigation',
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeTab extends _i9.PageRouteInfo<void> {
  const HomeTab({List<_i9.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NotesTab extends _i9.PageRouteInfo<void> {
  const NotesTab({List<_i9.PageRouteInfo>? children})
      : super(
          NotesTab.name,
          path: 'notes',
          initialChildren: children,
        );

  static const String name = 'NotesTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NewNoteTab extends _i9.PageRouteInfo<void> {
  const NewNoteTab({List<_i9.PageRouteInfo>? children})
      : super(
          NewNoteTab.name,
          path: 'new_note',
          initialChildren: children,
        );

  static const String name = 'NewNoteTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ToDosTab extends _i9.PageRouteInfo<void> {
  const ToDosTab({List<_i9.PageRouteInfo>? children})
      : super(
          ToDosTab.name,
          path: 'to_dos',
          initialChildren: children,
        );

  static const String name = 'ToDosTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class GoalsTab extends _i9.PageRouteInfo<void> {
  const GoalsTab({List<_i9.PageRouteInfo>? children})
      : super(
          GoalsTab.name,
          path: 'goals',
          initialChildren: children,
        );

  static const String name = 'GoalsTab';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'default',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.NoteEditingPage]
class NoteEditingRoute extends _i9.PageRouteInfo<NoteEditingRouteArgs> {
  NoteEditingRoute({
    _i10.Key? key,
    required _i11.Note note,
  }) : super(
          NoteEditingRoute.name,
          path: 'editing',
          args: NoteEditingRouteArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'NoteEditingRoute';
}

class NoteEditingRouteArgs {
  const NoteEditingRouteArgs({
    this.key,
    required this.note,
  });

  final _i10.Key? key;

  final _i11.Note note;

  @override
  String toString() {
    return 'NoteEditingRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i5.NotesPage]
class NotesRoute extends _i9.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: 'default',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i6.NewNotePage]
class NewNoteRoute extends _i9.PageRouteInfo<void> {
  const NewNoteRoute()
      : super(
          NewNoteRoute.name,
          path: 'default',
        );

  static const String name = 'NewNoteRoute';
}

/// generated route for
/// [_i7.ToDosPage]
class ToDosRoute extends _i9.PageRouteInfo<void> {
  const ToDosRoute()
      : super(
          ToDosRoute.name,
          path: 'default',
        );

  static const String name = 'ToDosRoute';
}

/// generated route for
/// [_i8.GoalsPage]
class GoalsRoute extends _i9.PageRouteInfo<void> {
  const GoalsRoute()
      : super(
          GoalsRoute.name,
          path: 'default',
        );

  static const String name = 'GoalsRoute';
}
