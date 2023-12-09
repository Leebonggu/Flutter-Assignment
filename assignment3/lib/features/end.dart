import 'package:flutter/material.dart';
import 'package:assignment3/shared/app_bar.dart';

class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('End'),
      ),
    );
  }
}
