import 'package:fin_app/screen/account.dart';
import 'package:fin_app/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screen/home.dart';
import '../widget/bottomnavigationbar.dart';

class AuthService{
   final GoogleSignIn _googleUser = GoogleSignIn(
        scopes: <String>["email"]);
  
    //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Bottom();
          } else {
            return const LoginPage();
          }
        });
  }
   signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();
    await _googleUser.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
   //Sign out
  signOut() async { 
    await _googleUser.signOut();
    await FirebaseAuth.instance.signOut();
  }
}