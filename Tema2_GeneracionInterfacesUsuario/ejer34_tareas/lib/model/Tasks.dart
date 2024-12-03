import 'dart:core';

class Tasks {
  late String _title;
  late String _description;
  late bool _isCompleted;

  Tasks(this._title, this._description, this._isCompleted);

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}