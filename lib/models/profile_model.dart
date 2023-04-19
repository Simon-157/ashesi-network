class Profile {
  late String user_id;
  late String name;
  late String dob;
  late String email;
  late String student_id;
  late String favFod;
  late String major;
  late String residence;
  late String yearGroup;

  Profile({
    required this.user_id,
    required this.name,
    required this.dob,
    required this.email,
    required this.student_id,
    required this.favFod,
    required this.major,
    required this.residence,
    required this.yearGroup,
  });

  Profile.fromJson(json) {
    name = json['name'];
    email = json['email'];
    user_id = json['user_id'];
    major = json['major'];
    yearGroup = json['yearGroup'];
    favFod = json['favFod'];
    student_id = json['student_id'];
    dob = json['dob'];
    residence = json['residence'];
    // DateTime.fromMillisecondsSinceEpoch(json['date_of_birth'] * 1000);
  }
}
