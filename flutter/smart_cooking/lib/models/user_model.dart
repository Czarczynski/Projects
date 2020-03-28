class UserModel{
  String id, userName, firstName, lastName, phoneNumber, starred, lastVisited, creationDate;

  UserModel(this.id, this.userName, this.firstName, this.lastName,
      this.phoneNumber, this.starred, this.lastVisited, this.creationDate);
  
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(json['Id'], json['Username'], json['FirstName'], json['LastName'],
        json['PhoneNumber'], json['Starred'], json['LastVisited'], json['CreatedDate']);
  }


}