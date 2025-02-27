import 'package:tactic/features/signin/domain/entities/user.dart';

class SignupResult {
  final String accessToken;
  final User user;

  SignupResult({
    required this.accessToken,
    required this.user,
  });
}
