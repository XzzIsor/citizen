import 'package:flutter/material.dart';

import 'package:citizen/Widgets/custom_button.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import '../src/Models/UserModel.dart';

class LogHeader extends StatelessWidget {
  const LogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle _textStyle = const TextStyle(color: Colors.white, fontSize: 50);

    UserController _userController = UserController();

    Icon _icon = const Icon(Icons.person_search, color: Colors.white, size: 25);
    Text _nameText = Text(_userController.authUser.nombres,
        style: const TextStyle(color: Colors.white, fontSize: 25));

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Row(
        children: [
          CustomButton(
              text: 'Problema',
              function: () {
                Navigator.pushNamed(context, 'problemRegister');
              }),
          SizedBox(width: size.width * 0.4),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Citizen',
              style: _textStyle,
            ),
          ),
          SizedBox(width: size.width * 0.1),
          _nameText,
          SizedBox(
            width: size.width * 0.01,
          ),
          _icon,
          SizedBox(
            width: size.width * 0.01,
          ),
          CustomButton(
            text: 'Logout',
            function: () async {
              await _userController.logoutFromFirebase();
              _userController.authUser = UserModel(
                  id: 'invalid',
                  nombres: 'invalid',
                  apellidos: 'invalid',
                  direccion: 'invalid',
                  email: 'invalid',
                  telefono: 'invalid',
                  password: 'invalid',
                  uid: 'invalid');
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
