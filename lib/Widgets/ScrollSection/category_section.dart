import 'package:citizen/Widgets/widgets.dart';
import 'package:citizen/src/Controllers/controllers.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    ProblemController _problemController = ProblemController();

    return Padding(
      padding: EdgeInsets.only(top: _size.height * 0.05),
      child: FutureBuilder(
          future: _problemController.getProblems(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return !snapshot.hasError
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: _size.width * 0.03),
                        child: const Text('Categoría',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                      const SizedBox(height: 25),
                      ScrollHorizontal(
                        children: _problemController.problems,
                        width: _size.width * 0.6,
                        height: _size.height * 0.2,
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                  );
          }),
    );
  }
}
