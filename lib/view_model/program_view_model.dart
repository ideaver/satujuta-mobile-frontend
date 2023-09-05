import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/generated/user_update_one.graphql.dart';

class ProgramViewModel extends ChangeNotifier {
  Mutation$UserUpdateOne$userUpdateOne? user;

  Future<void> getProgram(int id) async {
    // var res = await GqlProgramService.programFindOne(
    //   skip: skip,
    // );

    // cl('[getProgram].res = $res');

    // if (res.parsedData?.programFindOne != null && !res.hasException) {
    //   user = res.parsedData!.programFindOne;
    //   notifyListeners();
    // } else {
    //   cl('[getProgram].error = ${gqlErrorParser(res)}');
    // }
  }
}
