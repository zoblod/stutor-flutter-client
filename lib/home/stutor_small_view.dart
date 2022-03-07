import 'package:flutter/material.dart';
import 'package:stutor/data/models/stutor.dart';

class StutorSmallView extends StatelessWidget {
  const StutorSmallView({Key? key, required this.tutor}) : super(key: key);

  final Stutor tutor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: (MediaQuery.of(context).size.width - 50),
        height: 200,
        child: Column(
          children: [
            Row(
              children: [Column(), Column()],
            )
          ],
        ),
      ),
    );
  }
}
