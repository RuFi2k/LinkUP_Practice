import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //making stream to hold signed/unsigned user data
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  //sign in
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
//      await TransactionService(user_id: user.uid).addRecord(
//          amount: 100,
//          description: 'some desc',
//          category: TransactionCategoriesEnum.Home);
      return user;
    } catch (e) {
      throw new Exception(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future register(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
