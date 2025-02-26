import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/design/themes.dart';
import 'onboarding_cubit.dart';
import 'onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeManager>().toggleTheme(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.dark_mode, color: Colors.white),
      ),
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is OnboardingPageChanged) {
            currentIndex = state.pageIndex;
          }

          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().changePage(index);
                  },
                  children: const [
                    OnboardingPage(
                      title: "훈련 관리를 한 번에",
                      description: "훈련 계획부터 스케줄 관리까지",
                    ),
                    OnboardingPage(
                      title: "출결 관리도 간편하게",
                      description: "출석 현황 관리부터 회원 정보 확인까지",
                    ),
                    OnboardingPage(
                      title: "AI로 분석하는 훈련 현황",
                      description: "참여 만족도부터 훈련 현황까지",
                    ),
                    OnboardingPage(
                      title: "맞춤형 훈련 노트",
                      description: "훈련 동작별 관리부터 시퀀스 구성까지",
                    ),
                    OnboardingPage(
                      title: "Your Play\nYour Story",
                      description: "",
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    _buildPageIndicator(pageController),
                    _buildBottomButtons(context),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// 📌 페이지 인디케이터 추가
  Widget _buildPageIndicator(PageController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: SmoothPageIndicator(
        controller: controller,
        count: OnboardingCubit.totalPages,
        effect: ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey[300]!,
        ),
      ),
    );
  }

  /// 📌 로그인 및 회원가입 버튼 UI
  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<OnboardingCubit>().completeOnboarding();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("로그인"),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                // 회원가입 액션 추가 (예: 회원가입 화면으로 이동)
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: const Text("회원가입"),
            ),
          ),
        ],
      ),
    );
  }
}

/// 📌 온보딩 페이지 개별 컴포넌트
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: 200),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
        // const Spacer(),
      ],
    );
  }
}
