import 'package:flutter/material.dart';

import 'app/route/app_routes.dart';
import 'app/theme/app_colors.dart';
import 'app/theme/app_text_style.dart';

// TODO REMOVE
// DEV PUSPOSE ONLY
class ListMenuView extends StatelessWidget {
  const ListMenuView({super.key});

  static const String routeName = '/list-menu-view';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Pages'),
        ),
        body: views(context),
      ),
    );
  }

  Widget views(BuildContext context) {
    var items = AppRoutes.routes.entries.skip(2);

    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) {
              return ListTile(
                tileColor: index.isOdd ? AppColors.baseLv7.withOpacity(0.24) : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    items.elementAt(index).key,
                  );
                },
                title: Text(
                  items.elementAt(index).key.replaceAll('/', '').split('-').join(' ').toUpperCase(),
                  style: AppTextStyle.bold(context, fontSize: 14),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.base,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
