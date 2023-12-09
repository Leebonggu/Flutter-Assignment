import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment3/constants/gaps.dart';
import 'package:assignment3/constants/sizes.dart';
import 'package:assignment3/features/interests/interests_screen_part2.dart';
import 'package:assignment3/features/interests/widgets/text_with_icon.dart';
import 'package:assignment3/shared/app_bar.dart';

List<String> interests = [
  'Art',
  'Music',
  'Technology',
  'Cooking',
  'Sports',
  'Reading',
  'Travel',
  'Photography',
  'Fashion',
  'Gaming',
  'Writing',
  'Fitness',
  'Movies',
  'Design',
  'DIY',
  'Gardening',
  'Animals',
  'Dance',
  'Science',
  'Cars',
  'History',
  'Meditation',
  'Yoga',
  'Languages',
  'Astronomy',
  'Hiking',
  'Food',
  'Poetry',
  'Volunteering',
  'Architecture',
  'Fishing',
  'Collecting',
];

class InterestsScreenPart1 extends StatefulWidget {
  const InterestsScreenPart1({super.key});

  @override
  State<InterestsScreenPart1> createState() => _InterestsScreenPart1State();
}

class _InterestsScreenPart1State extends State<InterestsScreenPart1> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _selected = [];

  void _onPressTap() {
    if (!_isValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreenPart2(),
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

  bool _isSelected(String value) {
    return _selected.contains(value);
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
              Gaps.v4,
              const Divider(),
              Gaps.v20,
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (String interest in interests)
                        GestureDetector(
                          onTap: () => handleSelected(interest),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size24,
                              horizontal: Sizes.size16,
                            ),
                            decoration: BoxDecoration(
                              color: _selected.contains(interest)
                                  ? Colors.blue.shade700
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(
                                Sizes.size32,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    // child: Text(
                                    //   _selected.contains(interest) ? interest : '',
                                    //   style: TextStyle(
                                    // color: _selected.contains(interest)
                                    //     ? Colors.white
                                    //     : Colors.black,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    child: Opacity(
                                      opacity: _isSelected(interest) ? 1 : 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: Sizes.size8,
                                        ),
                                        child: Visibility(
                                          visible: _isSelected(interest),
                                          child: FaIcon(
                                            FontAwesomeIcons.circleCheck,
                                            color: _isSelected(interest)
                                                ? Colors.white
                                                : Colors.black,
                                            size: Sizes.size20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      interest,
                                      style: TextStyle(
                                        color: _isSelected(interest)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size12,
              horizontal: Sizes.size24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: _isValid()
                        ? const TextWithIcon(
                            message: 'Great Work',
                            icon: FaIcon(
                              FontAwesomeIcons.circleCheck,
                              size: Sizes.size16,
                              color: Colors.green,
                            ),
                          )
                        : Text('${_selected.length} of 3 selected')),
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
