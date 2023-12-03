import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_assignment_3/constants/gaps.dart';
import 'package:tiktok_assignment_3/constants/sizes.dart';
import 'package:tiktok_assignment_3/features/password_screen.dart';
import 'package:tiktok_assignment_3/shared/app_bar.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> codes = List.generate(6, (index) => '');

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onPressTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  bool _isValid() {
    return codes.every((value) => value.isNotEmpty);
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (_isValid() && index == 5) {
      FocusScope.of(context).unfocus();
    }
    setState(() {
      codes[index] = value; // 값이 변경될 때마다 저장
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
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              Text(
                "Enter it below to verify",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v8,
              Text(
                "custom@email.com",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v40,
              Form(
                key: _formKey,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.bold,
                          ),
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          maxLines: 1,
                          maxLength: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            counterText: '',
                          ),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Padding(
                      padding: const EdgeInsets.only(top: Sizes.size16),
                      child: FaIcon(
                        FontAwesomeIcons.circleCheck,
                        color: _isValid() ? Colors.green : Colors.white,
                        size: Sizes.size24,
                      )),
                ),
              ),
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
