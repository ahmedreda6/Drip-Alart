import 'package:brain_box/Features/alerts/presentaion/views/widgets/alerts_view_body.dart';
import 'package:flutter/material.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AlertsBodyView(),
    );
  }
}
