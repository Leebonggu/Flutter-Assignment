import 'package:assignment4/constants/gaps.dart';
import 'package:assignment4/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.nickname,
    required this.name,
    required this.followers,
    required this.imgUrl,
    required this.titleSide,
    this.trailingText,
  });

  final String nickname;
  final String name;
  final String followers;
  final String imgUrl;
  final String? trailingText;
  final dynamic titleSide;

  void _onTap() {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        bottom: Sizes.size8,
      ),
      leading: Container(
        width: Sizes.size52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
          text: nickname,
          style: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
          ),
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size4,
                ),
                child: titleSide,
              ),
            ),
          ],
        ),
      ),
      subtitle: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: Sizes.size12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.v10,
              Text(
                '$followers followers',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      trailing: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size2,
        ),
        width: Sizes.size96,
        height: Sizes.size32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: GestureDetector(
          onTap: _onTap,
          child: Text(
            trailingText ?? 'Follow',
            style: const TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
