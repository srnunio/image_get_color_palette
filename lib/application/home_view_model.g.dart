// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  Computed<bool>? _$isBusyComputed;

  @override
  bool get isBusy => (_$isBusyComputed ??=
          Computed<bool>(() => super.isBusy, name: '_HomeViewModel.isBusy'))
      .value;
  Computed<bool>? _$hasFilePathComputed;

  @override
  bool get hasFilePath =>
      (_$hasFilePathComputed ??= Computed<bool>(() => super.hasFilePath,
              name: '_HomeViewModel.hasFilePath'))
          .value;
  Computed<String>? _$pathFileComputed;

  @override
  String get pathFile =>
      (_$pathFileComputed ??= Computed<String>(() => super.pathFile,
              name: '_HomeViewModel.pathFile'))
          .value;
  Computed<Color>? _$titleColorComputed;

  @override
  Color get titleColor =>
      (_$titleColorComputed ??= Computed<Color>(() => super.titleColor,
              name: '_HomeViewModel.titleColor'))
          .value;
  Computed<Color>? _$backgroundColorComputed;

  @override
  Color get backgroundColor => (_$backgroundColorComputed ??= Computed<Color>(
          () => super.backgroundColor,
          name: '_HomeViewModel.backgroundColor'))
      .value;
  Computed<int>? _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_HomeViewModel.currentIndex'))
          .value;
  Computed<List<Color>>? _$colorsComputed;

  @override
  List<Color> get colors =>
      (_$colorsComputed ??= Computed<List<Color>>(() => super.colors,
              name: '_HomeViewModel.colors'))
          .value;

  final _$_isBusyAtom = Atom(name: '_HomeViewModel._isBusy');

  @override
  bool get _isBusy {
    _$_isBusyAtom.reportRead();
    return super._isBusy;
  }

  @override
  set _isBusy(bool value) {
    _$_isBusyAtom.reportWrite(value, super._isBusy, () {
      super._isBusy = value;
    });
  }

  final _$_currentIndexAtom = Atom(name: '_HomeViewModel._currentIndex');

  @override
  int get _currentIndex {
    _$_currentIndexAtom.reportRead();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.reportWrite(value, super._currentIndex, () {
      super._currentIndex = value;
    });
  }

  final _$_colorsAtom = Atom(name: '_HomeViewModel._colors');

  @override
  ObservableList<Color> get _colors {
    _$_colorsAtom.reportRead();
    return super._colors;
  }

  @override
  set _colors(ObservableList<Color> value) {
    _$_colorsAtom.reportWrite(value, super._colors, () {
      super._colors = value;
    });
  }

  final _$_backgroundColorAtom = Atom(name: '_HomeViewModel._backgroundColor');

  @override
  Color get _backgroundColor {
    _$_backgroundColorAtom.reportRead();
    return super._backgroundColor;
  }

  @override
  set _backgroundColor(Color value) {
    _$_backgroundColorAtom.reportWrite(value, super._backgroundColor, () {
      super._backgroundColor = value;
    });
  }

  final _$_titleColorAtom = Atom(name: '_HomeViewModel._titleColor');

  @override
  Color get _titleColor {
    _$_titleColorAtom.reportRead();
    return super._titleColor;
  }

  @override
  set _titleColor(Color value) {
    _$_titleColorAtom.reportWrite(value, super._titleColor, () {
      super._titleColor = value;
    });
  }

  final _$_pathFileAtom = Atom(name: '_HomeViewModel._pathFile');

  @override
  String get _pathFile {
    _$_pathFileAtom.reportRead();
    return super._pathFile;
  }

  @override
  set _pathFile(String value) {
    _$_pathFileAtom.reportWrite(value, super._pathFile, () {
      super._pathFile = value;
    });
  }

  final _$selectAsyncAction = AsyncAction('_HomeViewModel.select');

  @override
  Future<void> select() {
    return _$selectAsyncAction.run(() => super.select());
  }

  final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel');

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setBusy');
    try {
      return super.setBusy(state);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBackgroundColor(Color color) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setBackgroundColor');
    try {
      return super.setBackgroundColor(color);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color color) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setColor');
    try {
      return super.setColor(color);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitleColor(Color color) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setTitleColor');
    try {
      return super.setTitleColor(color);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy},
hasFilePath: ${hasFilePath},
pathFile: ${pathFile},
titleColor: ${titleColor},
backgroundColor: ${backgroundColor},
currentIndex: ${currentIndex},
colors: ${colors}
    ''';
  }
}
