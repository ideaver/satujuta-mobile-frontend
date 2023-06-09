import 'package:flutter/material.dart';

import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';
import 'tab_sections/account_section.dart';
import 'tab_sections/biodata_section.dart';
import 'tab_sections/komisi_section.dart';

class AuthListFormRegister extends StatelessWidget {
  const AuthListFormRegister({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_literals_to_create_immutables
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: FoundationColor.bgColorGrey),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              onTap: null,
              controller: tabController,
              indicator: BoxDecoration(
                color: FoundationColor.bgWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              labelColor: FoundationColor.bgColorBase, isScrollable: false,
              dividerColor: FoundationColor.bgWhite,
              indicatorColor: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Container(
                  width: 100,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            FoundationLinks.linkPersonIconLogo,
                            width: FoundationSize.sizeIconMini,
                          ),
                          const Expanded(
                              child: Text(
                            "Data Diri",
                            style: TextStyle(
                              fontSize: FoundationTyphography.fontSizeH5,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: Tab(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          FoundationLinks.linkLockDarkIcon,
                          width: FoundationSize.sizeIconMini,
                        ),
                        const Expanded(
                          child: Text("Akun",
                              style: TextStyle(
                                fontSize: FoundationTyphography.fontSizeH5,
                              )),
                        )
                      ],
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: null,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            FoundationLinks.linkCoinIconLogo,
                            width: FoundationSize.sizeIconMini,
                          ),
                          const Expanded(
                            child: Text("Komisi",
                                style: TextStyle(
                                  fontSize: FoundationTyphography.fontSizeH5,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BiodataSection(controller: tabController),
                  const AccountSection(),
                  const KomisiSection(),
                ]),
          )
        ],
      ),
    );
  }
}
