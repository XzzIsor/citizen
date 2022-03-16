// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProblemController {
  final firestore = FirebaseFirestore.instance;
  static ProblemModel _fixedProblem = ProblemModel(
      descripcion: '',
      direccion: '',
      estado: '',
      fijado: false,
      multimedia: [],
      titulo: '',
      ubicacion: const GeoPoint(0.0, 0.0),
      escritor: '',
      progreso: '');

  static List<ProblemModel> _problems = [];

  Future<void> getProblems() async {
    _problems = [];
    await firestore.collection("problema").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            ProblemModel problem = ProblemModel.fromMap(element.data());
            problem.setId = element.id;
            _problems.add(problem);
          })
        });
    getFixedProblem();
  }

  void getFixedProblem() {
    for (ProblemModel prob in _problems) {
      if (prob.fijado) {
        _fixedProblem = prob;
      }
    }
  }

  Future<void> addProblem(ProblemModel problem) async {
    await firestore.collection("problema").add(problem.toMap());
  }

  ProblemModel get fixedProblem => _fixedProblem;

  Future<void> setFixedProblem(ProblemModel newProblem) async {
    await _editFixProblem(fixedProblem);
    await _editFixProblem(newProblem);
  }

  Future<void> _editFixProblem(ProblemModel problem) async {
    bool update = !problem.fijado;

    await firestore
        .collection("problema")
        .doc(problem.id)
        .update({"fijado": update});
  }

  Future<void> updateProgressProblem(ProblemModel problem) async {
    await firestore
        .collection("problema")
        .doc(problem.id)
        .update({"estado": problem.estado, "progreso": problem.progreso});
  }

  List<ProblemModel> get problems => _problems;
}
