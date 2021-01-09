import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import '../../services/services/dataFromApi_service.dart';
// import '../../services/services/api_service.dart';
import '../../services/services/local_storage.dart';
// import '../../services/services/auth_service.dart';
import '../../app/locator.dart';
import '../../app/router.gr.dart';
//import '../../model/clinic.dart';

class WelcomeScreenViewModel extends FutureViewModel<String> {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final StorageService _storageService = locator<StorageService>();
  //final Clinic _clinicDataService = locator<Clinic>();
  // final APIServices _apiServices = locator<APIServices>();
  // final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // __________________________________________________________________________
  // String _clinicName;
  // String getClinicName() => _clinicName;
  // int _roleType;
  // int get getRoleType => _roleType;
  // String _designation;
  // String getDesignation() => _designation;

  // __________________________________________________________________________
  // Streams/Futures
  @override
  Future<String> futureToRun() async {
    try {
      return _storageService.getName;
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError("Error occured on the welcome screen");
  }
  // __________________________________________________________________________

  void navigateToHomePageView() =>
      _navigatorService.navigateTo(Routes.homeScreenView);
  // __________________________________________________________________________
}
