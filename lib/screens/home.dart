import 'package:brain_box/core/helper/navigationbar.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 151,
            ),
            Center(
              child: Image.asset(
                'assets/drip 1.png',
              ),
            ),
            const Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Drip',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                ),
                Text(
                  'Alart',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 76,
            ),
            const Text(
              'Start chatting with ChattyAI now',
              style: TextStyle(
                fontFamily: 'Urbanist',
              ),
            ),
            const Text(
              'You can ask me anything',
              style: TextStyle(
                fontFamily: 'Urbanist',
              ),
            ),
            const SizedBox(
              height: 102,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = selectedIndex + 1;
                  });
                },
                child: CustomButton(title: 'Get started'))
          ],
        ),
      ),
    );
  }
}
