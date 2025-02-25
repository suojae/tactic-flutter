import 'package:json_annotation/json_annotation.dart';

part 'admin_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseDto<T> {
  final int code;
  final T? data;

  BaseResponseDto({required this.code, this.data});

  factory BaseResponseDto.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T?) toJsonT) =>
      _$BaseResponseDtoToJson(this, toJsonT);
}

@JsonSerializable()
class LoginRequestDto {
  final String phone;
  final String password;

  LoginRequestDto({required this.phone, required this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => _$LoginRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}

@JsonSerializable()
class LoginDataDto {
  final String accessToken;
  final String? coach;
  final String? center;
  final List<String>? centers;

  LoginDataDto({required this.accessToken, this.coach, this.center, this.centers});

  factory LoginDataDto.fromJson(Map<String, dynamic> json) => _$LoginDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataDtoToJson(this);
}

@JsonSerializable()
class SignupRequestDto {
  final String phone;
  final String password;
  final String email;
  final String name;
  final String birthday;
  final String gender;
  final bool lesson;
  final bool representative;
  final List<EducationDto> educations;
  final List<QualificationDto> qualifications;
  final List<WorkDto> works;
  final List<GameDto> games;
  final String fileKey;
  final bool verifyPhone;
  final bool verifyEmail;
  final bool agreeGeneral;
  final bool agreePrivacy;
  final bool agreeMarketing;
  final bool validYear;

  SignupRequestDto({
    required this.phone,
    required this.password,
    required this.email,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.lesson,
    required this.representative,
    required this.educations,
    required this.qualifications,
    required this.works,
    required this.games,
    required this.fileKey,
    required this.verifyPhone,
    required this.verifyEmail,
    required this.agreeGeneral,
    required this.agreePrivacy,
    required this.agreeMarketing,
    required this.validYear,
  });

  factory SignupRequestDto.fromJson(Map<String, dynamic> json) => _$SignupRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestDtoToJson(this);
}

@JsonSerializable()
class ProfileDataDto {
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

  ProfileDataDto({
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

  factory ProfileDataDto.fromJson(Map<String, dynamic> json) => _$ProfileDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataDtoToJson(this);
}

@JsonSerializable()
class EducationDto {
  final int coachId;
  final String name;
  final String department;
  final String degree;

  EducationDto({required this.coachId, required this.name, required this.department, required this.degree});

  factory EducationDto.fromJson(Map<String, dynamic> json) => _$EducationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EducationDtoToJson(this);
}

@JsonSerializable()
class QualificationDto {
  final int coachId;
  final String issuer;
  final String name;
  final int fileId;

  QualificationDto({required this.coachId, required this.issuer, required this.name, required this.fileId});

  factory QualificationDto.fromJson(Map<String, dynamic> json) => _$QualificationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$QualificationDtoToJson(this);
}

@JsonSerializable()
class WorkDto {
  final int coachId;
  final String name;
  final String rank;
  final String period;

  WorkDto({required this.coachId, required this.name, required this.rank, required this.period});

  factory WorkDto.fromJson(Map<String, dynamic> json) => _$WorkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkDtoToJson(this);
}

@JsonSerializable()
class GameDto {
  final int coachId;
  final String name;
  final String type;
  final String detail;

  GameDto({required this.coachId, required this.name, required this.type, required this.detail});

  factory GameDto.fromJson(Map<String, dynamic> json) => _$GameDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GameDtoToJson(this);
}

@JsonSerializable()
class SendCodeRequestDto {
  final String phone;
  final String email;

  SendCodeRequestDto({required this.email, required this.phone});

  factory SendCodeRequestDto.fromJson(Map<String, dynamic> json) => _$SendCodeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SendCodeRequestDtoToJson(this);
}

@JsonSerializable()
class VerifyCodeRequestDto {
  final int verificationId;
  final String method;
  final String code;

  VerifyCodeRequestDto({required this.verificationId, required this.method, required this.code});

  factory VerifyCodeRequestDto.fromJson(Map<String, dynamic> json) => _$VerifyCodeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyCodeRequestDtoToJson(this);
}

@JsonSerializable()
class CheckDuplicateAdminRequestDto {
  final String? phone;
  final String? email;
  final String? name;

  @JsonKey(fromJson: _validateDateFormat)
  final String? birthday;

  CheckDuplicateAdminRequestDto({
    this.phone,
    this.email,
    this.name,
    this.birthday,
  });

  factory CheckDuplicateAdminRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CheckDuplicateAdminRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDuplicateAdminRequestDtoToJson(this);

  // 날짜 형식 검증 함수
  static String? _validateDateFormat(String? date) {
    if (date == null) return null;
    
    // YYYY-MM-DD 형식 검사
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regex.hasMatch(date)) {
      throw ArgumentError("Invalid birthday format. Expected YYYY-MM-DD");
    }

    // 존재하는 날짜인지 검사
    try {
      final parsedDate = DateTime.parse(date);
      final formatted = "${parsedDate.year.toString().padLeft(4, '0')}-"
          "${parsedDate.month.toString().padLeft(2, '0')}-"
          "${parsedDate.day.toString().padLeft(2, '0')}";
      if (date != formatted) {
        throw ArgumentError("Invalid date. The date does not exist.");
      }
      return date;
    } catch (e) {
      throw ArgumentError("Invalid date. The date does not exist.");
    }
  }
}

@JsonSerializable()
class CheckDuplicateDataDto {
  final String duplicate;

  CheckDuplicateDataDto({required this.duplicate});

  factory CheckDuplicateDataDto.fromJson(Map<String, dynamic> json) => _$CheckDuplicateDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDuplicateDataDtoToJson(this);
}

typedef LoginResponseDto = BaseResponseDto<LoginDataDto>;
typedef SignupResponseDto = BaseResponseDto<LoginDataDto>;
typedef ProfileResponseDto = BaseResponseDto<ProfileDataDto>;
typedef CheckDuplicateAdminResponseDto = BaseResponseDto<CheckDuplicateDataDto>;
