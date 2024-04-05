import 'package:flutter/material.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool field;
  const AuthGradientButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.field = false});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: screenWidth,
          height: 55,
          decoration: BoxDecoration(
            gradient: field
                ? LinearGradient(
                    colors: [
                      AppPallete.gradient1!,
                      AppPallete.gradient1!,
                      AppPallete.gradient1!,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: field ? AppPallete.gradient4 : Colors.white),
          )),
        ),
      ),
    );
  }
}
