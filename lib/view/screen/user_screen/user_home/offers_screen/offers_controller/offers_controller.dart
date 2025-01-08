import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/offers_screen/payment_model/payment_model.dart';

class OffersController extends GetxController{
   Rx<Status> offersServiceLoading = Status.loading.obs;
   RxList<PaymentModel> paymentModel = <PaymentModel>[].obs;
   Future<void> getOffersService() async {
     var response = await ApiClient.getData(ApiUrl.getPayment);
     if(response.statusCode==200){
       offersServiceLoading.value = Status.completed;
       var data =response.body["data"];
       paymentModel.value = List<PaymentModel>.from(
           data.map((x) => PaymentModel.fromJson(x)));
       refresh();
     }else {
       if(response.statusText ==ApiClient.somethingWentWrong){
         offersServiceLoading.value =Status.internetError;
         refresh();
       }else {
         offersServiceLoading.value =Status.error;
         refresh();
       }
       ApiChecker.checkApi(response);
       refresh();
     }
   }
   @override
  void onInit() {
     getOffersService();
    // TODO: implement onInit
    super.onInit();
  }
}