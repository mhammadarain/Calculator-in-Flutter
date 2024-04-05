import 'package:calculator_flutter/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var userInput = "";
  var answer = "0";
  final Color color1 = const Color(0xff003560);
  final Color color2 = const Color(0xFC6E6D6D);
  final Color bColorBlue =  Colors.blue;
  final Color bColorGray = const Color(0xcbfaf9f9);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFC6E6D6D),width: 0.2,style: BorderStyle.solid),
                      color: const Color(0xA31A1A1A),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,

                        ),
                        Text(userInput.toString(),style: const TextStyle(fontSize: 30,color: Colors.white),),
                        const SizedBox(height: 45,),
                        Text(answer.toString(),style: const TextStyle(fontSize: 45,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(title: "AC", onPress: (){
                            userInput = "";
                            answer = "";
                            setState(() {

                            });
                          },color: color2,bColor: bColorGray,),
                          MyButton(title: "^",onPress: (){
                            userInput += "^";
                            setState(() {

                            });
                          },color: color2,bColor: bColorGray,),
                          MyButton(title: "%", onPress: (){
                            userInput += "%";
                            setState(() {

                            });
                          },color: color2,bColor: bColorGray,),
                          MyButton(title: "/", onPress: (){
                            userInput += "/";
                            setState(() {

                            });
                          }, color: color1,bColor: bColorBlue,)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: "7", onPress: (){
                            userInput += "7";
                            setState(() {
                            });
                          },),
                          MyButton(title: "8",onPress: (){
                            userInput += "8";
                            setState(() {

                            });
                          },),
                          MyButton(title: "0", onPress: (){
                            userInput += "0";
                            setState(() {

                            });
                          },),
                          MyButton(title: "x", onPress: (){
                            userInput += "*";
                            setState(() {

                            });
                          }, color: color1,bColor: bColorBlue,)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: "4", onPress: (){
                            userInput += "4";
                            setState(() {

                            });
                          },),
                          MyButton(title: "5",onPress: (){
                            userInput += "5";
                            setState(() {

                            });
                          },),
                          MyButton(title: "6", onPress: (){
                            userInput += "6";
                            setState(() {

                            });
                          },),
                          MyButton(title: "-", onPress: (){
                            userInput += "-";
                            setState(() {

                            });
                          }, color: color1,bColor: bColorBlue,)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: "1", onPress: (){
                            userInput += "1";
                            setState(() {

                            });
                          },),
                          MyButton(title: "2",onPress: (){
                            userInput += "2";
                            setState(() {

                            });
                          },),
                          MyButton(title: "3", onPress: (){
                            userInput += "3";
                            setState(() {

                            });
                          },),
                          MyButton(title: "+", onPress: (){
                            userInput += "+";
                            setState(() {

                            });
                          }, color: color1,bColor: bColorBlue,)
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: "DEL", onPress: (){
                            userInput = userInput.substring(0,userInput.length -1);
                            setState(() {

                            });
                          },color: color2,bColor: bColorGray,),
                          MyButton(title: "0",onPress: (){
                            userInput += "0";
                            setState(() {

                            });
                          },),
                          MyButton(title: ".", onPress: (){
                            userInput += ".";
                            setState(() {

                            });
                          },),
                          MyButton(title: "=", onPress: (){
                            equalPress();
                            setState(() {

                            });
                          }, color: color1,bColor: bColorBlue,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}