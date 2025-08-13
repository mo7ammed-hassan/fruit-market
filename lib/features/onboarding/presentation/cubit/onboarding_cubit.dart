import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/features/onboarding/models/onboarding_page_data_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  final PageController pageController = PageController();

  static const _animationDuration = Duration(milliseconds: 300);

  final List<OnboardingPageDataModel> onboardingPages = const [
    OnboardingPageDataModel(
      imagePath: AppImages.imagesOnboarding,
      title: AppStrings.onboardingTitle1,
      subTitle: AppStrings.onboardingSubTitle1,
    ),
    OnboardingPageDataModel(
      imagePath: AppImages.imagesOnboarding,
      title: AppStrings.onboardingTitle2,
      subTitle: AppStrings.onboardingSubTitle12,
    ),
    OnboardingPageDataModel(
      imagePath: AppImages.imagesOnboarding,
      title: AppStrings.onboardingTitle3,
      subTitle: AppStrings.onboardingSubTitle3,
    ),
  ];

  bool _isManualScroll = true;

  int get totalPages => onboardingPages.length;
  bool get isLastPage => state == totalPages - 1;
  bool get hasCompletedOnboarding => state >= onboardingPages.length;

  void changePage(int index) {
    if (_isManualScroll) emit(index);
  }

  void nextPage() async {
    _isManualScroll = false;
    if (isLastPage) {
      emit(totalPages);
      //await getIt<AppStorage>().setBool(kOnBoardingShown, true);
      return;
    }

    final nextPageIndex = state + 1;
    emit(nextPageIndex);

    await pageController.animateToPage(
      nextPageIndex,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );

    _restoreManualScroll();
  }

  void skipPage() async {
    _isManualScroll = false;

    final lastPageIndex = totalPages - 1;
    emit(lastPageIndex);

    await pageController.animateToPage(
      lastPageIndex,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );

    _restoreManualScroll();
  }

  void _restoreManualScroll() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _isManualScroll = true;
    });
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
