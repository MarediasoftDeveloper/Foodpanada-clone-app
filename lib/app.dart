import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda_clone/core/services/snackbar_service.dart';
import 'package:foodpanda_clone/routes/app_routes.dart';
import 'package:foodpanda_clone/routes/route_generator.dart';
import 'package:foodpanda_clone/viewmodels/account_provider.dart';
import 'package:foodpanda_clone/viewmodels/grocery_provider.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:foodpanda_clone/viewmodels/settings_provider.dart';
import 'package:provider/provider.dart';
import 'config/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // wrap it with provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => RestaurantProvider()),
        ChangeNotifierProvider(create: (context) => GroceryProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // iPhone X reference
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            scaffoldMessengerKey: SnackbarService.scaffoldMessengerKey,
            initialRoute: AppRoutes.dashboard,
            onGenerateRoute: RouteGenerator.generateRoute,
            // home: MerchantDetailScreen(imageUrl: "https://picsum.photos/300/150?random=1",),
          );
        },
      ),
    );
  }
}
