import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mxpertx/core/constants/toast.dart';
import 'package:mxpertx/core/firebase/firebase_auth.dart';
import 'package:mxpertx/core/router/router_constants.dart';
import 'package:mxpertx/features/login/widgets/button_gradient_button.dart';
import 'package:mxpertx/features/login/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? isSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: AlertDialog(
              actions: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'Sign in to your account',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                LoginField(
                  hintText: 'Email',
                  controller: controller,
                  obscureText: false,
                  background: false,
                ),
                const SizedBox(height: 40),
                LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  background: false,
                ),
                const SizedBox(height: 40),
                AuthGradientButton(
                  buttonText: 'LOG IN',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUp();
                    }
                  },
                  field: false,
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'FORGET PASSOWRD',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
