// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:battery_plus/battery_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/key_value_strings.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/battery/common_battery.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../../../shared/domain/model/Image/image_model.dart';
import '../../../../../common/services/notifications/common_notifications.dart';
import '../../../domain/domain.dart';
import '../../../domain/models/odometer_value.dart';
import '../../../domain/models/vechile_type_model.dart';
import 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  final PunchInUseCase punchInUseCase;
  final PunchOutUsecase punchOutUseCase;
  final LastPunchInOutUseCase getLastPunchInOutDetailsUseCase;
  final CommonLocationServices commonLocationServices;
  final CommonNotifications commonNotifications;
  final CommonImageServices commonImageServices;

  MarkAttendanceCubit(
    this.punchInUseCase,
    this.punchOutUseCase,
    this.getLastPunchInOutDetailsUseCase,
    this.commonLocationServices,
    this.commonNotifications,
    this.commonImageServices,
  ) : super(MarkAttendanceState.initial());

  final TextEditingController odometerController = TextEditingController();
  int selectedvehicleId = 0;
  int isPreDropDown = 0;
  int? pinchinTimeOdometerValue;
  int preInKMSNum = 0;

  /// Load vehicle dropdown items
  List<VechileItemsModel> vehicles = [];
  void loadVehicles1() {
    vehicles = [
      VechileItemsModel(id: 1, name: "Bike"),
      VechileItemsModel(id: 2, name: "Car"),
      VechileItemsModel(id: 3, name: "Other - Bus, train, Flight"),
    ];
    emit(state.copyWith(vehicleItems: vehicles));
  }

  void loadVehicles({int? preselectedVehicleId}) {
    vehicles = [
      VechileItemsModel(id: 1, name: "Bike"),
      VechileItemsModel(id: 2, name: "Car"),
      VechileItemsModel(id: 3, name: "Other - Bus, train, Flight"),
    ];
    emit(state.copyWith(vehicleItems: vehicles));

    // Preselect if ID is passed
    if (preselectedVehicleId != null) {
      restorePreviousVehicleSelection(preselectedVehicleId);
    }
  }

  /// Select a vehicle from dropdown
  void selectVehicle(VechileItemsModel vehicle) {
    emit(state.copyWith(selectedVehicle: vehicle));
    selectedvehicleId = vehicle.id;
    emit(state.copyWith(
        dataState: (vehicle.id == 1 || vehicle.id == 2) ? 1 : 3));
  }

  void restorePreviousVehicleSelection(int selectedVehicleId) {
    isPreDropDown = selectedVehicleId;
    for (var vehicle in vehicles) {
      if (vehicle.id == selectedVehicleId) {
        selectVehicle(vehicle); // This sets the dropdown value
        break;
      }
    }
  }

  bool vehicleSubmiting(context) {
    if (odometerController.text.trim().isNotEmpty &&
        odometerController.text != "0") {
      if (preInKMSNum !=0 && preInKMSNum >= int.parse(odometerController.text)) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                'Ensure that the Punch-in odometer reading is not less than or equal to the Punch-out reading.',
                style: TextStyle(color: Colors.white, fontSize: 15)),
            duration: Duration(seconds: 5),
          ),
        );
        // Fluttertoast.showToast(
        //     msg:
        //         "Ensure the Punch-in odometer reading is not less than the Punch-out reading.");
        return false;
      } else if (state.imageLists.isEmpty) {
        Fluttertoast.showToast(
            msg: "Please upload an attachment before submitting");
        return false;
      } else {
        emit(state.copyWith(dataState: 3));
        return true;
      }
    } else {
      Fluttertoast.showToast(msg: "Please fill in all the required fields");
      return false;
    }
  }

  /// Reset vehicle selection
  void resetVehicleSelection() {
    emit(state.copyWith(selectedVehicle: null));
  }

  // CHANGE MOBILE FIELD
  void changeMobile({required String mobile, int? enteredValue}) {
    differenceKMS(enteredValue!);
    emit(state.copyWith(marketOdometerField: MarketOdometerField(mobile)));
  }

  void clearImageLists() {
    emit(state.copyWith(imageLists: []));
  }

  void differenceKMS(int outKms) {
    if (outKms == 0) {
      pinchinTimeOdometerValue = 0;
    } else if (preInKMSNum!="") {
      pinchinTimeOdometerValue = outKms - preInKMSNum;
      debugPrint("✅ The difference is: $pinchinTimeOdometerValue");
    } else {
      debugPrint("❌ Invalid input: 'b' should be less than 'a'.");
    }
  }

  void removeImage({required ImageModel image}) {
    // Create a modifiable copy of the list
    List<ImageModel> list = List<ImageModel>.from(state.imageLists);
    list.remove(image);
    emit(state.copyWith(imageLists: list));
  }

  Future<void> pickFromCameraLogic() async {
    final results = await commonImageServices
        .pickMultipleUint8ListImageUsingImagePicker(isFromCamera: true);
    results.fold((l) => {}, (r) {
      final List<ImageModel> existingImge = List.from(state.imageLists);
      existingImge.addAll(r);

      emit(state.copyWith(imageLists: existingImge.reversed.toList()));
    });
  }

  // PICK ALL IMAGES
  Future<void> pickAllImages() async {
    final result = await commonImageServices.pickMultipleUint8ListImage();
    // final result = await commonImageServices.pickMultipleUint8ListImageUsingImagePicker(isFromCamera: true);

    result.fold((l) => emit(state.copyWith()), (r) {
      final List<ImageModel> existingImge = List.from(state.imageLists);
      existingImge.addAll(r);
      emit(state.copyWith(imageLists: existingImge.reversed.toList()));
    });
  }

  // GET LAST PUNCH IN-OUT DATA
  Future<void> getLastPunchInOutData() async {
    odometerController.text = "";
    pinchinTimeOdometerValue = 0;
    emit(MarkAttendanceState.initial());
    emit(state.copyWith(loading: true));
    // await Future.delayed(const Duration(seconds: 1));
    try {
      final results = await getLastPunchInOutDetailsUseCase.execute();
      await results.fold((l) async {
        // handle failure
        emit(state.copyWith(
            loading: false,
            apiFailModel: ApiFailedModel.fromNetworkExceptions(l)));
      }, (r) async {
        emit(state.copyWith(
            loading: false, loaded: true, lastPunchInResponseModel: r));
        debugPrint(state.lastPunchInResponseModel!.toJson().toString());
        // (state.lastPunchInResponseModel?.data != null)
        //     ? selectedvehicleId =
        //         (state.lastPunchInResponseModel?.data?.vehicleId == 1 ||
        //                 state.lastPunchInResponseModel?.data?.vehicleId == 2)
        //             ? 1
        //             : 3
        //     : 0;

        if (state.lastPunchInResponseModel?.data != null) {
          preInKMSNum =
              state.lastPunchInResponseModel?.data!.punchInOdoKMS ?? 0;
          if (state.lastPunchInResponseModel?.data?.vehicleId != 0 &&
              state.lastPunchInResponseModel?.data?.vehicleId != null) {
            for (var each in vehicles) {
              if (state.lastPunchInResponseModel?.data?.vehicleId == each.id) {
                restorePreviousVehicleSelection(each.id);
                break;
              }
            }
            Future.delayed( const Duration(microseconds: 100));

            if (selectedvehicleId == 1) {
              emit(state.copyWith(dataState: selectedvehicleId));
            } else if (selectedvehicleId == 2) {
              emit(state.copyWith(dataState: selectedvehicleId));
            } else {
              emit(state.copyWith(dataState: 3));
            }
            if (selectedvehicleId != 0) {
              emit(state.copyWith(
                  dataState: (selectedvehicleId == 1 || selectedvehicleId == 2)
                      ? 1
                      : 3));
            }
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      // handle exception
      emit(state.copyWith(
        loading: false,
      ));
    }
  }

  VechileItemsModel? selectedItem;

  // PUNCH LOGIC
  Future<void> punchInLogic() async {
    emit(state.copyWith(
      isSubmitting: true,
      punchInFailure: false,
      punchInSuccess: false,
      punchOutSuccess: false,
      punchOutFailure: false,
      loading: false,
      loaded: false,
    ));
    int batterylevl = 0;
    dynamic lat = "";
    dynamic lon = "";

    try {
      final postion = await commonLocationServices.getUserCurrentPosition();
      if (postion == null) {
        emit(state.copyWith(loading: false, punchInFailure: true));
        return;
      }
      lat = postion.latitude.toString();
      lon = postion.longitude.toString();
      batterylevl = await locator.get<CommonBattery>().getBatteryLevel();
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, punchInFailure: true));
      if (kDebugMode) {
        print(e);
      }
      // TODO
    }

    PunchInPostModel postModel = PunchInPostModel(
      latitude: lat,
      longitude: lon,
      createdAt: DateTime.now().toString(),
      batteryStatus: batterylevl.toString(),
      punchInOdometerKMS: odometerController.text,
      punchOutOdometerKMS: "",
      vehicleId: selectedvehicleId.toString(),
      images: state.imageLists.map((e) => e.imageByes).toList(),
    );
    final result = await punchInUseCase.execute(punchInPostModel: postModel);
    result.fold((l) {
      emit(state.copyWith(
          isSubmitting: false,
          punchInFailure: true,
          apiFailModel: ApiFailedModel(
              statusCode: NetworkExceptions.getStatusCode(l),
              message: NetworkExceptions.getErrorTitle(l),
              errorMessage: NetworkExceptions.getErrorMessage(l))));
    }, (r) async {
      // emit(state.copyWith(isSubmitting: false, punchInSuccess: true, loading: ));
      emit(state.copyWith(
        punchInSuccess: true,
        punchOutSuccess: false,
        punchInFailure: false,
        punchOutFailure: false,
        loading: false,
        loaded: false,
      )); 
      final dioclinet = locator.get<DioClient>(); 
       String userDateTime = DateTime.now().toIso8601String();
      final response = await dioclinet.post(Endpoints.locationUrl, data: {
        "latitude": lat,
        "longitude": lon,
        "userDateTime": userDateTime,
        "batteryStatus": batterylevl.toString(),
      }, headers: {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("In Puch-In Check-In Api Called");
      }else{
        debugPrint("In Puch-In Check-In Api Calling fail");
      }
      odometerController.text = "";
      selectedvehicleId = 0;
      await getLastPunchInOutData();
      // if (Platform.isIOS) {
      //    startTrackingLocation();
      // }  
    });
  }

  // PUNCHOUT LOGIC
  Future<void> punchOutLogic({bool? isLogoutClicked, context}) async {
    emit(state.copyWith(
        isSubmitting: true,
        punchInFailure: false,
        punchInSuccess: false,
        punchOutSuccess: false,
        loading: false,
        loaded: false));
    int batteryLevel = 0;
    String lat = "";
    String lon = "";
    // final secureStorage = FlutterSecureStorage();
    // await secureStorage.delete(key: KeyValueStrings.isLoggedInStorage);
    // final tokenStorage =
    //     await secureStorage.read(key: KeyValueStrings.isLoggedInStorage);
    // debugPrint(tokenStorage);

    try {
      final position = await commonLocationServices.getUserCurrentPosition();
      if (position != null) {
        lat = position.latitude.toString();
        lon = position.longitude.toString();
      } else {
        if (kDebugMode) {
          print("⚠️ Location is null. Check permission settings.");
        }
      }

      batteryLevel = await locator.get<CommonBattery>().getBatteryLevel();
    } catch (e) {
      if (kDebugMode) {
        print("❌ Error getting location or battery level: $e");
      }
    }

    PunchoutPostModel postModel = PunchoutPostModel(
      createdAt: DateTime.now().toString(),
      latitude: lat,
      longitude: lon,
      batteryStatus: batteryLevel.toString(),
      punchInOutDistance:
          (pinchinTimeOdometerValue != 0 && pinchinTimeOdometerValue != null)
              ? pinchinTimeOdometerValue.toString()
              : '0',
      punchOutOdometerKMS: odometerController.text,
      vehicleId: selectedvehicleId.toString(),
      images: state.imageLists.map((e) => e.imageByes).toList(),
    );

    final result = await punchOutUseCase.execute(punchoutPostModel: postModel);
    result.fold((l) {
      emit(state.copyWith(
          punchOutFailure: true,
          apiFailModel: ApiFailedModel(
              statusCode: NetworkExceptions.getStatusCode(l),
              message: NetworkExceptions.getErrorTitle(l),
              errorMessage: NetworkExceptions.getErrorMessage(l))));
    }, (r) async {
      emit(state.copyWith(
        isSubmitting: false,
        punchOutSuccess: true,
        apiFailModel: null,
        loading: false,
        loaded: false,
      ));
      final keyValueStorage = locator.get<KeyValueStorage>();
      final dioclinet = locator.get<DioClient>();
      int batteryValue = 0;

      var battery = Battery();
      final postion = await commonLocationServices.getUserCurrentPosition();

      batteryValue = await battery.batteryLevel;
      String userDateTime = DateTime.now().toIso8601String();
      final response = await dioclinet.post(Endpoints.locationUrl, data: {
        "latitude": postion!.latitude.toString(),
        "longitude": postion.longitude.toString(),
        "userDateTime": userDateTime,
        "batteryStatus": batteryValue.toString(),
      }, headers: {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        keyValueStorage.sharedPreferences.remove(KeyValueStrings.isLoggedIn);
        // final secureStorage = FlutterSecureStorage();
        // await secureStorage.delete(key: KeyValueStrings.isLoggedInStorage);
        // final tokenStorage = await secureStorage.read(key: KeyValueStrings.isLoggedInStorage);
        // debugPrint(tokenStorage);
        odometerController.text = "";
        selectedvehicleId = 0;
      //    if (Platform.isIOS) {
      //    stopTrackingLocation();
      // } 

        // await FirebaseMessaging.instance.unsubscribeFromTopic('news');
      } else {}
      // TODO: COMMENTING THIS FOR TESTING
      // keyValueStorage.sharedPreferences.clear();
      //   if(isLogoutClicked != null && isLogoutClicked == true) {
      // return;
      // }
      //  await getLastPunchInOutData();
    });
  }
}
