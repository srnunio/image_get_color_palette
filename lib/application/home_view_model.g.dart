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
  Computed<String>? _$pathFileComputed;

  @override
  String get pathFile =>
      (_$pathFileComputed ??= Computed<String>(() => super.pathFile,
              name: '_HomeViewModel.pathFile'))
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

  final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel');

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
  String toString() {
    return '''
isBusy: ${isBusy},
pathFile: ${pathFile}
    ''';
  }
}
