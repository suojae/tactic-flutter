import '../../domain/entities/sign_up.dart';
import '../../domain/entities/sign_up_result.dart';
import '../../domain/entities/user.dart';
import '../remote/admin_dto.dart';

class AuthMapper {
  static User toUser(LoginDataDto dto) {
    return User(
      id: 0, // 로그인 시 ID 없음
      status: "",
      phone: "",
      email: "",
      name: "",
      birthday: DateTime.now(),
      gender: "",
      hasLesson: false,
      isRepresentative: false,
      profileImageUrl: null,
      isPhoneVerified: false,
      isEmailVerified: false,
      agreedToGeneralTerms: false,
      agreedToPrivacyPolicy: false,
      agreedToMarketing: false,
      hasValidMembership: false,
    );
  }

  static User toUserFromProfile(ProfileDataDto dto) {
    return User(
      id: dto.id,
      status: dto.status,
      phone: dto.phone,
      email: dto.email,
      name: dto.name,
      birthday: DateTime.parse(dto.birthday),
      gender: dto.gender,
      hasLesson: dto.lesson,
      isRepresentative: dto.representative,
      profileImageUrl: dto.fileUrl,
      isPhoneVerified: dto.verifyPhone,
      isEmailVerified: dto.verifyEmail,
      agreedToGeneralTerms: dto.agreeGeneral,
      agreedToPrivacyPolicy: dto.agreePrivacy,
      agreedToMarketing: dto.agreeMarketing,
      hasValidMembership: dto.validYear,
    );
  }

  static SignupRequestDto toSignupDto(Signup entity) {
    return SignupRequestDto(
      phone: entity.phone,
      password: entity.password,
      email: entity.email,
      name: entity.name,
      birthday: entity.birthday.toIso8601String(),
      gender: entity.gender,
      lesson: entity.hasLesson,
      representative: entity.isRepresentative,
      educations: entity.educations.map((e) => EducationDto(
        coachId: e.coachId,
        name: e.name,
        department: e.department,
        degree: e.degree,
      )).toList(),
      qualifications: entity.qualifications.map((q) => QualificationDto(
        coachId: q.coachId,
        issuer: q.issuer,
        name: q.name,
        fileId: q.fileId,
      )).toList(),
      works: entity.works.map((w) => WorkDto(
        coachId: w.coachId,
        name: w.name,
        rank: w.rank,
        period: w.period,
      )).toList(),
      games: entity.games.map((g) => GameDto(
        coachId: g.coachId,
        name: g.name,
        type: g.type,
        detail: g.detail,
      )).toList(),
      fileKey: entity.fileKey,
      verifyPhone: entity.isPhoneVerified,
      verifyEmail: entity.isEmailVerified,
      agreeGeneral: entity.agreedToGeneralTerms,
      agreePrivacy: entity.agreedToPrivacyPolicy,
      agreeMarketing: entity.agreedToMarketing,
      validYear: entity.hasValidMembership,
    );
  }

  static SignupResult toSignupResult(LoginResponseDto dto) {
    return SignupResult(
      accessToken: dto.data!.accessToken,
      user: toUser(dto.data!),
    );
  }
}
