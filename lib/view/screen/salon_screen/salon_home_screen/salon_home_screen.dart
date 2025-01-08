
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_images/app_images.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/nav_bar/salon_nav.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_home_appbar.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_home_controller.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_homepage_drawer.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_profile/salon_profile_controller.dart';

class SalonHomeScreen extends StatefulWidget {
  SalonHomeScreen({super.key});

  @override
  State<SalonHomeScreen> createState() => _SalonHomeScreenState();
}

class _SalonHomeScreenState extends State<SalonHomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SalonProfileController salonProfileController = Get.find<SalonProfileController>();

  final homeController = Get.put(SalonHomeController());

  var formattedDate = "";

  var now = DateTime.now();

  var outletId="";

  double totalAmount=0.0;

  @override
  void initState() {
    super.initState();

    var formatter = DateFormat('yyyy-MM-dd');

    formattedDate = formatter.format(now);

   homeController.upCommingBookingShow(formattedDate);

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.delayed(const Duration(seconds: 1), () async{

          outletId = await SharePrefsHelper.getString(AppConstants.userId);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SalonSideDrawer(),
      appBar: CustomSalonHomeAppBar(
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        appBarContent: AppImages.appLogo,
        serfixOnTap: () {},
      ),
      body: Obx(
         () {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      ///================== Profile Image ===================//
                      salonProfileController.userProfileShow.value.profileImage!=""?
                      CustomNetworkImage(
                        //imageUrl: AppConstants.profileImage,
                        imageUrl: "${ApiUrl.imageUrl}${salonProfileController.userProfileShow.value.profileImage}",
                        height: 80,
                        width: 80,
                        boxShape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ): CustomNetworkImage(
                        imageUrl: AppConstants.profileImage,
                        height: 80,
                        width: 80,
                        boxShape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
            
                      SizedBox(
                        width: 4.w,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomText(
                            text: AppStrings.welcome,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral03,
                            bottom: 10.h,
                          ),
                          ///================== Name ===================//
                          CustomText(
                            text: "${salonProfileController.userProfileShow.value.name}",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black_50,
                            bottom: 5.h,
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                              ),

                              ///================== Location ===================//
                              SizedBox(
                                width: 200,
                                child: CustomText(
                                  text: "${salonProfileController.userProfileShow.value.location?.address}",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: 24.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CustomImage(imageSrc: AppIcons.homeClock),
            
                            SizedBox(
                              width: 4.w,
                            ),
            
                            ///================== upcoming ===================//
                            const CustomText(
                              text: "upcoming Bookings",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          homeController.selectDate();
                        },
                        child: Row(
                          children: [
                            ///================== time ===================//
            
                            SizedBox(
                              width: 110,
                              child: CustomText(
                                text: homeController.selectedDate.value.isEmpty?formattedDate:homeController.selectedDate.value,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black_50,
                              ),
                            ),
            
                            SizedBox(
                              width: 4.h,
                            ),
            
                            CustomImage(imageSrc: AppIcons.homeCander),
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 12.h,
                  ),

                  homeController.upCommingShowList.isEmpty?
                  Expanded(
                    child: Center(
                      child: CustomText(
                        text: "Upcomming Booking Data \n is not available",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ): Expanded(
                    child: ListView.separated(
                    ///  shrinkWrap: true,
                     /// physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black,
                      ),
                      itemCount: homeController.upCommingShowList.length,
                      itemBuilder: (context, index){
                    
                        final model = homeController.upCommingShowList[index];

                      if(model.service?.serviceId?.discount?.type=="percentage"){

                        double originalPrice = double.parse(model.service?.price?.amount.toString() ??"0.0");

                        double discountPercentage = double.parse(model.service?.serviceId?.discount?.amount.toString() ??"0.0");

                        double discountAmount = (originalPrice * discountPercentage) / 100;

                        totalAmount = (originalPrice - discountAmount);

                        }else{

                        double originalPrice = double.parse(model.service?.price?.amount.toString() ??"0.0");
                        double discountPercentage = double.parse(model.service?.serviceId?.discount?.amount.toString() ??"0.0");

                        totalAmount = (originalPrice - discountPercentage);
                      }

                        return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {

                                   showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    insetPadding: EdgeInsets.all(8),
                                    contentPadding: EdgeInsets.all(8),
                                    title: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 32,
                                            color: Colors.black,
                                          )),
                                    ),
                                    content: SizedBox(
                                      width: 500.w,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            //  crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [

                                                  Positioned(
                                                    // top: -4,
                                                    child:  CustomNetworkImage(
                                                      // imageUrl: AppConstants.profileImage,
                                                      imageUrl: model.user?.userId?.image==""?AppConstants.profileImage:"${ApiUrl.imageUrl}${model.user?.userId?.image}",
                                                      height: 80,
                                                      width: 80,
                                                      boxShape: BoxShape.circle,
                                                      border: Border.all(color: AppColors.primary, width: 2),
                                                    ),),
                                                ],
                                              ),


                                              SizedBox(
                                                height: 8.h,
                                              ),

                                              ///================== Name ===================//
                                              CustomText(
                                                text: "${model.user?.name}",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primary,
                                                bottom: 5.h,
                                              ),

                                              CustomText(
                                                text: "${model.user?.userId?.email}",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_50,
                                                bottom: 5.h,
                                              ),

                                              CustomText(
                                                text:
                                                "${model.user?.address}",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_50,
                                                bottom: 5.h,
                                              ), //

                                              CustomText(
                                                text: "${model.user?.userId?.phone}",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_50,
                                                bottom: 5.h,
                                              ),

                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              const Divider(
                                                height: 3,
                                                color: Colors.black38,
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: CustomText(
                                                  text: "Order details",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black_50,
                                                  bottom: 5.h,
                                                ),
                                              ),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [

                                                  Checkbox(
                                                    checkColor: AppColors.white,
                                                    activeColor: AppColors.primary,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                    ),
                                                    side: const BorderSide(
                                                      // ======> CHANGE THE BORDER COLOR HERE <======
                                                      color: Colors.pink,
                                                      // Give your checkbox border a custom width
                                                      width: 1.4,
                                                    ),
                                                    value: model.homeService,
                                                    onChanged: (bool? value) {
                                                      // model.homeService = value!;
                                                    },
                                                  ),


                                                  CustomText(
                                                    text: "Home Services",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black_50,
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomText(
                                                          text: "${model.service?.name} ${model.paymentStatus}",
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.primary,
                                                          bottom: 5.h,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        CustomImage(imageSrc: AppIcons.homeclock1),
                                                        SizedBox(
                                                          width: 8.h,
                                                        ),//
                                                        CustomText(
                                                          text: "${DateConverter.dateFormetString("${model.date}")} -${model.time}",
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.homePopupTextColor3,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Divider(
                                                height: 3,
                                                color: AppColors.primary,
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children:   [
                                                  CustomText(
                                                    text: "price",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                  CustomText(
                                                    text: "${model.service?.price?.amount}\$",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(
                                                    text: "Discount",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                  CustomText(
                                                    text: "${model.service?.serviceId?.discount?.amount}%",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Divider(
                                                height: 3,
                                                color: AppColors.primary,
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(
                                                    text: "Total",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                  CustomText(
                                                    text: "$totalAmount\$",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackButtonFild,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(
                                                    text: "Salon earning",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.homeGreenColor3,
                                                  ),
                                                  CustomText(
                                                    text: "$totalAmount\$",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.homeGreenColor3,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CustomText(
                                        text: "${model.service?.name}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black_50,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          CustomText(
                                            text: "price: ${model.service?.price?.amount}\$",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                          ),

                                          CustomText(
                                            text: "\t ${model.paymentType}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Row(
                                        children: [
                                          CustomImage(imageSrc: AppIcons.homeclock1),
                                          SizedBox(
                                            width: 8.h,
                                          ),
                                            CustomText(
                                            text: "${model.time==null?"":model.time}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 8,
                                      ),
                                      GestureDetector(
                                        onTap: (){

                                           Get.toNamed(AppRoutes.salonQrScreen,
                                               arguments: [
                                            {
                                              "service_name":model.service?.name.toString(),
                                              "price":model.service?.price?.amount.toString(),
                                              "outletId":outletId
                                            }
                                          ]);

                                        },
                                        child: CustomText(
                                          text: "QR Code",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ));
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: NavBarSalon(
        currentIndex: 0,
      ),
    );
  }
}
