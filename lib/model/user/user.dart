class UserAuth {
  String id;
  String displayName;
  String email;
  String photoURL;

  UserAuth();
  UserAuth.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        displayName = map["display_name"],
        email = map["email"],
        photoURL = map["photo"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data["display_name"] = displayName;
    data["email"] = email;
    data["photo"] = photoURL;
    return data;
  }
}
