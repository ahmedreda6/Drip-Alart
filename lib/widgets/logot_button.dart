import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          width: double.infinity,
          child: const Center(
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 35,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
