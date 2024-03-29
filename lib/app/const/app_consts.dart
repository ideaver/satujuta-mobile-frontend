import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../model/menu_item_model.dart';
import '../asset/app_assets.dart';

enum PageStateEnum {
  create,
  edit,
  view,
  viewAsMe,
  viewAsOther,
}

String getMonthName(int value) {
  switch (value) {
    case 0:
      return 'Jan';

    case 1:
      return 'Feb';

    case 2:
      return 'Mar';

    case 3:
      return 'Apr';

    case 4:
      return 'May';

    case 5:
      return 'Jun';

    case 6:
      return 'Jul';

    case 7:
      return 'Aug';

    case 8:
      return 'Sep';

    case 9:
      return 'Oct';

    case 10:
      return 'Nov';

    case 11:
      return 'Dec';

    default:
      return '';
  }
}

List<MenuItemModel> fileTypeDropdownItems = [
  MenuItemModel(
    text: 'Semua',
    value: null,
  ),
  MenuItemModel(
    text: "PDF",
    value: Enum$FileType.PDF.name,
  ),
  MenuItemModel(
    text: "JPG",
    value: Enum$FileType.JPG.name,
  ),
  MenuItemModel(
    text: "PNG",
    value: Enum$FileType.PNG.name,
  ),
  MenuItemModel(
    text: "MP4",
    value: Enum$FileType.MP4.name,
  ),
];

String fileTypeIconSelector(MenuItemModel? fileType) {
  // File
  if (fileType?.value == fileTypeDropdownItems[1].value) {
    return AppAssets.fileIconPath;
  }

  // Image
  if (fileType?.value == fileTypeDropdownItems[2].value || fileType?.value == fileTypeDropdownItems[3].value) {
    return AppAssets.filePhotoIconPath;
  }

  // Video
  if (fileType?.value == fileTypeDropdownItems[5].value) {
    return AppAssets.fileVideIconPath;
  }

  return AppAssets.fileIconPath;
}

List<Map<String, String>> supportedBanks = [
  {
    "account_number": "",
    "account_type": "bank_account",
    "bank_code": "bni",
    "account_holder": "",
    "name": "Bank BNI",
    "icon": AppAssets.bankBNIImgPath,
  },
  {
    "account_number": "",
    "account_type": "bank_account",
    "bank_code": "bri",
    "account_holder": "",
    "name": "Bank BRI",
    "icon": AppAssets.bankBRIImgPath,
  },
  {
    "account_number": "",
    "account_type": "bank_account",
    "bank_code": "bca",
    "account_holder": "",
    "name": "Bank BCA",
    "icon": AppAssets.bankBCAImgPath,
  },
  {
    "account_number": "",
    "account_type": "bank_account",
    "bank_code": "mandiri",
    "account_holder": "",
    "name": "Bank Mandiri",
    "icon": AppAssets.bankMandiriImgPath,
  },
  {
    "account_number": "",
    "account_type": "virtual_account",
    "bank_code": "bni",
    "account_holder": "",
    "name": "Bank BNI",
    "icon": AppAssets.bankBNIImgPath,
  },
  {
    "account_number": "",
    "account_type": "virtual_account",
    "bank_code": "bri",
    "account_holder": "",
    "name": "Bank BRI",
    "icon": AppAssets.bankBRIImgPath,
  },
  {
    "account_number": "",
    "account_type": "virtual_account",
    "bank_code": "mandiri",
    "account_holder": "",
    "name": "Bank Mandiri",
    "icon": AppAssets.bankMandiriImgPath,
  },
  {
    "account_number": "",
    "account_type": "wallet_account",
    "bank_code": "dana",
    "account_holder": "",
    "name": "DANA",
    "icon": AppAssets.ewalDanaImgPath,
  },
  {
    "account_number": "",
    "account_type": "wallet_account",
    "bank_code": "ovo",
    "account_holder": "",
    "name": "OVO",
    "icon": AppAssets.ewalOvoImgPath,
  },
];
