


import 'package:injectable/injectable.dart';

import '../common.dart';



@lazySingleton
class ExcelServices {
  final CommonSharePlusServices sharePlusServices;
  final CommonFileStorageServcies fileStorageServcies;

  ExcelServices({required this.sharePlusServices, required this.fileStorageServcies});


  //! CREATE LAT-LONG -EXCEL-FILE
//   Future<void> createLatLngExcelFile(
//       List<Customer> customers, bool isSharingEnabled) async {
//     PermissionStatus status = await Permission.storage.request();

//     if (status.isGranted) {
//       // Create Excel instance
//       final Excel excel = Excel.createExcel();

//       // Access the default sheet (Sheet1)
//       final Sheet sheet = excel['Sheet1'];

//       // Define cell style
//       final CellStyle cellStyle = CellStyle(
//         bold: true,
//         italic: true,
//         textWrapping: TextWrapping.WrapText,
//         fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
//         rotation: 0,
//       );
// // Add headers
//       sheet.appendRow([
//         const TextCellValue('Name'),
//         const TextCellValue('Phone'),
//         const TextCellValue('Address'),
//         const TextCellValue("City"),
//         const TextCellValue("State"),
//         const TextCellValue('Pincode'),
//         const TextCellValue('Company Name'),
//         const TextCellValue("Latitude"),
//         const TextCellValue("Longitude"),
//       ]);

//       final sortedList = List.from(customers)
//         ..sort((a, b) => a.customerName.compareTo(b.customerName));
//       for (Customer customer in sortedList) {
//         sheet.appendRow([
//           TextCellValue(customer.customerName),
//           TextCellValue(customer.customerPhone),
//           TextCellValue(customer.customerAddress),
//           TextCellValue(customer.customerCity),
//           TextCellValue(customer.customerState),
//           TextCellValue(customer.customerPincode),
//           TextCellValue(customer.companyName),
//           TextCellValue(customer.customerLatLng.latitude.toString()),
//           TextCellValue(customer.customerLatLng.longitude.toString()),
//         ]);
//       }

// // Add user data
//       // for (LocationModel user in users.locationLists) {
//       //   sheet.appendRow([
//       //     TextCellValue(users.name),
//       //     TextCellValue(DateFormat.yMd().format(DateTime.now())),
//       //     TextCellValue(DateFormat.Hms().format(DateTime.now()).toString()),
//       //     TextCellValue(DateFormat.Hms().format(DateTime.now()).toString()),
//       //     TextCellValue(
//       //         user.latitude.toString()), // Append latitude to the same row
//       //     TextCellValue(
//       //         user.longtitude.toString()) // Append longitude to the same row
//       //   ]);
//       // }

//       try {
//         // Save Excel file
//         final List<int>? excelData = excel.encode();
//         final Directory? appDocDir = await getExternalStorageDirectory();
//         final String filePath =
//             '${appDocDir!.path}/${DateTime.now().toString()}.xlsx';

//         File file = File(filePath);
//         await file.writeAsBytes(excelData!);

//         try {
//           File file = await CommonFil.writeInt(
//               excelData, 'UsersLocation_${DateTime.now().toString()}', 'xlsx');
//           log('File saved successfully: ${file.path}');
//         } catch (e) {
//           log('Error creating Excel file: $e');
//         }

//         try {
//           OpenFile(filePath, true);
//         } catch (e) {
//           log('Error opening file: $e');
//         }

//         if (isSharingEnabled) {
//           await sharePlusServices.shareFilesMultipls(
//               filePaths: [XFile(filePath)],
//               text: "Share File",
//               subject: "Sharing user data");
//         }

//         // Show a toast message
//         Fluttertoast.showToast(msg: 'File saved to downlaods');

//         // Open the Excel file

//         log('Excel file created at: $filePath');
//       } catch (e) {
//         log('Error creating Excel file: $e');
//         // Handle the error as needed
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Permission Denied");
//     }
//   }

  //! create checkin excelsheet

  // Future<void> createCheckinHistory(
  //     {required List<WorkLocationModel> workLocationModelList,
  //     required bool isSharingEnabled}) async {
  //   try {
  //     final Excel excel = Excel.createExcel();
  //     final Sheet sheet = excel['Sheet1'];

  //     sheet.appendRow([
  //       const TextCellValue('Name'),
  //       const TextCellValue('Latitude'),
  //       const TextCellValue('Longitude'),
  //     ]);

  //     for (WorkLocationModel works in workLocationModelList) {
  //       sheet.appendRow([
  //         TextCellValue("Ajay Kumar"),
  //         TextCellValue(works.latitude.toString()),
  //         TextCellValue(works.longitude.toString()),
  //       ]);
  //     }

  //     final List<int>? excelData = excel.encode();
  //     final Directory? appDocDir = await getExternalStorageDirectory();
  //     final String filePath =
  //         '${appDocDir!.path}/${DateTime.now().toString()}.xlsx';

  //     File file = File(filePath);
  //     await file.writeAsBytes(excelData!);

  //     try {
  //       File file = await CommonFileStorageServcies.writeInt(
  //           excelData, 'UsersLocation_${DateTime.now().toString()}', 'xlsx');
  //       log('File saved successfully: ${file.path}');
  //     } catch (e) {
  //       log('Error creating Excel file: $e');
  //     }

  //     if (isSharingEnabled) {
  //       await sharePlusServices.shareFilesMultipls(
  //           filePaths: [XFile(filePath)],
  //           text: "Share File",
  //           subject: "Sharing user data");
  //     }

  //     // Show a toast message
  //     Fluttertoast.showToast(msg: 'File saved to downlaods');

  //     // Open the Excel file

  //     log('Excel file created at: $filePath');
  //   } catch (e) {
  //     log('UNABLE TO CRATE EXCEL SHEET FOR WORK LOCATION MODEL');
  //   }
  // }
}
