import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repositories/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;

  SignupBloc(this._authRepository) : super(const SignupInitial()) {
    on<UserInfoEntered>(_onUserInfoEntered);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<RequestPhoneVerification>(_onRequestPhoneVerification);
    on<PhoneVerificationCompleted>(_onPhoneVerificationCompleted);
    on<EmailChanged>(_onEmailChanged);
    on<RequestEmailVerification>(_onRequestEmailVerification);
    on<EmailVerificationCompleted>(_onEmailVerificationCompleted);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<AgreementChanged>(_onAgreementChanged);
    on<CompleteSignupRequest>(_onCompleteSignupRequest);
  }

  void _onUserInfoEntered(UserInfoEntered event, Emitter<SignupState> emit) {
    emit(UserInfoEnteredState(
      name: event.name,
      birthday: event.birthday,
      isManager: event.isManager,
    ));
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<SignupState> emit) {
    emit(PhoneVerificationPending(phoneNumber: event.phoneNumber));
  }

  Future<void> _onRequestPhoneVerification(
      RequestPhoneVerification event, Emitter<SignupState> emit) async {
    final currentState = state;
    if (currentState is PhoneVerificationPending &&
        currentState.phoneNumber.isNotEmpty) {
      emit(SignupLoading());

      try {
        await _authRepository.sendSignupCode(currentState.phoneNumber, "");
        emit(PhoneVerificationPending(phoneNumber: currentState.phoneNumber));
      } catch (e) {
        emit(SignupFailure("휴대폰 인증번호 요청 실패"));
      }
    }
  }

  Future<void> _onPhoneVerificationCompleted(
      PhoneVerificationCompleted event, Emitter<SignupState> emit) async {
    emit(const PhoneVerified());
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(EmailEntry(email: event.email));
  }

  Future<void> _onRequestEmailVerification(
      RequestEmailVerification event, Emitter<SignupState> emit) async {
    final currentState = state;
    if (currentState is EmailEntry && currentState.email.isNotEmpty) {
      emit(SignupLoading());

      try {
        await _authRepository.sendSignupCode("", currentState.email);
        emit(EmailVerificationPending(email: currentState.email));
      } catch (e) {
        emit(SignupFailure("이메일 인증번호 요청 실패"));
      }
    }
  }

  Future<void> _onEmailVerificationCompleted(
      EmailVerificationCompleted event, Emitter<SignupState> emit) async {
    emit(const EmailVerified());
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(PasswordEntry(password: event.password, confirmPassword: ""));
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<SignupState> emit) {
    final currentState = state;
    if (currentState is PasswordEntry) {
      emit(PasswordEntry(
          password: currentState.password,
          confirmPassword: event.confirmPassword));
    }
  }

  void _onAgreementChanged(AgreementChanged event, Emitter<SignupState> emit) {
    emit(AgreementEntry(
      agreeGeneral: event.agreeGeneral,
      agreePrivacy: event.agreePrivacy,
      agreeMarketing: event.agreeMarketing,
    ));
  }

  Future<void> _onCompleteSignupRequest(
      CompleteSignupRequest event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {
      await _authRepository.completeSignup(event.accessToken);
      emit(const SignupSuccess());
    } catch (e) {
      emit(SignupFailure("회원가입 완료 처리 실패: ${e.toString()}"));
    }
  }
}
