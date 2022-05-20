import 'package:ecom_app/domain/repositories/login/base_phone_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthRepository extends BasePhoneAuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return auth.signInWithCredential(credential);
  }
}
