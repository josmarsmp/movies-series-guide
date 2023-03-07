import 'package:flutter/material.dart';

import 'generated/assets.gen.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        routes: appRoutes,
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Assets.svgs.error404.svg()
            ),
          ),
        ),
      ),
    );
  }
}
