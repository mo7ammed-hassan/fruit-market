import 'package:fruit_market/features/home/home_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  registerHomeDependencies(getIt);
}
