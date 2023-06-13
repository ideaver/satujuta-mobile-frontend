import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atoms/my_asset_image.dart';
import '../../atoms/my_custom_button.dart';
import '../../atoms/my_custom_text.dart';
import '../../molecules/authentications/modal_bottom.dart';
import '../../molecules/student_registration/form_student_registration.dart';

class SRForm extends StatefulWidget {
  const SRForm({super.key});

  @override
  State<SRForm> createState() => _SRFormState();
}

class _SRFormState extends State<SRForm> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1150,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
              height: 840,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.baseLv4),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.sizeBorderRadiusForm),
                    topRight: Radius.circular(AppSizes.sizeBorderRadiusForm)),
              ),
              child: Column(
                children: [
                  FormStudentRegistration(
                      path: AppAssets.personFormIconPath,
                      label: "Nama Lengkap Siswa",
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.locationFormIconPath,
                      label: 'Alamat',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.dropdownRectangleFormIconPath,
                      label: 'Kota',
                      onPressed: () {
                        ModalBottom.modalBottom(
                            context,
                            contentModalBottom(context, "Kota", [
                              "Bandung",
                              "Surabaya",
                              "Banten",
                              "Jakarta",
                              "Yogyakarta"
                            ]));
                      }),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.dropdownRectangleFormIconPath,
                      label: 'Kecamatan',
                      onPressed: () {
                        ModalBottom.modalBottom(
                            context,
                            contentModalBottom(context, "Kecamatan", [
                              "Tambak Sari",
                              "Lidah Wetan",
                              "Kaliasin",
                              "Benowo",
                              "Tambak boyo"
                            ]));
                      }),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.dropdownRectangleFormIconPath,
                      label: 'Kode Pos',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.phoneIconPath,
                      label: 'No Whatsapp',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.dropdownRectangleFormIconPath,
                      label: 'Email',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.schoolIconPath,
                      label: 'Sekolah',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: AppAssets.dropdownRectangleFormIconPath,
                      label: 'Hotel',
                      onPressed: () {}),
                ],
              )),
          const SizedBox(
            height: AppSizes.sizeHeightDefault * 4,
          ),
          const Row(
            children: [
              Expanded(
                child: MyAssetImage(
                  path: AppAssets.successIconPath,
                  widthImage: AppSizes.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Email telah valid'))
            ],
          ),
          const SizedBox(
            height: AppSizes.sizeHeightDefault,
          ),
          const Row(
            children: [
              Expanded(
                child: MyAssetImage(
                  path: AppAssets.failedIconPath,
                  widthImage: AppSizes.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Nomor whatsapp salah'))
            ],
          ),
          const SizedBox(
            height: AppSizes.sizeHeightDefault,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: MyAssetImage(
                  path: AppAssets.unsuccessIconPath,
                  widthImage: AppSizes.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Email valid'))
            ],
          ),
          const SizedBox(
            height: AppSizes.sizeHeightDefault * 4,
          ),
          InkWell(
            onTap: () => ModalBottom.modalBottom(
                context,
                contentSuccessModalBottom(context, "Data Berhasil Dibuat",
                    "Harap melakukan pembayaran untuk menambahkan siswa ini")),
            child: Center(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Text("Daftar", style: AppTextStyle.bold(context)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.sizeHeightDefault * 4,
          )
        ],
      ),
    );
  }

  ListView contentModalBottom(
      BuildContext context, String title, List<String> listOption) {
    return ListView(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //     color: HexColor("#EBEBF0")),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.sizeIcon,
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: MyCustomText(
                        text: title,
                        style: AppTextStyle.bold(
                          context,
                          color: AppColors.base,
                        ).copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        top: 12,
                        right: 10,
                        child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(context),
                            child: Icon(Icons.close)))
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.sizeHeightDefault,
              ),
              ModalBottom.customRadioButton(context, listOption[0], value == 0,
                  () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(context, listOption[1], value == 1,
                  () {
                setState(() {
                  value = 1;
                });
              }),
              ModalBottom.customRadioButton(context, listOption[2], value == 0,
                  () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(context, listOption[3], value == 0,
                  () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(context, listOption[4], value == 0,
                  () {
                setState(() {
                  value = 0;
                });
              }),
              const SizedBox(
                height: AppSizes.sizeHeightDefault,
              ),
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(AppSizes.sizePadding))),
              )
            ],
          ),
        ),
      )
    ]);
  }

  ListView contentSuccessModalBottom(
      BuildContext context, String title, String description) {
    return ListView(children: [
      Container(
        decoration: const BoxDecoration(
          color: AppColors.baseLv4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.sizeIcon,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                        top: 12,
                        right: 10,
                        child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(context),
                            child: const Icon(Icons.close)))
                  ],
                ),
              ),
              Center(child: Image.asset(AppAssets.successIlusPath)),
              Center(
                child: MyCustomText(
                  text: title,
                  style: AppTextStyle.bold(
                    context,
                    color: AppColors.base,
                  ).copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: MyCustomText(
                  text: description,
                  style: AppTextStyle.regular(
                    context,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.sizeHeightDefault * 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(AppSizes.sizeBorderRadiusForm),
                    boxShadow: const [BoxShadow(color: AppColors.baseLv4)]),
                child: Row(
                  children: [
                    Expanded(child: Image.asset(AppAssets.clockIconPath)),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "1 Siswa siap didaftarkan",
                        style: AppTextStyle.regular(
                          context,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.sizeHeightDefault,
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.sizePadding),
                height: AppSizes.sizeHeightCardTransaction,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(AppSizes.sizeBorderRadiusForm),
                    boxShadow: const [BoxShadow(color: AppColors.baseLv4)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lusy Joolmin",
                            style: AppTextStyle.bold(
                              context,
                              color: AppColors.base,
                            ).copyWith(fontSize: 14),
                          ),
                          const Text("08126381234"),
                          const Text("SD Bakti Luhur, Bandung"),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            child: Image.asset(AppAssets.darkEditIconPath)),
                        CircleAvatar(
                            child: Image.asset(AppAssets.trashIconPath))
                      ],
                    )),
                    // Expanded(
                    //     flex: 2,
                    //     child: Text(
                    //       "1 Siswa siap didaftarkan",
                    //       style: AppTextStyle.regular(
                    // context,
                    // fontSize: 14,
                    // ),
                    //     )),
                    // const Expanded(
                    //     flex: 1, child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.sizeHeightDefault * 4,
              ),
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(AppSizes.sizePadding))),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
