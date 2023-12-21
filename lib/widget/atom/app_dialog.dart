import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../atom/app_progress_indicator.dart';
import 'app_button.dart';

class AppDialog {
  static Future<void> show(
    NavigatorState navigator, {
    String? title,
    Widget? child,
    String? text,
    EdgeInsetsGeometry? padding,
    String? leftButtonText,
    String? rightButtonText,
    Color? backgroundColor,
    Function()? onTapLeftButton,
    Function()? onTapRightButton,
    bool? dismissible,
    bool? showButtons,
    bool? enableRightButton,
    bool? enableLeftButton,
    Color? leftButtonTextColor,
    Color? rightButtonTextColor,
    double? elevation,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          title: title,
          text: text,
          padding: padding,
          rightButtonText: rightButtonText,
          leftButtonText: leftButtonText,
          backgroundColor: backgroundColor ?? AppColors.white,
          onTapLeftButton: onTapLeftButton,
          onTapRightButton: onTapRightButton,
          dismissible: dismissible ?? true,
          showButtons: showButtons ?? true,
          enableRightButton: enableRightButton ?? true,
          enableLeftButton: enableLeftButton ?? true,
          leftButtonTextColor: leftButtonTextColor ?? AppColors.base,
          rightButtonTextColor: rightButtonTextColor ?? AppColors.primary,
          elevation: elevation,
          child: child,
        );
      },
    );
  }

  static Future<void> showSuccessDialog(
    NavigatorState navigator, {
    String? title,
    String? subtitle,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          child: Column(
            children: [
              const SizedBox(height: 22),
              const Icon(
                Icons.check_circle,
                color: AppColors.greenLv1,
                size: 72,
              ),
              const SizedBox(height: 16),
              Text(
                title ?? 'Success',
                textAlign: TextAlign.center,
                style: AppTextStyle.extraBold(navigator.context, fontSize: 18),
              ),
              subtitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.medium(navigator.context, fontSize: 12),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showFailedDialog(
    NavigatorState navigator, {
    String? title,
    String? subtitle,
    String? error,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          child: Column(
            children: [
              const SizedBox(height: 22),
              const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 72,
              ),
              const SizedBox(height: 16),
              Text(
                title ?? 'Failed',
                textAlign: TextAlign.center,
                style: AppTextStyle.extraBold(navigator.context, fontSize: 18),
              ),
              subtitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.medium(navigator.context, fontSize: 12),
                      ),
                    )
                  : const SizedBox.shrink(),
              error != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        error.toString().length > 50 ? error.toString().substring(0, 50) : error.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.medium(
                          navigator.context,
                          fontSize: 10,
                          color: AppColors.baseLv5,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showErrorDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? error,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          child: Column(
            children: [
              const SizedBox(height: 22),
              const Icon(
                Icons.error,
                color: AppColors.red,
                size: 72,
              ),
              const SizedBox(height: 16),
              Text(
                title ?? 'Oops!',
                textAlign: TextAlign.center,
                style: AppTextStyle.extraBold(navigator.context, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  message ?? 'Something went wrong, please contact your system administrator or try restart the app',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.medium(navigator.context, fontSize: 12),
                ),
              ),
              error != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        error.toString().length > 50 ? error.toString().substring(0, 50) : error.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.medium(
                          navigator.context,
                          fontSize: 10,
                          color: AppColors.baseLv5,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showDialogProgress(
    NavigatorState navigator, {
    bool dismissible = false,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          dismissible: kDebugMode ? true : dismissible,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showButtons: false,
          child: const AppProgressIndicator(
            color: Colors.white,
            textColor: Colors.white,
          ),
        );
      },
    );
  }

  static Future<bool> showExitConfirmDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? rightButtonText,
    String? leftButtonText,
  }) async {
    bool value = false;

    await showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          title: title ?? "Konfirmasi",
          text: message ?? "Apakah kamu yakin ingin keluar dari halaman ini?",
          rightButtonText: "Keluar",
          leftButtonText: "Batal",
          onTapRightButton: () {
            navigator.pop();
            value = true;
          },
          onTapLeftButton: () {
            navigator.pop();
            value = false;
          },
        );
      },
    );

    return value;
  }

  static Future<String?> showPickImageDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? rightButtonText,
    String? leftButtonText,
  }) async {
    return await showDialog(
      context: navigator.context,
      builder: (context) {
        return const PickImageDialog();
      },
    );
  }
}

// Default Dialog
class AppDialogWidget extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final String? leftButtonText;
  final String? rightButtonText;
  final Color backgroundColor;
  final Function()? onTapLeftButton;
  final Function()? onTapRightButton;
  final bool dismissible;
  final bool showButtons;
  final bool enableRightButton;
  final bool enableLeftButton;
  final Color leftButtonTextColor;
  final Color rightButtonTextColor;
  final double? elevation;

  const AppDialogWidget({
    Key? key,
    this.title,
    this.child,
    this.text,
    this.padding,
    this.rightButtonText = 'Close',
    this.leftButtonText,
    this.backgroundColor = AppColors.white,
    this.onTapLeftButton,
    this.onTapRightButton,
    this.dismissible = true,
    this.showButtons = true,
    this.enableRightButton = true,
    this.enableLeftButton = true,
    this.leftButtonTextColor = AppColors.base,
    this.rightButtonTextColor = AppColors.primary,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(dismissible),
      child: Dialog(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                dialogTitle(context),
                dialogBody(context),
                dialogButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogTitle(BuildContext context) {
    return title != null
        ? Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(
                //     width: 0.5,
                //     color: AppColors.base2,
                //   ),
                // ),
                ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: AppTextStyle.extraBold(context, fontSize: 18),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget dialogBody(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 10,
          ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
              text!,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium(context),
            )
          : child ?? const SizedBox.shrink(),
    );
  }

  Widget dialogButtons(BuildContext context) {
    return !showButtons
        ? const SizedBox.shrink()
        : Container(
            decoration: const BoxDecoration(
                // border: Border(
                //   top: BorderSide(
                //     width: 0.5,
                //     color: AppColors.base3,
                //   ),
                // ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: <Widget>[
                  leftButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: leftButtonText!,
                            buttonColor: backgroundColor,
                            textColor: enableRightButton ? leftButtonTextColor : AppColors.base,
                            onTap: () async {
                              if (enableLeftButton) {
                                if (onTapLeftButton != null) {
                                  onTapLeftButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
                  leftButtonText != null && rightButtonText != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          height: 18,
                          width: 1,
                          color: AppColors.baseLv4,
                        )
                      : const SizedBox.shrink(),
                  rightButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: rightButtonText!,
                            buttonColor: backgroundColor,
                            textColor: enableRightButton ? rightButtonTextColor : AppColors.base,
                            onTap: () async {
                              if (enableRightButton) {
                                if (onTapRightButton != null) {
                                  onTapRightButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
  }
}

class PickImageDialog extends StatelessWidget {
  const PickImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo = await picker.pickImage(
                      source: ImageSource.camera,
                    );

                    navigator.pop(photo?.path);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.baseLv7,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.camera_alt_rounded,
                          color: AppColors.baseLv4,
                          size: 32,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Take Picture',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bold(
                            context,
                            color: AppColors.baseLv4,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo = await picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    navigator.pop(photo?.path);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.baseLv7,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.image,
                          color: AppColors.baseLv4,
                          size: 32,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Open Gallery',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bold(
                            context,
                            color: AppColors.baseLv4,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
