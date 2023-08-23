import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/webview_model.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/atom/app_progress_indicator.dart';

class WebView extends StatefulWidget {
  static const String routeName = '/web-view';

  const WebView({super.key});

  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)?.settings.arguments as WebViewModel?;

    if (model?.url != null) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..setNavigationDelegate(NavigationDelegate())
        ..loadRequest(Uri.parse(model!.url!));
    } else {
      controller = WebViewController();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          model?.title ?? '',
          style: AppTextStyle.bold(context, fontSize: 18),
        ),
        elevation: 0.5,
        automaticallyImplyLeading: model?.automaticallyImplyLeading ?? true,
      ),
      body: Stack(
        children: <Widget>[
          const AppProgressIndicator(color: AppColors.baseLv4),
          WebViewWidget(controller: controller),
          noUrlWidget(model),
        ],
      ),
    );
  }

  Widget noUrlWidget(WebViewModel? model) {
    return model?.url != null && model?.url != ''
        ? const SizedBox.shrink()
        : Center(
            child: Text(
              '(No URL Provided)',
              style: AppTextStyle.semiBold(
                context,
                color: AppColors.baseLv5,
                fontSize: 12,
              ),
            ),
          );
  }
}
