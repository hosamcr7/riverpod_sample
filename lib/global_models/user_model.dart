
class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.phone, 
      this.token,
      this.id,
      this.photo,
     });

  UserModel.fromJson(dynamic json) {
    name = json['name']??'';
    token = json['token']??'';
    email = json['email']??'';
    phone = json['phone']??'';
    bio = json['bio']??'';
    id = json['id'];
    photo = json['photo']??'https://media.istockphoto.com/vectors/avatar-vector-icon-simple-element-illustrationavatar-vector-icon-vector-id1208175274?k=20&m=1208175274&s=612x612&w=0&h=Ud2p5iidw5UDWGrzyuSiQ8eO08qzoqv_BAxnwx9qf1A=';
  }
  String? name;
  String? email;
  String? phone;
  String? token;
  String? bio;
  dynamic id;
  String? photo;

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? token,
    String? bio,
    String? photo,
    String? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      id: bio ?? this.id,
      photo: photo ?? this.photo,
    );
  }
}