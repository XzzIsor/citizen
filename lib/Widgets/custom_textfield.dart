import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.hintText,
      required this.onChange,
      required this.emailType,
      required this.obscureText,
      this.initialValue,
      this.inputFormatters, this.validator, this.counterText})
      : super(key: key);

  final String label;
  final String? counterText;
  final IconData icon;
  final String hintText;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final bool emailType;
  final bool obscureText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            initialValue: widget.initialValue,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
            onTap: _requestFocus,
            focusNode: _focusNode,
            onChanged: widget.onChange,
            keyboardType: widget.emailType
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(widget.icon, color: Colors.white),
              labelText: widget.label,
              labelStyle: TextStyle(
                  color:
                      _focusNode!.hasFocus ?  Colors.white : Colors.black),
              fillColor: const Color.fromRGBO(18, 94, 169, 1),
              hintText: widget.hintText,
              enabledBorder: _borderStyle(),
              focusedBorder: _borderStyle(),
              counterText: widget.counterText
            ),
            validator: widget.validator
          );
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  UnderlineInputBorder _borderStyle() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.5));
  }
}