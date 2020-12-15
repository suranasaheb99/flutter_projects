import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculator",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String operatortoperform;
  String res;

  void btnclicked(String btntext){
    if(btntext == "C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "0";
    }
    else if(btntext == "+" || btntext == "-" || btntext == "*" || btntext == "/"){
      // print("hi its working");
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btntext;
    }
    else if(btntext == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    }
      else {
        res = int.parse(texttodisplay + btntext).toString();
      }

      setState(() {
        texttodisplay = res;
      });
  }

  Widget custombutton(String btnval){
    return Expanded(                     //taki area equally divide ho jaye
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => btnclicked(btnval),
          child: Text(
              "$btnval",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator"
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                "$texttodisplay",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700
                  ),
              ),
            ),
            ),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


