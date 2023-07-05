import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../theme/app_colors.dart';
import '../utility/console_log.dart';
import 'app_progress_indicator.dart';

// App Image Widget
// v.2.0.1
// by Elriz Wiraswara

enum ImgProvider {
  networkImage,
  assetImage,
  fileImage,
}

// For develompment purpose
const String randomImage = 'https://source.unsplash.com/512x512?food';

class AppImage extends StatefulWidget {
  final String image;
  final List<String>? allImages;
  final ImgProvider imgProvider;
  final String placeholder;
  final String noImagePlaceholder;
  final BoxFit? fit;
  final Duration? fadeInDuration;
  final Widget? errorWidget;
  final bool enableFullScreenView;

  const AppImage({
    Key? key,
    required this.image,
    this.allImages,
    this.imgProvider = ImgProvider.networkImage,
    this.placeholder = 'assets/images/loading.gif',
    this.noImagePlaceholder = 'assets/images/empty_placeholder.png',
    this.fit,
    this.fadeInDuration,
    this.errorWidget,
    this.enableFullScreenView = false,
  }) : super(key: key);

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  static const int _maxAttempt = 5;

  int _imgErrorAttempt = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enableFullScreenView
          ? () {
              if ((widget.allImages == null || widget.allImages!.isEmpty) &&
                  widget.image == '') {
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AppImageViewer(
                    images: widget.allImages ?? [widget.image],
                    imgProvider: widget.imgProvider,
                  ),
                ),
              );
            }
          : null,
      child: widget.image == ''
          ? noImage()
          : widget.imgProvider == ImgProvider.networkImage
              ? networkImage()
              : widget.imgProvider == ImgProvider.assetImage
                  ? assetImage()
                  : fileImage(),
    );
  }

  Widget networkImage() {
    return OptimizedCacheImage(
      imageUrl: widget.image,
      fit: widget.fit ?? BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (context, string) {
        return Image.asset(widget.placeholder);
      },
      errorWidget: (context, object, stack) {
        if (_imgErrorAttempt <= _maxAttempt) {
          _imgErrorAttempt += 1;
          cl('IMAGE LOAD ERROR, ATTEMP = $_imgErrorAttempt');
          cl('IMAGE LOAD ERROR = $object');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });
          return Container();
        }
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.baseLv4,
              ),
            );
      },
    );
  }

  Widget assetImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(widget.placeholder),
      image: AssetImage(
        widget.image,
      ),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.baseLv4,
              ),
            );
      },
    );
  }

  Widget fileImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(widget.placeholder),
      image: FileImage(
        File(widget.image),
      ),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.baseLv4,
              ),
            );
      },
    );
  }

  Widget noImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(widget.placeholder),
      image: AssetImage(widget.noImagePlaceholder),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.baseLv4,
              ),
            );
      },
    );
  }
}

// Full screen images viewer
class AppImageViewer extends StatefulWidget {
  final List<String> images;
  final ImgProvider imgProvider;
  final Function(int)? onPageChanged;
  final bool showAppBar;

  const AppImageViewer({
    super.key,
    required this.images,
    this.imgProvider = ImgProvider.networkImage,
    this.onPageChanged,
    this.showAppBar = true,
  });

  @override
  State<AppImageViewer> createState() => _AppImageViewerState();
}

class _AppImageViewerState extends State<AppImageViewer> {
  ImageProvider imageProvider(String img) {
    if (widget.imgProvider == ImgProvider.fileImage) {
      return FileImage(File(img));
    } else if (widget.imgProvider == ImgProvider.assetImage) {
      return AssetImage(img);
    } else {
      return NetworkImage(img);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: !widget.showAppBar
          ? null
          : AppBar(
              leading: const BackButton(color: Colors.white),
              elevation: 0,
              backgroundColor: Colors.black,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.black,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: imageProvider(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            // maxScale: PhotoViewComputedScale.contained,
            heroAttributes: const PhotoViewHeroAttributes(tag: 'image_viewer'),
          );
        },
        itemCount: widget.images.length,
        loadingBuilder: (context, event) {
          return const AppProgressIndicator(
            color: Colors.white,
            textColor: Colors.white,
          );
        },
        onPageChanged: widget.onPageChanged,
      ),
    );
  }
}
