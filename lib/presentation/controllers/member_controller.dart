
import 'package:get/get.dart';
import 'package:o2o_point_configuration/domain/entities/member.dart';
import 'package:o2o_point_configuration/domain/usecases/member/add_member_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/delete_member_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/get_members_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/update_member_points_usecase.dart';
import 'package:o2o_point_configuration/domain/usecases/member/update_member_usecase.dart';


class MemberController extends GetxController {
  final AddMemberUseCase _addMemberUseCase;
  final DeleteMemberUseCase _deleteMemberUseCase;
  final UpdateMemberUseCase _updateMemberUseCase;
  final UpdateMemberPointsUseCase _updateMemberPointsUseCase;
  final GetMembersUseCase _getMembersUseCase;

  MemberController({
    required AddMemberUseCase addMemberUseCase,
    required DeleteMemberUseCase deleteMemberUseCase,
    required UpdateMemberUseCase updateMemberUseCase,
    required UpdateMemberPointsUseCase updateMemberPointsUseCase,
    required GetMembersUseCase getMembersUseCase,
  })  : _addMemberUseCase = addMemberUseCase,
        _deleteMemberUseCase = deleteMemberUseCase,
        _updateMemberUseCase = updateMemberUseCase,
        _updateMemberPointsUseCase = updateMemberPointsUseCase,
        _getMembersUseCase = getMembersUseCase;

  @override
  void onInit() {
    super.onInit();
    // fetchUsers();
    getMembers();
  }

  final members = <Member>[].obs;



  Future<void> addMember(Member member) async {
    await _addMemberUseCase.call(member);
    members.add(member);
  }

  Future<void> deleteMember(String name, String phone) async {
    await _deleteMemberUseCase.call(name, phone);
    members.removeWhere((m) => m.name == name && m.phone == phone);
  }

  Future<void> updateMember(Member member) async {
    await _updateMemberUseCase.call(member);
    int index = members.indexWhere((m) => m.name == member.name && m.phone == member.phone);
    if (index != -1) {
      members[index] = member;
    }
  }

  Future<void> updateMemberPoints(String name, String phone, int points) async {
    await _updateMemberPointsUseCase.call(name, phone, points);
    int index = members.indexWhere((m) => m.name == name && m.phone == phone);
    if (index != -1) {
      members[index] = members[index].copyWith(point: points);
    }
  }

  Future<List<Member>?> getMembers() async{
    final memberList = await _getMembersUseCase.call();
    members.value = memberList;
    return memberList ?? [];
  }
}