import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSuccessDialog extends StatelessWidget {

  final void Function() onPressed;
  const CustomSuccessDialog(
      {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.network(
                "https://assets6.lottiefiles.com/packages/lf20_pqnfmone.json",
                repeat: false,
                fit: BoxFit.fill,
                width: 128),
          ],
        ),
      ),
    );
  }
}