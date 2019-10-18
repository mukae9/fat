import 'package:flutter/material.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _message;
  @override
  void initState(){
    _message='嘘偽りない体重を記録';
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('fatrol'),

      ),
      body:
          Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children:<Widget>[

              Expanded(
                child:Container(
                  color: Color.fromARGB(0, 0, 0, 0),
                  child:Padding(
                    padding: EdgeInsets.all(25.0),
                  child: new Text(
                    "体重管理アプリ\nFatrol", textAlign: TextAlign.center,
                    style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w300,
                        //  decoration: TextDecoration.underline,
                    fontFamily: "Roboto"),
                   ),

                ),
                ),
              ),
              Expanded(
                child:Padding(
                  padding: EdgeInsets.all(25.0),
                    child:Container(
                      color: Color.fromARGB(0, 0, 0, 0),
                      child: new Text(
                      _message,
                        textAlign: TextAlign.center,
                      style: new TextStyle(fontSize:16.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w300,
                      //  decoration: TextDecoration.underline,
                      fontFamily: "Roboto"),

                      ),
                    ),
              ),

              ),
              Expanded(
              child:Padding(
                padding: EdgeInsets.all(25.0),
                  child:TextField(
                    style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),

              ),
              ),
              FlatButton(key:null,
                  onPressed:buttonPressed,
                  child:
                  Text(
                    "送信",
                    style: TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  )
              ),
            ]
          )


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
  void buttonPressed(){
    setState(() {
       _message="…そのままでいいと思ってんの？";
    });
  }
}