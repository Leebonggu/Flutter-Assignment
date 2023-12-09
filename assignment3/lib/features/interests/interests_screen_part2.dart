import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_assignment_3/constants/gaps.dart';
import 'package:tiktok_assignment_3/constants/sizes.dart';
import 'package:tiktok_assignment_3/features/end.dart';
import 'package:tiktok_assignment_3/features/interests/widgets/interest_list.dart';
import 'package:tiktok_assignment_3/shared/app_bar.dart';

List<String> musics = [
  'Pop',
  'Rock',
  'Jazz',
  'Classical',
  'Hip-hop',
  'EDM',
  'R&B',
  'Country',
  'Reggae',
  'Blues',
  'Funk',
  'Metal',
  'Soul',
  'Punk',
  'Disco',
  'Electronic',
  'Folk',
  'Gospel',
  'Techno',
  'Alternative',
];

List<String> entertains = [
  'Drama',
  'Variety Show',
  'News',
  'Sports',
  'Documentary',
  'Music/Performance',
  'Movies',
  'Education/Information',
  'Kids/Children',
  'Shopping',
  'Reality Show',
  'Comedy/Talk Show',
  'Foreign Drama/Movies',
  'Entertainment/Celebrity Programs',
  'Health/Lifestyle',
  'Game/Entertainment',
  'Crafts/Cooking',
  'Culture/History',
  'Public Service/Social Activities',
  'Live Performances/Events',
  // 필요한 만큼 다른 종류 추가 가능
];

class InterestsScreenPart2 extends StatefulWidget {
  const InterestsScreenPart2({super.key});

  @override
  State<InterestsScreenPart2> createState() => _InterestsScreenPart2State();
}

class _InterestsScreenPart2State extends State<InterestsScreenPart2> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _selected = [];

  void _onPressTap() {
    if (!_isValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const End(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isValid() {
    return _selected.isNotEmpty && _selected.length >= 3;
  }

  void handleSelected(String value) {
    setState(() {
      _selected.contains(value)
          ? _selected.remove(value)
          : _selected.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size32,
              ),
              child: Column(
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
                    "Interests are  used to personalize and will be visible on your profile.",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Gaps.v20,
                  const Divider(),
                  Gaps.v14,
                  InterestList(
                    category: "Music",
                    list: musics,
                    handler: handleSelected,
                  ),
                  Gaps.v20,
                  InterestList(
                    category: "Entertainment",
                    list: entertains,
                    handler: handleSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size12,
              horizontal: Sizes.size24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _onPressTap,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size24,
                    ),
                    decoration: BoxDecoration(
                      color: _isValid() ? Colors.black : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        Sizes.size32,
                      ),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: _isValid() ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
