import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, currentIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cubit.onboardingPages.length, (index) {
            final isActive = index == currentIndex;

            return AnimatedContainer(
              width: 12,
              height: 12,
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primaryColor : null,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor),
              ),
            );
          }),
        );
      },
    );
  }
}
