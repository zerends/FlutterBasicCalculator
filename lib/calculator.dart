

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8", (Colors.grey[850])!, Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("x", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("0", (Colors.grey[850])!, Colors.white),
                numButton(".", (Colors.grey[850])!, Colors.white),
                numButton("Del", Colors.red, Colors.black),
                numButton("=", Colors.orange, Colors.white),
                
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  
  int sayi1 = 0;
  int sayi2 = 0;
  String sonuc = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      sonuc = "";
      text = "";
      sayi1 = 0;
      sayi2 = 0;

    } else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/") {

      sayi1 = int.parse(text);
      sonuc = "";
      operation = btnText;
    
    } else if(btnText=="Del"){
      sonuc = sonuc.substring(0,sonuc.length-1);

    } else if (btnText == "=") {
      sayi2 = int.parse(text);
      if (operation == "+") {
        sonuc = (sayi1 + sayi2).toString();
      }
      
    } else {
      sonuc = int.parse(text + btnText).toString();
    }
    setState(() {
      text = sonuc;
    });
  }
}