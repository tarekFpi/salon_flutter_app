class ApiUrl {
  static const String baseUrl = "http://10.0.60.55:5000/v1"; //http://10.0.60.55:5000/v1
  static const String imageUrl = "http://10.0.60.55:5000/v1/";
  static String socketUrl ({required String id}) => "http://10.0.60.55:5000?userId=$id";
  // server url : http://115.127.156.14:5002/api/v1
  // local url : http://10.0.60.55:5000/v1
  ///========================= Authentication =========================
  static const String userRegister = "/user/create";
  static const String otpVerify = "/auth/verify-otp";
  static const String login = "/auth/login";
  static const String forgetPassword = "/auth/email-verification/resend-code";
  static const String mailForgetOtp = "/auth/forget-password/send-otp";
  static const String getCustomerProfile = "/users/me";
  static const String resetPassword = "/auth/reset-password";
  static const String farmaciesNearby = "/farmacies/nearby";
  static const String getServices = "/services/";
  static const String getCategories = "/categories/";
  static const String postAddToCart = "/carts/add-to-cart";
  static const String getHomeService = "/service-category/retrive/all";
  static const String privacyPolicy = "/privacy-policy/retrive";
  static const String termsCondition = "/terms-condition/retrive";
  static const String aboutUs = "/about-us/retrive";
  static const String getSliderImage = "/slider/retrive/all";
  static const String getPopularService = "/service/popular/retrive";
  static const String getOffersService = "/service/offered/retrive";
  static const String getPayment = "/booking/retrive/search?query=upcomming";
  static const String postConversation = "/conversation/create";
  static const String getRecommendService = "/outlet/retrive/recommended/category/675815ec1fcccc650d647298/search?query=45545554545554525&page=1&limit=8";
  static String getSearchServiceOutlet({required String userId, required String searchText}) => "/outlet/retrive/category/$userId/search?query=$searchText";
  static String getServiceOutlet({required String userId,}) => "/outlet/retrive/category/$userId/search";
  static String getOrderHistory({required String userId,}) => "/booking/retrive/user/$userId";
  static String getMessage({required String conversationId,}) => "/message/retrive/$conversationId";

  static String getProfile ({required String userId}) => "/user/retrive/$userId";
  static String updateProfile ({required String userId}) => "/user/update/$userId";
  static String updateProfileImage ({required String userId}) => "/user/update/profile-picture/$userId";
  static String getDrugsCategory ({required String categoriesName}) => "/drugs/category/$categoriesName";
  static String getSingleDrugs ({required String userId}) => "/drugs/$userId";
  //static String getCustomerProfile ({required String userId}) => "/users/me$userId";

//============================= Send Message =======================

static String sendMessage = '/message/send';

///========================= salon api all implementation =========================
  static  String salonProfileShow({required String outletId}) =>  "/outlet/retrive/$outletId";


  ///========================= salon userProfile update implementation =========================
  static  String userProfileUpdate({required String  outletId}) =>  "/outlet/update/$outletId";


  ///========================= salon cover photos update implementation =========================
  static  String coverPhotosUpdate({required String  outletId}) =>  "/outlet/change/cover/$outletId";


  ///========================= salon scheduleByDay api implementation =========================

  static  String scheduleByDay({required String  outletId}) =>  "/schedule/retrive/$outletId";


  ///========================= salon Service manager api implementation =========================
  static  String serviceRetriveById({required String  outletId}) =>  "/service/retrive/outlet/$outletId";


  ///========================= salon Service manager api implementation =========================
  static  String serviceCreate = "/service/create";

  ///========================= salon userPhotosUpdate  api implementation =========================
  static  String userPhotosUpdate({required String  outletId}) =>  "/outlet/change/profile/$outletId";

  ///========================= salon Service Update api implementation =========================

  static  String serviceUpdate ({required String  serviceId}) => "/service/update/$serviceId";

  ///========================= salon upcomming Booking Show api implementation =========================
  static  String upcommingBookingShow({required String  outletId,required String  date}) =>  "/booking/upcomming/retrive/outlet/$outletId?date=$date";


  ///========================= earning retrive outlet  api implementation =========================
  static  String earningOutlet({required String  outletId}) =>  "/earning/retrive/outlet/$outletId";

  ///========================= earning retrive outlet  api implementation =========================
  static  String earningCompleted= "/booking/retrive/search?query=completed";

  ///========================= feedback retrive   api implementation =========================
  ///
  static  String feedbackReview({required String  outletId}) => "/feedback/retrive/all/outlet/$outletId";


  ///========================= salon scheduleBy Day create api implementation =========================
  static  String createDaySlots = "/schedule/create-or-update";
}
