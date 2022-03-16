import 'package:citizen/src/Controllers/controllers.dart';
import 'package:flutter/material.dart';

import 'package:citizen/Widgets/widgets.dart';

class RecoveryForm extends StatelessWidget {
  const RecoveryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final UserController _userController = UserController();
    StateRecoveryDialog _stateRecoveryDialog = StateRecoveryDialog();
    String email = '';

    return Container(
      height: _size.height * 0.2,
      width: _size.width * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(241, 142, 172, 1),
              Color.fromRGBO(236, 98, 188, 1),
            ],
          )),
      child: Form(
        child: Column(
          children: [
            const Text('Ingrese su correo electrónico',
                style: TextStyle(color: Colors.white)),
            SizedBox(height: _size.height * 0.02),
            CustomTextField(
                label: 'E-Mail',
                icon: Icons.email_outlined,
                hintText: 'example@gmail.com',
                onChange: (value) {
                  email = value;
                },
                emailType: false,
                obscureText: false),
            SizedBox(height: _size.height * 0.02),
            CustomButton(
                text: 'Enviar',
                function: () async {
                  await _userController.sendRecoveryPassword(email);
                  Navigator.pop(context);
                  if (ErrorProvider.error == '') {
                    _stateRecoveryDialog.showStateRecoveryDialog(
                        context, 'Correo Enviado');
                  } else {
                    _stateRecoveryDialog.showStateRecoveryDialog(
                        context, ErrorProvider.error);
                  }
                })
          ],
        ),
      ),
    );
  }
}
