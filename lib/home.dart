// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputText = '';
  String result = '';
  String t1 = "0";
  String t2 = "0";
  String t5 = "0";
  String t10 = "0";
  String t20 = "0";
  String t50 = "0";
  String t100 = "0";
  String t500 = "0";

  final snackBar = SnackBar(
    content: Text('Length exceeded'),
  );

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'CLEAR') {
        inputText = "";
        t1 = '0';
        t2 = '0';
        t5 = '0';
        t10 = '0';
        t20 = '0';
        t50 = '0';
        t100 = '0';
        t500 = '0';
      } else if (buttonText == 'DELETE') {
        inputText = inputText.substring(0, inputText.length - 1);
        calculations();
      } else {
        inputText = inputText + buttonText;
        calculations();
      }
    });
  }

  void calculations() {
    int amount = int.parse(inputText);

    t500 = '${amount ~/ 500}';
    amount %= 500;

    t100 = '${amount ~/ 100}';
    amount %= 100;

    t50 = '${amount ~/ 50}';
    amount %= 50;

    t20 = '${amount ~/ 20}';
    amount %= 20;

    t10 = '${amount ~/ 10}';
    amount %= 10;

    t5 = '${amount ~/ 5}';
    amount %= 5;

    t2 = '${amount ~/ 2}';
    amount %= 2;

    t1 = '$amount';
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return ElevatedButton(
      onPressed: () => buttonPressed(buttonText),
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(primary: buttonColor, elevation: 0),
    );
  }

  Widget inputField() {
    return Container(
        margin: EdgeInsets.only(right: 16, top: 25),
        child: Text(
          'Taka: $inputText',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ));
  }

  Widget noteText(String moneyText) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Text(
          moneyText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Widget portraitView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                noteText('500: $t500'),
                noteText('100: $t100'),
                noteText('50: $t50'),
                noteText('20: $t20'),
                noteText('10: $t10'),
                noteText('5: $t5'),
                noteText('2: $t2'),
                noteText('1: $t1'),
              ],
            ),
          ],
        ),
        Column(
          children: [
            inputField(),
            tableButtons(),
          ],
        )
      ],
    );
  }

  Widget landscapeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        inputField(),
        Table(
          children: [
            TableRow(
              children: [
                buildButton('1', Colors.grey),
                buildButton('2', Colors.grey),
                buildButton('3', Colors.grey),
              ],
            ),
            TableRow(
              children: [
                buildButton('4', Colors.grey),
                buildButton('5', Colors.grey),
                buildButton('6', Colors.grey),
              ],
            ),
            TableRow(
              children: [
                buildButton('7', Colors.grey),
                buildButton('8', Colors.grey),
                buildButton('9', Colors.grey),
              ],
            ),
            TableRow(
              children: [
                buildButton('0', Colors.grey),
                buildButton('CLEAR', Colors.red),
                buildButton('DELETE', Colors.blue)
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            noteText('500: $t500'),
            noteText('100: $t100'),
            noteText('50: $t50'),
            noteText('20: $t20'),
            noteText('10: $t10'),
            noteText('5: $t5'),
            noteText('2: $t2'),
            noteText('1: $t1'),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VangtiChai'),
        backgroundColor: Colors.grey,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraitView();
        } else {
          return landscapeView();
        }
      }),
    );
  }

  Container tableButtons() {
    return Container(
      margin: EdgeInsets.all(50),
      child: Table(
        children: [
          TableRow(
            children: [
              buildButton('1', Colors.grey),
              buildButton('2', Colors.grey),
              buildButton('3', Colors.grey),
            ],
          ),
          TableRow(
            children: [
              buildButton('4', Colors.grey),
              buildButton('5', Colors.grey),
              buildButton('6', Colors.grey),
            ],
          ),
          TableRow(
            children: [
              buildButton('7', Colors.grey),
              buildButton('8', Colors.grey),
              buildButton('9', Colors.grey),
            ],
          ),
          TableRow(
            children: [
              buildButton('0', Colors.grey),
              buildButton('CLEAR', Colors.red),
              buildButton('DELETE', Colors.blue)
            ],
          ),
        ],
      ),
    );
  }
}
