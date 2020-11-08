import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }


}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String outPut = "0";
  String temp = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = "";


  buttonPressed(String buttonValue, BuildContext context){

    if(buttonValue == "Clear"){

      outPut = "0";
      temp = "0";
      num2 = 0.0;
      operator = "";


    }else if(buttonValue == "+" || buttonValue == "-" || buttonValue == "X" || buttonValue == "/"){

      num1 = double.parse(outPut);
      operator = buttonValue;
      temp = "0";

    }else if(buttonValue == "."){

      if(temp.contains(".")){

        return;
      }else{

        temp = temp + buttonValue;
      }
    }else if(buttonValue == "="){
      num2 = double.parse(outPut);
      if(operator == "+"){
        temp = (num1 + num2).toString();
      }if(operator == "-"){
        temp = (num1 - num2).toString();
      }if(operator == "X"){
        temp = (num1 * num2).toString();
      }if (operator == "/"){
        temp = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operator ="";


    }else{
      temp = temp + buttonValue;

    }

    setState(() {
      outPut = double.parse(temp).toStringAsFixed(2);
    });
  }
  Widget buildNumberButton (String buttonValue, BuildContext context){

    return new Expanded(

      child: new OutlineButton(

        padding: new EdgeInsets.all(24.0),
        onPressed: () => buttonPressed(buttonValue, context),
        child: new Text(buttonValue,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.blueGrey[300],
        splashColor: Colors.grey,
        textColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Container(
          padding: EdgeInsets.all(15),
       child :  new Column(
         children: <Widget> [

           new Container(

              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
               alignment: Alignment.centerRight,
               child: new Text(outPut, style: new TextStyle(
                 fontSize: 48.0,
                 fontWeight: FontWeight.bold,
               ),
               )
           ),

           new Expanded(
           child: new Divider(),
         ),
         new Row(
           children: [
             buildNumberButton("1", context),
             buildNumberButton("2", context),
             buildNumberButton("3", context),
             buildNumberButton("+", context)
           ],
         ),
         new Row(
           children: [
             buildNumberButton("4", context),
             buildNumberButton("5", context),
             buildNumberButton("6", context),
             buildNumberButton("-", context)
           ],
         ),
         new Row(
           children: [
             buildNumberButton("7", context),
             buildNumberButton("8", context),
             buildNumberButton("9", context),
             buildNumberButton("X", context)
           ],
         ),
         new Row(
           children: [
             buildNumberButton(".", context),
             buildNumberButton("0", context),
             buildNumberButton("00", context),
             buildNumberButton("/", context)
           ],
         ),
         new Row(
           children: [
             buildNumberButton("Clear", context),
             buildNumberButton("=", context)
           ],
         )
       ],)
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
