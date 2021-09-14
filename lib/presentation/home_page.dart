import 'dart:io';

import 'package:customized/customized.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_get_color_palette/application/home_view_model.dart';
import 'package:image_get_color_palette/presentation/responsive.dart';

import 'custom_section.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  HomeViewModel _model = HomeViewModel();

  GridView _bodyGridList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80.0,
          mainAxisSpacing: 8,
          mainAxisExtent: 80.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.50),
      itemBuilder: (context, index) {
        var color = _model.colors[index];

        var defaultColor = (_model.currentIndex == 0)
            ? _model.titleColor
            : _model.backgroundColor;

        var selected = (defaultColor == color);

        return GestureDetector(
          onTap: () => _model.setColor(color),
          child: Container(
            child: empty,
            decoration: BoxDecoration(
                border: (selected)
                    ? Border.all(color: Colors.white, width: 2.0)
                    : null,
                borderRadius: BorderRadius.circular(4.0),
                color: color),
          ),
        );
      },
      itemCount: _model.colors.length,
    );
  }

  _bodyImage() {
    if (kIsWeb)
      return Container(
        width: 420.0,
        height: 420.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            image:
                DecorationImage(image: Image.network(_model.pathFile).image)),
      );
    else
      return Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            image: DecorationImage(
                image: Image.file(File(_model.pathFile)).image)),
      );
  }

  _noSelectFile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.image_outlined,
            color: _model.titleColor,
            size: 80.0,
          ),
          SizedBox(
            height: 16.0,
          ),
          Txt(
            'Add an image to your liking',
            textColor: _model.titleColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            child: DefaultButton(
                text: 'Add',
                onPressed: () {
                  _model.select();
                }),
            width: 100.0,
            height: 35.0,
          )
        ],
      ),
    );
  }

  _bodyMobile() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: _model.backgroundColor,
        elevation: 0.0,
        title: Txt(
          'Image palette color'.toUpperCase(),
          textStyle: (style) => style.copyWith(
              color: _model.titleColor,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 16.0,
              ),
              _bodyImage(),
              SizedBox(
                height: 16.0,
              ),
              CustomSection(
                activeColor: Colors.white,
                currentIndex: _model.currentIndex,
                items: ['Title', 'Background'],
                onTap: _model.setCurrentIndex,
                defaultColor: Colors.white54,
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(child: _bodyGridList())
            ],
          ),
        ),
      ),
    );
  }

  _bodyDesktop() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32.0,
            ),
            _bodyImage(),
            SizedBox(
              width: 32.0,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Txt(
                  'Image palette color'.toUpperCase(),
                  textStyle: (style) => style.copyWith(
                      color: _model.titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: CustomSection(
                    activeColor: Colors.white,
                    currentIndex: _model.currentIndex,
                    items: ['Title', 'Background'],
                    onTap: _model.setCurrentIndex,
                    defaultColor: Colors.white54,
                  ),
                  width: 300.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Flexible(
                    child: Container(
                  height: 280.0,
                  child: _bodyGridList(),
                )),
                Container(
                  child: DefaultButton(
                    text: 'Clear',
                    activeColor: Colors.white54,
                    textColor: _model.titleColor,
                    onPressed: _model.clear,
                  ),
                  width: 200.0,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  _body() {
    if (_model.isBusy)
      return Center(
          child: CustomProgress(
        ignorePlatform: true,
      ));

    if (_model.pathFile.isEmpty) return _noSelectFile();

    return Responsive(
        mobile: _bodyMobile(), tablet: _bodyDesktop(), desktop: _bodyDesktop());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var backgroundColor = _model.backgroundColor;
        return Scaffold(
          backgroundColor: backgroundColor,
          body: _body(),
        );
      },
    );
  }
}
