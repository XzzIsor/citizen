
import 'package:citizen/Widgets/ScrollSection/card_scroll.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:flutter/material.dart';

class ScrollHorizontal extends StatefulWidget {
  const ScrollHorizontal({
    Key? key,
    required this.children,
    required this.width,
    required this.height,
  }) : super(key: key);

  final List<ProblemModel> children;
  final double width;
  final double height;

  @override
  State<ScrollHorizontal> createState() => _ScrollHorizontalState();
}

class _ScrollHorizontalState extends State<ScrollHorizontal> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
              onPressed: () => _controller.previousPage(duration: const Duration(milliseconds: 800), curve: Curves.decelerate),
              icon: const Icon(Icons.arrow_back_ios)),
          SizedBox(
              height: widget.height,
              width: widget.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: widget.children.length,
                itemBuilder: (BuildContext context, int index) => ScrollCard(problem: widget.children[index],))
              ),
          IconButton(
              onPressed: () => _controller.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.decelerate),
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
