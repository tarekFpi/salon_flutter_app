// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_profile/salon_profile_controller.dart';

class SalonEditprofileScreen extends StatefulWidget {
  const SalonEditprofileScreen({super.key});

  @override
  State<SalonEditprofileScreen> createState() => _SalonEditprofileScreenState();
}

class _SalonEditprofileScreenState extends State<SalonEditprofileScreen> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  final SalonProfileController salonProfileController = Get.find<SalonProfileController>();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: AppStrings.editProfile),
      body: Obx(
         () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  ///================= Salon Name ===================//
                  CustomFormCard(
                      hintText: "Salon Name",
                     // isPassword: true,
                      title: "Salon Name",
                      controller: salonProfileController.nameController.value),

                  ///================== Email Name ===================//
              /*    CustomFormCard(
                      hintText: "yousef@gmail.com",
                      // isPassword: true,
                      title: "Email",
                      controller: salonProfileController.emailController.value),
*/

                  ///================== Location Name ===================//
           /*       CustomFormCard(
                      hintText: "15 Rue des Saint-Paris,75006 Paris",
                      // isPassword: true,
                      title: "Location",
                      controller: TextEditingController()),*/

                  ///================== Phone number ===================//
                  CustomFormCard(
                      hintText: "+099999",
                      // isPassword: true,
                      title: "Phone number",
                      keyboardType: TextInputType.number,
                      controller: salonProfileController.phoneNumberController.value),

                  ///================== Experience ===================//
                  CustomFormCard(
                      hintText: "5 Years",
                      // isPassword: true,
                      keyboardType: TextInputType.number,
                      title: "Experience",
                      controller: salonProfileController.experienceController.value),

               ///================== Salon Type ===================//

              /*          CustomText(
                    text: "Salon Type",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_50,
                    bottom: 10.h,
                  ),

                InputDecorator(
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(6),
                  ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(

                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                       // color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )).toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
              ),*/



                  SizedBox(
                    height: 12,
                  ),

                  ///================== About ===================//
                  CustomFormCard(
                      hintText: "dui. at tortor. nisi vitae Nullam adipiscing",
                      // isPassword: true,
                      title: "About",
                      controller: salonProfileController.aboutController.value),



                  ///================== Id Card  ===================//
                 /* GestureDetector(
                    onTap: (){
                      salonProfileController.getImage();
                    },
                    child: CustomFormCard(
                      readOnly: false,
                        hintText: "Browse image or upload file",
                        // isPassword: true,
                        prefixIcon:SvgPicture.asset(
                          AppIcons.choose_image,
                          fit: BoxFit.scaleDown,
                          height: 16,
                          width: 16,
                        ),
                        title: "Id Card",
                        controller:  salonProfileController.imageController.value),
                  ),*/

                  CustomText(
                    text: "Browse image or upload file",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyGrey_200,
                    bottom: 5.h,
                  ),

                  GestureDetector(
                    onTap: (){

                      salonProfileController.editUserImage();
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, spreadRadius: 1),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SvgPicture.asset(
                              AppIcons.choose_image,
                              fit: BoxFit.scaleDown,
                              height: 16,
                              width: 16,
                            ),

                            SizedBox(
                              width: 9,
                            ),

                            Expanded(
                              child: CustomText(
                                text: "${salonProfileController.profileImage.value}",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyGrey_200,
                                bottom: 5.h,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 8,
                  ),

                  ///================== Card number ===================//
                  CustomFormCard(
                      hintText: "226545651654",
                      keyboardType: TextInputType.number,
                      // isPassword: true,
                      title: "Nid Number",
                      controller: salonProfileController.nidNumberController.value),

                  SizedBox(
                    height: 8,
                  ),

                  ///================== Bank Information (IBAN) ===================//
                  CustomFormCard(
                      hintText: "226545651654",
                      keyboardType: TextInputType.number,
                      // isPassword: true,
                      title: "Bank Information (IBAN)",
                      controller: salonProfileController.bankAccountController.value),

                  ///================== Save & Change ===================//
                  CustomButton(onTap: (){
                   // Get.toNamed(AppRoutes.userHomePage);

                    salonProfileController.userInformationUpdate();
                  },title: "Save & Change",),

                  SizedBox(
                    height: 16.h,
                  )
                ],
              ),
            ),
          );
        }
      ),

    );
  }
}
