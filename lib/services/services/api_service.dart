import 'dart:convert';
import 'dart:async';
import 'package:user/model/clinic.dart';
import 'package:user/model/clinicUser.dart';
import 'package:user/model/doctor.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import 'package:user/services/services/helperData_service.dart';
import '../../app/locator.dart';
import 'dataFromApi_service.dart';
import 'local_storage.dart';

class APIServices {
  // __________________________________________________________________________
  // Variables for Clinic API
  String url = "https://biolegenew.herokuapp.com/api/";
  // -------------------------------------------------------------
  // Clinic
  String urlClinicEmployeeCreate = "clinicemployee/create";
  String urlClinicCreate = "clinic/create";
  String urlClinicUpdate = "clinic/phone/";
  String urlClinicGet = "clinic/";
  String updateClinicImages = "clinic/image/";
  String urlGetClinicsAll = "clinics";
  // -------------------------------------------------------------
  // Doctors
  String urlGetDoctors = "doctors";
  String urlGetDoctorByID = "doctor";
  String updateDoctor = "doctor";
  String urlGetAllDoctorCustomers = "doctorcustomer/customers";
  // ------------------------------------------------------------
  // Diagnostic Customers
  String urlDiagnosticCustomerCreate = "diagnostic/customer/create";
  String urlUpdateDiagnosticCustomer = "diagnostic/customer";
  String urlDiagnosticCustomerGet = "diagnostic/customer";
  String urlGetDiagnosticCustomerByPhone = "diagnostic/customer/phone/";
  String urlGetAllDiagnosticCustomers = "diagnostic/customers";
  // -------------------------------------------------------------------------
  // -------------------------------------------------------------------------

  // Fetches clinic data from the api by using CLINIC Id stored in local
  Future<Clinic> getClinicById(String id) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();

