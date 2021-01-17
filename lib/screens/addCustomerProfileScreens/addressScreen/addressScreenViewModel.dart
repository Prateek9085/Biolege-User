import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/services/services/api_service.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.gr.dart';

class AddressViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final APIServices _apiServices = locator<APIServices>();
  // _________________________________________________________________________
  // Controllers and Variables
  final addressFormKey = GlobalKey<FormState>();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  // _________________________________________________________________________
  //Validating form fields

  String validateState(String value) {
    return value.isEmpty
        ? "State cannot be empty"
        : value.length > 2
            ? null
            : "State should be atleast 3 characters long";
  }

  String validateCity(String value) {
    return value.isEmpty
        ? "City cannot be empty"
        : value.length > 3
            ? null
            : "City should be atleast 4 characters long";
  }

  String validatePincode(String value) {
    int pinC = value.isEmpty ? 0 : int.parse(value);
    return pinC == 0
        ? "Pincode cannot be empty"
        : value.length == 6
            ? null
            : "Pincode should be of 6 digit";
  }

  String validateHomeAddress(String value) {
    return value.isEmpty
        ? "Home Address cannot be empty"
        : value.length > 10
            ? null
            : "Home Address should be atleast 15 characters long";
  }

  // _________________________________________________________________________
  // Saving Address Details
  void saveAddressDetails() async {
    addressFormKey.currentState.save();
    if (!addressFormKey.currentState.validate()) return;

    await _storageService
        .setAddressDetails(
            address: homeAddress.text,
            city: city.text,
            pinCode: int.parse(pinCode.text),
            state: state.text);
    await _apiServices.addDiagnosticCustomer()
        .whenComplete(() => navigateToWelcomeScreenView());
  }

  void navigateToWelcomeScreenView() {
    _navigatorService.navigateTo(Routes.welcomeScreenView);
  }
}
