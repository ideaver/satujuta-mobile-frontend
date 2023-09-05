// import 'package:easy_sidemenu/easy_sidemenu.dart';
// import 'package:flutter/material.dart';

// import '../../../app/asset/app_assets.dart';
// import '../../../app/asset/app_icons.dart';
// import '../../../app/theme/app_colors.dart';
// import '../../../app/theme/app_sizes.dart';
// import '../../../app/theme/app_text_style.dart';
// import '../../atom/app_button.dart';

// class SideBar extends StatefulWidget {
//   final PageController? pageController;
//   final List<Widget>? children;

//   const SideBar({
//     super.key,
//     this.children,
//     this.pageController,
//   });

//   @override
//   SideBarState createState() => SideBarState();
// }

// class SideBarState extends State<SideBar> {
//   PageController pageController = PageController();
//   SideMenuController sideMenu = SideMenuController();

//   List<bool> isHover = [
//     ...List.generate(
//       8,
//       (index) {
//         return false;
//       },
//     )
//   ];

//   List<String> titleList = [
//     'Dashboard',
//     'Laporan',
//     'Member',
//     'Transaksi',
//     'Program',
//     'Hotel',
//     'Marketing Kit',
//     'Tentang Aplikasi '
//   ];

//   List<IconData> iconList = [
//     CustomIcon.layer_icon,
//     Icons.receipt_long_outlined,
//     Icons.person_outline,
//     Icons.receipt,
//     CustomIcon.inventory,
//     Icons.home_work_outlined,
//     Icons.text_snippet_outlined,
//     Icons.info_outline,
//   ];

//   @override
//   void initState() {
//     sideMenu.addListener((index) {
//       pageController.jumpToPage(index);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Drawer(
//           width: 250,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: AppSizes.padding * 2),
//                   Padding(
//                     padding: const EdgeInsets.only(left: AppSizes.padding),
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             AppAssets.shortLogoPath,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: AppSizes.padding * 2),
//                 ],
//               ),
//               Expanded(
//                   child: ListView(
//                 children: [
//                   ...List.generate(8, (item) {
//                     return Column(
//                       children: [
//                         SideItem(
//                           title: titleList[item],
//                           icon: iconList[item],
//                           iconColor: isHover[item] == true ? AppColors.primary : AppColors.baseLv4,
//                           titleStyle: isHover[item] == true
//                               ? AppTextStyle.bold(
//                                   context,
//                                   fontSize: 14,
//                                   color: AppColors.primary,
//                                 )
//                               : AppTextStyle.medium(
//                                   context,
//                                   fontSize: 14,
//                                   color: AppColors.baseLv4,
//                                 ),
//                           onTap: () {
//                             // TODO
//                           },
//                           onHover: (value) {
//                             // TODO
//                             isHover[item] = value;
//                             setState(() {});
//                           },
//                         ),
//                         item == 1
//                             ? const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
//                                 child: Divider(
//                                   thickness: 1,
//                                   color: AppColors.baseLv6,
//                                 ),
//                               )
//                             : const SizedBox.shrink()
//                       ],
//                     );
//                   }),
//                 ],
//               )),
//               Align(
//                 alignment: FractionalOffset.bottomCenter,
//                 child: footer(),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: PageView(
//             controller: widget.pageController ?? pageController,
//             children: widget.children ?? [],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget footer() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
//       child: Column(
//         children: [
//           Image.network(AppAssets.longLogoPath),
//           Text(
//             'v2 1.0 (12345)',
//             style: AppTextStyle.regular(context, fontSize: 13),
//           ),
//           const SizedBox(
//             height: AppSizes.padding * 1.5,
//           ),
//           AppButton(
//             leftIcon: CustomIcon.logout_icon,
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppSizes.padding,
//               vertical: AppSizes.padding / 1.5,
//             ),
//             text: 'Logout',
//             onTap: () {
//               // TODO
//             },
//           ),
//           const SizedBox(height: AppSizes.padding * 2),
//         ],
//       ),
//     );
//   }
// }

// class SideItem extends StatefulWidget {
//   const SideItem({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onTap,
//     required this.onHover,
//     this.iconColor,
//     this.iconSize,
//     this.titleStyle,
//   });
//   final String title;
//   final IconData icon;
//   final Color? iconColor;

//   final double? iconSize;
//   final TextStyle? titleStyle;
//   final void Function() onTap;
//   final void Function(bool) onHover;
//   @override
//   State<SideItem> createState() => _SideItemState();
// }

// class _SideItemState extends State<SideItem> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.onTap();
//       },
//       onHover: (value) {
//         widget.onHover(value);
//       },
//       child: ListTile(
//         leading: Icon(
//           widget.icon,
//           size: widget.iconSize ?? 20,
//           color: widget.iconColor ?? AppColors.baseLv4,
//         ),
//         minLeadingWidth: 20,
//         title: Text(
//           widget.title,
//           style: widget.titleStyle ??
//               AppTextStyle.medium(
//                 context,
//                 fontSize: 14,
//                 color: AppColors.baseLv4,
//               ),
//         ),
//         onTap: () {},
//       ),
//     );
//   }
// }
