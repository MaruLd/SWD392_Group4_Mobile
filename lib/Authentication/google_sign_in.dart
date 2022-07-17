import 'package:evsmart/models/DAO/auth_DAO.dart';
import 'package:evsmart/networking/api_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  static final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: <String>['email', 'profile']);
  static final FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    print(googleAuth.idToken);
    await auth.signInWithCredential(credential);
    getAndStoreJwtToken();
    notifyListeners();
  }

  static Future<Null> signOutWithGoogle() async {
    // Sign out with firebase
    await auth.signOut();
    // Sign out with google
    await _googleSignIn.signOut();
  }

  static Future<String>? getUserToken() {
    return auth.currentUser?.getIdToken();
  }

  static Future<String?> getAndStoreJwtToken() async {
    final storage = new FlutterSecureStorage();
    String? jwtToken = await storage.read(key: 'jwt');
    if (jwtToken == null) {
      String? userToken = await getUserToken();
      if (userToken != null) {
        var authDAO = await AuthDAO().getJwtToken();
        jwtToken = authDAO.token;
        await storage.write(key: 'jwt', value: jwtToken);
        return jwtToken;
      } else {
        print("User Token not found!");
      }
    } else {
      return jwtToken;
    }
  }

  static Future refreshFirebaseUser() async {
    if (auth.currentUser != null) {
      final user = auth.currentUser;
      final idTokenResult = await user!.getIdTokenResult(true);
      return idTokenResult.token;
    }
  }
}
