import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/features/onboarding/models/onboarding_page_data_model.dart';
import 'package:fruit_market/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnbboardingPageView extends StatelessWidget {
  const OnbboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        return PageView.builder(
          controller: cubit.pageController,
          onPageChanged: (index) => cubit.changePage(index),
          itemCount: cubit.totalPages,
          itemBuilder: (context, index) {
            final pageData = cubit.onboardingPages[index];
            return _OnboardingPage(
              key: ObjectKey(pageData),
              onbboardingPageData: pageData,
            );
          },
        );
      },
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({super.key, required this.onbboardingPageData});
  final OnboardingPageDataModel onbboardingPageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.onbordingPadding,
      ),
      child: Column(
        children: [
          Flexible(child: Image.asset(onbboardingPageData.imagePath)),
          SizedBox(height: AppSizes.onbordingSpaceItem),

          Text(
            onbboardingPageData.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSizes.onbordingSpaceText),

          Text(
            onbboardingPageData.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
