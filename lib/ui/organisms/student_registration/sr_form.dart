import 'package:flutter/material.dart';

import '../../atoms/my_asset_image.dart';
import '../../atoms/my_custom_button.dart';
import '../../atoms/my_custom_text.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_links.dart';
import '../../foundations/foundation_size.dart';
import '../../foundations/foundation_typhography.dart';
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
                color: FoundationColor.bgWhite,
                border: Border.all(color: FoundationColor.bgColorGrey),
                borderRadius: const BorderRadius.only(
                    topLeft:
                        Radius.circular(FoundationSize.sizeBorderRadiusForm),
                    topRight:
                        Radius.circular(FoundationSize.sizeBorderRadiusForm)),
              ),
              child: Column(
                children: [
                  FormStudentRegistration(
                      path: FoundationLinks.linkPersonIconLogo,
                      label: "Nama Lengkap Siswa",
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkLocationImage,
                      label: 'Alamat',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkDropdownIconLogo,
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
                      path: FoundationLinks.linkDropdownIconLogo,
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
                      path: FoundationLinks.linkDropdownIconLogo,
                      label: 'Kode Pos',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkPhoneIcon,
                      label: 'No Whatsapp',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkDropdownIconLogo,
                      label: 'Email',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkSchoolIconLogo,
                      label: 'Sekolah',
                      onPressed: () {}),
                  const Divider(),
                  FormStudentRegistration(
                      path: FoundationLinks.linkDropdownIconLogo,
                      label: 'Hotel',
                      onPressed: () {}),
                ],
              )),
          const SizedBox(
            height: FoundationSize.sizeHeightDefault * 4,
          ),
          const Row(
            children: [
              Expanded(
                child: MyAssetImage(
                  path: FoundationLinks.linkSuccessIconLogo,
                  widthImage: FoundationSize.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Email telah valid'))
            ],
          ),
          const SizedBox(
            height: FoundationSize.sizeHeightDefault,
          ),
          const Row(
            children: [
              Expanded(
                child: MyAssetImage(
                  path: FoundationLinks.linkFailedIconLogo,
                  widthImage: FoundationSize.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Nomor whatsapp salah'))
            ],
          ),
          const SizedBox(
            height: FoundationSize.sizeHeightDefault,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: MyAssetImage(
                  path: FoundationLinks.linkUnSuccessIconLogo,
                  widthImage: FoundationSize.sizeIconMini,
                ),
              ),
              Expanded(flex: 4, child: Text('Email valid'))
            ],
          ),
          const SizedBox(
            height: FoundationSize.sizeHeightDefault * 4,
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
                  child: Text("Daftar",
                      style: FoundationTyphography.lightFontBold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: FoundationSize.sizeHeightDefault * 4,
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
                height: FoundationSize.sizeIcon,
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: MyCustomText(
                        text: title,
                        style: FoundationTyphography.darkFontBold.copyWith(
                            fontSize: FoundationTyphography.fontSizeH3,
                            fontWeight: FontWeight.bold),
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
                height: FoundationSize.sizeHeightDefault,
              ),
              ModalBottom.customRadioButton(listOption[0], value == 0, () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(listOption[1], value == 1, () {
                setState(() {
                  value = 1;
                });
              }),
              ModalBottom.customRadioButton(listOption[2], value == 0, () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(listOption[3], value == 0, () {
                setState(() {
                  value = 0;
                });
              }),
              ModalBottom.customRadioButton(listOption[4], value == 0, () {
                setState(() {
                  value = 0;
                });
              }),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                        color: FoundationColor.bgPrimary,
                        borderRadius:
                            BorderRadius.circular(FoundationSize.sizePadding))),
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
          color: FoundationColor.bgColorGrey,
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
                height: FoundationSize.sizeIcon,
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
              Center(
                  child: Image.asset(FoundationLinks.linkSuccessIlustration)),
              Center(
                child: MyCustomText(
                  text: title,
                  style: FoundationTyphography.darkFontBold.copyWith(
                      fontSize: FoundationTyphography.fontSizeH1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: MyCustomText(
                  text: description,
                  style: FoundationTyphography.darkFontRegular
                      .copyWith(fontSize: FoundationTyphography.fontSizeH4),
                ),
              ),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: FoundationColor.bgWhite,
                    borderRadius: BorderRadius.circular(
                        FoundationSize.sizeBorderRadiusForm),
                    boxShadow: const [
                      BoxShadow(color: FoundationColor.bgColorGrey)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset(FoundationLinks.linkClockIconLogo)),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "1 Siswa siap didaftarkan",
                          style: FoundationTyphography.darkFontRegular,
                        )),
                    const Expanded(
                        flex: 1, child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault,
              ),
              Container(
                padding: const EdgeInsets.all(FoundationSize.sizePadding),
                height: FoundationSize.sizeHeightCardTransaction,
                decoration: BoxDecoration(
                    color: FoundationColor.bgWhite,
                    borderRadius: BorderRadius.circular(
                        FoundationSize.sizeBorderRadiusForm),
                    boxShadow: const [
                      BoxShadow(color: FoundationColor.bgColorGrey)
                    ]),
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
                            style: FoundationTyphography.darkFontBold.copyWith(
                                fontSize: FoundationTyphography.fontSizeH4),
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
                            child: Image.asset(
                                FoundationLinks.linkDarkEditIconLogo)),
                        CircleAvatar(
                            child:
                                Image.asset(FoundationLinks.linkTrashIconLogo))
                      ],
                    )),
                    // Expanded(
                    //     flex: 2,
                    //     child: Text(
                    //       "1 Siswa siap didaftarkan",
                    //       style: FoundationTyphography.darkFontRegular,
                    //     )),
                    // const Expanded(
                    //     flex: 1, child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              const SizedBox(
                height: FoundationSize.sizeHeightDefault * 4,
              ),
              SizedBox(
                width: double.infinity,
                child: MyCustomButton(
                    text: "Pilih",
                    decoration: BoxDecoration(
                        color: FoundationColor.bgPrimary,
                        borderRadius:
                            BorderRadius.circular(FoundationSize.sizePadding))),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
