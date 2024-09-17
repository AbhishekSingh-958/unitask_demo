import 'package:flutter/material.dart';
import 'package:unitask_demo/core/extensions/size_extension.dart';
import 'package:unitask_demo/core/theme/app_textstyle.dart';
import 'package:unitask_demo/src/features/home/model/products_data.dart';
import 'package:unitask_demo/src/features/home/widgets/discount_banner_image.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.heightMultiplier,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: DiscountBannerImage(
                product: product,
                discountPercentage: product.discountPercentage),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0.widthMultiplier,
                  vertical: 15.heightMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.title}',
                    style: AppTextStyle.f16w500black,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(product.brand!=null)
                      Expanded(
                        child: Text(
                          'Brand : ${product.brand}',
                          style: AppTextStyle.f12W400black,
                          softWrap: true,
                        ),
                      ),
                      Text('Rs ${product.price}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
