import 'package:flutter/cupertino.dart';

import '../../config/routes/app_route.dart';

class NavigationGraph {
  final _map = <String, Route Function(RouteSettings)>{};

  registerRoutes(Map<String, Route Function(RouteSettings)> routes) {
    _map.addAll(routes);
  }

  Route getRoute(RouteSettings settings) {
    final route = _map[settings.name]!;
    return route.call(settings);
  }
}
