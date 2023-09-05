// import 'package:flutter/material.dart';

// import '../../../../app/asset/app_assets.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../app/theme/app_sizes.dart';
// import '../../../../app/theme/app_text_style.dart';
// import '../../../atom/app_custom_button.dart';
// import '../../../atom/app_custom_text.dart';
// import '../../../atom/app_text_field.dart';
// import '../../../molecule/authentications/modal_bottom.dart';

// class BiodataSection extends StatefulWidget {
//   const BiodataSection({super.key, required this.controller});
//   final TabController controller;
//   @override
//   State<BiodataSection> createState() => _BiodataSectionState();
// }

// class _BiodataSectionState extends State<BiodataSection> {
//   int value = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: [
//       Container(
//         height: 660,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           border: Border.all(color: AppColors.baseLv4),
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: Image.asset(
//                     AppAssets.contactFormIconPath,
//                     height: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {},
//                 lableText: 'Nama Lengkap',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: const Icon(
//                     Icons.location_on_rounded,
//                     size: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {},
//                 lableText: 'Alamat',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     size: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {
//                   ModalBottom.modalBottom(context,
//                       contentModalBottom(context, "Kota", ["Bandung", "Surabaya", "Banten", "Jakarta", "Yogyakarta"]));
//                 },
//                 lableText: 'Kota',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     size: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {
//                   ModalBottom.modalBottom(
//                       context,
//                       contentModalBottom(
//                           context, "Kecamatan", ["Tambak Sari", "Lidah Wetan", "Kaliasin", "Benowo", "Tambak boyo"]));
//                 },
//                 lableText: 'Kecamatan',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: Image.asset(
//                     AppAssets.dropdownRectangleFormIconPath,
//                     width: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {},
//                 lableText: 'Kode Pos',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                     size: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {
//                   ModalBottom.modalBottom(
//                     context,
//                     contentModalBottom(context, "Role", ["Siswa", "Guru", "Kepala Sekolah", "Orang Tua", "Lainnya"]),
//                   );
//                 },
//                 lableText: 'Role',
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: AppTextField(
//                 suffixIcon: IconButton(
//                   icon: Image.asset(
//                     AppAssets.schoolIconPath,
//                     width: AppSizes.padding * 2,
//                   ),
//                   onPressed: () {},
//                 ),
//                 onTap: () {},
//                 lableText: 'Sekolah',
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       InkWell(
//         onTap: () {
//           widget.controller.animateTo(1);
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (_) => CreatePasswordScreen(),
//           //   ),
//           // );
//         },
//         child: Center(
//           child: Container(
//             height: 60,
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//             ),
//             child: Center(
//               child: Text("Berikutnya", style: AppTextStyle.bold(context)),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       )
//     ]);
//   }

//   ListView contentModalBottom(BuildContext context, String title, List<String> listOption) {
//     return ListView(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             // border: Border.all(
//             //     color: HexColor("#EBEBF0")),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25.0),
//               topRight: Radius.circular(25.0),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: AppSizes.padding * 3,
//                   width: double.infinity,
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: AppCustomText(
//                           text: title,
//                           style: AppTextStyle.bold(
//                             context,
//                             color: AppColors.base,
//                           ).copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 12,
//                         right: 10,
//                         child: GestureDetector(
//                           onTap: () => Navigator.of(context).pop(context),
//                           child: const Icon(
//                             Icons.close,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: AppSizes.height,
//                 ),
//                 ModalBottom.customRadioButton(context, listOption[0], value == 0, () {
//                   setState(() {
//                     value = 0;
//                   });
//                 }),
//                 ModalBottom.customRadioButton(context, listOption[1], value == 1, () {
//                   setState(() {
//                     value = 1;
//                   });
//                 }),
//                 ModalBottom.customRadioButton(context, listOption[2], value == 2, () {
//                   setState(() {
//                     value = 2;
//                   });
//                 }),
//                 ModalBottom.customRadioButton(context, listOption[3], value == 3, () {
//                   setState(() {
//                     value = 3;
//                   });
//                 }),
//                 ModalBottom.customRadioButton(context, listOption[4], value == 4, () {
//                   setState(() {
//                     value = 4;
//                   });
//                 }),
//                 const SizedBox(
//                   height: AppSizes.height,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: AppCustomButton(
//                     text: "Pilih",
//                     decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       borderRadius: BorderRadius.circular(
//                         AppSizes.padding,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
