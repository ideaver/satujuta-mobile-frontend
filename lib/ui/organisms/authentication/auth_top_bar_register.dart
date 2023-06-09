import 'package:flutter/material.dart';

import '../../atoms/my_button_with_icon.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';

class AuthTopbarRegister extends StatelessWidget {
  const AuthTopbarRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FoundationLinks.linkbackgroundAestheticFourth),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: FoundationSize.sizeHeightDefault * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: FoundationSize.sizePadding * 2),
            child: Row(
              children: [
                Image.asset(
                  FoundationLinks.linkLockIconLogo,
                  height: 30,
                ),
                const Spacer(),
                MyButtonWithIcon(
                    onPressed: () {}, text: "Login", buttonStyle: ButtonStyle())
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: FoundationSize.sizePadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrasi",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Bergabung menjadi anggota SatuJuta!",
                  style: FoundationTyphography.darkFontRegular
                      .copyWith(fontSize: FoundationTyphography.fontSizeH4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
