class AlertMessageString {
  static const String socketException = 'Please try again later';

  static const String noInternet = "No Internet";
  static const String noInternetMsg = "Please check your internet connection";

  static const String unAuthorisedTitle = "UnAuthorized";
  static const String unAuthorisedMsg =
      "The session is expired due to security reasons, please login again to continue.";

  static const String defaultErrorTitle = "Error";
  static const String somethingWentWrong =
      "Something went wrong, please try again later...";
  static const String underMaintainanceTitle = "Under Maintenance";
  static const String underMaintainanceMsg =
      "Sorry, we're down for scheduled maintenance right now, please try after some time.";
  static const String invalidFormat = "Invalid format";
  static const String httpErrorMsg = "The server is currently unavailable.";

  //-----------------SignUp Validation----------------------
  static const String emptyName = "Please add your first name";
  static const String emptyMessage = "Please enter message";
  static const String validateContacetSupportMessage =
      "Please include a message";
  static const String emptyInstaHandle = "Please enter your instagram handle";
  // ------------------ Permission Messages -------------------
  static const String permissionDenied = "Permission denied";
  static const String gotToSettings = "Go to setting";
  static const String manageSettings = "Manage Settings";

  static const String allowContactMsg =
      "Access to the Contact is denied for this app, go to settings, and allow Contact permission";
  static const String allowLocationMsg =
      "Access to the Location is denied for this app, go to settings, and allow Location permission";
  static const String allowCameraMsg =
      "Access to the Camera is denied for this app, go to settings, and allow Camera permission";
  static const String allowPhotoesMsg =
      "Go to Settings > Photos and grant permission to access Photos to set your profile picture.";

  //-----------------Auth Alert--------------------------------------//
  static const String emptyEmail = 'Please enter an email';
  static const String emptyEmailForUpdate = 'Please add an email';

  static const String validEmailForUpdate = "Please add a valid email address";

  static const String validInstaHandle =
      'Please enter valid instagram username';

  //static const String validInstaHandle = 'Please enter valid instagram username';
  static const String emptyPwd = 'Please enter a password';
  static const String validEmail = 'Please enter a valid email';
  static const String validPassword = 'Please enter at least 8 characters';
  static const String emptyPhone = "Please enter a phone number";
  static const String validPhone = "Please enter at least 10 digits";
  static const String emptyCurrentPassword =
      'Please enter your current password';
  static const String emptyNewPassword = "Please enter your new password";
  static const String emptyConfrimPassword = "Please confirm your password";

  static const String emptyPhoneforUpdate = "Please add your phone number";
  static const String validPhoneForUpdate = "Please enter at least 10 digits";

  static const String emptyFirstName = "Please enter first name";
  static const String emptyLastName = "Please enter last name";
  static const String emptyBio = "Please enter something about you";
  static const String emptyUserName = "Please enter your username";

  static const String enableBluetooth = "Enable Bluetooth";
  static const String yourBluetoothIsNotEnale =
      "Your bluetooth is off please turn on bluetooth.";

  // No vibration dialog box//
  static const String notVibrating = "Not Vibrating?";
  static const String pleaseMakeSureThatVibration =
      "Please make sure that vibration is turned on in your device settings";
  static const String andSwitchOnOne =
      '1. [Setting -> Accessibility -> Vibration And haptics] and switch on "Vibration".';
  static const String andSwitchOnTwo =
      '1. [Setting -> Accessibility -> Touch] and switch on "Vibration".';

  static String getErrorMsg(
      {required String error, required bool returnDefault}) {
    String errorMsg =
        returnDefault ? error : "Something went wrong please try again later.";

    switch (error) {
      case "INVALID_APP_USER_ID":
        errorMsg;
        break;
      case "ERROR_FINDING_RECEIPT_SKU":
        errorMsg;
        break;
      case "ERROR_FETCHING_RECEIPTS":
        errorMsg;
        break;
      case "ERROR_FETCHING_RECEIPT_INFO":
        errorMsg;
        break;
      case "ERROR_OBSERVER_MODE_NOT_SUPPORTED":
        errorMsg;
        break;
      case "INVALID_CREDENTIALS":
        errorMsg;
        break;
      case "INVALID_SUBSCRIBER_ATTRIBUTES":
        errorMsg;
        break;
      case "NETWORK_ERROR":
        errorMsg =
            "Make sure the device has an internet connection and try again.";
        break;
      case "OPERATION_ALREADY_IN_PROGRESS":
        errorMsg = "Operation is already in progress.";
        break;
      case "STORE_PROBLEM":
        errorMsg;
        break;
      case "UNEXPECTED_BACKEND_RESPONSE_ERROR":
        errorMsg;
        break;
      case "RECEIPT_ALREADY_IN_USE":
        errorMsg;
        break;
      case "INVALID_APPLE_SUBSCRIPTION_KEY":
        errorMsg;
        break;
      case "MISSING_RECEIPT_FILE":
        errorMsg =
            "Make sure you're signed into the device with a valid Apple account.";
        break;
      case "INELIGIBLE_ERROR":
        errorMsg = "You are not eligible for this offer.";
        break;
      case "INSUFFICIENT_PERMISSIONS_ERROR":
        errorMsg =
            "Device does not have sufficient permissions to make in-app purchases.";
        break;
      case "PAYMENT_PENDING_ERROR":
        errorMsg;
        break;
      case "PRODUCT_ALREADY_PURCHASED":
        errorMsg = "Product is already active.";
        break;
      case "PRODUCT_NOT_AVAILABLE_FOR_PURCHASE":
        errorMsg = "Product is not available for purchase.";
        break;
      case "PURCHASE_CANCELLED":
        errorMsg =
            "We noticed that you canceled your subscription before it was processed. Please try again to complete your purchase.";
        break;
      case "PurchaseCancelledError":
        errorMsg =
            "We noticed that you canceled your subscription before it was processed. Please try again to complete your purchase.";
        break;
      default:
        errorMsg;
    }

    return errorMsg;
  }
}
