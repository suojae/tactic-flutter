import '../entities/check_duplicate_result.dart';
import '../entities/sign_up.dart';
import '../entities/sign_up_result.dart';
import '../entities/user.dart';

abstract interface class AuthRepository {
  Future<User> login(String phone, String password);
  Future<SignupResult> completeSignup(String accessToken);
  Future<SignupResult> signup(Signup signup);
  Future<User> getProfile();
  Future<void> sendSignupCode(String phone, String email);
  Future<bool> verifySignupCode(int verificationId, String method, String code);
  Future<CheckDuplicateResult> checkDuplicateAdmin({
    String? phone,
    String? email,
    String? name,
    String? birthday,
  });
}
