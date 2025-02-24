import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  static const int totalPages = 5;
  int _currentPage = 0;

  OnboardingCubit() : super(const OnboardingInitial());

  /// 현재 페이지 변경
  void changePage(int index) {
    _currentPage = index;
    emit(OnboardingPageChanged(index));
  }

  /// 온보딩 완료 처리
  void completeOnboarding() {
    emit(const OnboardingCompleted());
  }
}
