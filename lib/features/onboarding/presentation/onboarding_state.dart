sealed class OnboardingState {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

final class OnboardingPageChanged extends OnboardingState {
  final int pageIndex;
  const OnboardingPageChanged(this.pageIndex);
}

final class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}
