import '../../domain/entities/check_duplicate_result.dart';
import '../../domain/entities/sign_up.dart';
import '../../domain/entities/sign_up_result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../mappers/auth_mapper.dart';
import '../remote/admin_api_service.dart';
import '../remote/admin_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AdminApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<User> login(String phone, String password) async {
    final response = await _apiService
        .login(LoginRequestDto(phone: phone, password: password));
    return AuthMapper.toUser(response.data!);
  }

  @override
  Future<SignupResult> signup(Signup signup) async {
    final response = await _apiService.register(AuthMapper.toSignupDto(signup));
    return AuthMapper.toSignupResult(response);
  }

  @override
  Future<SignupResult> completeSignup(String accessToken) async {
    final response = await _apiService.completeSignUp(accessToken);
    return AuthMapper.toSignupResult(response);
  }

  @override
  Future<User> getProfile() async {
    final response = await _apiService.getProfile();
    return AuthMapper.toUserFromProfile(response.data!);
  }

  @override
  Future<void> sendSignupCode(String phone, String email) async {
    await _apiService
        .sendSignupCode(SendCodeRequestDto(phone: phone, email: email));
  }

  @override
  Future<bool> verifySignupCode(
      int verificationId, String method, String code) async {
    final response = await _apiService.verifySignupCode(
      VerifyCodeRequestDto(
          verificationId: verificationId, method: method, code: code),
    );
    return response.code == 200; // 서버가 성공 응답을 200으로 보낸다고 가정
  }

  @override
  Future<CheckDuplicateResult> checkDuplicateAdmin({
    String? phone,
    String? email,
    String? name,
    String? birthday,
  }) async {
    final response = await _apiService.checkDuplicateAdmin(
      CheckDuplicateAdminRequestDto(
        phone: phone,
        email: email,
        name: name,
        birthday: birthday,
      ),
    );
    return AuthMapper.toCheckDuplicateResult(response);
  }
}
