import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/model/doctor.dart';
import 'package:user/services/services/dataFromApi_service.dart';

class ShowAllSpecialityScreenViewModel extends FutureViewModel {

  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final NavigationService _navigatorService = locator<NavigationService>();

  Map<String, List<Doctor>> specialisationList = {};

  void getSpecialisationList() async {
    setBusy(true);
    specialisationList = _dataFromApiService.getSpecialisationDoctors;

    print(specialisationList);
    setBusy(false);
  }

  @override
  Future futureToRun() async {
    try {
      getSpecialisationList();
    } catch (e) {
      print("Error." + e.toString());
    }
    throw UnimplementedError();
  }
}