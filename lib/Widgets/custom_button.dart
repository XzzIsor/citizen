import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.function, this.color, this.textColor})
      : super(key: key);

  final String text;
  final VoidCallback function;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: function, 
        child: Text(text, style: const TextStyle(fontSize: 20),), 
        style: ElevatedButton.styleFrom(
          onPrimary: textColor ?? Colors.black, 
          primary: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          elevation: 16,
        )
      ),
    );
  }

  

}
