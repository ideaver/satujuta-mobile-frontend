import 'package:flutter/material.dart';

import '../../../constant.dart';

class ButtonAuthentication extends StatelessWidget {
  const ButtonAuthentication({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: 50,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kColorBase)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Mulai",
                    style: whiteJakartaText.copyWith(
                        fontWeight: semiBold, letterSpacing: 1),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: darkJakartaText.copyWith(fontWeight: bold),
              ))
        ],
      ),
    );
  }
}
