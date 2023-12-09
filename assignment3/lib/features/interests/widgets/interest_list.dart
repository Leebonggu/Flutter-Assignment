import 'package:flutter/material.dart';
import 'package:assignment3/constants/gaps.dart';
import 'package:assignment3/constants/sizes.dart';
import 'package:assignment3/features/interests/widgets/intereset_button.dart';

class InterestList extends StatefulWidget {
  final List<String> list;
  final String category;
  final Function handler;

  const InterestList({
    super.key,
    required this.list,
    required this.category,
    required this.handler,
  });

  @override
  State<InterestList> createState() => _InterestListState();
}

class _InterestListState extends State<InterestList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.category,
          style: const TextStyle(
            fontSize: Sizes.size20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 250,
            child: Wrap(
              direction: Axis.vertical,
              spacing: Sizes.size8,
              runSpacing: Sizes.size4,
              children: [
                for (String name in widget.list)
                  InterestButton(
                    interest: name,
                    handler: widget.handler,
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
