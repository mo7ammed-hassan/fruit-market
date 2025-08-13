import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
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
            // context.pushNamedAndRemoveUntilPage(Routes.loginScreen);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.onboardingColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OnboardingSkip(),
                const Spacer(),

                const Expanded(flex: 6, child: OnbboardingPageView()),
                const Spacer(),

                const OnboardingDotsIndicator(),
                const Spacer(),

                _buildNextButton(),
                const Spacer(flex: 2),
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
