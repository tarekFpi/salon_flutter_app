import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';

class AppTranslations extends Translations {
  @override
  // TO DO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          "chane_password": AppStrings.changePassword,
          "delete_account": AppStrings.deleteAccount,
          "welcome": AppStrings.welcome,
          "name": "Mehedi Bin Abdul Salam",
          "location": "Location",
          "nextAppointment": "Location",
          "popularServices": "Popular services",
          "viewAll": "View all",
          // ignore: equal_keys_in_map
          "viewAll": "عرض الكل",
        },
        'ar': {
          "chane_password": "أدخل رقم التعريف الشخصي",
          "delete_account": "حذف الحساب",
          "welcome": "مرحباً",
          "name": "مهدي بن عبد السلام",
          "location": "موقع",
          "nextAppointment": "الموعد القادم",
          "popularServices": "الخدمات الشعبية",
          "viewAll": "عرض الكل",
        },
      };
}
