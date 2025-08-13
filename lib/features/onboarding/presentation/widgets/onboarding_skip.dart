import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:fruit_market/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.onbordingPadding,
        vertical: AppSizes.onbordingPadding,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => context.read<OnboardingCubit>().skipPage(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Container(height: 1.2, color: Colors.blueGrey, width: 33),
            ],
          ),
        ),
      ),
    );
  }
}
