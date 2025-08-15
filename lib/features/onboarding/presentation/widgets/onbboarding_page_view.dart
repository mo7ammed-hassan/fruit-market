import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_text.dart';
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
        horizontal: AppSizes.onbordingPadding / 1.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.onbordingPadding / 2,
              ),
              child: Image.asset(
                onbboardingPageData.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: AppSizes.onbordingSpaceItem),

          FittedBox(
            child: ResponsiveText(
              onbboardingPageData.title,
              baseStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: AppSizes.onbordingSpaceText),

          FittedBox(
            child: ResponsiveText(
              onbboardingPageData.subTitle,
              textAlign: TextAlign.center,
              baseStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
