import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitask_demo/core/components/button/custom_button.dart';
import 'package:unitask_demo/core/extensions/sizedbox_extension.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';
import 'package:unitask_demo/core/theme/app_textstyle.dart';
import 'package:unitask_demo/src/features/home/provider/product_provider.dart';

class BrandFilterBottomsheetLayout extends StatefulWidget {
  const BrandFilterBottomsheetLayout({super.key});

  @override
  State<BrandFilterBottomsheetLayout> createState() =>
      _BrandFilterBottomsheetLayoutState();
}

class _BrandFilterBottomsheetLayoutState
    extends State<BrandFilterBottomsheetLayout> {
  late ProductProvider productProvider;
  List<String> tempFilteredBrandList = [];

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    tempFilteredBrandList = productProvider.filteredBrandList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //List of Brands
          SizedBox(
            height: 600,
            width: double.infinity,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  String brandName =
                      productProvider.brandsList.elementAt(index);
                  return CheckboxListTile(
                      title: Text(
                        brandName,
                        style: AppTextStyle.f14w400black,
                      ),
                      value: tempFilteredBrandList.contains(brandName),
                      onChanged: (val) {
                        setState(() {
                          if (val!) {
                            tempFilteredBrandList.add(brandName);
                          } else {
                            tempFilteredBrandList.remove(brandName);
                          }
                        });
                      });
                },
                separatorBuilder: (context, _) => 12.verticalSizedBox,
                itemCount: productProvider.brandsList.length),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Cancel Filter Button
                CustomButton(
                  width: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Cancel',
                  textStyle: AppTextStyle.f12W400black,
                  borderColor: AppColors.grey,
                  color: AppColors.white,
                ),

                //Apply Filter Buttons
                CustomButton(
                  width: 150,
                  onPressed: () {
                    productProvider.clearFilteredCategoryList();
                  
                    productProvider.filterBrandList(tempFilteredBrandList);
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Apply Filter',
                  textStyle: AppTextStyle.f12W400black
                      .copyWith(color: AppColors.white),
                  color: AppColors.primary300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
