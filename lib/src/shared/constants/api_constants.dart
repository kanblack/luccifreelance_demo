class BaseUrl {
  static const String dev = "https://boxapp-api.its-globaltek.com";
  static const String stag = "https://box-stg-api.its-globaltek.com";
}

class AuthApi {
  static const String _base = "/auth";
  static const String loginEmail = "$_base/login/email";
  static const String loginGoogle = "$_base/login/google";
  static const String loginFacebook = "$_base/login/facebook";
  static const String loginApple = "$_base/login/apple";
  static const String loginLine = "$_base/login/line";
  static const String refreshToken = "$_base/refresh";
}

class UserApi {
  static const String _base = "/users";
  static const String registerUserWithEmail = _base;
  static const String checkCustomerMailExist = "$_base/checkCustomerMailExist";
  static const String verifyOtp = "$_base/verifyOtp";
  static const String sentOtp = "$_base/sentOtp";
  static const String getUserById = "$_base/{id}";
  static const String updateUserById = "$_base/{id}";
  static const String forgotPassword = "$_base/forgotPassword";
  static const String changePassword = "$_base/changePassword";
  static const String changeEmail = "$_base/{uuid}";
  static const String registerFCM = "$_base/device";
  static const String getCreditCard = "$_base/creditCards";
}

class TransportMethodApi {
  static const String _base = "/transport-methods";
  static const String getTransportMethodDetails = "$_base/detail";
}

class BoxRequestPaymentApi {
  static const String _base = "/box-request-payments";
  static const String listBoxRequestPayment = _base;
  static const String boxRequestPaymentById = "$_base/{id}";
  static const String boxRequestPaymentPreview = "$_base/preview";
}

class BoxRequestApi {
  static const String _base = "/box-requests";
  static const String createBoxRequest = _base;
  static const String getBoxRequestsHistory = _base;
  static const String getBoxRequestsById = "$_base/{id}";
}

class PackageApi {
  static const String _base = "/packages";
  static const String createPackage = _base;
}

class AddressApi {
  static const String _base = "/address";
  static const String createNewAddress = _base;
  static const String getListAddress = _base;
  static const String getAddressById = "$_base/{id}";
  static const String updateAddressById = "$_base/{id}";
  static const String deleteAddressById = "$_base/{id}";
  static const String getAddressInfoFromZipCode = "$_base/jp/postal/{zip}";
}

class CouponApi {
  static const String _base = "/coupons";
  static const String getCouponFromCode = "$_base/code/{code}";
  static const String verifyCoupon = "$_base/verify/{code}";
}

class BoxsApi {
  static const String _base = "/boxs";
  static const String scanCode = "$_base/scan/{code}";
}

class PackagesAPI {
  static const _base = "/packages";
  static const createPackage = _base;
  static const getPackageList = _base;
  static const getPackageById = "$_base/{id}";
  static const updatePackage = "$_base/{id}";
  static const deletePackage = "$_base/{id}";
}

class PackageItemCategoryApi {
  static const String _base = "/package-item-categories";
  static const String getPackageItemCategories = _base;
}

class PackageItemsApi {
  static const _base = "/package-items";
  static const createPackageItems = _base;
  static const getPackageItemsById = "$_base/{id}";
  static const updatePackageItemsById = "$_base/{id}";
  static const deletePackageItemsById = "$_base/{id}";
}

class ImageApi {
  static const String _base = "/images";
  static const String uploadImage = "$_base/upload";
}

class PickUpRequestAPI {
  static const _base = "/pickup-request";
  static const createPickupRequest = _base;
  static const getPickupRequestList = _base;
  static const getPickupRequestById = "$_base/{id}";
  static const getTrackingEvent = "$_base/{id}/tracking-events";
  static const updatePickupRequestById = "$_base/{id}";
  static const hiddenPickupRequestById = "$_base/{id}/hidden";
}

class PickUpRequestPaymentsAPI {
  static const _base = "/pickup-request-payments";
  static const previewPickUpRequestPayments = "$_base/preview";
}

class PaymentsAPI {
  static const _base = "/payments";
  static const notificationPayment = "$_base/notifications";
  static const deleteCreditCard = "$_base/deleteCreditCard";
  static const exePurchaseCreditCard = "$_base/exePurchaseCreditCard";
  static const exePurchaseOtherMethod = "$_base/exePurchaseOtherMethod";
}

class Notification {
  static const _base = "/notifications";
  static const getAllNotifications = _base;
  static const readNotificationById = "$_base/{id}";
  static const getCountUnreadNotification = "$_base/unread";
  static const requestReadNotification = "$_base/batchUpdateStatus";
}
