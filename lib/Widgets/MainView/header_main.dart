import 'package:citizen/Widgets/Login/login_dialog.dart';
import 'package:citizen/Widgets/Sing%20In/singin_dialog.dart';
import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeaderMain extends StatelessWidget {
  const HeaderMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle _textStyle = const TextStyle(color: Colors.white, fontSize: 50);
    LoginDialog _loginDialog = LoginDialog();
    SingInDialog _singInDialog = SingInDialog();

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.5),
          Text(
            'Citizen',
            style: _textStyle,
          ),
          SizedBox(width: size.width * 0.20),
          CustomButton(
              text: 'Registrar',
              function: () {
                _singInDialog.showSingInDialog(context);
              }),
          CustomButton(
            text: 'Ingresar',
            function: () {
              _loginDialog.showLoginDialog(context);
            },
            color: const Color.fromRGBO(236, 98, 188, 1),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
