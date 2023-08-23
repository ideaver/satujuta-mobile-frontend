import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // return Scaffold(
    //   body: Operation<GUserFindManyData, GUserFindManyVars>(
    //     client: GqlService.client,
    //     operationRequest: GUserFindManyReq(
    //       (b) => b..vars.userFindManyArgs.take = 50,
    //     ),
    //     builder: (context, response, error) {
    //       if (response!.loading) {
    //         return const Center(child: CircularProgressIndicator());
    //       }

    //       final users = response.data?.userFindMany?.toList() ?? [];

    //       return ListView.builder(
    //         itemCount: users.length,
    //         itemBuilder: (context, index) => Text(
    //           users[index].email, // Non nullable
    //         ),
    //       );
    //     },
    //   ),
    // );
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: .6,
                child: Container(
                  width: size.width * 2.6,
                  height: size.width * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.white.withAlpha(10),
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                AppAssets.shortLogoPath,
              ),
            )
          ],
        ),
      ),
    );
  }
}
