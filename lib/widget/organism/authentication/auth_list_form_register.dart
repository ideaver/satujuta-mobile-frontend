import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.baseLv4),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              onTap: null,
              controller: tabController,
              indicator: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              labelColor: AppColors.base, isScrollable: false,
              dividerColor: AppColors.white,
              indicatorColor: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                SizedBox(
                  width: 100,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.personFormIconPath,
                            width: AppSizes.padding * 2,
                          ),
                          const Expanded(
                              child: Text(
                            "Data Diri",
                            style: TextStyle(
                              fontSize: 12,
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
                          AppAssets.lockDarkIconPath,
                          width: AppSizes.padding * 2,
                        ),
                        const Expanded(
                          child: Text("Akun",
                              style: TextStyle(
                                fontSize: 12,
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
                            AppAssets.coinFormIconPath,
                            width: AppSizes.padding * 2,
                          ),
                          const Expanded(
                            child: Text("Komisi",
                                style: TextStyle(
                                  fontSize: 12,
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
            child: TabBarView(controller: tabController, physics: const NeverScrollableScrollPhysics(), children: [
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
