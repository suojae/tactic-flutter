import 'package:equatable/equatable.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

final class SignupInitial extends SignupState {
  const SignupInitial();
}

final class UserInfoEnteredState extends SignupState {
  final String name;
  final DateTime birthday;
  final bool isManager;

  const UserInfoEnteredState({
    required this.name,
    required this.birthday,
    required this.isManager,
  });

  @override
  List<Object?> get props => [name, birthday, isManager];
}

final class PhoneVerificationPending extends SignupState {
  final String phoneNumber;

  const PhoneVerificationPending({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

final class PhoneVerified extends SignupState {
  const PhoneVerified();
}

final class EmailEntry extends SignupState {
  final String email;
  final String? errorMessage;

  const EmailEntry({required this.email, this.errorMessage});

  @override
  List<Object?> get props => [email, errorMessage];
}

final class EmailVerificationPending extends SignupState {
  final String email;

  const EmailVerificationPending({required this.email});

  @override
  List<Object?> get props => [email];
}

final class EmailVerified extends SignupState {
  const EmailVerified();
}

final class PasswordEntry extends SignupState {
  final String password;
  final String confirmPassword;
  final String? errorMessage;

  const PasswordEntry({
    required this.password,
    required this.confirmPassword,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [password, confirmPassword, errorMessage];
}

final class AgreementEntry extends SignupState {
  final bool agreeGeneral;
  final bool agreePrivacy;
  final bool agreeMarketing;

  const AgreementEntry({
    required this.agreeGeneral,
    required this.agreePrivacy,
    required this.agreeMarketing,
  });

  @override
  List<Object?> get props => [agreeGeneral, agreePrivacy, agreeMarketing];
}

final class SignupLoading extends SignupState {
  const SignupLoading();
}

final class SignupSuccess extends SignupState {
  const SignupSuccess();
}

final class SignupFailure extends SignupState {
  final String errorMessage;

  const SignupFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class SignupFormState extends SignupState {
  final String? name;
  final DateTime? birthday;
  final bool? isManager;
  final String? phoneNumber;
  final bool isPhoneVerified;
  final String? email;
  final bool isEmailVerified;
  final String? password;
  final String? confirmPassword;
  final bool agreedToGeneralTerms;
  final bool agreedToPrivacyPolicy;
  final bool agreedToMarketing;

  const SignupFormState({
    this.name,
    this.birthday,
    this.isManager,
    this.phoneNumber,
    this.isPhoneVerified = false,
    this.email,
    this.isEmailVerified = false,
    this.password,
    this.confirmPassword,
    this.agreedToGeneralTerms = false,
    this.agreedToPrivacyPolicy = false,
    this.agreedToMarketing = false,
  });

  SignupFormState copyWith({
    String? name,
    DateTime? birthday,
    bool? isManager,
    String? phoneNumber,
    bool? isPhoneVerified,
    String? email,
    bool? isEmailVerified,
    String? password,
    String? confirmPassword,
    bool? agreedToGeneralTerms,
    bool? agreedToPrivacyPolicy,
    bool? agreedToMarketing,
  }) {
    return SignupFormState(
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      isManager: isManager ?? this.isManager,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      agreedToGeneralTerms: agreedToGeneralTerms ?? this.agreedToGeneralTerms,
      agreedToPrivacyPolicy:
          agreedToPrivacyPolicy ?? this.agreedToPrivacyPolicy,
      agreedToMarketing: agreedToMarketing ?? this.agreedToMarketing,
    );
  }

  @override
  List<Object?> get props => [
        name,
        birthday,
        isManager,
        phoneNumber,
        isPhoneVerified,
        email,
        isEmailVerified,
        password,
        confirmPassword,
        agreedToGeneralTerms,
        agreedToPrivacyPolicy,
        agreedToMarketing,
      ];
}
