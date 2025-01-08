import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_profile/model/SalonProfileShowResponseModel.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/model/ScheduleDayResponseModel.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_model/offer_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_model/popular_service_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_model/slider_image_model.dart';

class UserHomeController extends GetxController {
  final List<String> imgList = [
    'https://c1.wallpaperflare.com/preview/127/366/443/library-book-bookshelf-read.jpg',
    'https://c4.wallpaperflare.com/wallpaper/569/784/53/macro-table-books-blur-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/569/853/227/summer-mood-positive-morning-wallpaper-preview.jpg',
  ].obs;
  RxInt currentIndex = 0.obs;
  late PageController pageController;
  var favorites = <String>[].obs;

  var savedItems = <String>[].obs;

  void toggleFavorite(String item) {
    if (savedItems.contains(item)) {
      savedItems.remove(item);
    } else {
      savedItems.add(item);
    }
  }

  bool isFavorite(String item) => savedItems.contains(item);

  ///================= GET SLIDER IMAGE =================
  Rx<Status> sliderImageLoading = Status.loading.obs;
  // void setSliderImageStatus(Status value) => sliderImageLoading.value = value;
  RxList<SliderImageModel> sliderImageModelList = <SliderImageModel>[].obs;
  Future<void> getSliderImage() async {
    debugPrint('=======Method Call ==============>${ApiUrl.getSliderImage}');
    //final userId = await SharePrefsHelper.getString(AppConstants.userId);
    var response = await ApiClient.getData(ApiUrl.getSliderImage);
    if (response.statusCode == 200) {
      sliderImageLoading.value = Status.completed;
      var data = response.body["data"];
      sliderImageModelList.value = List<SliderImageModel>.from(
          data.map((x) => SliderImageModel.fromJson(x)));
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        sliderImageLoading.value = Status.internetError;
        refresh();
        //   setServiceOutletStatus(Status.internetError);
      } else {
        //    setServiceOutletStatus(Status.error);
        sliderImageLoading.value = Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  ///================= GET POPULAR SERVICE =================
  ///
  ///
  Rx<Status> popularServiceLoading = Status.loading.obs;

  RxList<PopularServiceModel> popularServiceModelList =
      <PopularServiceModel>[].obs;

  Future<void> getPopularService() async {
    var response = await ApiClient.getData(ApiUrl.getPopularService);
    if (response.statusCode == 200) {
      popularServiceLoading.value = Status.completed;
      var data = response.body["data"];
      popularServiceModelList.value = List<PopularServiceModel>.from(
          data.map((x) => PopularServiceModel.fromJson(x)));
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        popularServiceLoading.value = Status.internetError;
        refresh();
        //   setServiceOutletStatus(Status.internetError);
      } else {
        //    setServiceOutletStatus(Status.error);
        popularServiceLoading.value = Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  ///==================GET OFFERS SERVICE====================
  Rx<Status> offersServiceLoading = Status.loading.obs;
  RxList<OffersModel> offersModelList = <OffersModel>[].obs;
  Future<void> getOffersService() async {
    var response = await ApiClient.getData(ApiUrl.getOffersService);
    if (response.statusCode == 200) {
      offersServiceLoading.value = Status.completed;
      var data = response.body["data"];
      offersModelList.value =
          List<OffersModel>.from(data.map((x) => OffersModel.fromJson(x)));
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        offersServiceLoading.value = Status.internetError;
        refresh();
        //   setServiceOutletStatus(Status.internetError);
      } else {
        //    setServiceOutletStatus(Status.error);
        offersServiceLoading.value = Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  //============================ Get spesic Salun outlet =========================

  Rx<Status> getOutLetStatus = Status.loading.obs;

  Rx<SalonProfileShowResponseModel> salunProfile =
      SalonProfileShowResponseModel().obs;

  getSingleSalun({required String outlateId}) async {
    getOutLetStatus.value = Status.loading;
    refresh();

    var response =
        await ApiClient.getData(ApiUrl.salonProfileShow(outletId: outlateId));

    if (response.statusCode == 200) {
      salunProfile.value =
          SalonProfileShowResponseModel.fromJson(response.body['data']);

      getOutLetStatus.value = Status.completed;
      refresh();
    } else {
      getOutLetStatus.value = Status.error;
    }
  }

  //====================================== Get single salun sedule ================================
//ScheduleDayResponseModel

  Rx<ScheduleDayResponseModel> sheduleResponse = ScheduleDayResponseModel().obs;

  getSalunShedule({required String salunId}) async {
    var response =
        await ApiClient.getData(ApiUrl.scheduleByDay(outletId: salunId));

    if (response.statusCode == 201) {
      sheduleResponse.value =
          ScheduleDayResponseModel.fromJson(response.body['data']);
    } else {}
  }  

  

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    pageController.addListener(() {
      currentIndex.value = pageController.page!.round();
    });

    getSliderImage();
    getPopularService();
    getOffersService();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
