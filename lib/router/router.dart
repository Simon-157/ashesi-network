import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/action_services/posts_actions.dart';
import 'package:social_network/dashboard.dart';
import 'package:social_network/pages/login_screen.dart';
import 'package:social_network/pages/create_post_page.dart';
import 'package:social_network/pages/profile_page.dart';
import 'package:social_network/pages/sign_up.dart';
import 'package:social_network/widgets/edit_profile_dialog.dart';

bool isAuthenticated() {
  User? user = FirebaseAuth.instance.currentUser;

  return user != null;
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Dashboard();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpPage();
          },
        ),
        GoRoute(
          path: 'posts',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpPage();
          },
        ),
        GoRoute(
          path: 'add_post',
          builder: (BuildContext context, GoRouterState state) {
            return CreatePostPage();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: 'profile/:id',
          builder: (BuildContext context, GoRouterState state) {
            if (isAuthenticated()) {
              return const ProfilePage();
            } else {
              return LoginScreen();
            }
          },
        ),
        GoRoute(
          path: 'profile/edit/:id',
          builder: (BuildContext context, GoRouterState state) {
            return const EditProfile();
          },
        ),
      ],
    ),
  ],
);
