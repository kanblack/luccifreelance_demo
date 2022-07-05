import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';
import '../constants/imgs_constants.dart';
import '../utils/utils.dart';

class LoadingImageWidget extends StatelessWidget {
  final String imgUrl;
  final BoxFit? boxFitType;
  const LoadingImageWidget({Key? key, required this.imgUrl, this.boxFitType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFitType,
      imageUrl: getImageUrl(imgUrl),
      progressIndicatorBuilder: (context, url, progress) => Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        "",
        fit: BoxFit.cover,
      ),
    );
  }
}
