import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/service_outlet_model/recommend_services_model.dart';


class StyleListController extends GetxController {
  RxList<String> tabNamelist =
      <String>[
        AppStrings.afrohaircare,
        AppStrings.twistHightaper,
        AppStrings.braids
      ].obs;
  RxInt currentIndex = 0.obs;


  ///================ GET RECOMMEND SERVICES ==================//
  Rx<Status> recommendServiceLoading = Status.loading.obs;
  RxList<RecommendServicesModel> recommendServicesModelList = <RecommendServicesModel>[].obs;
  Future<void> getRecommendService() async {
    var response = await ApiClient.getData(ApiUrl.getRecommendService);
    if(response.statusCode==200){
      recommendServiceLoading.value = Status.completed;
      var data =response.body["data"];
      recommendServicesModelList.value = List<RecommendServicesModel>.from(
          data.map((x) => RecommendServicesModel.fromJson(x)));
      refresh();
    }else{
      if(response.statusText == ApiClient.somethingWentWrong){
        recommendServiceLoading.value =Status.internetError;
        refresh();
        //   setServiceOutletStatus(Status.internetError);
      }else{
        //    setServiceOutletStatus(Status.error);
        recommendServiceLoading.value =Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  /* ///=============Get Search Box Service Outlet =============
 final getSearchServiceOutletLoading = Status.completed.obs;
  //void setServiceOutletStatus(Status value) =>
  //    getServiceOutletLoading.value = value;
  RxList<ServiceOutletModel> searchServiceOutletModelList = <ServiceOutletModel>[].obs;
  Future<void> getSearchServiceOutlet({required String userId, required String searchText}) async {
    var response = await ApiClient.getData(ApiUrl.getSearchServiceOutlet(userId: userId,searchText: searchText));
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
  final getServiceOutletLoading = Status.completed.obs;
  void setServiceOutletStatus(Status value) =>
     getServiceOutletLoading.value = value;
  RxList<ServiceOutletModel> serviceOutletModelList = <ServiceOutletModel>[].obs;
  Future<void> getServiceOutlet() async {
    final userId = await SharePrefsHelper.getString(AppConstants.userId);


    var response = await ApiClient.getData(ApiUrl.getServiceOutlet(userId: userId,));
    if (response.statusCode == 200) {
      try {
     //   var data = response.body["data"];
        serviceOutletModelList.value = List<ServiceOutletModel>.from(
            response.body["data"].map((x) => ServiceOutletModel.fromJson(x)));
          setServiceOutletStatus(Status.completed);
        refresh();
      } catch (e) {
          setServiceOutletStatus(Status.error);
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
           setServiceOutletStatus(Status.internetError);
      } else {
         setServiceOutletStatus(Status.error);
        refresh();
      }
    }
  }*/

  @override
  void onInit() {
   // getServiceOutlet();
    getRecommendService();
    super.onInit();
  }






}
