import 'package:brain_box/widgets/alart_container_widget.dart';
import 'package:flutter/material.dart';

class AlertDatailsView extends StatefulWidget {
  const AlertDatailsView({super.key});

  @override
  State<AlertDatailsView> createState() => _AlertDatailsViewState();
}

class _AlertDatailsViewState extends State<AlertDatailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'My Alerts',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          const AlertContainerWidget(),
        ],
      ),
    );
  }
}
