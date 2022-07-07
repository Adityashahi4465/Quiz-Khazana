import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kbc_quiz_app/services/localdb.dart';
import 'firedb.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
Future<User?> signWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final usercredential = await _auth.signInWithCredential(credential);

    final User? user = usercredential.user;
    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);
    final User? currentuser = await _auth.currentUser;
    assert(currentuser!.uid == user!.uid);
    await FireDB().createNewUser(user!.displayName.toString(),
        user.email.toString(), user.photoURL.toString(), user.uid);
    await LocalDB.saveUserID(user.uid);
    await LocalDB.saveName(user.displayName.toString());
    await LocalDB.saveUrl(user.photoURL.toString());
    print(user);
  } catch (e) {
    print(e);
    print("Error Occurred In SignIn");
  }
}

Future<String> signOut() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  await LocalDB.saveUserID("null");
  return "SUCCESS";
}
