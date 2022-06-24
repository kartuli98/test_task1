import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_to_do/core/constants/constants.dart';
import 'package:test_to_do/core/di/dependency_provider.dart';
import 'package:test_to_do/core/keys.dart';
import 'package:test_to_do/core/navigation/navigation_graph.dart';
import 'package:test_to_do/di/app_dependency_resolver.dart';
import 'package:test_to_do/presentation/pages/login_screen/login_screen.dart';

import 'config/routes/app_route.dart';
import 'core/logger/todo_logger.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ToDoLogger logger = ToDoLogger();
    AppDependeciesResolver.register(logger);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Тудушечка',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Keys.navigatorKey,
      initialRoute: AppRoute.LOGIN,
      //localizationsDelegates: ,
      //supportedLocales: ,
      //navigatorObservers: [],
      onGenerateInitialRoutes: (name) => [
        DependencyProvider.get<NavigationGraph>()
            .getRoute(RouteSettings(name: name))
      ],
      onGenerateRoute: DependencyProvider.get<NavigationGraph>().getRoute,
    );
  }
}
