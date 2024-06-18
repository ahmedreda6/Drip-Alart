import 'package:brain_box/models/user_model.dart';
import 'package:brain_box/widgets/add_email_bottom_sheet.dart';
import 'package:brain_box/widgets/my_group_card.dart';
import 'package:flutter/material.dart';

class MyGroupView extends StatelessWidget {
  const MyGroupView({super.key, required this.user});
  static String id = 'My Group Screen';
  final UsrerModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              context: context,
              builder: (context) {
                return const AddEmailBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 42,
            ),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Text(
                    'My Group',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 63,
            ),
            MyGroupCard(
              time: user.time.toDate(),
              user: user.email,
            ),
            MyGroupCard(
              user: user.groubMember?.email ?? 'Try add new member',
              time: user.time.toDate(),
            ),
          ],
        ),
      ),
    );
  }
}
