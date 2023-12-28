import 'package:flutter/material.dart';
import 'package:test_suitmedia/style/colors.dart';
import 'package:test_suitmedia/style/padding.dart';
import 'package:test_suitmedia/style/textstyle.dart';
import 'package:test_suitmedia/view/first_screen.dart';
import 'package:test_suitmedia/view/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final String apiName;

  const SecondScreen({Key? key, required this.name, required this.apiName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyleApp.appbarTextStyle,
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/Arrow-Left2.png'),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const FirstScreen()));
          },
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.white,
        elevation: 0.5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: CustomPadding.kSidePaddingSecondS,
            child: Text(
              'Welcome',
              style: TextStyleApp.welcomeTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              name.isEmpty ? 'No Name' : name,
              style: TextStyleApp.appbarTextStyle,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Text(
                apiName.isNotEmpty ? apiName : 'Select User Name',
                style: TextStyleApp.selectednameTextStyle,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(37.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(310, 41),
            fixedSize: const Size(310, 41),
            backgroundColor: ColorsApp.buttonCollor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ThirdScreen(
                        name: name,
                      )),
            );
          },
          child: Text(
            'Choose a User',
            style: TextStyleApp.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
