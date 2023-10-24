import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double output = 0.0;
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  String selectedOperation = "+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(labelText: "Enter First Number "),
              ),
              TextField(
                controller: secondNumberController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(labelText: "Enter Second Number "),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOperationButton('+'),
                  buildOperationButton('-'),
                  buildOperationButton('*'),
                  buildOperationButton('/'),
                ],
              ),
              ElevatedButton(
                  onPressed: calculateResult,
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 24.0),
                  )),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Text(
                  'Result = ${output.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildOperationButton(String opeation) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(
            () {
              selectedOperation = opeation;
            },
          );
        },
        child: Text(opeation, style: TextStyle(fontSize: 30)),
      ),
    );
  }

  void calculateResult() {
    double number1 = double.tryParse(firstNumberController.text) ?? 0.0;
    double number2 = double.tryParse(secondNumberController.text) ?? 0.0;

    setState(() {
      switch (selectedOperation) {
        case '+':
          output = number1 + number2;
          break;
        case '-':
          output = number1 - number2;
          break;
        case '*':
          output = number1 * number2;
          break;
        case '/':
          if (number2 != 0) {
            output = number1 / number2;
          } else {
            output = 0.0;
          }
          break;
      }
    });
  }
}
