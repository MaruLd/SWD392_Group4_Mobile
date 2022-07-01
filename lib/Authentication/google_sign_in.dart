import 'package:evsmart/models/DAO/auth_DAO.dart';
import 'package:evsmart/networking/api_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: <String>['email', 'profile']);

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
    await FirebaseAuth.instance.signInWithCredential(credential);
    getAndStoreJwtToken();
    notifyListeners();
  }

  static Future<String>? getUserToken() {
    return FirebaseAuth.instance.currentUser?.getIdToken();
  }

  static Future<String?> getAndStoreJwtToken() async {
    final storage = new FlutterSecureStorage();
    String? jwtToken = await storage.read(key: 'jwt');
    if (jwtToken == null) {
      String? userToken = await getUserToken();
      if (userToken != null) {
        var auth = await AuthDAO().getJwtToken();
        jwtToken = auth.token;
        await storage.write(key: 'jwt', value: jwtToken);
        return jwtToken;
      } else {
        print("User Token not found!");
      }
    } else {
      return jwtToken;
    }
  }
}
