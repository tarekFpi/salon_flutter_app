// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/servies_map_screen/services_map_controller/services_map_controller.dart';

class ServiesMapScreen extends StatefulWidget {
  const ServiesMapScreen({super.key});

  @override
  State<ServiesMapScreen> createState() => _ServiesMapScreenState();
}

class _ServiesMapScreenState extends State<ServiesMapScreen> {
  //final StyleListController styleListController = Get.find<StyleListController>();
  final ServicesMapController servicesMapController =
      Get.find<ServicesMapController>();
  static final LatLng _currentLocation = LatLng(23.7617, 90.4313);
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.serviesMap),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _currentLocation,
                  zoom: 15,
                ),
              ));
            },
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: MarkerId(''),
                position: _currentLocation,
                infoWindow: InfoWindow(title: 'Current Location'),
              ),
            },
          ),
          /*CustomImage(
            imageSrc: AppImages.mapimage,
            fit: BoxFit.cover,
            scale: 4,
            height: double.infinity,
            width: double.infinity,
          ),*/

          Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    CustomTextField(
                      fieldBorderColor: AppColors.white,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      fillColor: AppColors.white,
                      hintText: AppStrings.searchLocation,
                    ),

                    SizedBox(
                      height: 15,
                    ),


                    /*  Container(
                      height: 40.h,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                         boxShadow: [
                      BoxShadow(
                        color: AppColors.grey1,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      )
                    ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                styleListController.tabNamelist.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  styleListController.currentIndex.value = index;
                                  styleListController.update();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40.h,
                                  width: screenWidth / 3.4,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                    color:
                                    styleListController.currentIndex.value == index
                                        ? AppColors.primary
                                        : AppColors.white.withOpacity(0),
                                  ),
                                  child: CustomText(
                                    text: styleListController.tabNamelist[index],
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black_50,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              )),
          Positioned(
              bottom: 40,
              left: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.serviceMapStyleList);
                },
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.list_alt,
                  color: AppColors.white,
                ),
              ))
        ],
      ),
      // bottomNavigationBar: const NavBar(currentIndex: 1),
    );
  }
}
