import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/theme.dart';
import 'features/cart_feature/data/data_source/local/fake_products.dart';
import 'features/cart_feature/presentation/bloc/cart_cubit.dart';
import 'features/home_feature/presentation/bloc/theme_cubit.dart';
import 'features/home_feature/presentation/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (final BuildContext context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode?>(
        builder: (final BuildContext context, final ThemeMode? themeMode) {
          return MyApp(themeMode: themeMode);
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.themeMode});

  final ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocProvider(
      create:
          (context) =>
              CartCubit()
                ..loadCart()
                ..addItem(FakeProducts.products[0])
                ..addItem(FakeProducts.products[1])
                ..addItem(FakeProducts.products[4])
                ..addItem(FakeProducts.products[6]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        home: SplashScreen(),
      ),
    );
  }
}
