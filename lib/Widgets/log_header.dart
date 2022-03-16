import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

import 'package:citizen/src/Controllers/controllers.dart';

class LogHeader extends StatelessWidget {
  const LogHeader({Key? key, this.isProblem}) : super(key: key);
  final bool? isProblem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle _textStyle = const TextStyle(color: Colors.white, fontSize: 50);

    ProblemProvider _problemProvider = ProblemProvider();
    ProblemController _problemController = ProblemController();
    UserController _userController = UserController();
    UpdateProblemDialog _problemDialog = UpdateProblemDialog();
   

    Widget _fixButton = isProblem == null
        ? Container()
        : CustomButton(
            text: 'Fijar',
            function: () async {
              await _problemController.setFixedProblem(_problemProvider.selectedProblem);
              Navigator.pushReplacementNamed(context, '/');
            });
    Widget _updateButton = isProblem == null
        ? Container()
        : CustomButton(
            text: 'Trazar',
            function: () {
              _problemDialog.showProblemDialog(context, _problemProvider.selectedProblem);
            });

    Icon _icon = const Icon(Icons.person_search, color: Colors.white, size: 25);
    SizedBox _nameText = SizedBox(
        width: size.width * 0.07,
        child: Text(
          _userController.authUser.nombres,
          style: const TextStyle(color: Colors.white, fontSize: 25),
          overflow: TextOverflow.ellipsis,
        ));

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Row(
        children: [
          _userController.authUser.admin
              ? _fixButton
              : CustomButton(
                  text: 'Problema',
                  function: () {
                    Navigator.pushNamed(context, 'problemRegister');
                  }),
          SizedBox(width: size.width * 0.01),
          _userController.authUser.admin ? _updateButton : Container(),
          
          _updateButton == Container() ? SizedBox(width: size.width * 0.4):SizedBox(width: size.width * 0.3),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Citizen',
              style: _textStyle,
            ),
          ),
          SizedBox(width: size.width * 0.2),
          _icon,
          SizedBox(
            width: size.width * 0.01,
          ),
          _nameText,
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
                  uid: 'invalid',
                  admin: false);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
