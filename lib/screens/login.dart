import 'package:brain_box/helper/snakbar.dart';
import 'package:brain_box/screens/add_member.dart';
import 'package:brain_box/user_auth/firebase_auth_services.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSigningIN = false;
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Login Your Account',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                ),
              ),
              const SizedBox(height: 48),
              CustomTextFormField(
                controller: EmailController,
                hintText: 'Enter Your Email',
                prefix: const Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: PasswordController,
                hintText: 'Password',
                isPasswordField: true,
                prefix: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'ForgotPasswordScreen');
                    },
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: _SignIn,
                child: CustomButton(title: 'LogIn'),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?  ",
                    style: TextStyle(
                      fontFamily: 'poppins',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signUpScreen');
                    },
                    child: const Text(
                      'Sign UP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              const Center(
                  child: Text(
                'Continue With Accounts',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signInWithGoogle();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(237, 187, 188, 193),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _SignIn() async {
    setState(() {
      isSigningIN = true;
    });
    String email = EmailController.text;
    String password = PasswordController.text;

    User? user =
        await auth.signInWithEmailAndPassword(email, password, context);
    setState(() {
      isSigningIN = false;
    });

    if (user != null) {
      showSnackBar(context, 'User is successfully signed in');
      Navigator.pushNamed(context, AddMemberScreen.id);
    } else {
      showSnackBar(context, 'some error occured');
    }
  }

  void signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await auth.auth.signInWithCredential(credential);
        Navigator.pushNamed(context, AddMemberScreen.id);
      }
    } catch (e) {
      showSnackBar(context, "some error occured $e");
    }
  }
}
