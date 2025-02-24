class User {
  final int id;
  final String status;
  final String phone;
  final String email;
  final String name;
  final DateTime birthday;
  final String gender;
  final bool hasLesson;
  final bool isRepresentative;
  final String? profileImageUrl;
  final bool isPhoneVerified;
  final bool isEmailVerified;
  final bool agreedToGeneralTerms;
  final bool agreedToPrivacyPolicy;
  final bool agreedToMarketing;
  final bool hasValidMembership;

  User({
    required this.id,
    required this.status,
    required this.phone,
    required this.email,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.hasLesson,
    required this.isRepresentative,
    this.profileImageUrl,
    required this.isPhoneVerified,
    required this.isEmailVerified,
    required this.agreedToGeneralTerms,
    required this.agreedToPrivacyPolicy,
    required this.agreedToMarketing,
    required this.hasValidMembership,
  });
}
