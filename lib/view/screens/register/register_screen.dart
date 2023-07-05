import 'package:flutter/material.dart';

import '../../organisms/authentication/auth_form_data_register.dart';
import '../../organisms/authentication/auth_top_bar_register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthTopbarRegister(),
            AuthFormDataRegister(tabController: tabController),
          ],
        ),
      ),
    );
  }
}
