import 'package:flutter/material.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({Key? key}) : super(key: key);

  @override
  State<LoadingSplash> createState() => _LoadingSplash();
}

class _LoadingSplash extends State<LoadingSplash>
    with TickerProviderStateMixin {
  late AnimationController motionController;
  late Animation motionAnimation;
  double size = 20;

  @override
  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });

    motionController.addListener(() {
      setState(() {
        size = motionController.value * 250;
      });
    });
  }

  @override
  void dispose() {
    motionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: SizedBox(
          child: Image.asset(
            'assets/graphics/original_logo.png',
          ),
          height: size,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
