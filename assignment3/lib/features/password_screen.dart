import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment3/constants/gaps.dart';
import 'package:assignment3/constants/sizes.dart';
import 'package:assignment3/features/interests/interests_screen_part1.dart';
import 'package:assignment3/shared/app_bar.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool _isHidden = true;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onPressTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreenPart1(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void toggleHidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
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
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v40,
              TextField(
                controller: _passwordController,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Password',
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.black, // 원하는 색상으로 설정
                    fontSize: Sizes.size16,
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: toggleHidden,
                        child: FaIcon(
                          _isHidden
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isValid() ? 1 : 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size8,
                          ),
                          child: Visibility(
                            visible: _isValid(),
                            child: const FaIcon(
                              FontAwesomeIcons.circleCheck,
                              color: Colors.green,
                              size: Sizes.size20,
                            ),
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
