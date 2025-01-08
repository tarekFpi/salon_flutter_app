import 'package:get/get.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_qr_screen/order_history_model/order_history_model.dart';

class SalonOrderController extends GetxController{
  Rx<Status> orderHistoryLoading = Status.loading.obs;
  RxList<OrderHistoryModel> orderHistoryList = <OrderHistoryModel>[].obs;
  Future<void> getOrderHistory() async {
    final userId = await SharePrefsHelper.getString(AppConstants.userId);
    var response = await ApiClient.getData(ApiUrl.getOrderHistory( userId: userId));
    if(response.statusCode==200){
      orderHistoryLoading.value =Status.completed;
      var data = response.body["data"];
      orderHistoryList.value = List<OrderHistoryModel>.from(
        data.map((x) => OrderHistoryModel.fromJson(x)));
      refresh();
    }else {
      if(response.statusText ==ApiClient.somethingWentWrong){
        orderHistoryLoading.value =Status.internetError;
        refresh();
      }else {
        orderHistoryLoading.value =Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }
  @override
  void onInit() {
    getOrderHistory();
    // TODO: implement onInit
    super.onInit();
  }
}