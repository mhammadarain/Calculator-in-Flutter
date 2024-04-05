import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String title;
  final Color color;
  final Color bColor;
  final VoidCallback onPress;
  const MyButton({super.key,required this.title,
    required this.onPress,
    this.bColor = const Color(0xFCA6A5A5),
    this.color = const Color(0xff464545)});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: bColor,width: 1,style: BorderStyle.solid),
              color: color
            ),
            child:  Center(child: Text(title,style: const TextStyle(fontSize: 20,color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}
