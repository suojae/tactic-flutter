import 'package:json_annotation/json_annotation.dart';

part 'admin_dto.g.dart';

@JsonSerializable()
class LoginRequest {
  final String phone;
  final String password;

  LoginRequest({required this.phone, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final int code;
  final LoginData data;

  LoginResponse({required this.code, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final String accessToken;
  final String? coach;
  final String? center;
  final List<String>? centers;

  LoginData({required this.accessToken, this.coach, this.center, this.centers});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class CenterSelectionRequest {
  final int centerId;

  CenterSelectionRequest({required this.centerId});

  factory CenterSelectionRequest.fromJson(Map<String, dynamic> json) => _$CenterSelectionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CenterSelectionRequestToJson(this);
}

@JsonSerializable()
class PasswordUpdateRequest {
  final String phone;
  final String email;
  final String password;

  PasswordUpdateRequest({required this.phone, required this.email, required this.password});

  factory PasswordUpdateRequest.fromJson(Map<String, dynamic> json) => _$PasswordUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordUpdateRequestToJson(this);
}

/// 🔹 비밀번호 변경 응답 DTO
@JsonSerializable()
class PasswordUpdateResponse {
  final int code;
  final ProfileData data;

  PasswordUpdateResponse({required this.code, required this.data});

  factory PasswordUpdateResponse.fromJson(Map<String, dynamic> json) => _$PasswordUpdateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordUpdateResponseToJson(this);
}

@JsonSerializable()
class SendCodeRequest {
  final String phone;
  final String email;

  SendCodeRequest({required this.phone, required this.email});

  factory SendCodeRequest.fromJson(Map<String, dynamic> json) => _$SendCodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SendCodeRequestToJson(this);
}

@JsonSerializable()
class VerifyCodeRequest {
  final String phone;
  final String email;
  final String code;

  VerifyCodeRequest({required this.phone, required this.email, required this.code});

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) => _$VerifyCodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyCodeRequestToJson(this);
}

@JsonSerializable()
class SignupRequest {
  final String phone;
  final String password;
  final String email;
  final String name;
  final String birthday;
  final String gender;

  SignupRequest({
    required this.phone,
    required this.password,
    required this.email,
    required this.name,
    required this.birthday,
    required this.gender,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class SignupResponse {
  final int code;
  final LoginData data;

  SignupResponse({required this.code, required this.data});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class ProfileResponse {
  final int code;
  final ProfileData data;

  ProfileResponse({required this.code, required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileData {
  final int id;
  final String status;
  final String phone;
  final String email;
  final String name;
  final String birthday;
  final String gender;
  final bool lesson;
  final bool representative;
  final String? fileUrl;
  final bool verifyPhone;
  final bool verifyEmail;
  final bool agreeGeneral;
  final bool agreePrivacy;
  final bool agreeMarketing;
  final bool validYear;

  ProfileData({
    required this.id,
    required this.status,
    required this.phone,
    required this.email,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.lesson,
    required this.representative,
    this.fileUrl,
    required this.verifyPhone,
    required this.verifyEmail,
    required this.agreeGeneral,
    required this.agreePrivacy,
    required this.agreeMarketing,
    required this.validYear,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int code;
  final T? data;

  BaseResponse({required this.code, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T?) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}
