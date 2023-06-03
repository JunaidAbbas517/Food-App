import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:what_you_cook_today/shared_components/routes/routes.dart';
import 'package:what_you_cook_today/shared_components/routes/routes_name.dart';
import 'package:what_you_cook_today/view_model/providers/approving_user_provider.dart';
import 'package:what_you_cook_today/view_model/providers/auth_provider.dart';
import 'package:what_you_cook_today/view_model/providers/product_provider.dart';
import 'package:what_you_cook_today/view_model/providers/user_list_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Builder(builder: (context) {
      return ScreenUtilInit(
        designSize: const Size(372, 820),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProductProvider>(
                  create: (_) => ProductProvider()),
              ChangeNotifierProvider<UserAuth>(create: (_) => UserAuth()),
              ChangeNotifierProvider<UserListProvider>(
                  create: (_) => UserListProvider()),
              ChangeNotifierProvider<ApprovingNewUser>(
                  create: (_) => ApprovingNewUser()),
            ],
            child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: const Color(0xfff5f5f5),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: RouteName.splashScreen,
              onGenerateRoute: Routes.generateRoute,
            ),
          );
        },
      );
    });
  }
}
