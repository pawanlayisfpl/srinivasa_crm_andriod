// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/repo/profile_repo.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalRepo profileLocalRepo;
  ProfileRepoImpl({
    required this.profileLocalRepo,
  });

  @override
  Future<Either<String, ProfileModel?>> getLocalUserProfile() async {
    try {
      final profileData = await profileLocalRepo.getLocalUserProfile();
      return Right(profileData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> saveLocalUserProfile({required ProfileModel profileModel})  async{
    try {
      final result = await profileLocalRepo.saveLocalUserProfile(profileModel: profileModel);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
