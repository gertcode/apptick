import 'package:apptick/presentation/screens/first_page.dart';
import 'package:apptick/presentation/screens/login_pagev.dart';
import 'package:apptick/presentation/screens/signup_page.dart';
import 'package:go_router/go_router.dart';
import 'package:apptick/presentation/screens/login_page.dart';
import 'package:apptick/presentation/screens/register_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
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
]);