import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_service_model/home_service_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/service_outlet_model/service_outlet_model.dart';

class HomeServiceController extends GetxController {
  RxString comonId = "".obs;

  ///=========== home Service =======
  final getHomeServiceLoading = Status.loading.obs;
  void setHomeServiceStatus(Status value) =>
      getHomeServiceLoading.value = value;
  RxList<HomeServiceModel> homeServiceModelList = <HomeServiceModel>[].obs;
  Future<void> getHomeService() async {
    var response = await ApiClient.getData(ApiUrl.getHomeService);
    if (response.statusCode == 200) {
      try {
        // var data = response.body["data"];
        homeServiceModelList.value = List<HomeServiceModel>.from(
            response.body["data"].map((x) => HomeServiceModel.fromJson(x)));
        setHomeServiceStatus(Status.completed);
        refresh();
      } catch (e) {
        setHomeServiceStatus(Status.error);
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setHomeServiceStatus(Status.internetError);
      } else {
        setHomeServiceStatus(Status.error);
        refresh();
      }
    }
  }

  ///=============Get Search Box Service Outlet =============
  final getSearchServiceOutletLoading = Status.completed.obs;
  //void setServiceOutletStatus(Status value) =>
  //    getServiceOutletLoading.value = value;
  RxList<ServiceOutletModel> searchServiceOutletModelList =
      <ServiceOutletModel>[].obs;
  Future<void> getSearchServiceOutlet(
      {required String userId, required String searchText}) async {
    var response = await ApiClient.getData(
        ApiUrl.getSearchServiceOutlet(userId: userId, searchText: searchText));
    if (response.statusCode == 200) {
      try {
        // var data = response.body["data"];
        searchServiceOutletModelList.value = List<ServiceOutletModel>.from(
            response.body["data"].map((x) => ServiceOutletModel.fromJson(x)));
        //   setServiceOutletStatus(Status.completed);
        refresh();
      } catch (e) {
        //  setServiceOutletStatus(Status.error);
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        //   setServiceOutletStatus(Status.internetError);
      } else {
        //    setServiceOutletStatus(Status.error);
        refresh();
      }
    }
  }

  ///=============Get Service Outlet =============
  final getServiceOutletLoading = Status.loading.obs;
  RxList<ServiceOutletModel> serviceOutletModelList =
      <ServiceOutletModel>[].obs;
  Future<void> getServiceOutlet() async {
    var response = await ApiClient.getData(ApiUrl.getServiceOutlet(
      userId: comonId.value,
    ));
    if (response.statusCode == 200) {
      try {
        //   var data = response.body["data"];
        serviceOutletModelList.value = List<ServiceOutletModel>.from(
            response.body["data"].map((x) => ServiceOutletModel.fromJson(x)));
        getServiceOutletLoading.value = Status.completed;
        refresh();
      } catch (e) {
        getServiceOutletLoading.value = Status.completed;
        debugPrint("Parsing error: $e");
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        getServiceOutletLoading.value = Status.internetError;
      } else {
        getServiceOutletLoading.value = Status.error;
        refresh();
      }
    }
  }

  @override
  void onInit() {
    getHomeService();
    //getServiceOutlet();
    super.onInit();
  }
}
