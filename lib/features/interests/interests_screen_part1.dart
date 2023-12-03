import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_assignment_3/constants/gaps.dart';
import 'package:tiktok_assignment_3/constants/sizes.dart';
import 'package:tiktok_assignment_3/features/interests/interests_screen_part2.dart';
import 'package:tiktok_assignment_3/shared/app_bar.dart';

class InterestsScreenPart1 extends StatefulWidget {
  const InterestsScreenPart1({super.key});

  @override
  State<InterestsScreenPart1> createState() => _InterestsScreenPart1State();
}

class _InterestsScreenPart1State extends State<InterestsScreenPart1> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onPressTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreenPart2(),
      ),
    );
  }

  bool _isValid() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "What do you want to see on Twitter",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              Text(
                "Select at least 3 interests to personalize your experience on Twitter. They will be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.grey.shade600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Divider(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size16,
              ),
              child: CupertinoButton(
                minSize: 60,
                onPressed: _onPressTap,
                color: _isValid() ? Colors.black : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(Sizes.size96),
                child: const Text('Next'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
