import 'package:apptick/presentation/screens/dash_page.dart';
import 'package:apptick/presentation/screens/dashboard_page.dart';
import 'package:apptick/presentation/screens/first_page.dart';
import 'package:apptick/presentation/screens/home_page.dart';
import 'package:apptick/presentation/screens/login_pagev.dart';
import 'package:apptick/presentation/screens/new_task_page.dart';
import 'package:apptick/presentation/screens/principalPage.dart';
import 'package:apptick/presentation/screens/signup_page.dart';
import 'package:apptick/presentation/screens/task_page.dart';
import 'package:apptick/presentation/screens/team_page.dart';
import 'package:go_router/go_router.dart';
import 'package:apptick/presentation/screens/login_page.dart';
import 'package:apptick/presentation/screens/register_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/vcbcvb',
    builder: (context, state) => FirstPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/reg',
    builder: (context, state) => SignUpPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/algo',
    builder: (context, state) => HomeScreen(userId: 1),
  ),
  GoRoute(
    path: '/team',
    builder: (context, state) => TeamPage(),
  ),
  GoRoute(
    path: '/fddsfsdf',
    builder: (context, state) => FirstPage(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const PrincipalPage(),
  ),
]);