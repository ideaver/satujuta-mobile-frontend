import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_button.dart';

class UserRoleListModal extends StatefulWidget {
  const UserRoleListModal({
    super.key,
  });

  @override
  State<UserRoleListModal> createState() => _UserRoleListModalState();
}

class _UserRoleListModalState extends State<UserRoleListModal> {
  Enum$UserRole? selectedRole;

  List<Enum$UserRole> allowedRoles = [
    Enum$UserRole.STUDENT,
    Enum$UserRole.MEMBER,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allowedRoles.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: allowedRoles[i],
                  groupValue: selectedRole,
                  onChanged: (value) {
                    selectedRole = allowedRoles[i];
                    setState(() {});
                  },
                  title: Text(
                    allowedRoles[i].name,
                    style: AppTextStyle.bold(context),
                  ),
                  activeColor: AppColors.primary,
                  contentPadding: const EdgeInsets.fromLTRB(
                    AppSizes.padding,
                    AppSizes.padding / 1.8,
                    AppSizes.padding / 1.8,
                    AppSizes.padding / 1.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(
          onTap: () {
            Navigator.pop(context, selectedRole);
          },
          enable: selectedRole != null,
          text: 'Pilih',
        ),
      ],
    );
  }
}
