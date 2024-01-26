import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/file_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_file_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';

class MarketingListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$FileFindMany$fileFindMany>? fileFindMany;

  Map<String, String>? selectedCategory;
  int selectedTabIndex = -1;

  List<Map<String, String>> categories = [
    {'name': 'Foto', 'value': 'JPG'},
    {'name': 'Video', 'value': 'MP4'},
    {'name': 'File', 'value': '*'},
  ];

  void resetState() {
    selectedCategory = null;
    fileFindMany = null;
    selectedTabIndex = -1;
  }

  void initFileListView() {
    getAllFiles();
  }

  Future<void> getAllFiles({int skip = 0, String contains = ""}) async {
    var res = await GqlFileService.fileFindMany(
      fileType: selectedCategory?['value'] ?? '*',
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

  void onSelectCategory(
    NavigatorState navigator,
    Map<String, String>? category,
    int tabIndex,
  ) {
    selectedCategory = category;
    selectedTabIndex = tabIndex;
    notifyListeners();

    if (category != null) {
      getAllFiles();
    }
  }
}
