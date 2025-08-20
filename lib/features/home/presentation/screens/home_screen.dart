import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/custom_appbar.dart';
import 'package:fruit_market/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppbar(), body: HomeScreenBody());
  }
}
