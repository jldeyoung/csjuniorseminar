import 'package:firebase_auth/firebase_auth.dart';
import 'package:csjuniorseminar/player.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  Player _userFromFirebaseUser(FirebaseUser user){
   // return user != null ? User(userID: user.userID) : null;
  }

  Stream<Player> get player {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pw



  //register with email and pw
  Future registerEmail(String email, String pw) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }


}