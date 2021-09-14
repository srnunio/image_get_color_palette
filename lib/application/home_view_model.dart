import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  @observable
  bool _isBusy = false;

  @observable
  int _currentIndex = 0;

  @observable
  ObservableList<Color> _colors = ObservableList.of([]);

  @observable
  Color _backgroundColor = Colors.black;

  @observable
  Color _titleColor = Colors.white;

  @observable
  String _pathFile = "";

  @computed
  bool get isBusy => _isBusy;

  @computed
  bool get hasFilePath => _pathFile.isNotEmpty;

  @computed
  String get pathFile => _pathFile;

  @computed
  Color get titleColor => _titleColor;

  @computed
  Color get backgroundColor => _backgroundColor;

  @computed
  int get currentIndex => _currentIndex;

  @computed
  List<Color> get colors => _colors;

  /// informs that something is in process
  @action
  void setCurrentIndex(int index) {
    this._currentIndex = index;
  }

  /// informs that something is in process
  @action
  void setBusy(bool state) {
    this._isBusy = state;
  }

  /// changes the color of the _background
  @action
  void setBackgroundColor(Color color) {
    this._backgroundColor = color;
  }

  /// changes the color of the _borderColor
  @action
  void setColor(Color color) {
    if (_currentIndex == 0) setTitleColor(color);
    if (_currentIndex == 1) setBackgroundColor(color);
  }

  /// changes the color of the title
  @action
  void setTitleColor(Color color) {
    this._titleColor = color;
  }

  /// Validate the result of the methods [getImage] and [readColors]
  @action
  Future<void> select() async {
    setBusy(true);

    var image = await getImage();

    this._pathFile = image ?? '';

    print('image: $image');

    var colors = await readColors(image);

    this._colors = colors.asObservable();

    setBusy(false);
  }

  /// Validate the result of the extraction, called [_generatorPalette]
  Future<List<Color>> readColors(String? image) async {
    if (image == null) return [];

    var palette = await _generatorPalette(image);

    if (palette == null) return [];

    return palette.colors.toList().asObservable();
  }

  /// Extracts colors from the selected image
  Future<PaletteGenerator?> _generatorPalette(String file) async {
    return await PaletteGenerator.fromImageProvider(
      (kIsWeb) ? Image.network(file).image : Image.file(File(file)).image,
      size: Size(200.0, 200.0),
      maximumColorCount: 10,
    );
  }

  /// Select scan scan scans on device
  Future<String?> getImage() async {
    final ImagePicker _picker = ImagePicker();

    var result = await _picker.pickImage(source: ImageSource.gallery);

    if (result == null) return null;

    return result.path;
  }

  @action
  void clear() {
    this._backgroundColor = Colors.black;
    this._titleColor = Colors.white;
    this._pathFile = '';
  }
}
