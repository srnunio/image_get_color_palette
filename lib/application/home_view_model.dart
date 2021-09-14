import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  @observable
  bool _isBusy = false;

  @observable
  Color _backgroundColor = Colors.black;

  @observable
  Color _titleColor = Colors.white;

  @observable
  String _pathFile = "";

  @computed
  bool get isBusy => _isBusy;

  @computed
  String get pathFile => _pathFile;

  @computed
  Color get titleColor => _titleColor;

  @computed
  Color get backgroundColor => _backgroundColor;

  @action
  void setBusy(bool state) {
    _isBusy = state;
  }

  @action
  void setBackgroundColor(Color color) {
    this._backgroundColor = color;
  }

  @action
  void setTitleColor(Color color) {
    this._titleColor = color;
  }
}
