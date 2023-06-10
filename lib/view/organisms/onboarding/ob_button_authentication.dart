import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/molecules/onboarding/ob_button_elevated.dart';
import 'package:satujuta_app_mobile/ui/molecules/onboarding/ob_text_button.dart';

class ObButtonAuthentication extends StatelessWidget {
  const ObButtonAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: 50,
            child: ObButtonElevated(
              onPressed: () {
                if (kDebugMode) {
                  print("Bimillah");
                }
              },
            ),
          ),
          const ObTextButton()
        ],
      ),
    );
  }
}
