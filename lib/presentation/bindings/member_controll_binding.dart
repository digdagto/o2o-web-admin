import 'package:get/get.dart';
import 'package:o2o_point_configuration/data/repositories/member_repository_impl.dart';
import 'package:o2o_point_configuration/data/services/auth_service_impl.dart';
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';
import 'package:o2o_point_configuration/domain/services/auth_service.dart';
import 'package:o2o_point_configuration/domain/usecases/member/add_member_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/delete_member_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/get_members_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/update_member_points_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/update_member_usecase.dart';
import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:o2o_point_configuration/presentation/controllers/member_controller.dart';
import 'package:o2o_point_configuration/presentation/controllers/token_controller.dart';

class MemberControllerBinding implements Bindings {
  final Map<String, dynamic> queryParameters;

  MemberControllerBinding({required this.queryParameters});


  @override
  void dependencies() {
    print("binding");
    Get.lazyPut<AuthService>(() => AuthServiceImpl());
    Get.lazyPut<MemberRepository>(() => MemberRepositoryImpl(numberOfDummyData: 20));
    Get.lazyPut<ConfigurationController>(() => ConfigurationController(queryParameters: queryParameters));
    Get.lazyPut<AddMemberUseCase>(() => AddMemberUseCase(repository: Get.find()));
    Get.lazyPut<DeleteMemberUseCase>(() => DeleteMemberUseCase(repository: Get.find()));
    Get.lazyPut<UpdateMemberUseCase>(() => UpdateMemberUseCase(repository: Get.find()));
    Get.lazyPut<UpdateMemberPointsUseCase>(() => UpdateMemberPointsUseCase(repository: Get.find()));
    Get.lazyPut<GetMembersUseCase>(() => GetMembersUseCase(repository: Get.find()));
    Get.lazyPut<MemberController>(() => MemberController(
      addMemberUseCase: Get.find(),
      deleteMemberUseCase: Get.find(),
      updateMemberUseCase: Get.find(),
      updateMemberPointsUseCase: Get.find(),
      getMembersUseCase: Get.find(),
    ));
  }
}