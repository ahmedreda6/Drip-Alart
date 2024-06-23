import 'package:flutter/material.dart';

class PreferencesButton extends StatelessWidget {
  const PreferencesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: double.infinity,
        child: const Row(
          children: [
            Icon(
              Icons.settings,
              size: 35,
              color: Colors.black,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              'Preferences',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Spacer(),
            Icon(
              size: 20,
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
