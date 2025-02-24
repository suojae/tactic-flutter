import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'admin_dto.dart';

part 'admin_api_service.g.dart';

@RestApi(baseUrl: "")
abstract class AdminApiService {
  factory AdminApiService(Dio dio, {String? baseUrl}) {
    return _AdminApiService(dio, baseUrl: dotenv.env['API_BASE_URL'] ?? "");
  }

  @POST("/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("/login/center")
  Future<LoginResponse> chooseCenter(@Body() CenterSelectionRequest request);

  @PUT("/password")
  Future<PasswordUpdateResponse> updatePassword(@Body() PasswordUpdateRequest request);

  @POST("/signup")
  Future<SignupResponse> register(@Body() SignupRequest request);

  @PUT("/signup/complete")
  Future<SignupResponse> completeSignup();

  @POST("/signup/sendCode")
  Future<BaseResponse> sendSignupCode(@Body() SendCodeRequest request);

  @POST("/signup/verifyCode")
  Future<BaseResponse> verifySignupCode(@Body() VerifyCodeRequest request);

  @GET("/profile")
  Future<ProfileResponse> getProfile();
}
