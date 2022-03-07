import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/user_controller.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    bool _exist = true;

    UserController _userController = UserController();
    String _email = '';
    String _password = '';

    CustomTextField _emailInput = CustomTextField(
        label: 'E-Mail',
        icon: Icons.email_outlined,
        hintText: 'example@gmail.com',
        onChange: (value) {
          _email = value;
        },
        emailType: true,
        obscureText: false);

    CustomTextField _passwordInput = CustomTextField(
      label: 'Contraseña',
      icon: Icons.lock_outline,
      hintText: 'juanitogolondrina123',
      onChange: (value) {
        _password = value;
      },
      emailType: false,
      obscureText: true,
      maxLines: 1,
    );

    TextButton _forgetButton = TextButton(
        onPressed: () {},
        child: const Text(

          '¿Olvidó su contraseña?',

          style: TextStyle(color: Colors.white),
        ));

    ElevatedButton _button = ElevatedButton(
      onPressed: () {
        _userController.authenticateUser(email: _email, password: _password);

        if (_userController.authUser.id != 'invalid') {
          Navigator.pushNamedAndRemoveUntil(
              context, 'logmain', (Route<dynamic> route) => false);
        } else {
          setState(() {
            _exist = false;
          });
        }
      },
      child: const Text(
        'Ingresar',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPrimary: Colors.transparent,
          primary: Colors.transparent,
          side: const BorderSide(color: Colors.white),
          onSurface: Colors.white),
    );

    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ],
            begin: FractionalOffset(0, 0.6),
            end: FractionalOffset(0, 1),
          ),
          borderRadius: BorderRadius.circular(25)),
      height: _size.height * 0.6,
      width: _size.width * 0.25,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              const Text('Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: _emailInput,
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: _passwordInput,
              ),
              const SizedBox(height: 15),
              _forgetButton,
              const SizedBox(height: 110),
              _button,
              const SizedBox(height: 15),
              Text(
                'El usuario no existe',
                style: TextStyle(color: _exist ? Colors.transparent : Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
