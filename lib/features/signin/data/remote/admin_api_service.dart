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
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST("/signup")
  Future<LoginResponseDto> register(@Body() SignupRequestDto request);

  @PUT("/signup/complete")
  Future<BaseResponseDto<void>> completeSignup();

  @POST("/signup/sendCode")
  Future<BaseResponseDto<void>> sendSignupCode(@Body() SendCodeRequestDto request);

  @POST("/signup/verifyCode")
  Future<BaseResponseDto<void>> verifySignupCode(@Body() VerifyCodeRequestDto request);

  @GET("/profile")
  Future<BaseResponseDto<ProfileDataDto>> getProfile();
}
