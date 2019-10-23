import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_app/main.dart';


class ThirdPage extends StatefulWidget {
  ThirdPage({Key key}) : super(key: key);
  @override
  _ThirdPageState createState() => new _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String _message;
  double _value = 50.0;
  int _index = 0;
  final controller = TextEditingController();

  @override
  void initState() {
    _message = '自分の情報設定\n$_value kg';
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


            Padding(
              padding: EdgeInsets.all(25.0),
              child: Slider(
                key: null,
                onChanged: textChanged,
                value: _value,
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
        currentIndex: 2,
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
          if(value == 0)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          if(value == 1)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
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
    setState(() {
//       _message=controller.text + "Kg…\n"+"そのままでいいと思ってんの？";
      _message= '$_value Kg…\nそのままでいいと思ってんの？';
    });
  }

  void tapBottomIcon(int value){
    var items = ['追加ページ','グラフページ','マイページ'];
    setState((){
      _index = value;
      _message ='you tapped:"'+items[_index]+'".';
    });
  }
}

