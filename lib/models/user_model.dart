class UsrerModel {
  final String userName;
  final String email;
  final dynamic time;

  final String password;
  final GroupMember? groubMember;

  UsrerModel(
      {required this.userName,
      required this.email,
      this.time,
      required this.password,
      required this.groubMember});

  toJason() {
    return {
      'username': userName,
      'email': email,
      'password': password,
      'group member': groubMember?.toJason(),
      'createdOn': DateTime.now(),
    };
  }

  factory UsrerModel.fromJason(Map<String, dynamic> Jason) => UsrerModel(
      userName: Jason['username'],
      email: Jason['email'],
      time: Jason['createdOn'],
      password: Jason['password'],
      groubMember: GroupMember.fromJason(Jason['group member']));
}

class GroupMember {
  final String? email;

  GroupMember(this.email);
  toJason() {
    return {
      'email': email,
    };
  }

  factory GroupMember.fromJason(Map<String, dynamic>? Jason) => GroupMember(
        Jason?['email'],
      );
}

String? uid;
