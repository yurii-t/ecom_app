import 'package:bloc/bloc.dart';
import 'package:ecom_app/domain/repositories/login/phone_auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthRepository phoneAuthRepository;

  PhoneAuthBloc({required this.phoneAuthRepository})
      : super(PhoneAuthInitial()) {
    on<SendOtpToPhoneEvent>(_onSendOtp);

    on<VerifySentOtpEvent>(_onVerifyOtp);

    on<OnPhoneOtpSent>((event, emit) =>
        emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    on<OnPhoneAuthErrorEvent>(
      (event, emit) => emit(PhoneAuthError(error: event.error)),
    );

    on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);
  }

  Future<void> _onSendOtp(
    SendOtpToPhoneEvent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    emit(PhoneAuthLoading());
    try {
      await phoneAuthRepository.verifyPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (credential) async {
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        verificationFailed: (e) {
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeSent: (verificationId, resendToken) {
          add(OnPhoneOtpSent(
            verificationId: verificationId,
            token: resendToken,
          ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on Exception catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _onVerifyOtp(
    VerifySentOtpEvent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    try {
      emit(PhoneAuthLoading());

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } on Exception catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> _loginWithCredential(
    OnPhoneAuthVerificationCompleteEvent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    try {
      await phoneAuthRepository
          .signInWithCredential(event.credential)
          .then((user) {
        if (user.user != null) {
          emit(PhoneAuthVerified());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(error: e.code));
    } on Exception catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }
}
