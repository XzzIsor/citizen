import 'package:citizen/src/Models/models.dart';

class ProblemProvider {
  static ProblemModel? _selectedProblem;

  ProblemModel get selectedProblem => _selectedProblem!;

  set selectedProblem(ProblemModel problem) {
    _selectedProblem = problem;
  }
}
