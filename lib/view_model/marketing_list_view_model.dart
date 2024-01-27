import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/file_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_file_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/const/app_consts.dart';
import '../app/utility/console_log.dart';
import '../model/menu_item_model.dart';

class MarketingListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$FileFindMany$fileFindMany>? fileFindMany;

  MenuItemModel? selectedFileType = fileTypeDropdownItems.first;

  int selectedTabIndex = -1;

  void resetState() {
    fileFindMany = null;
    selectedTabIndex = -1;
  }

  void initFileListView() {
    getAllFiles();
  }

  Future<void> getAllFiles({int skip = 0, String contains = ""}) async {
    var res = await GqlFileService.fileFindMany(
      fileType: selectedFileType?.value,
      // TODO SEARCH WIDGET UNIMPLEMENTED YET
      // contains: contains,
      skip: skip,
    );

    if (res.parsedData?.fileFindMany != null && !res.hasException) {
      if (skip == 0) {
        fileFindMany = res.parsedData?.fileFindMany;
      } else {
        fileFindMany?.addAll(res.parsedData?.fileFindMany ?? []);
      }
    } else {
      cl('[getAllFiles].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }

  void onSelectTab(String value) {
    selectedFileType = value as MenuItemModel;

    var type = fileTypeDropdownItems.where((e) => e.value == value).firstOrNull;

    if (type != null) {
      selectedFileType = type;
      notifyListeners();
    }

    getAllFiles();
  }

  void onSelectFileType(
    MenuItemModel? fileType,
    int tabIndex,
  ) {
    selectedFileType = fileType;
    selectedTabIndex = tabIndex;
    notifyListeners();

    getAllFiles();
  }
}
