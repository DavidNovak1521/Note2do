import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './routes/app_routes.dart';
import './providers/to_dos.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ToDos()),
      ],
      child: MaterialApp.router(
        title: 'Note2do',
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        ),
        routerDelegate: appRouter.delegate(
          initialRoutes: [
            NavigationRoute(),
          ],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
