import 'package:brain_box/core/helper/snakbar.dart';
import 'package:brain_box/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> signUpWithEmailAndPassword(String username, String email,
      String password, BuildContext context) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final UsrerModel usrerModel =
          UsrerModel(userName:  username, email:  email,password:  password,groubMember:  GroupMember(''));
      await firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(usrerModel.toJason());

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'weak-password');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'email-already-in-use');
      }
    } catch (e) {
      showSnackBar(context, 'there was an error ');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'user-not-found');
      } else if (e.code == 'wrong password') {
        showSnackBar(context, 'wrong password');
      }
    } catch (e) {
      showSnackBar(context, 'there was an error ');
    }
    return null;
  }
}
