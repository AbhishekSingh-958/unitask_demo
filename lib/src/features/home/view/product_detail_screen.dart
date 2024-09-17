// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:unitask_demo/core/components/shimmer_widget.dart';
import 'package:unitask_demo/core/extensions/size_extension.dart';
import 'package:unitask_demo/core/extensions/sizedbox_extension.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';
import 'package:unitask_demo/core/theme/app_textstyle.dart';
import 'package:unitask_demo/src/features/home/model/products_data.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product;

  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title ?? '',
          style: AppTextStyle.f16w500black,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: AppColors.white,
            height: 200.heightMultiplier,
            width: double.infinity,
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.widthMultiplier, vertical: 16.heightMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.description}',
                  style: AppTextStyle.f14w400black
                      .copyWith(color: AppColors.greyTextColor),
                ),
                40.verticalSizedBox,
                Text(
                  'Reviews',
                  style: AppTextStyle.f14w500black,
                ),
                10.verticalSizedBox,
                const ReviewWidget(
                  comment: 'lsk foe els eifle flief weiofe fllsifeoi ',
                  date: '25th Aug 2024',
                  name: 'Abhishek',
                  stars: 3,
                ),
                10.verticalSizedBox,
                const ReviewWidget(
                  comment:
                      'sldkfj lsjf seifj sldjfi seolfj sleijfs lefijhsle fleijf slfij elfjs elfhjasefl efshfl lshflesfh sl ',
                  date: '28th Aug 2024',
                  name: 'Abhishek',
                  stars: 5,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String comment;
  final num stars;
  final String name;
  final String date;
  const ReviewWidget({
    super.key,
    required this.comment,
    required this.stars,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.widthMultiplier),
      decoration: BoxDecoration(border: Border.all(color: AppColors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: name,
              style: AppTextStyle.f14W400black,
              children: [
                TextSpan(
                    text: ' on ',
                    style: AppTextStyle.f14W400black
                        .copyWith(color: AppColors.greyTextColor)),
                TextSpan(text: date, style: AppTextStyle.f14W400black)
              ],
            ),
          ),
          6.verticalSizedBox,
          Row(
            children: [
              ...List.generate(
                stars.toInt(),
                (i) => const Icon(
                  Icons.star,
                  size: 15,
                  color: Color.fromARGB(255, 240, 218, 18),
                ),
              ),
            ],
          ),
          6.verticalSizedBox,
          Text(comment)
        ],
      ),
    );
  }
}
