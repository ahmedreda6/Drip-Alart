import 'package:brain_box/helper/snakbar.dart';
import 'package:brain_box/models/user_model.dart';
import 'package:brain_box/screens/add_member.dart';
import 'package:brain_box/user_auth/firebase_auth_services.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSigningUp = false;

  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 73,
                ),
                const Text(
                  'Create your Account',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  controller: userNameController,
                  hintText: 'Full Name',
                  prefix: const Icon(Icons.person),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter Your Email',
                  prefix: const Icon(Icons.email),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  isPasswordField: true,
                  prefix: const Icon(Icons.lock),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: _SignUp,
                  child: CustomButton(title: 'Register'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Allready have an account?  ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'SignIn',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const Center(
                  child: Text(
                    'Continue With Accounts',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
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
      ),
    );
  }

  void _SignUp() async {
    setState(() {
      isSigningUp = true;
    });
    String username = userNameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    final user = await auth.signUpWithEmailAndPassword(
        username, email, password, context);
    setState(() {
      isSigningUp = false;
      uid = user;
    });

    if (user != null) {
      showSnackBar(context, 'User is successfully created');
      Navigator.pushNamed(context, AddMemberScreen.id);
    } else {
      showSnackBar(context, 'Some error happend');
    }
  }

  void signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
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
