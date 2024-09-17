import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unitask_demo/core/components/shimmer_widget.dart';
import 'package:unitask_demo/core/extensions/size_extension.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';
import 'package:unitask_demo/src/features/home/model/products_data.dart';

class DiscountBannerImage extends StatelessWidget {
  const DiscountBannerImage({
    super.key,
    this.discountPercentage,
    required this.product,
  });
  final num? discountPercentage;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColors.white,
        height: 120.heightMultiplier,
        width: 107.widthMultiplier,
        child: CachedNetworkImage(
          imageUrl: product.thumbnail ??
              "https://images.pexels.com/photos/18487730/pexels-photo-18487730/free-photo-of-elderly-man-eating-breakfast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          fit: BoxFit.cover,
          height: 120.heightMultiplier,
          width: 107.widthMultiplier,
          progressIndicatorBuilder: (context, child, loadingProgress) {
            return ShimmerWidget.rectangular(
              height: 120.heightMultiplier,
              width: 107.widthMultiplier,
            );
          },
          errorWidget: (context, error, stackTrace) {
            return Container(
              height: 141.heightMultiplier,
              width: 107.widthMultiplier,
              color: AppColors.lightBlack.withOpacity(0.2),
            );
          },
        ),
      ),
      if (discountPercentage != null)
        Positioned(
          top: 15,
          left: -35,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  '$discountPercentage %',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ),
    ]);
  }
}
