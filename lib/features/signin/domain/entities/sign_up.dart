import 'package:tactic/features/signin/domain/entities/qualification.dart';
import 'package:tactic/features/signin/domain/entities/work.dart';

import 'education.dart';
import 'game.dart';

class Signup {
  final String phone;
  final String password;
  final String email;
  final String name;
  final DateTime birthday;
  final String gender;
  final bool hasLesson;
  final bool isRepresentative;
  final List<Education> educations;
  final List<Qualification> qualifications;
  final List<Work> works;
  final List<Game> games;
  final String fileKey;
  final bool isPhoneVerified;
  final bool isEmailVerified;
  final bool agreedToGeneralTerms;
  final bool agreedToPrivacyPolicy;
  final bool agreedToMarketing;
  final bool hasValidMembership;

  Signup({
    required this.phone,
    required this.password,
    required this.email,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.hasLesson,
    required this.isRepresentative,
    required this.educations,
    required this.qualifications,
    required this.works,
    required this.games,
    required this.fileKey,
    required this.isPhoneVerified,
    required this.isEmailVerified,
    required this.agreedToGeneralTerms,
    required this.agreedToPrivacyPolicy,
    required this.agreedToMarketing,
    required this.hasValidMembership,
  });
}
