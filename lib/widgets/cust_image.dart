import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '/constants/constant_color.dart';
import '/constants/constant_image.dart';

class CustImage extends StatelessWidget {
  final String imgURL;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final String errorImage;

  final Color? backgroundColor;
  final Color? imgColor;
  final BoxFit boxfit;

  final Color? textColor;
  final EdgeInsets letterPadding;

  const CustImage({
    super.key,
    this.imgURL = "",
    this.cornerRadius = 0,
    this.height,
    this.width,
    this.boxfit = BoxFit.cover,
    this.errorImage = ConstantImage.crosswordsBg,
    this.backgroundColor,
    this.imgColor,
    this.textColor,
    this.letterPadding = const EdgeInsets.all(8.0),
  });

  Widget defaultImg(BuildContext context) => Image.asset(
        errorImage,
        color: imgColor,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          errorImage,
          fit: BoxFit.cover,
          color: imgColor,
          height: height,
          width: width,
        ),
        fit: BoxFit.cover,
        height: height,
        width: width,
      );

  @override
  Widget build(BuildContext context) {
    Widget image = defaultImg(context);
    if (imgURL.isNotEmpty) {
      // Check if Network image...
      if (isNetworkImage(imgURL)) {
        image = _cacheImage(context);

        // Check if Asset image...
      } else if (isAssetImage(imgURL)) {
        image = imgURL.contains(".svg")
            ? SvgPicture.asset(
                imgURL,
                fit: boxfit,
                height: height,
                width: width,
              )
            : Image.asset(
                imgURL,
                height: height,
                width: width,
                color: imgColor,
                errorBuilder: (context, error, stackTrace) =>
                    defaultImg(context),
                fit: boxfit,
              );

        // Check if File image...
      } else if (isFileImage(imgURL)) {
        image = Image.file(
          File(imgURL),
          height: height,
          width: width,
          color: imgColor,
          errorBuilder: (context, error, stackTrace) => defaultImg(context),
          fit: boxfit,
        );
      }
    }

    return Container(
      alignment: Alignment.center,
      // clipBehavior: Clip.antiAlias,
      height: height,
      width: width,
      child: image,
    );
  }

  Widget _cacheImage(BuildContext context) {
    return imgURL.contains(".svg")
        ? SvgPicture.network(
            imgURL,
            fit: boxfit,
            height: height,
            width: width,
            placeholderBuilder: (context) => defaultImg(context),
          )
        : CachedNetworkImage(
            fit: boxfit,
            imageUrl: imgURL,
            height: height,
            width: width,
            color: imgColor,
            placeholder: (context, url) => shimmerWidget(),
            errorWidget: (ctx, url, obj) => defaultImg(context),
          );
  }

  Widget shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey.shade400,
      enabled: true, //Default value

      child: Container(
        color: ConstantColor.ffEE4F62,
      ),
    );
  }

  bool isAssetImage(String url) =>
      url.toLowerCase().contains(ConstantImage.imgPath);

  bool isFileImage(String url) => !isAssetImage(url);

  bool isNetworkImage(String url) =>
      url.toLowerCase().startsWith("http://") ||
      url.toLowerCase().startsWith("https://");
}
