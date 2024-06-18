import 'package:brain_box/firebase_options.dart';
import 'package:brain_box/core/helper/navigationbar.dart';
import 'package:brain_box/screens/Profile.dart';
import 'package:brain_box/screens/add_member.dart';
import 'package:brain_box/screens/alert_datails.dart';
import 'package:brain_box/screens/editinformation.dart';
import 'package:brain_box/screens/forgot_password.dart';
import 'package:brain_box/screens/home.dart';
import 'package:brain_box/screens/login.dart';
import 'package:brain_box/screens/preferences.dart';
import 'package:brain_box/screens/sensor.dart';
import 'package:brain_box/screens/sign-up.dart';
import 'package:brain_box/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const DripAlart());
}

class DripAlart extends StatelessWidget {
  const DripAlart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'loginScreen': (context) => const Loginview(),
        'signUpScreen': (context) => const SignUpView(),
        'WelcomeScreen': (context) => const Welcomeview(),
        'HomeScreen': (context) => const HomeView(),
        'SensorScreen': (context) => const SensorView(),
        'ProfileScreen': (context) => const ProfileView(),
        'BottomNavBar': (context) => const BottomNavBar(),
        'PreferencesScreen': (context) => const PreferencesView(),
        'EditInformationScreen': (context) => const EditInformationView(),
        'ForgotPasswordScreen': (context) => const ForgotPasswordView(),
        'AlertDatailsScreen': (context) => const AlertDatailsView(),
        AddMemberView.id: (context) => const AddMemberView(),
      },
      initialRoute: 'BottomNavBar',
    );
  }
}
