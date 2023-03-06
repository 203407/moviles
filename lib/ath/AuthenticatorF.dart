// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

// class AuthenticatorF {
//   static Future<User?> iniciarSesionF({required BuildContext context}) async {
//     FirebaseAuth objAuthenticator = FirebaseAuth.instance;
//     User? user;

//     FacebookLogin objFacebookSignIn = new FacebookLogin();
//     FacebookLoginResult objFacebookSignInAccount =
//         await objFacebookSignIn.logIn(['email']);

//     if (objFacebookSignInAccount != null) {
//       FacebookAccessToken objAccessToken = objFacebookSignInAccount.accessToken;
//       AuthCredential objCredential =
//           FacebookAuthProvider.credential(objAccessToken.token);
//       try {
//         UserCredential objUserCredential =
//             await FirebaseAuth.instance.signInWithCredential(objCredential);
//         user = objUserCredential.user;
//         return user;
//       } on FirebaseAuthException catch (e) {
//         print('Error en la autenticacion');
//       }
//     }
//   }
// }
