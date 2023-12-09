import 'package:assignment4/constants/sizes.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.size96,
        title: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(
                Sizes.size20,
              ),
              child: const Text(
                'Activity',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          Sizes.size20,
        ),
        child: const Column(
          children: [
            Text(
              'Activity',
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size36,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
