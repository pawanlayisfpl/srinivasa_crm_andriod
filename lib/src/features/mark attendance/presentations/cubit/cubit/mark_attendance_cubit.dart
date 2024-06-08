// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/domain.dart';
import 'mark_attendance_state.dart';

@injectable
class MarkAttendanceCubit extends Cubit<MarkAttendanceState> {
  final PunchInUseCase punchInUseCase;
  final PunchOutUsecase punchOutUseCase;
  final LastPunchInOutUseCase getLastPunchInOutDetailsUseCase;

  MarkAttendanceCubit(
    this.punchInUseCase,
    this.punchOutUseCase,
    this.getLastPunchInOutDetailsUseCase,
  ) : super(const MarkAttendanceState.initial());

  // GET LAST PUNCH IN-OUT DATA
  Future<void> getLastPunchInOutData() async {
    
    emit(const MarkAttendanceState.loading());
    final results = await getLastPunchInOutDetailsUseCase.execute();
    results.fold((l) => emit(MarkAttendanceState.error(NetworkExceptions.getErrorMessage(l))), (r) => emit(MarkAttendanceState.loaded(lastPunchInResponseModel: r)));
  }

  // PUNCH LOGIC
  Future<void> punchInLogic({required PunchInPostModel punchInPostModel}) async {
    emit(const MarkAttendanceState.loading());
    final result = await punchInUseCase.execute(punchInPostModel: punchInPostModel);
   result.fold((l) => emit(MarkAttendanceState.punchInFailure(l.toString())), (r) => emit(MarkAttendanceState.punchInSuccess(r.message.toString())));
  } 


   // PUNCHOUT LOGIC
  Future<void> punchOutLogic({required PunchoutPostModel punchoutPostModel}) async {
    emit(const MarkAttendanceState.loading());
    final result = await punchOutUseCase.execute(punchoutPostModel: punchoutPostModel);
   result.fold((l) => emit(MarkAttendanceState.punchInFailure(l.toString())), (r) => emit(MarkAttendanceState.punchInSuccess(r.message.toString())));
  } 
}
