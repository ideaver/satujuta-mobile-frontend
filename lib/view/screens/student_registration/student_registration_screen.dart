import 'package:flutter/material.dart';

import '../../atoms/my_custom_text.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';
import '../../organisms/student_registration/sr_form.dart';

class StudentRegistrationScreen extends StatelessWidget {
  const StudentRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoundationColor.bgWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: FoundationSize.sizePadding * 2,
              right: FoundationSize.sizePadding * 2,
              left: FoundationSize.sizePadding * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      FoundationLinks.linkWarningIcon,
                      width: FoundationSize.sizeIcon,
                    ),
                  ],
                ),
                MyCustomText(
                  text: "Daftarkan Siswa",
                  style: FoundationTyphography.darkFontBold
                      .copyWith(fontSize: FoundationTyphography.fontSizeH1 + 8),
                ),
                MyCustomText(
                  text: "Harap mengisi data siswa",
                  style: FoundationTyphography.darkFontRegular.copyWith(),
                ),
                const SizedBox(
                  height: FoundationSize.sizeHeightDefault * 4,
                ),
                const SRForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
