import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var btnresult = '';

  Widget customebtn(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(30.0),
      onPressed: () {
        setState(() {
          btnresult += btnvalue;
        });
      },
      child: Text(
        '$btnvalue',
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  Widget customeclr(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(30.0),
      onPressed: () {
        setState(() {
          btnresult = '';
        });
      },
      child: Text(
        '$btnvalue',
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  Widget resultbtn(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(30.0),
      onPressed: () {
        setState(() {
          Parser p = Parser();
          Expression exp = p.parse(btnresult);
          ContextModel cm = ContextModel();
          double evel = exp.evaluate(EvaluationType.REAL, cm);
          btnresult = evel.toString();
        });
      },
      child: Text(
        '$btnvalue',
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$btnresult',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                customebtn('9'),
                customebtn('8'),
                customebtn('7'),
                customebtn('+')
              ],
            ),
            Row(
              children: [
                customebtn('6'),
                customebtn('5'),
                customebtn('4'),
                customebtn('-')
              ],
            ),
            Row(
              children: [
                customebtn('3'),
                customebtn('2'),
                customebtn('1'),
                customebtn('*')
              ],
            ),
            Row(
              children: [
                customeclr('C'),
                customebtn('0'),
                resultbtn('='),
                customebtn('/')
              ],
            )
          ],
        ),
      ),
    );
  }
}
