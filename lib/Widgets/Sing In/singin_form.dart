import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';

class SingInForm extends StatelessWidget {
  const SingInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    UserController _userController = UserController();

    UserModel _user = UserModel(
        id: '',
        nombres: '',
        apellidos: '',
        direccion: '',
        email: '',
        telefono: '',
        password: '');

    CustomTextField _emailInput = CustomTextField(
        label: 'E-Mail',
        icon: Icons.email_outlined,
        hintText: 'example@gmail.com',
        onChange: (value) {
          _user.email = value;
        },
        emailType: true,
        obscureText: false);

    CustomTextField _passwordInput = CustomTextField(
      label: 'Contraseña',
      icon: Icons.lock_outline,
      hintText: 'juanitogolondrina123',
      onChange: (value) {
        _user.password = value;
      },
      emailType: false,
      obscureText: true,
    );

    CustomTextField _nameInput = CustomTextField(
      label: "Nombre",
      icon: Icons.person_add,
      hintText: "Pepito",
      onChange: (value) {
        _user.nombres = value;
      },
      emailType: false,
      obscureText: false,
    );

    CustomTextField _lastNameInput = CustomTextField(
      label: "Apellido",
      icon: Icons.abc,
      hintText: "Rodriguez",
      onChange: (value) {
        _user.apellidos = value;
      },
      emailType: false,
      obscureText: false,
    );

    CustomTextField _addressInput = CustomTextField(
      label: "Dirección",
      icon: Icons.house_outlined,
      hintText: "Cra 17 - #67 N66",
      onChange: (value) {
        _user.direccion = value;
      },
      emailType: false,
      obscureText: false,
    );

    CustomTextField _phoneInput = CustomTextField(
      label: "Teléfono",
      icon: Icons.phone_callback,
      hintText: "3226411321",
      onChange: (value) {
        _user.telefono = value;
      },
      emailType: false,
      obscureText: false,
    );

    CustomTextField _idInput = CustomTextField(
      label: "Cédula",
      icon: Icons.card_membership_outlined,
      hintText: "1002965448",
      onChange: (value) {
        _user.id = value;
      },
      emailType: false,
      obscureText: false,
    );

    ElevatedButton _button = ElevatedButton(
      onPressed: () {
        _userController.registerUser(user: _user);
        Navigator.of(context).pop();
        SuccesfulDialog _succesfulDialog = SuccesfulDialog();
        _succesfulDialog.showSuccesfulDialog(context);
      },
      child: const Text(
        'Registrar',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPrimary: Colors.transparent,
          primary: Colors.transparent,
          side: const BorderSide(color: Colors.white),
          onSurface: Colors.white),
    );

    TextButton _loginButton = TextButton(
        onPressed: () {},
        child: const Text(
          '¿Ya tienes una cuenta?',
          style: TextStyle(color: Colors.white),
        ));

    GoogleSingInButton _googleButton = GoogleSingInButton(
        height: _size.height * 0.06, width: _size.width * 0.15);

    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 151, 78, 219),
              Color.fromARGB(255, 191, 68, 196),
            ],
            begin: FractionalOffset(0, 0.6),
            end: FractionalOffset(0, 1),
          ),
          borderRadius: BorderRadius.circular(25)),
      height: _size.height * 0.75,
      width: _size.width * 0.65,
      child: Form(
        child: Column(
          children: [
            SizedBox(height: _size.height * 0.02),
            const Text('Registro',
                style: TextStyle(color: Colors.white, fontSize: 40)),
            FormContent(
                size: _size,
                emailInput: _emailInput,
                passwordInput: _passwordInput,
                nameInput: _nameInput,
                lastNameInput: _lastNameInput,
                idInput: _idInput,
                phoneInput: _phoneInput,
                addressInput: _addressInput),
            _button,
            const SizedBox(height: 10),
            _loginButton,
            const SizedBox(height: 25),
            _googleButton
          ],
        ),
      ),
    );
  }

  User() {}
}

class FormContent extends StatelessWidget {
  const FormContent({
    Key? key,
    required Size size,
    required CustomTextField emailInput,
    required CustomTextField passwordInput,
    required CustomTextField nameInput,
    required CustomTextField lastNameInput,
    required CustomTextField idInput,
    required CustomTextField phoneInput,
    required CustomTextField addressInput,
  })  : _size = size,
        _emailInput = emailInput,
        _passwordInput = passwordInput,
        _nameInput = nameInput,
        _lastNameInput = lastNameInput,
        _idInput = idInput,
        _phoneInput = phoneInput,
        _addressInput = addressInput,
        super(key: key);

  final Size _size;
  final CustomTextField _emailInput;
  final CustomTextField _passwordInput;
  final CustomTextField _nameInput;
  final CustomTextField _lastNameInput;
  final CustomTextField _idInput;
  final CustomTextField _phoneInput;
  final CustomTextField _addressInput;

  @override
  Widget build(BuildContext context) {
    Padding _rightColumn = Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        height: _size.height * 0.45,
        width: _size.width * 0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _emailInput,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _passwordInput,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _nameInput,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _lastNameInput,
            ),
          ],
        ),
      ),
    );

    Padding _leftColumn = Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        height: _size.height * 0.45,
        width: _size.width * 0.3,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _idInput,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _phoneInput,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _addressInput,
          ),
        ]),
      ),
    );

    return Row(
      children: [_rightColumn, _leftColumn],
    );
  }
}
