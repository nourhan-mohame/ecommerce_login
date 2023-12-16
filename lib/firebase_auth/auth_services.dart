
import 'package:firebase_auth/firebase_auth.dart';

class firebaseauthservices{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Future<User?>signupemailandpassword(String email,String password) async {

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch(e){
      print("some error went wrong");
    }
    return null;
  }


  Future<User?>signinemailandpassword(String email,String password) async {

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch(e){
      print("some error went wrong");
    }
    return null;
  }

}
