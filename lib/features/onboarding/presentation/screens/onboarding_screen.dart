import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/config/routing/routes.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/core/utils/device/extensions/navigation_extension.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_gap.dart';
import 'package:fruit_market/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:fruit_market/features/onboarding/presentation/widgets/onbboarding_page_view.dart';
import 'package:fruit_market/features/onboarding/presentation/widgets/onboarding_dots_indicator.dart';
import 'package:fruit_market/features/onboarding/presentation/widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocListener<OnboardingCubit, int>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          if (cubit.hasCompletedOnboarding) {
            context.pushAndRemovePages(Routes.welcomeScreen);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.onboardingColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OnboardingSkip(),
                ResponsiveGap.vertical(25.0),

                const Expanded(flex: 4, child: OnbboardingPageView()),
                ResponsiveGap.vertical(48.0),

                const OnboardingDotsIndicator(),
                ResponsiveGap.vertical(80.0),

                _buildNextButton(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.read<OnboardingCubit>().nextPage(),
          child: Text(AppStrings.next),
        );
      },
    );
  }
}
