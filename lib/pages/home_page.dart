import 'package:flutter/material.dart';

import 'widgets/menu_widget.dart';
import 'widgets/section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final globalKeySection1 = GlobalKey();
  final globalKeySection2 = GlobalKey();
  final globalKeySection3 = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            MenuWidget(
              onSectionTap: _onSectionTap,
            ),
            SectionWidget(
              key: globalKeySection1,
              color: Colors.black,
              height: size.height,
            ),
            SectionWidget(
              key: globalKeySection2,
              color: Colors.red,
              height: size.height,
            ),
            SectionWidget(
              key: globalKeySection3,
              color: Colors.blue,
              height: size.height,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  void _onSectionTap(int section) {
    late final RenderBox renderBox;

    switch (section) {
      case 1:
        renderBox =
            globalKeySection1.currentContext!.findRenderObject() as RenderBox;
        break;
      case 2:
        renderBox =
            globalKeySection2.currentContext!.findRenderObject() as RenderBox;
        break;
      case 3:
        renderBox =
            globalKeySection3.currentContext!.findRenderObject() as RenderBox;
        break;
      default:
        globalKeySection1.currentContext!.findRenderObject() as RenderBox;
    }

    final offset = renderBox.localToGlobal(Offset.zero);
    scrollController.animateTo(
      offset.dy,
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
  }
}
