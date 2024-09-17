import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitask_demo/core/components/button/custom_button.dart';
import 'package:unitask_demo/core/extensions/size_extension.dart';
import 'package:unitask_demo/core/extensions/sizedbox_extension.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';
import 'package:unitask_demo/core/theme/app_textstyle.dart';
import 'package:unitask_demo/src/features/home/provider/product_provider.dart';
import 'package:unitask_demo/src/features/home/view/product_detail_screen.dart';
import 'package:unitask_demo/src/features/home/widgets/brand_filter_bottomsheet_layout.dart';
import 'package:unitask_demo/src/features/home/widgets/product_card.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  late ProductProvider productProvider;
  List<String> categoryList = ['Cat 1', 'Cat 2', 'Cat 3'];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    await productProvider.fetchAllProducts();
    await productProvider.fetchAllProductCategories();
    setState(() {
      isLoading = false;
    });
  }

  Widget getChip({required String text, required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary75 : AppColors.white,
        border: Border.all(color: AppColors.primary300),
        borderRadius: BorderRadius.circular(20.heightMultiplier),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.widthMultiplier),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.f12W500black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.heightMultiplier, horizontal: 20),
            child: CustomButton(
              width: 100,
              height: 90,
              onPressed: () {
                if (productProvider.originalProductList.isEmpty) {
                  return;
                }
                showModalBottomSheet(
                    isScrollControlled: true,
                    enableDrag: false,
                    useSafeArea: true,
                  //  isDismissible: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          16.widthMultiplier,
                        ),
                        topRight: Radius.circular(
                          16.widthMultiplier,
                        ),
                      ),
                    ),
                    context: context,
                    builder: (context) => const BrandFilterBottomsheetLayout());
              },
              borderRadius: 8,
              buttonText: 'Filter',
              textStyle:
                  AppTextStyle.f12W400black.copyWith(color: AppColors.black),
              borderColor: AppColors.primary300,
              color: AppColors.primary75,
            ),
          )
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.widthMultiplier),
                child: Column(
                  children: [
                    10.verticalSizedBox,
                    SizedBox(
                      height: 35,
                      child: Consumer<ProductProvider>(
                          builder: (context, productProvider, _) {
                        final categoryList = productProvider.categoryList;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, _) =>
                              12.horizontalSizedBox,
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            String categoryName =
                                categoryList[index].name ?? '';
                            return GestureDetector(
                              onTap: () {
                                productProvider.clearFilteredBrandList();
                                productProvider.changeFilterList(categoryName);

                                productProvider.filterCategoryList();
                              },
                              child: getChip(
                                  text: categoryName,
                                  isSelected:
                                      productProvider.isCategorySelectedMap[
                                              categoryName] ??
                                          false),
                            );
                          },
                        );
                      }),
                    ),
                    20.verticalSizedBox,
                    Expanded(
                      child: Consumer<ProductProvider>(
                          builder: (context, productProvider, _) {
                        final productList = productProvider.filteredProductList;
                        if (productList.isEmpty) {
                          return const Center(
                            child: Text('No Data Found'),
                          );
                        }
                        return ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) =>
                                16.verticalSpace,
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        product: productList[index]),
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.grey),
                                      borderRadius: BorderRadius.circular(16),
                                      color: AppColors.lightOlive
                                          .withOpacity(0.2)),
                                  child: ProductCard(
                                    product: productList[index],
                                  ),
                                ),
                              );
                            });
                      }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
