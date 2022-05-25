import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'google_sign_in_controller.g.dart';

class ControllerGoogleSingIn = _ControllerGoogleSingInBase with _$ControllerGoogleSingIn;

abstract class _ControllerGoogleSingInBase with Store {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  @action
  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @action 
  Future saveCredentialsGoogle() async {
    final user =  FirebaseAuth.instance.currentUser!;
    final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await firestore.collection("users").doc(user.uid).set({
        "first_name": user.displayName,
        "email": user.email,
        'history' : [],
      });
    }
  }
}