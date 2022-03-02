
import 'package:citizen/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: _size.height* 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: _size.width * 0.03),
            child: const Text('Categoría', style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          const SizedBox(height: 25),
          ScrollHorizontal(
            children: const [
              ScrollCard(title: 'Título'),
              ScrollCard(title: 'Título2'),
              ScrollCard(title: 'Título3'),
              ScrollCard(title: 'Título4'),
              ScrollCard(title: 'Título5')
            ],
            width: _size.width * 0.6,
            height: _size.height * 0.2,
          )
        ],
      ),
    );
  }
}
