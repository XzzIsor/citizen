import 'package:flutter/material.dart';

class SuccesfulDialog {
  Future<void> showSuccesfulDialog(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          final Size _size = MediaQuery.of(context).size;
          return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                height: _size.height*0.1,
                width: _size.width*0.1,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                    Color.fromARGB(255, 151, 78, 219),
                    Color.fromARGB(255, 191, 68, 196),
                    ],
                    begin: FractionalOffset(0, 0.6),
                    end: FractionalOffset(0, 1),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                  child: Text('Registro Exitoso, Guapx',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ));
        });
  }
}
