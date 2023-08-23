import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_button_with_icon.dart';
import '../../atom/app_gradient_text.dart';
import '../../atom/app_icon_button.dart';

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
          image: AssetImage(AppAssets.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSizes.height * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.lockIconPath,
                  height: 30,
                ),
                const Spacer(),
                AppButtonWithIcon(
                  onPressed: () {},
                  text: "Login",
                  buttonStyle: const ButtonStyle(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrasi",
                  style: AppTextStyle.bold(context, fontSize: 22),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Bergabung menjadi anggota SatuJuta!",
                  style: AppTextStyle.regular(
                    context,
                    fontSize: 14,
                  ),
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
      decoration:
          const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.backgroundPath), fit: BoxFit.cover)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: AppSizes.padding * 3, left: AppSizes.padding + 8, right: AppSizes.padding + 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSizes.height * 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  size: AppSizes.padding * 2,
                ),
                const Spacer(),
                AppIconButton(
                  onPressed: () {},
                  imgIcon: AppAssets.warningIconPath,
                  imgIconSize: AppSizes.padding * 2,
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.height * 6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: AppGradientText(
                      textTitle: "Ringkasan Order",
                      listColor: [AppColors.pink, AppColors.darkBlue],
                      fontSize: 20 * 2 - 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Lakukan pembayaran sebelum batas waktu berakhir agar tidak kehilangan Peluang.",
                textAlign: TextAlign.center,
                style: AppTextStyle.regular(
                  context,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
