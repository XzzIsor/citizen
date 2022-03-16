import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

class UpdateProblemForm extends StatefulWidget {
  const UpdateProblemForm({Key? key, required this.problem}) : super(key: key);
  final ProblemModel problem;

  @override
  State<UpdateProblemForm> createState() => _UpdateProblemFormState();
}

class _UpdateProblemFormState extends State<UpdateProblemForm> {
  final ProblemController _problemController = ProblemController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    String _trace = '';
    String _progress = '';

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 191, 68, 196),
        borderRadius: BorderRadius.circular(25),
      ),
      width: _size.width * 0.35,
      height: _size.height * 0.5,
      child: Form(
        child: Column(
          children: [
            CustomTextField(
              initialValue: widget.problem.progreso,
              label: 'Trazabilidad',
              icon: Icons.abc_rounded,
              hintText: 'Progreso del proyecto',
              onChange: (value) {
                _trace = value;
              },
              emailType: false,
              obscureText: false,
              maxLines: 10,
            ),
            SizedBox(height: _size.height * 0.02),
            CustomTextField(
              initialValue: widget.problem.estado,
              label: 'Progreso',
              icon: Icons.percent_outlined,
              hintText: '20',
              onChange: (value) {
                _progress = value;
              },
              emailType: false,
              obscureText: false,
              validator: (value) {
                String? resp = int.tryParse(value!) == null
                    ? 'Ingrese un valor numérico'
                    : null;
                return resp;
              },
            ),
            SizedBox(height: _size.height * 0.02),
            CustomButton(
                text: 'Subir',
                function: () async {
                  widget.problem.estado = _progress;
                  widget.problem.progreso = _trace;
                  await _problemController.updateProgressProblem(widget.problem);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                })
          ],
        ),
      ),
    );
  }
}
