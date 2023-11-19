import 'package:flutter/material.dart';
import 'package:practise_2/custom_button.dart';
import 'dart:math' as Math;
class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator-screen';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resText, style: TextStyle(fontSize: 24)),
            ],
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(text: '%', onButtonClick: onOperatorClick),
                CustomButton(text: 'sin', onButtonClick: onSinClick),
                // CustomButton(icon: , onButtonClick: onOperatorClick),
                CustomButton(text: 'C', onButtonClick: onClearClick),
                Expanded(
                    child: ElevatedButton.icon(
                  onPressed: onBackSpace,
                  icon: Icon(Icons.backspace),
                  label: Text(''),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(text: '7', onButtonClick: onDigitCLick),
                CustomButton(text: '8', onButtonClick: onDigitCLick),
                CustomButton(text: '9', onButtonClick: onDigitCLick),
                CustomButton(text: '*', onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(text: '4', onButtonClick: onDigitCLick),
                CustomButton(text: '5', onButtonClick: onDigitCLick),
                CustomButton(text: '6', onButtonClick: onDigitCLick),
                CustomButton(text: '/', onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(text: '1', onButtonClick: onDigitCLick),
                CustomButton(text: '2', onButtonClick: onDigitCLick),
                CustomButton(text: '3', onButtonClick: onDigitCLick),
                CustomButton(text: '+', onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(text: '.', onButtonClick: onDigitCLick),
                CustomButton(text: '0', onButtonClick: onDigitCLick),
                CustomButton(text: '=', onButtonClick: onEqualClick),
                CustomButton(text: '-', onButtonClick: onOperatorClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onClearClick(String clrear){
    resText = '';
    lhs = '';
    operator = '';
    setState(() {

    });
  }
  onBackSpace(){
    // String x = "aaabcd";
    List<String> output = resText.split(""); // ['a', 'a', 'a', 'b', 'c', 'd']
    output.removeLast(); // ['a', 'a', 'a', 'b', 'c']
    resText = output.join(); //aaabc
    setState(() {

    });

  }

  onDigitCLick(String text) {
    resText += text;
    setState(() {});
  }

  String lhs = '';
  String operator = '';

  onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, operator, rhs);
    }
    operator = clickedOperator;
    resText = '';
    setState(() {});
  }

  onEqualClick(String equal) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }
  onSinClick(String sin){
    String lhs = resText;
    double num = double.parse(lhs);
    double val = Math.sin(num);

    // print(Math.pi);
    resText = val.toString();
    setState(() {

    });
    // print(res);
  }
  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;
    if (operator == '+') {
      res = num1 + num2;
    } else if (operator == '-') {
      res = num1 - num2;
    } else if (operator == '*') {
      res = num1 * num2;
    } else if (operator == '/') {
      res = num1 / num2;
    } else if (operator == '%') {
      res = num1 % num2;
    }
    return res.toString();
  }


//---------------

// onDigitCLick(String text) {
//   resText += text;
//   setState(() {
//   });
// }
//
// String lhs = '';
// String operator = '';
// onOperatorClick(String  clickedOperator){
//   if(operator.isEmpty){
//     lhs = resText;
//     operator = clickedOperator;
//     resText = '';
//   }else{
//     String rhs = resText;
//     lhs = calculate(lhs, operator, rhs);
//   }
//   operator = clickedOperator;
//   resText = '';
//   setState(() {
//
//   });
//
// }
//
// void onEqualClick(String equal){
//   String rhs = resText;
//   resText = calculate(lhs, operator, rhs);
//   lhs = '';
//   operator = '';
//   setState(() {
//
//   });
// }
//
// String calculate(String lhs, String operator, String rhs) {
//   double num1 = double.parse(lhs);
//   double num2 = double.parse(rhs);
//   double res = 0.0;
//   if(operator == '+'){
//     res = num1 + num2;
//   }
//   else if(operator == '-'){
//     res = num1 - num2;
//   }
//   else if(operator == '*'){
//     res = num1 * num2;
//   }
//   else if(operator == '/'){
//     res = num1 / num2;
//   }
//   return res.toString();
// }
}
