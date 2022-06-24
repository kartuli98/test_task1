import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDB {
  static Completer<HiveInterface>? _boxCompleter;

  static Future<HiveInterface> getInstance() async {
    if (_boxCompleter == null) {
      final Completer<HiveInterface> completer = Completer<HiveInterface>();
      try {
        final hive = Hive;
        await hive.initFlutter();
        completer.complete(hive);
      } on Exception catch (e) {
        completer.completeError(e);
        final Future<HiveInterface> hiveFuture = completer.future;
        _boxCompleter = null;
        return hiveFuture;
      }
      _boxCompleter = completer;
    }
    return _boxCompleter!.future;
  }

  Future<Box<E>> getBox<E>(String name) async {
    final hive = await getInstance();
    return await hive.openBox(name);
  }

  registerAdapter<E, T extends TypeAdapter<E>>(T adapter) async {
    final hive = await getInstance();
    hive.registerAdapter(adapter);
  }
}
