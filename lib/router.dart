import 'package:forgemate/ui/screen/expenses_screen/expenses_binding.dart';
import 'package:forgemate/ui/screen/expenses_screen/expenses_screen.dart';
import 'package:forgemate/ui/screen/home_screen/home_binding.dart';
import 'package:forgemate/ui/screen/home_screen/home_screen.dart';
import 'package:forgemate/ui/screen/insights_screen/insights_binding.dart';
import 'package:forgemate/ui/screen/insights_screen/insights_screen.dart';
import 'package:forgemate/ui/screen/login_screen/login_binding.dart';
import 'package:forgemate/ui/screen/login_screen/login_screen.dart';
import 'package:forgemate/ui/screen/new_project_screen/new_project_binding.dart';
import 'package:forgemate/ui/screen/new_project_screen/new_project_screen.dart';
import 'package:forgemate/ui/screen/onboarding_screen/onboarding_binding.dart';
import 'package:forgemate/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:forgemate/ui/screen/project_screen/project_binding.dart';
import 'package:forgemate/ui/screen/project_screen/project_screen.dart';
import 'package:forgemate/ui/screen/register_screen/register_binding.dart';
import 'package:forgemate/ui/screen/register_screen/register_screen.dart';
import 'package:forgemate/ui/screen/splash_screen/splash_binding.dart';
import 'package:forgemate/ui/screen/splash_screen/splash_screen.dart';
import 'package:forgemate/ui/screen/workforce_screen/workforce_binding.dart';
import 'package:forgemate/ui/screen/workforce_screen/workforce_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutePaths {
  static const String splash = '/';
  static const String homeScreen = '/home';
  static const String onBoardingScreen = '/onBoarding';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String newProjectScreen = '/newProject';
  static const String insightsScreen = '/insights';
  static const String projectScreen = '/project';
  static const String expensesScreen = '/expenses';
  static const String workforceScreen = '/workforce';


}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      binding: SplashBinding(),
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutePaths.homeScreen,
      binding: HomeBinding(),
      page: () =>  HomeScreen(),
    ),
    GetPage(
      name: RoutePaths.onBoardingScreen,
      binding: OnboardingBinding(),
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: RoutePaths.loginScreen,
      binding: LoginBinding(),
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutePaths.registerScreen,
      binding: RegisterBinding(),
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RoutePaths.newProjectScreen,
      binding: NewProjectBinding(),
      page: () => const NewProjectScreen(),
    ),
    GetPage(
      name: RoutePaths.insightsScreen,
      binding: InsightsBinding(),
      page: () => const InsightsScreen(),
    ),
    GetPage(
      name: RoutePaths.projectScreen,
      binding: ProjectBinding(),
      page: () => const ProjectScreen(),
    ),
    GetPage(
      name: RoutePaths.workforceScreen,
      binding: WorkforceBinding(),
      page: () => const WorkforceScreen(),
    ),
    GetPage(
      name: RoutePaths.expensesScreen,
      binding: ExpensesBinding(),
      page: () =>  ExpensesScreen(),
    ),
  ];
}