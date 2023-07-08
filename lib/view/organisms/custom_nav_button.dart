import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_assets.dart';
import 'package:satujuta_app_mobile/app/const/app_sizes.dart';
import 'package:satujuta_app_mobile/app/theme/app_colors.dart';
import 'package:satujuta_app_mobile/view/dashboard/dashboard_view.dart';
import 'package:satujuta_app_mobile/view/program_list/program_list_view.dart';
import 'package:satujuta_app_mobile/view/referral/referral_view.dart';
import 'package:satujuta_app_mobile/view/settings_sreen/settings_view.dart';

// ignore: must_be_immutable
class CustomNavBottom extends StatefulWidget {
  CustomNavBottom({
    Key? key,
    required this.indexIndicator,
  }) : super(key: key);

  int indexIndicator = 0;

  @override
  State<CustomNavBottom> createState() => _CustomNavBottomState();
}

class _CustomNavBottomState extends State<CustomNavBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding,
        horizontal: AppSizes.padding * 5,
      ),
      child: Container(
        height: 70 + MediaQuery.of(context).padding.bottom,
        decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          border: Border.all(color: Color(0XFFF4F5F6)),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: const [
            BoxShadow(
              color: const Color.fromARGB(66, 181, 178, 178),
              offset: const Offset(
                1,
                1,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  widget.indexIndicator = 0;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    DashboardView.routeName,
                    ModalRoute.withName(DashboardView.routeName),
                  );
                });
              },
              child: CircleAvatar(
                backgroundColor: widget.indexIndicator == 0 ? AppColors.primary : Colors.transparent,
                radius: 20,
                child: Icon(
                  CustomIcon.dashboard_icon,
                  color: widget.indexIndicator == 0 ? AppColors.white : AppColors.base,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.indexIndicator = 1;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ProgramListView.routeName,
                    ModalRoute.withName(DashboardView.routeName),
                  );
                  widget.indexIndicator = 0;
                });
              },
              child: CircleAvatar(
                backgroundColor: widget.indexIndicator == 1 ? AppColors.primary : Colors.transparent,
                radius: 20,
                child: Icon(
                  CustomIcon.layer_icon,
                  color: widget.indexIndicator == 1 ? AppColors.white : AppColors.base,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.indexIndicator = 2;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ReferralView.viewAsMeRouteName,
                    ModalRoute.withName(DashboardView.routeName),
                  );
                  widget.indexIndicator = 0;
                });
              },
              child: CircleAvatar(
                backgroundColor: widget.indexIndicator == 2 ? AppColors.primary : Colors.transparent,
                radius: 20,
                child: Icon(
                  CustomIcon.contact_group_icon,
                  color: widget.indexIndicator == 2 ? AppColors.white : AppColors.base,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.indexIndicator = 3;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SettingsView.routeName,
                    ModalRoute.withName(DashboardView.routeName),
                  );
                  widget.indexIndicator = 0;
                });
              },
              child: CircleAvatar(
                backgroundColor: widget.indexIndicator == 3 ? AppColors.primary : Colors.transparent,
                radius: 20,
                child: Icon(
                  CustomIcon.settings_icon,
                  color: widget.indexIndicator == 3 ? AppColors.white : AppColors.base,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
