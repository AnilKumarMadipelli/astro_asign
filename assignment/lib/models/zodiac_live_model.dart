class LiveZodiacCardModel {
  String title;
  String userName;
  String userImagePath;
  bool isNetworkImage;
  String viewsCount;

  LiveZodiacCardModel({
    required this.title,
    required this.userName,
    required this.userImagePath,
    required this.isNetworkImage,
    required this.viewsCount,
  });

  factory LiveZodiacCardModel.fromJson(Map<String, dynamic> json) =>
      LiveZodiacCardModel(
        title: json["title"],
        userName: json["userName"],
        userImagePath: json["userImagePath"],
        isNetworkImage: json["isNetworkImage"],
        viewsCount: json["viewsCount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "userName": userName,
        "userImagePath": userImagePath,
        "isNetworkImage": isNetworkImage,
        "viewsCount": viewsCount,
      };
}
