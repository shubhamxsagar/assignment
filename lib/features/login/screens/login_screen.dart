import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mxpertx/core/constants/toast.dart';
import 'package:mxpertx/core/firebase/firebase_auth.dart';
import 'package:mxpertx/core/router/router_constants.dart';
import 'package:mxpertx/features/login/screens/sign_in_screen.dart';
import 'package:mxpertx/features/login/widgets/button_gradient_button.dart';
import 'package:mxpertx/features/login/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSignIn
          ? Center(
            child: Lottie.network(
                'https://lottie.host/cfc65c8d-09b1-4bf0-8a1c-3596e41aa2ed/PEXXS37uGz.json'),
          )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthGradientButton(
                      buttonText: 'LOG WITH EMAIL',
                      onPressed: () {
                        _showSignInDialog(context);
                      },
                      field: true,
                    ),
                    const SizedBox(height: 20),
                    AuthGradientButton(
                      buttonText: 'REGISTER',
                      onPressed: () {
                        context.pushNamed(RouterConstants.register);
                      },
                      field: false,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  void _showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Sign in to your account',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  LoginField(
                    hintText: 'Email',
                    controller: controller,
                    obscureText: false,
                    background: false,
                  ),
                  const SizedBox(height: 20),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    background: false,
                  ),
                  const SizedBox(height: 20),
                  AuthGradientButton(
                    buttonText: 'LOG IN',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signUp();
                        Navigator.pop(context);
                      }
                    },
                    field: false,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle forgot password logic here
                    },
                    child: Text(
                      'FORGET PASSWORD',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _signUp() async {
    setState(() {
      isSignIn = true;
    });

    String email = controller.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSignIn = false;
    });
    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', user.uid);
      showToast("User is successfully created");
      context.goNamed(RouterConstants.home);
    } else {
      showToast("Some error happend");
    }
  }
}
