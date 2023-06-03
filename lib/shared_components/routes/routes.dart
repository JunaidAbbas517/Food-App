import 'package:flutter/material.dart';
import 'package:what_you_cook_today/shared_components/routes/routes_name.dart';
import 'package:what_you_cook_today/view/admin_screens/add_food_screen/add_food_screen.dart';
import 'package:what_you_cook_today/view/admin_screens/edit_food_screen/edit_food_screen.dart';
import 'package:what_you_cook_today/view/admin_screens/manage_order_screen/manage_order_screen.dart';
import 'package:what_you_cook_today/view/auth_screens/forgot_password_screen.dart';
import 'package:what_you_cook_today/view/auth_screens/login_screen.dart';
import 'package:what_you_cook_today/view/auth_screens/signup_screen.dart';

import '../../view/admin_screens/admin_homepage_screen/admin_homepage_screen.dart';
import '../../view/admin_screens/manage_users_screen/manage_users_screen.dart';
import '../../view/admin_screens/manage_users_screen/new_user_list_screen.dart';
import '../../view/admin_screens/manage_users_screen/regular_user_list_screen.dart';
import '../../view/customers_screens/card_screen/card_screen.dart';
import '../../view/customers_screens/check_out_screen/check_out_screen.dart';
import '../../view/customers_screens/food_detial_screen/details_food_screen.dart';
import '../../view/customers_screens/home_screen/home_screen.dart';
import '../../view/onboard_screen/onboard_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.detailsFoodScreen:
        return MaterialPageRoute(
            builder: (_) => DetailsFoodScreen(
                  data: arguments,
                ));
      case RouteName.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      case RouteName.checkOutScreen:
        return MaterialPageRoute(builder: (_) => const CheckOutScreen());
      case RouteName.adminDashboardScreen:
        return MaterialPageRoute(builder: (_) => const AdminHomePageScreen());
      case RouteName.addFoodScreen:
        return MaterialPageRoute(builder: (_) => const AddFoodScreen());
      case RouteName.approveRequestScreen:
        return MaterialPageRoute(builder: (_) => const ManageUsersScreen());
      case RouteName.editFoodScreen:
        return MaterialPageRoute(builder: (_) => const EditFoodScreen());
      case RouteName.manageOrderScreen:
        return MaterialPageRoute(builder: (_) => const ManageOrderScreen());
      case RouteName.newUserScreen:
        return MaterialPageRoute(builder: (_) => const NewUserListScreen());
      case RouteName.regularUserScreen:
        return MaterialPageRoute(builder: (_) => const RegularUserListScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
