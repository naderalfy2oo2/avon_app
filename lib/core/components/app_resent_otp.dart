import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class AppResentOtp extends StatefulWidget {
  const AppResentOtp({super.key});

  @override
  State<AppResentOtp> createState() => _AppResentOtpState();
}

class _AppResentOtpState extends State<AppResentOtp> {
  bool isSend = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Didn’t receive a code? '),

        TextButton(
          onPressed: isSend
              ? null
              : () {
                  isSend = true;
                  setState(() {});
                },
          child: Text('Resend'),
        ),

        Spacer(),

        if (isSend)
          CircularCountDownTimer(
            width: 50,
            height: 40,
            duration: 90,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
            isReverse: true,
            onComplete: () {
              isSend = false;
              setState(() {});
            },
            textFormat: CountdownTextFormat.MM_SS,
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),

        // Text('0:36'),
      ],
    );
  }
}
