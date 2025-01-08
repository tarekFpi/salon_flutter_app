
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_images/app_images.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_service/service_controller.dart';

class SalonServiceScreen extends StatefulWidget {
  const SalonServiceScreen({super.key});

  @override
  State<SalonServiceScreen> createState() => _SalonServiceScreenState();
}

class _SalonServiceScreenState extends State<SalonServiceScreen> {

  final serviceController = Get.put(ServiceSalonController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: AppStrings.service),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: (){


          ///================== Salon service clean textController ===================//

          serviceController.cleanTextController();


          ///================== Salon service create Alert ===================//
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor:  Colors.white,
              insetPadding: EdgeInsets.all(8),
              contentPadding: EdgeInsets.all(0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  CustomText(
                    text: "Add Services",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    bottom: 5.h,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {

                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 32,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height * 0.8,

           ///  child: SalonServiceAlertCreate()),
              child: Obx((){

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),

                        ///================== Service Name ===================//
                        CustomFormCard(
                            hintText: "Service Name",
                            // isPassword: true,
                            title: "Service Name",
                            controller: serviceController.serviceNameController.value),

                        CustomFormCard(
                            hintText: "120€",
                            keyboardType: TextInputType.number,
                            title: "Price",
                            controller: serviceController.servicePriceController.value),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            ///================== Salon Price ===================//
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ///================== With appointment ===================//

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                        text: AppStrings.discountType,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black_50,
                                        bottom: 10.h,
                                      ),
                                    ),

                                    InputDecorator(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                        ),
                                        contentPadding: EdgeInsets.all(4),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint:   Text(
                                            //  AppStrings.discountType,
                                            serviceController.selectedValue.value,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          items: serviceController.items
                                              .toSet() // Ensure unique values
                                              .map(
                                                (String item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          )
                                              .toList(),
                                          value: serviceController.items.contains(serviceController.selectedValue.value)
                                              ? serviceController.selectedValue.value
                                              : null, // Handle invalid selection
                                          onChanged: (String? value) {
                                            serviceController.selectedValue.value = value!;
                                          },
                                        ),
                                      ),
                                    ),

                                  ],
                                )),

                            const SizedBox(
                              width: 8,
                            ),

                            ///================== Salon Price ===================//
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: AppStrings.discount,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black_50,
                                      bottom: 10.h,
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: serviceController.serviceDiscountController.value,
                                    decoration: InputDecoration(
                                      //label:   Text(AppStrings.capacityvalue),
                                      hintText: "€",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        ///================== Image Name ===================//
                        CustomFormCard(
                           onTap: (){
                               serviceController.getpickImage();
                           },
                            readOnly: true,
                            hintText: "browse image",
                            prefixIcon: SvgPicture.asset(
                              AppIcons.choose_image,
                              fit: BoxFit.scaleDown,
                              height: 16,
                              width: 16,
                            ),
                            title: "browse image",
                            controller: serviceController.serviceImagePathController.value),



                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Home Service:",
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  Radio<bool>(
                                    value: true, // Value for "No"
                                    fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                    groupValue: serviceController.isHomeServiceAvailable.value,
                                    onChanged: (bool? value) {

                                      serviceController.isHomeServiceAvailable.value = value!;
                                    },
                                  ),
                                  CustomText(
                                    text: "Available",
                                    fontSize: 12,
                                    color: AppColors.bdColor,
                                    fontWeight: FontWeight.w600,
                                  ),

                                  Radio<bool>(
                                    value: false, // Value for "Yes"
                                    fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                    groupValue: serviceController.isHomeServiceAvailable.value,
                                    onChanged: (bool? value) {
                                      serviceController.isHomeServiceAvailable.value= value!;
                                    },
                                  ),
                                  CustomText(
                                    text: "Unavailable",
                                    fontSize: 12,
                                    color: AppColors.bdColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        ///========================= Service create Confirm ========================================//

                        CustomButton(
                          onTap: () {
                            // Retrieve the values from the text controllers
                            String serviceName = serviceController.serviceNameController.value.text.trim();
                            String servicePrice = serviceController.servicePriceController.value.text.trim();
                           // String discountType = serviceController.serviceDiscountTypeController.value.text.trim();

                           if (serviceName.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "Service Name cannot be empty!",
                                toastLength: Toast.LENGTH_LONG,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else if (servicePrice.isEmpty) {

                              Fluttertoast.showToast(
                                msg: "Service Price cannot be empty!",
                                toastLength: Toast.LENGTH_LONG,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );

                            } else if (serviceController.serviceImage.value.isEmpty) {

                              Fluttertoast.showToast(
                                msg: "Service Image cannot be empty!",
                                toastLength: Toast.LENGTH_LONG,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );

                            } else {



                            if(serviceController.selectedValue.value != "Discount Type") {

                           if(serviceController.serviceDiscountController.value.text=="") {

                               Fluttertoast.showToast(
                                 msg: "Please select a valid Discount Type!",
                                 toastLength: Toast.LENGTH_LONG,
                                 backgroundColor: Colors.red,
                                 textColor: Colors.white,
                                 fontSize: 16.0,
                               );

                         }else{


                               serviceController.isDiscount.value = true;
                               serviceController.createService();

                            if(serviceController.createServiceLoading.value){
                              Navigator.of(context).pop();
                            }
                        }

                         } else{

                              serviceController.isDiscount.value = false;
                              serviceController.createService();

                              if(serviceController.createServiceLoading.value){
                                Navigator.of(context).pop();
                              }
                            }

                            }
                          },
                          title: "Confirm",
                        ),

                      ],
                    ),
                  ),
                );
              },
              )),

            ),

          );

        },child: Icon(Icons.add,color: Colors.white,),),
         body:Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,),
        child: Expanded(
          child: Obx(
              () {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///================== Salon service  ListView ===================//
          
                    serviceController.servieceList.isEmpty?
                    Expanded(
                      child: Center(
                        child: const CustomText(
                          text: "Service Data is not available",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ): ListView.builder(
                      padding: EdgeInsets.only(top: 16),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: serviceController.servieceList.length,
                      itemBuilder: (context, index) {

                        final model = serviceController.servieceList[index];

                        return InkWell(
                          onTap: (){

                            ///================== Salon service get single data show ===================//
                            serviceController.updateSingleShowData(model);


                            ///================== Salon service Edit Alert ===================//
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor:  Colors.white,
                                insetPadding: EdgeInsets.all(8),
                                contentPadding: EdgeInsets.all(0),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    CustomText(
                                      text: "Edit Services",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      bottom: 5.h,
                                    ),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {

                                            Navigator.of(context).pop();
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 32,
                                            color: Colors.black,
                                          )),
                                    )
                                  ],
                                ),
                                content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.8,

                                    ///  child: SalonServiceAlertCreate()),
                                    child: Obx((){

                                      return SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 8.h,
                                              ),

                                              ///================== edit Service Name ===================//
                                              CustomFormCard(
                                                  hintText: "Service Name",
                                                  // isPassword: true,
                                                  title: "Service Name",
                                                  controller: serviceController.serviceNameController.value),

                                              CustomFormCard(
                                                  hintText: "120€",
                                                  keyboardType: TextInputType.number,
                                                  title: "Price",
                                                  controller: serviceController.servicePriceController.value),


                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  ///================== edit Salon Price ===================//
                                                  Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          ///================== edit With appointment ===================//

                                                          Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: CustomText(
                                                              text: AppStrings.discountType,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w500,
                                                              color: AppColors.black_50,
                                                              bottom: 10.h,
                                                            ),
                                                          ),

                                                          InputDecorator(
                                                            decoration: const InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                              ),
                                                              contentPadding: EdgeInsets.all(4),
                                                            ),
                                                            child: DropdownButtonHideUnderline(
                                                              child: DropdownButton2<String>(
                                                                isExpanded: true,
                                                                hint:   Text(
                                                                  //  AppStrings.discountType,
                                                                  serviceController.selectedValue.value,
                                                                  style: const TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                                items: serviceController.items
                                                                    .toSet() // Ensure unique values
                                                                    .map(
                                                                      (String item) => DropdownMenuItem<String>(
                                                                    value: item,
                                                                    child: Text(
                                                                      item,
                                                                      style: const TextStyle(
                                                                        fontSize: 14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).toList(),
                                                                value: serviceController.items.contains(serviceController.selectedValue.value)
                                                                    ? serviceController.selectedValue.value
                                                                    : null, // Handle invalid selection
                                                                onChanged: (String? value) {
                                                                  serviceController.selectedValue.value = value!;
                                                                },
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      )),

                                                  const SizedBox(
                                                    width: 8,
                                                  ),

                                                  ///================== edit Salon Price ===================//
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: CustomText(
                                                            text: AppStrings.discount,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500,
                                                            color: AppColors.black_50,
                                                            bottom: 10.h,
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          keyboardType: TextInputType.number,
                                                          controller: serviceController.serviceDiscountController.value,
                                                          decoration: InputDecoration(
                                                            //label:   Text(AppStrings.capacityvalue),
                                                            hintText: "€",
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(color: Colors.grey),
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                color: Colors.black,
                                                                width: 1,
                                                              ),
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                color: Colors.red,
                                                                width: 1,
                                                              ),
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 8,
                                              ),

                                              ///================== edit Image Name ===================//
                                              CustomFormCard(
                                                  onTap: (){
                                                    serviceController.getpickImage();
                                                  },
                                                  readOnly: true,
                                                  hintText: "browse image",
                                                  prefixIcon: SvgPicture.asset(
                                                    AppIcons.choose_image,
                                                    fit: BoxFit.scaleDown,
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  title: "browse image",
                                                  controller: serviceController.serviceImagePathController.value),


                                              SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const CustomText(
                                                          text: "Home Service:",
                                                          fontSize: 14,
                                                          color: AppColors.primary,
                                                          fontWeight: FontWeight.w700,
                                                        ),

                                                        Radio<bool>(
                                                          value: true, // Value for "No"
                                                          fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                                          groupValue: serviceController.isHomeServiceAvailable.value,
                                                          onChanged: (bool? value) {

                                                            serviceController.isHomeServiceAvailable.value = value!;
                                                          },
                                                        ),
                                                        const CustomText(
                                                          text: "Available",
                                                          fontSize: 12,
                                                          color: AppColors.bdColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),

                                                        Radio<bool>(
                                                          value: false, // Value for "Yes"
                                                          fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                                          groupValue: serviceController.isHomeServiceAvailable.value,
                                                          onChanged: (bool? value) {
                                                            serviceController.isHomeServiceAvailable.value= value!;
                                                          },
                                                        ),
                                                        const CustomText(
                                                          text: "Unavailable",
                                                          fontSize: 12,
                                                          color: AppColors.bdColor,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 8,
                                              ),

                                              ///========================= Service update button ========================================//
                                              CustomButton(
                                                onTap: () {

                                                  /// Retrieve the values from the text controllers
                                                  String serviceName = serviceController.serviceNameController.value.text.trim();
                                                  String servicePrice = serviceController.servicePriceController.value.text.trim();

                                                  if (serviceName.isEmpty) {
                                                    Fluttertoast.showToast(
                                                      msg: "Service Name cannot be empty!",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      backgroundColor: Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );
                                                  } else if (servicePrice.isEmpty) {

                                                    Fluttertoast.showToast(
                                                      msg: "Service Price cannot be empty!",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      backgroundColor: Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );

                                                  } else if (serviceController.serviceImage.value.isEmpty) {

                                                    Fluttertoast.showToast(
                                                      msg: "Service Image cannot be empty!",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      backgroundColor: Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );

                                                  } else {



                                                    if(serviceController.selectedValue.value != "Discount Type") {

                                                      if(serviceController.serviceDiscountController.value.text=="") {

                                                        Fluttertoast.showToast(
                                                          msg: "Please select a valid Discount Type!",
                                                          toastLength: Toast.LENGTH_LONG,
                                                          backgroundColor: Colors.red,
                                                          textColor: Colors.white,
                                                          fontSize: 16.0,
                                                        );

                                                      }else{


                                                        serviceController.isDiscount.value = true;
                                                        serviceController.updateService(model.id.toString());

                                                        if(serviceController.updateServiceLoading.value){
                                                          Navigator.of(context).pop();
                                                        }
                                                      }

                                                    } else{

                                                      serviceController.isDiscount.value = false;

                                                      serviceController.updateService(model.id.toString());

                                                      if(serviceController.updateServiceLoading.value){
                                                        Navigator.of(context).pop();
                                                      }
                                                    }
                                                  }
                                                },
                                                title: "Update",
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    )),
                              ),
                            );



                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding:   EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [


                                     /// Image.asset(AppImages.service_image,width: 40,height: 40,),

                                       CustomNetworkImage(imageUrl: "${ApiUrl.imageUrl}${model.image}", width: 40,height: 40,),

                                      SizedBox(
                                        width: 6.w,
                                      ),
                                        Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          CustomText(
                                           // text: "Special Afro Hair Style",
                                            text: "${model.name}",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black_50,
                                            bottom: 8,
                                          ),

                                          CustomText(
                                            text: "${model.outlet?.name}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                            bottom: 8,
                                          ),

                                        ],
                                      ),

                                        Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                text: "${model.price?.amount}",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_50,
                                                bottom: 8,
                                              ),

                                              const CustomText(
                                                text: " \$",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black_50,
                                                bottom: 8,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ]
              );
            }
          ),
        ),
      ),
    );
  }
}
