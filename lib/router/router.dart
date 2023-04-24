import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/dashboard.dart';
import 'package:social_network/pages/login_screen.dart';
import 'package:social_network/pages/create_post_page.dart';
import 'package:social_network/pages/profile_page.dart';
import 'package:social_network/pages/sign_up.dart';
import 'package:social_network/widgets/edit_profile_dialog.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return Dashboard();
        }
        return LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return Dashboard();
            }
            return SignUpPage();
          },
        ),
        GoRoute(
          path: 'add_post',
          builder: (BuildContext context, GoRouterState state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return const CreatePostPage();
            }
            return LoginScreen();
          },
        ),
        GoRoute(
          path: 'posts',
          builder: (BuildContext context, GoRouterState state) {
            return Dashboard();
          },
        ),
        GoRoute(
          path: 'profile/:id',
          builder: (BuildContext context, GoRouterState state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return const ProfilePage();
            } else {
              return LoginScreen();
            }
          },
        ),
        GoRoute(
          path: 'profile/edit/:id',
          builder: (BuildContext context, GoRouterState state) {
            return EditProfile();
          },
        ),
      ],
    ),
  ],
);
