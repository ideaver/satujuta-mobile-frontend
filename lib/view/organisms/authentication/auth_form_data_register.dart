import 'package:flutter/material.dart';

import '../../atoms/my_custom_text.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';
import 'auth_list_form_register.dart';

class AuthFormDataRegister extends StatelessWidget {
  const AuthFormDataRegister({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: FoundationSize.sizeHeightDefault * 5,
            ),
            Center(
              child: MyCustomText(
                  text: 'Upload Foto Profile Anda',
                  style: FoundationTyphography.darkFontBold
                      .copyWith(fontSize: FoundationTyphography.fontSizeH3)),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: FoundationSize.sizeHeightDefault * 5),
                width: MediaQuery.of(context).size.width * .5,
                height: 150,
                child: Center(
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        child: Container(
                          width: FoundationSize.sizeIcon,
                          height: FoundationSize.sizeIcon,
                          decoration: BoxDecoration(
                              color: FoundationColor.bgPrimary,
                              borderRadius: BorderRadius.circular(
                                  FoundationSize.sizeHeightDefault * 5)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              FoundationLinks.linkEditIconLogo,
                              width: FoundationSize.sizeIconMini,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AuthListFormRegister(tabController: tabController),
          ],
        ));
  }
}
