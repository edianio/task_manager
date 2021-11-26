import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:my_tasks/helpers/firebase_errors.dart';
import 'package:my_tasks/models/user_app.dart';

class UserController extends ChangeNotifier{
  UserApp? userApp;

  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  bool get isLoggedIn => userApp != null;

  void get currentUser => _loadCurrentUser();

  UserController(){
    _loadCurrentUser();
  }

  // Future<void> signInGoogle({required Function onFail, required Function onSuccess}) async {
  //   loading = true;
  //
  //   try{
  //     final UserCredential result = await _signInWithGoogle();
  //
  //     await _loadCurrentUser(firebaseUser: result.user);
  //
  //     onSuccess();
  //   }catch(error){
  //     onFail(error);
  //   }
  //
  //   notifyListeners();
  //   loading = false;
  // }

  // Future<void> signUpGoogle({required Function onFail, required Function onSuccess}) async {
  //   loading = true;
  //
  //   try {
  //     final UserCredential result = await _signInWithGoogle();
  //
  //     userApp = UserApp(id: result.user!.uid, name: result.user!.displayName!, email: result.user!.email!);
  //
  //     await userApp!.saveUser();
  //
  //     onSuccess();
  //   } on PlatformException catch(e){
  //
  //     onFail(getErrorString(e.code));
  //
  //   } on FirebaseAuthException catch (e) {
  //
  //     onFail(getErrorString(e.code));
  //
  //   } catch(e){
  //
  //     onFail(e.toString());
  //
  //   }
  //
  //   notifyListeners();
  //   loading = false;
  // }

  // Future<UserCredential> _signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await auth.signInWithCredential(credential);
  // }

  Future<void> signIn({required String name, required String password, required Function onFail, required Function onSuccess}) async{
    loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: name, password: password);

      if(result.user != null){
        if(!result.user!.emailVerified){
          await result.user?.sendEmailVerification();
        }
      }

      await _loadCurrentUser(firebaseUser: result.user!);

      onSuccess();
    } on PlatformException catch (e){

      onFail(getErrorString(e.code));

    } on FirebaseAuthException catch (e) {

      onFail(getErrorString(e.code));

    } catch(e){

      onFail(e.toString());

    }

    loading = false;
  }

  Future<void> signUp({required UserApp userApp, required Function onFail, required Function onSuccess}) async{
    loading = true;

    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(email: userApp.email, password: userApp.password!);

      await result.user?.sendEmailVerification();
      //await result.user?.updateProfile(displayName: userApp.name);

      final String id = result.user!.uid;

      userApp.id = id;

      this.userApp = userApp;

      await userApp.saveUser();

      //userApp.saveToken();

      onSuccess();
    } on PlatformException catch(e){

      onFail(getErrorString(e.code));

    } on FirebaseAuthException catch (e) {

      onFail(getErrorString(e.code));

    } catch(e){

      onFail(e.toString());

    }

    loading = false;
  }

  Future<void> updateUser(UserApp userApp, {required Function onFail, required Function onSuccess})async{
    loading = true;
    try {
      await userApp.updateData();

      onSuccess();
    } on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
    debugPrint('updateUser');
    notifyListeners();
    loading = false;
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    loading = true;
    final User? currentUser = firebaseUser ?? auth.currentUser;

    if(currentUser != null){
      DocumentSnapshot<Map<String, dynamic>> docUser;

      if(currentUser.phoneNumber != null){

        try{
          docUser = await firestore.collection('users')
              .where('idPhone', isEqualTo: currentUser.uid)
              .get()
              .then((querySnapshot) => querySnapshot.docs.first);
        }catch(e){
          debugPrint('Este telefone não está vinculado a nenhuma conta de email cadastrada!!!');//TODO informar o usuário
          docUser = await firestore.collection('users').doc(currentUser.uid).get();
        }

      }else {

        docUser = await firestore.collection('users').doc(currentUser.uid).get();

      }

      userApp = UserApp.fromDocument(docUser);
    }

    notifyListeners();

    loading = false;
  }

  void signOut(){
    auth.signOut();

    userApp = null;

    firestore.clearPersistence();

    notifyListeners();
  }

  Future<void> resetPasswordByEmail(String email)async{
    loading = true;
    await auth.sendPasswordResetEmail(email: email);
    loading = false;
  }
}