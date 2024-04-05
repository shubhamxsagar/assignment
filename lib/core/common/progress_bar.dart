import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.network(
          'https://lottie.host/cfc65c8d-09b1-4bf0-8a1c-3596e41aa2ed/PEXXS37uGz.json'),
    );
  }
}
