// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:unitask_demo/core/extensions/size_extension.dart';
// import 'package:unitask_demo/core/theme/app_textstyle.dart';


// import '../theme/app_colors.dart';

// class SearchField extends StatefulWidget {
//   final TextEditingController controller;
//   final void Function(String)? onChanged;
//   final void Function() onCutTap;
//   const SearchField(
//       {required this.onCutTap,
//       this.onChanged,
//       required this.controller,
//       super.key});

//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }

// class _SearchFieldState extends State<SearchField> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16.heightMultiplier),
//             color: AppColors.olive.withOpacity(0.2),
//           ),
//           width: double.maxFinite,
//           child: TextFormField(
//             style: AppTextStyle.f14w400White,
//             controller: widget.controller,
//             onChanged: (val) {
//               setState(() {});
//               if (widget.onChanged != null) {
//                 widget.onChanged!(val);
//               }
//             },
//             scrollPadding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             decoration: InputDecoration(
//               hintText: 'Search Events...',
//               hintStyle: const TextStyle(color: AppColors.olive),
//               prefixIcon: Container(
//                 margin: EdgeInsets.fromLTRB(
//                     16.widthMultiplier,
//                     12.heightMultiplier,
//                     16.widthMultiplier,
//                     12.widthMultiplier),
//                 child: SvgPicture.asset(Assets.icons.search),
//               ),
//               prefixIconConstraints:
//                   BoxConstraints(maxHeight: 48.heightMultiplier),
//               suffixIcon: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (widget.controller.text.isNotEmpty)
//                     GestureDetector(
//                       onTap: () {
//                         widget.onCutTap();
//                         widget.controller.clear();
//                         setState(() {});
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(3),
//                         decoration: const BoxDecoration(
//                             color: AppColors.brown2, shape: BoxShape.circle),
//                         child: const Icon(
//                           Icons.close,
//                           size: 20,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(
//                         5.widthMultiplier,
//                         12.heightMultiplier,
//                         16.widthMultiplier,
//                         12.widthMultiplier),
//                     child: SvgPicture.asset(Assets.icons.recordMic),
//                   ),
//                 ],
//               ),
//               suffixIconConstraints:
//                   BoxConstraints(maxHeight: 48.heightMultiplier),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16.heightMultiplier),
//                   borderSide: BorderSide.none),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16.heightMultiplier),
//                   borderSide: BorderSide.none),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16.heightMultiplier),
//                 borderSide: const BorderSide(color: AppColors.white),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
