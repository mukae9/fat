import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';

import 'package:flutter_app/graf.dart';
import 'package:flutter_app/mydate.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF041b60),
        accentColor: const Color(0xFF3f51b5),
        canvasColor: const Color(0xFFfafafa),
        fontFamily: 'Roboto',
      ),
      home: new MyHomePage(),
//      home: new MyHomePage(),
    );

  }



}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final _controller = TextEditingController();
  final _fname = 'mydata.txt';

  String _message;
  double _value = 50.0;
  int _index = 0;

  final slide = SleekCircularSlider(



  );







  @override
  void initState() {
    _message = '嘘偽りない体重を記録\n$_value kg';
    super.initState();
  }




  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('fatrol'),

      ),
      body:
      Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                color: Color.fromARGB(0, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: new Text(
                    "体重管理アプリ\nFatrol", textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        //  decoration: TextDecoration.underline,
                        fontFamily: "Roboto"),
                  ),

                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Container(
                  color: Color.fromARGB(0, 0, 0, 0),
                  child: new Text(
                    _message,

                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        //  decoration: TextDecoration.underline,
                        fontFamily: "Roboto"),

                  ),
                ),
              ),

            ),

            SizedBox(

                height: 200.0,
                child: Center(
                  child: MyRenderBoxWidget(),
                )),

            Padding(
              padding: EdgeInsets.all(25.0),
              child: SafeArea(
                child: Center(
                  child: SleekCircularSlider(
                    min: 0,
                    max: 100,


                    appearance: CircularSliderAppearance(

                      customWidths: CustomSliderWidths(
                        progressBarWidth: 12,
                        trackWidth: 2,
                        handlerSize: 12,
                        shadowWidth: 1.4,
                      ),

                      customColors: CustomSliderColors(
                        hideShadow: true,
                        dotColor: Color(0xfffefefe),
                        shadowColor: Color(0x28282828),
                        progressBarColors: [Color(0xFFA7F1FF), Color(0xFF7FFFD4),Color(0xFFA7F1FF)],
              //        trackColor: kAppPurple650,
              //        progressBarColors: [kAppPurple150, kAppPurple250],
              //        gradientStartAngle: 90,
              //        gradientEndAngle: 270,
                      ),

                      infoProperties: InfoProperties(
                        modifier: (double value) {
                          return  '$value kg';
                        },

                      )
                    ),

                    onChangeStart: (double value) {


                      print(value);
                    },
                    onChangeEnd: (double value) {


                      print(value);
                    },
                  )
                ),
              ),
              ),
//                  child:TextField(
//                    controller: controller,
//                    onChanged: textChanged,
//                    style: new TextStyle(fontSize:12.0,
//                        color: const Color(0xFF000000),
//                        fontWeight: FontWeight.w200,
//                        fontFamily: "Roboto"),
//                  ),




            FlatButton(key: null,
                onPressed: buttonPressed,
                child:
                Text(
                  "送信",
                  style: TextStyle(fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                )
            ),

          ]
      ),


      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text('Add'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Graf'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mydate'),
          )
        ],
        onTap: (int value){
          if(value == 1)
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => SecondPage()),
            );
          if(value == 2)
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ThirdPage()),
            );

        },

      ),


//      new Center(
//        child:
//        new Center(
//          child:
//          new Text(
//            "体重管理アプリ\nFatrol",
//            textAlign: TextAlign.center,
//            style: new TextStyle(fontSize:16.0,
//                color: const Color(0xFF000000),
//                fontWeight: FontWeight.w300,
////                decoration: TextDecoration.underline,
//                fontFamily: "Roboto"),
//          ),
//
//        ),
//
//      ),

    );
  }


  void textChanged(double val){
    setState(() {
//      _message=val.toUpperCase();
      _value=val.floorToDouble();
      _message= '嘘偽りない体重を記録\n$_value kg';

    });
  }

  void buttonPressed(){
    saveIt(_value);
    setState(() {
//       _message=controller.text + "Kg…\n"+"そのままでいいと思ってんの？";
      _message= '$_value Kg…\nそのままでいいと思ってんの？';
    });
  }

  void tapBottomIcon(int value){
    var items = ['追加ページ','グラフ','マイページ'];
    setState((){
      _index = value;
      _message ='you tapped:"'+items[_index]+'".';
    });
  }

  void saveIt(double value) async {
//    getDataFile(_fname).then((File file){
//      file.writeAsString(value);
//    });
  }
}





class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context){
    return _MyRenderBox();
  }
}


class _MyRenderBox extends RenderBox {

  ui.Image _img;


  @override
  bool hitTest(HitTestResult result, {@required Offset position}) {
    return true;
  }

  _MyRenderBox() {
    loadAssetImage('fat.png');
  }

  loadAssetImage(String fname) =>
      rootBundle.load
        ("assets/$fname").then((bd) {
        Uint8List u8lst = Uint8List.view(bd.buffer);
        ui.instantiateImageCodec(u8lst).then((codec) {
          codec.getNextFrame().then(
                  (frameInfo) {
                _img = frameInfo.image;
                markNeedsPaint();
                print("_img created: $_img");
              }
          );
        });
      });

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Paint p = Paint();

    Rect r = Rect.fromLTWH(dx + 175.0, dy + 20.0,70.0, 70.0);
    if (_img != null) {
      Rect r0 = Rect.fromLTWH(0.0, 0.0, _img.width.toDouble(),
          _img.height.toDouble());
          c.drawImageRect(_img, r0, r, p);
      print('draw _img.');
    } else {
      print('_img is null.');
    }

//    p.style = PaintingStyle.fill;
//    p.color = Color.fromARGB(150, 200, 0, 255);
//    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 150.0, 150.0);
//    c.drawRect(r, p);
//    p.style = PaintingStyle.stroke;
//    p.color = Color.fromARGB(150, 200, 0, 255);
//    p.strokeWidth = 10.0;
//    r = Rect.fromLTWH(dx + 100.0, dy + 100.0, 150.0, 150.0);
//    c.drawRect(r, p);
//  }
//
  }


  @override
  bool get sizedByParent =>
      true;

  @override
  void performResize() {
    size = constraints.biggest;
  }


}