import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {
  static FirebaseAuth _authenticator = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<User?> iniciarSesion({required BuildContext context}) async {
    User? user;
    // await _authenticator.signOut();

    _googleSignIn = GoogleSignIn();

    GoogleSignInAccount? objGoogleSignInAccount = await _googleSignIn.signIn();

    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objgoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objgoogleSignInAuthentication.accessToken,
          idToken: objgoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await _authenticator.signInWithCredential(credential);
        user = userCredential.user;

        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticacion: ");
      }
    }
    return null;
  }

  static Future<void> cerrarSesion() async {
    await _authenticator.signOut();
    await _googleSignIn.disconnect();
    print("Usuario desconectado");
  }
}
