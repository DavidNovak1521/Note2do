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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

import '../pages/goals_page.dart' as _i7;
import '../pages/home_page.dart' as _i3;
import '../pages/navigation_page.dart' as _i1;
import '../pages/new_note_page.dart' as _i5;
import '../pages/notes_page.dart' as _i4;
import '../pages/to_dos_page.dart' as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    NavigationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NavigationPage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NotesTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NewNoteTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ToDosTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    GoalsTab.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NotesPage(),
      );
    },
    NewNoteRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NewNotePage(),
      );
    },
    ToDosRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ToDosPage(),
      );
    },
    GoalsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.GoalsPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          NavigationRoute.name,
          path: '/navigation',
          children: [
            _i8.RouteConfig(
              HomeTab.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: HomeTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  HomeRoute.name,
                  path: 'default',
                  parent: HomeTab.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              NotesTab.name,
              path: 'notes',
              parent: NavigationRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NotesTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  NotesRoute.name,
                  path: 'default',
                  parent: NotesTab.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              NewNoteTab.name,
              path: 'new_note',
              parent: NavigationRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NewNoteTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  NewNoteRoute.name,
                  path: 'default',
                  parent: NewNoteTab.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              ToDosTab.name,
              path: 'to_dos',
              parent: NavigationRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ToDosTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  ToDosRoute.name,
                  path: 'default',
                  parent: ToDosTab.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              GoalsTab.name,
              path: 'goals',
              parent: NavigationRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: GoalsTab.name,
                  redirectTo: 'default',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  GoalsRoute.name,
                  path: 'default',
                  parent: GoalsTab.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.NavigationPage]
class NavigationRoute extends _i8.PageRouteInfo<void> {
  const NavigationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          path: '/navigation',
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeTab extends _i8.PageRouteInfo<void> {
  const HomeTab({List<_i8.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NotesTab extends _i8.PageRouteInfo<void> {
  const NotesTab({List<_i8.PageRouteInfo>? children})
      : super(
          NotesTab.name,
          path: 'notes',
          initialChildren: children,
        );

  static const String name = 'NotesTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NewNoteTab extends _i8.PageRouteInfo<void> {
  const NewNoteTab({List<_i8.PageRouteInfo>? children})
      : super(
          NewNoteTab.name,
          path: 'new_note',
          initialChildren: children,
        );

  static const String name = 'NewNoteTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ToDosTab extends _i8.PageRouteInfo<void> {
  const ToDosTab({List<_i8.PageRouteInfo>? children})
      : super(
          ToDosTab.name,
          path: 'to_dos',
          initialChildren: children,
        );

  static const String name = 'ToDosTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class GoalsTab extends _i8.PageRouteInfo<void> {
  const GoalsTab({List<_i8.PageRouteInfo>? children})
      : super(
          GoalsTab.name,
          path: 'goals',
          initialChildren: children,
        );

  static const String name = 'GoalsTab';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'default',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.NotesPage]
class NotesRoute extends _i8.PageRouteInfo<void> {
  const NotesRoute()
      : super(
          NotesRoute.name,
          path: 'default',
        );

  static const String name = 'NotesRoute';
}

/// generated route for
/// [_i5.NewNotePage]
class NewNoteRoute extends _i8.PageRouteInfo<void> {
  const NewNoteRoute()
      : super(
          NewNoteRoute.name,
          path: 'default',
        );

  static const String name = 'NewNoteRoute';
}

/// generated route for
/// [_i6.ToDosPage]
class ToDosRoute extends _i8.PageRouteInfo<void> {
  const ToDosRoute()
      : super(
          ToDosRoute.name,
          path: 'default',
        );

  static const String name = 'ToDosRoute';
}

/// generated route for
/// [_i7.GoalsPage]
class GoalsRoute extends _i8.PageRouteInfo<void> {
  const GoalsRoute()
      : super(
          GoalsRoute.name,
          path: 'default',
        );

  static const String name = 'GoalsRoute';
}
