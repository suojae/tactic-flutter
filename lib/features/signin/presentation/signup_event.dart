import 'package:equatable/equatable.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

final class UserInfoEntered extends SignupEvent {
  final String name;
  final DateTime birthday;
  final bool isManager; // true: 센터 관리자, false: 강사

  const UserInfoEntered({
    required this.name,
    required this.birthday,
    required this.isManager,
  });

  @override
  List<Object?> get props => [name, birthday, isManager];
}

final class PhoneNumberChanged extends SignupEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

final class RequestPhoneVerification extends SignupEvent {
  const RequestPhoneVerification();
}

final class PhoneVerificationCompleted extends SignupEvent {
  final String verificationCode;

  const PhoneVerificationCompleted(this.verificationCode);

  @override
  List<Object?> get props => [verificationCode];
}

final class EmailChanged extends SignupEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class RequestEmailVerification extends SignupEvent {
  const RequestEmailVerification();
}

final class EmailVerificationCompleted extends SignupEvent {
  final String verificationCode;

  const EmailVerificationCompleted(this.verificationCode);

  @override
  List<Object?> get props => [verificationCode];
}

final class PasswordChanged extends SignupEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class ConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

final class AgreementChanged extends SignupEvent {
  final bool agreeGeneral;
  final bool agreePrivacy;
  final bool agreeMarketing;

  const AgreementChanged({
    required this.agreeGeneral,
    required this.agreePrivacy,
    required this.agreeMarketing,
  });

  @override
  List<Object?> get props => [agreeGeneral, agreePrivacy, agreeMarketing];
}

final class CompleteSignup extends SignupEvent {
  const CompleteSignup();
}

final class CompleteSignupRequest extends SignupEvent {
  final String accessToken;

  const CompleteSignupRequest(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}
