import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/app_button.dart';

class UserTypeListModal extends StatefulWidget {
  const UserTypeListModal({
    super.key,
  });

  @override
  State<UserTypeListModal> createState() => _UserTypeListModalState();
}

class _UserTypeListModalState extends State<UserTypeListModal> {
  Enum$UserType? selectedType;

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
            itemCount: Enum$UserType.values.length - 1,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: Enum$UserType.values[i],
                  groupValue: selectedType,
                  onChanged: (value) {
                    selectedType = Enum$UserType.values[i];
                    setState(() {});
                  },
                  title: Text(
                    Enum$UserType.values[i].name.replaceAll('_', ' '),
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
            Navigator.pop(context, selectedType);
          },
          enable: selectedType != null,
          text: 'Pilih',
        ),
      ],
    );
  }
}
