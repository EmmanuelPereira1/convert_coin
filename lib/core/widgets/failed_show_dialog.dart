import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorDialog extends StatelessWidget {
  final String error;
  final void Function() onPressed;
  const CustomErrorDialog(
      {Key? key, required this.error, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      backgroundColor: const Color(0xFFFFEBC5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.network(
                "https://assets7.lottiefiles.com/packages/lf20_e1pmabgl.json",
                repeat: true,
                fit: BoxFit.fill,
                width: 128),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0XFFF2C53D)),
              ),
              onPressed: onPressed,
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color(0xFFD97236),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
