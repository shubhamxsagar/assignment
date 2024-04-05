import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mxpertx/core/router/router_constants.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';
import 'package:mxpertx/features/login/widgets/button_gradient_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPallete.gradient1!,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/girl1.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Following'),
                        Text('0'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Followers'),
                        Text('0'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Post'),
                        Text('0'),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();
                      context.goNamed(RouterConstants.login);
                    },
                    child: Text('Sign Out'))
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Jane doe',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            AuthGradientButton(buttonText: 'EditProfile', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
