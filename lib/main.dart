import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Calculadora'),
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
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operando = "";

  ///Metodo para darle una accion a un boton presionado
  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operando = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operando = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Ya contiene un punto");
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operando == "+") {
        _output = (num1 + num2).toString();
      }
      if (operando == "-") {
        _output = (num1 - num2).toString();
      }
      if (operando == "/") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          print("No se puede dividir por 0");
        }
      }
      if (operando == "X") {
        _output = (num1 * num2).toString();
      }

      num1 =0.0;
      num2 =0.0;
      operando = "";

    }else{
      _output += buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  ///Constructor para un boton de la calculadora
  Widget buildButton(String buttonText, Color color) {
    return new Expanded(
      child: new MaterialButton(
        color: color,
        //textColor: Colors.white,
        padding: new EdgeInsets.all(20.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        // textColor: Colors.white,
      ),
    );
  }

  ///Main
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                buildButton("7", Colors.lightGreenAccent[100]),
                buildButton("8", Colors.lightGreenAccent[100]),
                buildButton("9", Colors.lightGreenAccent[100]),
                buildButton("/", Colors.red[300])
              ]),
              new Row(children: [
                buildButton("4", Colors.lightGreenAccent[100]),
                buildButton("5", Colors.lightGreenAccent[100]),
                buildButton("6", Colors.lightGreenAccent[100]),
                buildButton("X", Colors.orange[300])
              ]),
              new Row(children: [
                buildButton("1", Colors.lightGreenAccent[100]),
                buildButton("2", Colors.lightGreenAccent[100]),
                buildButton("3", Colors.lightGreenAccent[100]),
                buildButton("-", Colors.red[300])
              ]),
              new Row(children: [
                buildButton(".", Colors.lightGreenAccent[100]),
                buildButton("0", Colors.lightGreenAccent[100]),
                buildButton("00", Colors.lightGreenAccent[100]),
                buildButton("+", Colors.orange[300])
              ]),
              new Row(children: [
                buildButton("CLEAR", Colors.redAccent),
                buildButton("=", Colors.cyanAccent)
              ]),
            ]),
          ],
        )));
  }
}
