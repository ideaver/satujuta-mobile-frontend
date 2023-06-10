import 'package:flutter/material.dart';

import '../../atoms/my_button_with_icon.dart';
import '../../atoms/my_icon_button.dart';
import '../../atoms/my_text_gradient_color.dart';
import '../../foundations/foundation_colors.dart';
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FoundationLinks.linkbackgroundAestheticFourth),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
                    onPressed: () {},
                    text: "Login",
                    buttonStyle: const ButtonStyle())
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

class TopbarCheckOut extends StatelessWidget {
  const TopbarCheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FoundationLinks.linkbackgroundAestheticFourth),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: FoundationSize.sizePadding * 3,
            left: FoundationSize.sizePadding + 8,
            right: FoundationSize.sizePadding + 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: FoundationSize.sizeHeightDefault * 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: FoundationSize.sizeIconMini,
                ),
                const Spacer(),
                MyIconButton(
                  onPressed: () {},
                  path: FoundationLinks.linkWarningIcon,
                  sizeImage: FoundationSize.sizeIconMini,
                )
              ],
            ),
            const SizedBox(
              height: FoundationSize.sizeHeightDefault * 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: FoundationSize.sizePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: MyTextGradientColor(
                      textTitle: "Ringkasan Order",
                      listColor: [
                        FoundationColor.bgColorTextPink,
                        FoundationColor.bgColorTextPurple
                      ],
                      fontSize: FoundationTyphography.fontSizeH2 * 2 - 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Lakukan pembayaran sebelum batas waktu berakhir agar tidak kehilangan Peluang.",
                textAlign: TextAlign.center,
                style: FoundationTyphography.darkFontRegular
                    .copyWith(fontSize: FoundationTyphography.fontSizeH4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
