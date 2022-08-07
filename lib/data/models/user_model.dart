class UserProfile {
  String? id;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? userName;
  String? photo;
  String? bio;
  String? bioDetail;
  String? fcmToken;
  String? roleName;
  String? appVersion;
  String? deviceId;
  String? loginDevice;
  String? gender;
  String? dateOfBirth;
  String? socialLink;

  UserProfile(
      {this.id,
        this.password,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.userName,
        this.photo,
        this.bio,
        this.bioDetail,
        this.fcmToken,
        this.roleName,
        this.appVersion,
        this.loginDevice,this.socialLink,
        this.gender,this.dateOfBirth,
        this.deviceId});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    userName = json['userName'];
    photo = json['photo'];
    bio = json['bio'];
    bioDetail = json['bioDetail'];
    fcmToken = json['fcmToken'];
    roleName = json['roleName'];
    appVersion = json['appVersion'];
    deviceId = json['deviceId'];
    loginDevice = json['loginDevice'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    socialLink = json['socialLink'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['userName'] = userName;
    data['photo'] = photo;
    data['bio'] = bio;
    data['bioDetail'] = bioDetail;
    data['fcmToken'] = fcmToken;
    data['roleName'] = roleName;
    data['appVersion'] = appVersion;
    data['deviceId'] = deviceId;
    data['loginDevice'] = loginDevice;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['socialLink'] = socialLink;
    return data;
  }
}