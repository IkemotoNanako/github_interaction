import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GithubAuthProvider githubProvider = GithubAuthProvider();

  Future _signInWithGitHub() async {
    await FirebaseAuth.instance.signInWithPopup(githubProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Sign in"),
          onPressed: () async {
            try {
              await _signInWithGitHub();
              context.go('/home');
            } catch (e) {
              print('エラーです');
            }
          },
        ),
      ),
    );
  }
}
