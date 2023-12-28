import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_suitmedia/style/colors.dart';
import 'package:test_suitmedia/style/padding.dart';
import 'package:test_suitmedia/style/textstyle.dart';
import 'package:test_suitmedia/view/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/ic_photo.png'),
          ),
          const SizedBox(height: 51),
          Padding(
            padding: CustomPadding.kSidePadding,
            child: Column(
              children: [
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyleApp.textFieldStyle,
                      fillColor: ColorsApp.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )),
                const SizedBox(height: 15),
                TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Palindrome',
                      hintStyle: TextStyleApp.textFieldStyle,
                      fillColor: ColorsApp.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )),
                const SizedBox(height: 45),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(310, 41),
                    fixedSize: const Size(310, 41),
                    backgroundColor: ColorsApp.buttonCollor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _checkPalindrome();
                    _textController.clear();
                  },
                  child: Text(
                    'Check',
                    style: TextStyleApp.buttonTextStyle,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(310, 41),
                    fixedSize: const Size(310, 41),
                    backgroundColor: ColorsApp.buttonCollor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    String name = nameController.text;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen(
                                  name: name,
                                  apiName: '',
                                )));
                  },
                  child: Text(
                    'Next',
                    style: TextStyleApp.buttonTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void _checkPalindrome() {
    String inputText = _textController.text.toLowerCase().replaceAll(" ", "");

    if (isPalindrome(inputText)) {
      _showResultDialog('is Palindrome');
    } else {
      _showResultDialog('Not Palindrome');
    }
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            'Palindrome Check Result',
            style: TextStyleApp.namaTextStyle,
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK', style: TextStyleApp.namaTextStyle),
            ),
          ],
        );
      },
    );
  }

  bool isPalindrome(String text) {
    String reversedText = text.split('').reversed.join('');
    return text == reversedText;
  }
}
