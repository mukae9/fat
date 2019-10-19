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
  String _message;
  double _value = 50.0;
  final controller = TextEditingController();

  @override
  void initState(){
    _message='嘘偽りない体重を記録\n$_value kg';
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
              Padding(
                padding: EdgeInsets.all(25.0),
                    child:Slider(
                      key: null,
                      onChanged: textChanged,
                      value:_value,
                      min: 20.0,
                      max: 100.0,

                    ),
//                  child:TextField(
//                    controller: controller,
//                    onChanged: textChanged,
//                    style: new TextStyle(fontSize:12.0,
//                        color: const Color(0xFF000000),
//                        fontWeight: FontWeight.w200,
//                        fontFamily: "Roboto"),
//                  ),

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
          ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
            new BottomNavigationBarItem(
                icon: const Icon(Icons.create),
            title: new Text('Add'),
            ),

            new BottomNavigationBarItem(
            icon: const Icon(Icons.assessment),
            title: new Text('Graf'),
            ),

            new BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            title: new Text('Mydate'),
            )
            ]

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
    setState(() {
//       _message=controller.text + "Kg…\n"+"そのままでいいと思ってんの？";
         _message= '$_value Kg…\nそのままでいいと思ってんの？';
    });
  }
}