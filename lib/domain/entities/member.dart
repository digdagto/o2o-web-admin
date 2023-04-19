// member.dart
class Member {
  final String name;
  final String phone;
  final DateTime registeredDate;
  final int visitCount;
  final int point;

  Member({
    required this.name,
    required this.phone,
    required this.registeredDate,
    required this.visitCount,
    required this.point,
  });

  Member copyWith({
    String? name,
    String? phone,
    int? point,
    DateTime? registeredDate,
    int? visitCount,
  }) {
    return Member(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      point: point ?? this.point,
      registeredDate: registeredDate ?? this.registeredDate ,
        visitCount : visitCount?? this.visitCount,
    );
  }
}