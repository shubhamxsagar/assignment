import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mxpertx/core/constants/toast.dart';
import 'package:mxpertx/core/firebase/firebase_auth.dart';
import 'package:mxpertx/core/router/router_constants.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';
import 'package:mxpertx/features/login/widgets/button_gradient_button.dart';
import 'package:mxpertx/features/login/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isSigningUp = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();

    super.dispose();
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.gradient3,
      appBar: AppBar(
        title: const Text(
          'Register with skenu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(), // Remove the leading arrow
        backgroundColor:
            AppPallete.gradient1, // Set the AppBar background color to yellow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), // Adjust the radius as needed
            bottomRight: Radius.circular(20), // Adjust the radius as needed
          ),
        ),
        centerTitle: true,
      ),
      body: isSigningUp
          ? Center(
              child: Lottie.network(
                  'https://lottie.host/cfc65c8d-09b1-4bf0-8a1c-3596e41aa2ed/PEXXS37uGz.json'))
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      LoginField(
                        hintText: 'Username',
                        controller: userController,
                        background: true,
                      ),
                      const SizedBox(height: 20),
                      LoginField(
                        hintText: 'Email',
                        controller: emailController,
                        background: true,
                      ),
                      const SizedBox(height: 20),
                      LoginField(
                        hintText: 'Password',
                        controller: passwordController,
                        background: true,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      LoginField(
                        hintText: 'Confirm Password',
                        controller: confirmPasswordController,
                        background: true,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                              child: Text(
                                'Agree terms and conditions',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AuthGradientButton(
                        buttonText: 'Register',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signUp();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = userController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast("User is successfully created");
      context.pushNamed(RouterConstants.login);
    } else {
      showToast("Some error happend");
    }
  }
}
