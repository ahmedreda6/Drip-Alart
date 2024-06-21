import 'package:brain_box/screens/Profile.dart';
import 'package:brain_box/Features/alerts/presentaion/views/alerts_view.dart';
import 'package:brain_box/screens/home.dart';
import 'package:brain_box/screens/sensor.dart';
import 'package:brain_box/widgets/add_sensor_bottom_sheet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    const HomeView(),
    const SensorView(),
    const AlertsView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selectedIndex == 1
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    context: context,
                    builder: (context) {
                      return const AddSensorBottomSheet();
                    });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : const SizedBox.shrink(),
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.sensors,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    );
  }
}

int selectedIndex = 0;
