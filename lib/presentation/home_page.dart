import 'package:customized/customized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_get_color_palette/application/home_view_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel _model = HomeViewModel();

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
            child: DefaultButton(text: 'Add', onPressed: () {}),
            width: 100.0,
            height: 35.0,
          )
        ],
      ),
    );
  }

  _bodySelectFile() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 240.0,
              height: 240.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      image: Image.asset('assets/image.png').image)),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 24.0,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 24.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.50),
              itemBuilder: (context, index) {
                var color = Colors.red;
                return Container(
                  child: empty,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0), color: color),
                );
              },
              itemCount: 44,
            ))
          ],
        ),
      ),
    );
  }

  _body() {
    if (_model.isBusy) return Center(child: CustomProgress());
    if (_model.pathFile.isEmpty) return _noSelectFile();
    if (_model.pathFile.isNotEmpty) return _bodySelectFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _model.backgroundColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: _model.backgroundColor,
        title: Text(
          'Image palette color',
          style: TextStyle(color: _model.titleColor),
        ),
      ),
      body: Observer(
        builder: (_) => _body(),
      ),
    );
  }
}
