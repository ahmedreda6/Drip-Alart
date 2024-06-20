import 'package:brain_box/Features/splash/presentaion/views/splash_view.dart';
import 'package:brain_box/core/helper/navigationbar.dart';
import 'package:brain_box/screens/Profile.dart';
import 'package:brain_box/screens/add_member.dart';
import 'package:brain_box/screens/alert_datails.dart';
import 'package:brain_box/screens/alerts.dart';
import 'package:brain_box/screens/editinformation.dart';
import 'package:brain_box/screens/forgot_password.dart';
import 'package:brain_box/screens/home.dart';
import 'package:brain_box/screens/login.dart';
import 'package:brain_box/screens/preferences.dart';
import 'package:brain_box/screens/sensor.dart';
import 'package:brain_box/screens/sign-up.dart';
import 'package:brain_box/screens/welcome.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kAddMembersView = '/addMembersView';
  static const kHomeView = '/homeView';
  static const kBottonNavBar = '/bottonNavBar';
  static const kSensorView = '/sensorView';
  static const kSensorDetailsView = '/sensorDetailsView';
  static const kAlartView = '/alartView';
  static const kAlartDetailsView = '/alartDetailsView';
  static const kProfileView = '/profileView';
  static const kPreferencesView = '/preferencesView';
  static const kEditInformationView = '/editInformationView';
    static const kGroupView = '/groupView';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const Welcomeview(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const Loginview(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kAddMembersView,
        builder: (context, state) => const AddMemberView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBottonNavBar,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: kSensorView,
        builder: (context, state) => const SensorView(),
      ),
      // GoRoute(
      //   path: kSensorDetailsView,
      //   builder: (context, state) => const SensorDitalsView(),
      // ),
      GoRoute(
        path: kAlartView,
        builder: (context, state) => const AlertsView(),
      ),
      GoRoute(
        path: kAlartDetailsView,
        builder: (context, state) => const AlertDatailsView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kPreferencesView,
        builder: (context, state) => const PreferencesView(),
      ),
      GoRoute(
        path: kEditInformationView,
        builder: (context, state) => const EditInformationView(),
      ),
      //  GoRoute(
      //   path: kGroupView,
      //   builder: (context, state) => const MyGroupView(),
      // ),
    ],
  );
}
