import 'package:brain_box/Features/alerts/presentaion/views/widgets/alert_notifications.dart';
import 'package:flutter/material.dart';

class AlertsBodyView extends StatefulWidget {
  const AlertsBodyView({super.key});

  @override
  State<AlertsBodyView> createState() => _AlertsViewState();
}

class _AlertsViewState extends State<AlertsBodyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 56,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'My Alerts',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => AlertNotifications(
              count: (index + 1).toString(),
            ),
          ),
        ],
      ),
    );
  }
}
