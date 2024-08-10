import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/kyc_remarks_field.dart';

import '../../../../../../shared/domain/model/Image/image_model.dart';

part 'kyc_upload_state.freezed.dart';

@freezed
class KycUploadState with _$KycUploadState {
  const factory KycUploadState({
    required bool isLoading,
    @Default(null) ImageModel? adharFileFront, 
    @Default(null) ImageModel? adharFileBack, 
    @Default(null) ImageModel? panFile, // Already nullable, kept as is
    @Default(null) ImageModel? gstFile, // Already nullable, kept as is
    required KycRemarksField remarksField,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @Default(null) String? errorMessage,
  }) = _KycUploadState;

  factory KycUploadState.initial() => KycUploadState(
        isLoading: false,
        remarksField: KycRemarksField(''),
        adharFileFront: null,
        adharFileBack: null,
        isSuccess : false,
        errorMessage: null,
        gstFile: null,

        
        panFile: null,isSubmitting: false
      );
}