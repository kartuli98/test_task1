import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

extension StringToDate on String {
  DateTime toDate() {
    List<String> components = split('-');
    return DateTime(int.parse(components[0]), int.parse(components[1]),
        int.parse(components[2]));
  }
}

extension DateToString on DateTime {
  String toUiString() {
    return toString().split(" ").first;
  }
}
