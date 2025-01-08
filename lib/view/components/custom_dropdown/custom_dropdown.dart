// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../utils/app_colors/app_colors.dart';
// import '../../../utils/app_strings/app_strings.dart';

// import '../custom_text/custom_text.dart';

// class CustomDropdown extends StatelessWidget {
//   const CustomDropdown({
//     super.key,
//     required this.items, required this.currentItem, this.onChanged,

//   });
//  final  Function(String?)? onChanged;
//   final List<String> items;
//   final String currentItem;

//   @override
//   Widget build(BuildContext context) {
// <<<<<<< dev_mehedi
//     return Container(
//       height: 30.h,
//       //width: 120.w,
//       padding: EdgeInsets.symmetric(horizontal: 5.w),
//       decoration: BoxDecoration(
//         color: AppColors.softlimegreen,
//         //border: Border.all(color: AppColors.red_500, width: .7),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: DropdownButton<String>(
//         hint: CustomText(
//             text: AppStrings.confirmPassword,
//             fontSize: 14,
// =======

//       return Container(
//         height: 30.h,
//         //width: 120.w,
//         padding: EdgeInsets.symmetric(horizontal: 5.w),
//         decoration: BoxDecoration(
//           color: AppColors.softlimegreen,
//           //border: Border.all(color: AppColors.red_500, width: .7),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: DropdownButton<String>(
//           hint: CustomText(
//               text: AppStrings.checkOut,
//               fontSize: 14,
//               color: AppColors.white,
//               fontWeight: FontWeight.w700),
//           borderRadius: BorderRadius.circular(15),
//           elevation: 8,
//           dropdownColor: AppColors.softlimegreen,
//           icon: const Icon(
//             Icons.keyboard_arrow_down_rounded,
// >>>>>>> main
//             color: AppColors.white,
//             fontWeight: FontWeight.w700),
//         borderRadius: BorderRadius.circular(15),
//         elevation: 8,
//         dropdownColor: AppColors.softlimegreen,
//         icon: const Icon(
//           Icons.keyboard_arrow_down_rounded,
//           color: AppColors.white,
//         ),
//         iconSize: 25,
//         underline: const SizedBox(),
//         //isExpanded: true, // This makes the dropdown full-width
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//         value: currentItem,
//         onChanged: onChanged,
//         items: List.generate(items.length, (index) => items[index])
//             .map((String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: CustomText(
//               text: item,
//               color: AppColors.white_400,
//               fontSize: 16.w,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
