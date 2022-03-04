import 'package:citizen/Widgets/Login/login_dialog.dart';
import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderMain extends StatelessWidget {
  const HeaderMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    TextStyle _textStyle = const TextStyle(color: Colors.white, fontSize: 50);
    LoginDialog _loginDialog = LoginDialog();
    SingInDialog _singInDialog = SingInDialog();

    CustomButton _logButton = CustomButton(
        text: 'Registrar',
        function: () {
          _singInDialog.showSingInDialog(context);
        });
    CustomButton _singInButton = CustomButton(
      text: 'Ingresar',
      function: () async {
        _loginDialog.showLoginDialog(context);
      },
      color: const Color.fromRGBO(236, 98, 188, 1),
      textColor: Colors.white,
    );

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.5),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Citizen',
              style: _textStyle,
            ),
          ),
          SizedBox(width: size.width * 0.20),
          _logButton,
          _singInButton
        ],
      ),
    );
  }
}