    // _________________________________________________________________________
    try {
      // _______________________________________________________________________
      // URL to be called
      var getClinicUri = Uri.parse('$url$urlClinicGet$id');
      // _______________________________________________________________________
      // Creating get requests
      var getClinicRequest = new http.Request("GET", getClinicUri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var getClinicResponse = await getClinicRequest.send();
      var getClinicResponseString =
          await getClinicResponse.stream.bytesToString();
      var getClinicResponseJson = json.decode(getClinicResponseString);

      // Clinic object generated from the incoming json
      return Clinic.fromJson(getClinicResponseJson);
    } catch (e) {
      print("At get clinic by ID : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // Adds a clinic customer by first fetching the complete clinic object
  // and then checking whether the customer is already added or not. If added
  // updates the appointment date field else creates a new customer object.
  // Finally, prepares a modified version of the recieved clinic object and
  // updaates via API.
  // Future<Clinic> addOrUpdateClinicCustomers(String id) async {
  //   // _________________________________________________________________________
  //   // Locating Dependencies
  //   final SnackbarService _snackBarService = locator<SnackbarService>();
  //   final StorageService _storageService = locator<StorageService>();
  //   final APIServices _apiServices = locator<APIServices>();
  //   // _________________________________________________________________________
  //   // Retreiving clinic id
  //   // _________________________________________________________________________
  //   try {
  //     // _______________________________________________________________________
  //     // URL to be called
  //     var uri = Uri.parse('$url$urlClinicUpdate$id');
  //     // _______________________________________________________________________
  //     // Creating get requests
  //     var request = new http.Request("PUT", uri);
  //     // _______________________________________________________________________
  //     // Clinic object from get clinic by id (API)
  //     Clinic latestDoctorObjectFromApi = await _apiServices.getClinicById();
  //     // List of customer of the respective clinic (API)
  //     List<CustomerElement> latestCustomersListFromApi =
  //         latestDoctorObjectFromApi.customers;

  //     String diagnosticID = _storageService.getUID;

  //     // _______________________________________________________________________
  //     // Preparing the data to be sent
  //     CustomerElement
  //         customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist =
  //         _patientDetailservice
  //             .customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
  //                 _patientDetailservice.customerDetailsToBeSentIfDoesntExist());
  //     // _______________________________________________________________________
  //     // Finding customer in the customers object of the clinic and
  //     // returns the iterator
  //     Iterable<CustomerElement> foundCustomer = latestCustomersListFromApi
  //         .where((customer) => customer.customer.id == diagnosticID);
  //     // _______________________________________________________________________
  //     // Logic for updating customer object of doctor
  //     if (foundCustomer.isEmpty) {
  //       // If not found add the "customerObjectToBeSentIfDoesntExist" to latest
  //       // customer list and covert all the customer to jsonobject
  //       latestCustomersListFromApi
  //           .add(customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist);
  //       // ________________________________________________________
  //       var object = [];
  //       latestCustomersListFromApi
  //           .forEach((customer) => object.add(customer.toJson()));
  //       request.body = jsonEncode({'customers': object});
  //       // ________________________________________________________
  //     } else {
  //       // If found update the appointment date where Customer ID is same as
  //       // diagnostic id and covert all the customer to jsonobject
  //       latestCustomersListFromApi
  //           .where((customer) => customer.customer.id == diagnosticID)
  //           .forEach((customer) {
  //         customer.appointmentDate
  //             .add(_patientDetailservice.getDoctorsPatientSelectedDate());
  //       });
  //       // ________________________________________________________
  //       var object = [];
  //       latestCustomersListFromApi
  //           .forEach((customer) => object.add(customer.toJson()));
  //       request.body = jsonEncode({'customers': object});
  //     }

  //     // _______________________________________________________________________
  //     // Preparing the headers
  //     request.headers.addAll({
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     });

  //     var response = await request.send();
  //     var responseString = await response.stream.bytesToString();
  //     var responseJson = json.decode(responseString);

  //     _dataFromApiServices.setClinic(Clinic.fromJson(responseJson));

  //     // _______________________________________________________________________
  //     print("Clinic Customer added : " + responseJson["customers"].toString());
  //     // _______________________________________________________________________
  //     return Clinic.fromJson(responseJson);
  //   } catch (e) {
  //     print("At add clinic customer : " + e.toString());
  //     _snackBarService.showSnackbar(message: e.toString());
  //     return null;
  //   }
  // }

  // ---------------------------------------------------------------------------

  Future<Doctor> addOrUpdateDiagnosticCustomersToDoctor(
      String id, bool isComplete) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // final StorageService _storageService = locator<StorageService>();
    final PatientDetails _patientDetailservice = locator<PatientDetails>();
    final APIServices _apiServices = locator<APIServices>();
    // final DataFromApi _dataFromApiServices = locator<DataFromApi>();
    // _________________________________________________________________________
    try {
      // _______________________________________________________________________
      // URL to be called
      var uri = Uri.parse('$url$updateDoctor/$id');
      // print(uri);
      // _______________________________________________________________________
      // Creating get requests
      var request = new http.Request("PUT", uri);
      // _______________________________________________________________________
      // Diagnostic Customer ID
      String diagnosticID = _patientDetailservice.getDoctorsPatientDiagnosticID;
      // Clinic object from get clinic by id (API)
      Doctor latestDoctorObjectFromApi = await _apiServices.getDoctorById(id);
      // List of customer of the respective clinic (API)
      List<CustomerElement> latestCustomersListFromApi =
          latestDoctorObjectFromApi.customers;
      // _______________________________________________________________________
      // Preparing the data to be sent

      CustomerElement
          customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist =
          _patientDetailservice
              .customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
                  _patientDetailservice.customerDetailsToBeSentIfDoesntExist(),
                  isComplete);
      // _______________________________________________________________________
      // Finding customer in the customers object of the clinic and
      // returns the iterator
      Iterable<CustomerElement> foundCustomer = latestCustomersListFromApi
          .where((customer) => customer.customer.id == diagnosticID);
      // _______________________________________________________________________
      // Logic for updating customer object of doctor
      if (foundCustomer.isEmpty) {
        // If not found add the "customerObjectToBeSentIfDoesntExist" to latest
        // customer list and covert all the customer to jsonobject
        latestCustomersListFromApi
            .add(customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist);
        // ________________________________________________________
        var object = [];
        latestCustomersListFromApi
            .forEach((customer) => object.add(customer.toJson()));
        request.body = jsonEncode({'customers': object});
        // ________________________________________________________
      } else {
        // If found update the appointment date where Customer ID is same as
        // diagnostic id and covert all the customer to jsonobject
        latestCustomersListFromApi
            .where((customer) => customer.customer.id == diagnosticID)
            .forEach((customer) {
          customer.appointmentDate.add(AppointmentDate(
              id: _patientDetailservice.getAppointmentID,
              date: _patientDetailservice.getDoctorsPatientSelectedDate,
              isCompleted: 0));
        });
        // ________________________________________________________
        var object = [];
        latestCustomersListFromApi
            .forEach((customer) => object.add(customer.toJson()));
        request.body = jsonEncode({'customers': object});
      }

      // _______________________________________________________________________

      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // print(request.body);
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // print(responseJson);
      // _______________________________________________________________________
      print("Doctor Customer added to : " + responseJson["_id"].toString());
      // _______________________________________________________________________
      return Doctor.fromJson(responseJson);
    } catch (e) {
      print("At add doctor customer : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // ---------------------------------------------------------------------------

  Future updateAppointmentInDiagnosticCustomer(String clinicId) async {
    // _________________________________________________________________________
    // Locating Dependencies

    final SnackbarService _snackBarService = locator<SnackbarService>();
    final PatientDetails _patientDetailservice = locator<PatientDetails>();
    final APIServices _apiServices = locator<APIServices>();
    final StorageService _storageService = locator<StorageService>();

    // _________________________________________________________________________
    //
    try {
      // _______________________________________________________________________
      // Variables to be used
      String diagnostisId = _patientDetailservice.getDoctorsPatientDiagnosticID;
      //String clinicId = _storageService.getClinicId;
      String selectedDoctorId =
          _patientDetailservice.getDoctorsPatientSelectedDoctor.id;
      // _______________________________________________________________________
      // URL to be called
      var uri = Uri.parse('$url$urlUpdateDiagnosticCustomer/$diagnostisId');
      // _______________________________________________________________________
      // Creating a get request
      var request = new http.Request("PUT", uri);
      // _______________________________________________________________________
      // Latest details of Diagnostic Customers fetched by ID (API)
      DiagnosticCustomer latestDiagnosticCustomerObjectFromApi =
          await _apiServices.getDiagnoticCustomerById(diagnostisId);
      // _______________________________________________________________________
      // List of Appointments from the doctors object of Diagnostic Customers(API)
      List<DoctorObject> latestDoctorsAppointmentListFromApi =
          latestDiagnosticCustomerObjectFromApi.doctors;
      // _______________________________________________________________________
      DoctorObject appointmentObjectIfDoesntExist = DoctorObject(
          visitingDate: [
            AppointmentDate(
                id: _patientDetailservice.getAppointmentID,
                date: _patientDetailservice.getDoctorsPatientSelectedDate,
                isCompleted: 0)
          ],
          clinic: ObjectWithID(id: clinicId),
          doctor: ObjectWithID(
              id: _patientDetailservice.getDoctorsPatientSelectedDoctor.id));
      // _______________________________________________________________________
      // Check whether a an appointment this doctor is already exists or not
      Iterable<DoctorObject> foundAppointment =
          latestDoctorsAppointmentListFromApi.where((appointmentObject) =>
              (appointmentObject.clinic.id == clinicId &&
                  appointmentObject.doctor.id == selectedDoctorId));
      // _______________________________________________________________________
      // Logical for searching
      if (foundAppointment.isEmpty)
        latestDoctorsAppointmentListFromApi.add(appointmentObjectIfDoesntExist);
      else
        latestDoctorsAppointmentListFromApi
            .where((appointmentObject) =>
                (appointmentObject.clinic.id == clinicId &&
                    appointmentObject.doctor.id == selectedDoctorId))
            .first
            .visitingDate
            .add(AppointmentDate(
                id: _patientDetailservice.getAppointmentID,
                date: _patientDetailservice.getDoctorsPatientSelectedDate,
                isCompleted: 0));
      // _______________________________________________________________________
      // Preparing the data to be sent
      var object = [];
      latestDoctorsAppointmentListFromApi
          .forEach((apt) => object.add(apt.toJson()));

      request.body = jsonEncode({'doctors': object});
      // print(request.body);

      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });

      // _______________________________________________________________________
      // Receiving the JSON response

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      print("Update Appointment to diagnotic customer: " +
          responseJson['_id'].toString());

      // _______________________________________________________________________
    } catch (e) {
      print("At Update appointment to diagnostic customer :" + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  Future<Clinic> getClinic(String clinicId) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final StorageService _storageService = locator<StorageService>();
    // _________________________________________________________________________
    // Retreiving clinic id
    //String clinicId = _storageService.getClinicId;
    // _________________________________________________________________________
    try {
      // _______________________________________________________________________
      // URL to be called
      var getClinicUri = Uri.parse('$url$urlClinicGet$clinicId');
      // _______________________________________________________________________
      // Creating get requests
      var getClinicRequest = new http.Request("GET", getClinicUri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var getClinicResponse = await getClinicRequest.send();
      var getClinicResponseString =
          await getClinicResponse.stream.bytesToString();
      var getClinicResponseJson = json.decode(getClinicResponseString);

      // Clinic object generated from the incoming json
      return Clinic.fromJson(getClinicResponseJson);
    } catch (e) {
      print("At get clinic by ID : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // ***************************************************************************

  Future<DiagnosticCustomer> getDiagnosticCustomerByPhone(String phone) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // final StorageService _storageService = locator<StorageService>();
    // _________________________________________________________________________
    try {
      // _______________________________________________________________________
      // URL to be called
      var getDiagnosticCustomerUri =
          Uri.parse('$url$urlGetDiagnosticCustomerByPhone$phone');
      // print(getDiagnosticCustomerUri);
      // _______________________________________________________________________
      // Creating get requests
      var getDiagnosticCustomerRequest =
          new http.Request("GET", getDiagnosticCustomerUri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var getDiagnosticCustomerResponse =
          await getDiagnosticCustomerRequest.send();
      var getDiagnosticCustomerResponseString =
          await getDiagnosticCustomerResponse.stream.bytesToString();
      var getDiagnosticCustomerResponseJson =
          json.decode(getDiagnosticCustomerResponseString);
      if (getDiagnosticCustomerResponseString.length == 2) return null;

      return DiagnosticCustomer.fromJson(getDiagnosticCustomerResponseJson[0]);
    } catch (e) {
      print("At get diagnostic customer by phone : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  Future<Clinic> addOrUpdateDiagnosticCustomerToClinic(
      bool isComplete, String clinicId) async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final StorageService _storageService = locator<StorageService>();
    final PatientDetails _patientDetailservice = locator<PatientDetails>();
    final APIServices _apiServices = locator<APIServices>();
    final DataFromApi _dataFromApiServices = locator<DataFromApi>();
    // _________________________________________________________________________
    // Retreiving clinic id

    // _________________________________________________________________________
    try {
      // _______________________________________________________________________
      // URL to be called
      var uri = Uri.parse('$url$urlClinicUpdate$clinicId');
      // print(uri);
      // _______________________________________________________________________
      // Creating get requests
      var request = new http.Request("PUT", uri);
      // _______________________________________________________________________
      // Clinic object from get clinic by id (API)
      Clinic latestDoctorObjectFromApi = await _apiServices.getClinic(clinicId);
      // List of customer of the respective clinic (API)
      List<CustomerElement> latestCustomersListFromApi =
          latestDoctorObjectFromApi.customers;

      String diagnosticID = _patientDetailservice.getDoctorsPatientDiagnosticID;
      // _______________________________________________________________________
      // Preparing the data to be sent
      CustomerElement
          customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist =
          _patientDetailservice
              .customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
                  _patientDetailservice.customerDetailsToBeSentIfDoesntExist(),
                  isComplete);
      // _______________________________________________________________________
      // Finding customer in the customers object of the clinic and
      // returns the iterator
      Iterable<CustomerElement> foundCustomer = latestCustomersListFromApi
          .where((customer) => customer.customer.id == diagnosticID);
      // _______________________________________________________________________
      // Logic for updating customer object of doctor
      if (foundCustomer.isEmpty) {
        // If not found add the "customerObjectToBeSentIfDoesntExist" to latest
        // customer list and covert all the customer to jsonobject
        latestCustomersListFromApi
            .add(customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist);
        // ________________________________________________________
        var object = [];
        latestCustomersListFromApi
            .forEach((customer) => object.add(customer.toJson()));
        request.body = jsonEncode({'customers': object});
        // ________________________________________________________
      } else {
        // If found update the appointment date where Customer ID is same as
        // diagnostic id and covert all the customer to jsonobject
        latestCustomersListFromApi
            .where((customer) => customer.customer.id == diagnosticID)
            .forEach((customer) {
          customer.appointmentDate.add(AppointmentDate(
              id: _patientDetailservice.getAppointmentID,
              date: _patientDetailservice.getDoctorsPatientSelectedDate,
              isCompleted: 0));
        });
        // ________________________________________________________
        var object = [];
        latestCustomersListFromApi
            .forEach((customer) => object.add(customer.toJson()));
        request.body = jsonEncode({'customers': object});
      }

      // _______________________________________________________________________
      // Preparing the headers
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // print(request.body);
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // print(responseJson);
      _dataFromApiServices.setClinic(Clinic.fromJson(responseJson));

      // _______________________________________________________________________
      print("Clinic Customer added to " + responseJson["_id"].toString());
      // _______________________________________________________________________
      return Clinic.fromJson(responseJson);
    } catch (e) {
      print("At add clinic customer : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // Fetches all diagnostic customers from the API
  Future getAllDiagnosticCustomers() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final DataFromApi _dataFromApi = locator<DataFromApi>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlGetAllDiagnosticCustomers');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________

      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);

      // _______________________________________________________________________
      // Serializing Json to DiagnosticCustomer Class
      List<DiagnosticCustomer> dgncstlist = [];
      Map<String, DiagnosticCustomer> customerAndDetailsMapping = {};

      responseJson.forEach((dgncst) {
        DiagnosticCustomer x = diagnosticCustomerFromJson(json.encode(dgncst));
        dgncstlist.add(x);
        customerAndDetailsMapping[x.id] = x;
      });

      await _dataFromApi
          .setDiagnosticCustomersMappedList(customerAndDetailsMapping);

      // _______________________________________________________________________
      return dgncstlist;
    } catch (e) {
      print("At get all diagnostic customer : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return [];
    }
  }

  // ***************************************************************************
  // Fetches all doctors from the API and stores in data services class
  Future<List<Doctor>> getAllDoctors() async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // final StorageService _storageService = locator<StorageService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlGetDoctors');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________
      print(uri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      print(responseJson);
      // _______________________________________________________________________
      // Serializing Json to Doctor Class
      List<Doctor> dlist = [];

      responseJson
          .forEach((doctor) => dlist.add(doctorFromJson(json.encode(doctor))));

      // _______________________________________________________________________
      return dlist;
    } catch (e) {
      print("At get all doctors : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return [];
    }
  }

  Future<List<Clinic>> getAllClinics() async {
    // _________________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    final DataFromApi _dataFromApiService = locator<DataFromApi>();
    // _________________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlGetClinicsAll');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________

      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Serializing Json to Doctor Class
      List<Clinic> clist = [];

      responseJson.forEach((clinic) {
        Clinic x = clinicFromJson(json.encode(clinic));
        clist.add(x);
      });

      _dataFromApiService.setclinicList(clist);
      // _______________________________________________________________________
      return clist;
    } catch (e) {
      print("At get all clinics : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return [];
    }
  }

  // ---------------------------------------------------------------------------
  // Fetches a doctor from the api using id
  Future<Doctor> getDoctorById(String id) async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlGetDoctorByID/$id');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      return Doctor.fromJson(responseJson);
    } catch (e) {
      print("At get doctors by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // ---------------------------------------------------------------------------

  // Future<dynamic> getAllDoctorCustomers() async {
  //   // _______________________________________________________________________
  //   // Locating Dependencies
  //   final SnackbarService _snackBarService = locator<SnackbarService>();
  //   // _______________________________________________________________________
  //   try {
  //     // URL to be called
  //     var uri = Uri.parse('$url$getAllDoctorCustomers');
  //     // Creating a get request
  //     var request = new http.Request("GET", uri);
  //     // _______________________________________________________________________

  //     // _______________________________________________________________________
  //     // Receiving the JSON response
  //     var response = await request.send();
  //     var responseString = await response.stream.bytesToString();
  //     var responseJson = json.decode(responseString);
  //     // _______________________________________________________________________

  //     return dynamic;
  //   } catch (e) {
  //     print("At get doctors by Id " + e.toString());
  //     _snackBarService.showSnackbar(message: e.toString());
  //     return null;
  //   }
  // }

  // ***************************************************************************
  // ***************************************************************************
  Future addDiagnosticCustomer() async {
    // _______________________________________________________________________
    // Locating Dependencies

    final SnackbarService _snackBarService = locator<SnackbarService>();
    final StorageService _storageService = locator<StorageService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlDiagnosticCustomerCreate');

      // Creating a get request
      // var request = new http.MultipartRequest("PUT", uri);
      var request = new http.Request("POST", uri);
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
      // _______________________________________________________________________
      // Preparing the data to be sent
      request.body = jsonEncode({
        'name': _storageService.getName,
        'phoneNumber': _storageService.getPhoneNumber,
        // 'customers.customer.email':,
        'gender': _storageService.getGender,
        'dob': _storageService.getDateOfBirth.toString(),
        'address.state': _storageService.getState,
        'address.city': _storageService.getCityName,
        'address.pincode': _storageService.getPinCode,
        'address.homeAddress': _storageService.getAddress,
        //'bloodGroup': _storageService.gettBloodGroup(),
      });
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      // Refetch the updated doctors list from the API
      print("Added new Diagnostic Customer: " +
          responseJson["diagnosticCustomer"]["_id"]);

      _storageService.setUID(responseJson["diagnosticCustomer"]["_id"]);

      // _______________________________________________________________________
    } catch (e) {
      print("At Add Diagnostic Customer " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }

  // Future addOrUpdateAppointmentToDiagnosticCustomer() async {
  //   // _______________________________________________________________________
  //   // Locating Dependencies

  //   final SnackbarService _snackBarService = locator<SnackbarService>();
  //   final APIServices _apiServices = locator<APIServices>();
  //   final StorageService _storageService = locator<StorageService>();
  //   // _______________________________________________________________________
  //   //
  //   try {
  //     String id = _storageService.getUID;
  //     // URL to be called
  //     var uri = Uri.parse('$url$urlUpdateDiagnosticCustomer/$id');
  //     print(uri);
  //     // Creating a get request
  //     var request = new http.Request("PUT", uri);
  //     //
  //     DiagnosticCustomer latestDoctorObjectFromApi =
  //         await _apiServices.getDoctorById(id);
  //     request.headers.addAll({
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     });
  //     // _______________________________________________________________________
  //     // Preparing the data to be sent
  //     request.body = jsonEncode({
  //       'doctors.doctor._id': _storageService.getUID,
  //       'doctors.visitingDate':
  //           _patientDetailservice.getDoctorsPatientSelectedDate().toString(),
  //       'doctors._id':
  //           _patientDetailservice.getDoctorsPatientSelectedDoctor().id,
  //     });
  //     // _______________________________________________________________________
  //     // Receiving the JSON response

  //     var response = await request.send();
  //     var responseString = await response.stream.bytesToString();
  //     var responseJson = json.decode(responseString);

  //     // _______________________________________________________________________
  //     print("Added Appointment to diagnotic customer: " + responseString);

  //     // _______________________________________________________________________
  //   } catch (e) {
  //     print("At add appointment to diagnostic customer " + e.toString());
  //     _snackBarService.showSnackbar(message: e.toString());
  //     return null;
  //   }
  // }

  Future<DiagnosticCustomer> getDiagnoticCustomerById(String id) async {
    // _______________________________________________________________________
    // Locating Dependencies
    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _______________________________________________________________________
    try {
      // URL to be called
      var uri = Uri.parse('$url$urlUpdateDiagnosticCustomer/$id');
      // Creating a get request
      var request = new http.Request("GET", uri);
      // _______________________________________________________________________
      // Receiving the JSON response
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var responseJson = json.decode(responseString);
      // _______________________________________________________________________
      return DiagnosticCustomer.fromJson(responseJson);
    } catch (e) {
      print("At get diagnotic customer by Id " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
      return null;
    }
  }
}
