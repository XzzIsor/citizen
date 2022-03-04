import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProblemController {
  final firestore = FirebaseFirestore.instance;
  static ProblemModel _fixedProblem = ProblemModel(
      descripcion: '',
      direccion: '',
      estado: '',
      fijado: false,
      multimedia: '',
      titulo: '',
      ubicacion: const GeoPoint(0.0, 0.0),
      escritor: '');

  static List<ProblemModel> _problems = [];

  Future<void> getProblems() async {
    await firestore.collection("problema").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            ProblemModel problem = ProblemModel.fromMap(element.data());
            problem.setId = element.id;
            problems.add(problem);
          })
        });
  }

  void getFixedProblem() {
    for (var prob in problems) {
      if (prob.fijado) {
        _fixedProblem = prob;
      }
    }
  }

  Future<void> addProblem(ProblemModel problem) async {
    await firestore.collection("problema").add(problem.toMap()).then((value) => print(value));
  }

  ProblemModel get fixedProblem => _fixedProblem;

  List<ProblemModel> get problems => _problems;
}
