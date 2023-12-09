import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment3/constants/gaps.dart';

class TextWithIcon extends StatelessWidget {
  final String message;
  final FaIcon icon;
  const TextWithIcon({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message),
        Gaps.h6,
        icon,
      ],
    );
  }
}
