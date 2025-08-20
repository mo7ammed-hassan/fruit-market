import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/animated_circular_container.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_images.dart';
import 'package:fruit_market/core/constants/app_sizes.dart';
import 'package:fruit_market/core/utils/responsive/responsive_helpers.dart';
import 'package:fruit_market/core/utils/responsive/widgets/responsive_gap.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  int _currentIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveSize(
          context,
          Axis.horizontal,
          AppSizes.defaultPadding,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => const BannerCard(),
            options: CarouselOptions(
              clipBehavior: Clip.none,
              height: getResponsiveSize(context, Axis.vertical, 120),
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1,
              onPageChanged: (index, _) => onPageChanged(index),
            ),
          ),
          ResponsiveGap.vertical(32.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              final isActive = index == _currentIndex;

              return AnimatedCircularContainer(
                width: isActive ? 9 : 8,
                height: isActive ? 9 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: isActive ? AppColors.primaryColor : Colors.transparent,
              );
            }),
          ),
        ]),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(AppImages.imagesFruitBanner),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
