import 'package:brain_box/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertNotifications extends StatelessWidget {
  const AlertNotifications({
    super.key,
    required this.count,
  });
  final String count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kAlartDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffF1F1F1),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SizedBox(width: 5),
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You have a new alert',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'one of your sensor may detect a water leak you need',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'to take an action immimmediately',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
