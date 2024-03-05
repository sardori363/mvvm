import 'dart:convert';

List<User> postModelFromJson(String str) =>
    List.from(jsonDecode(str).map((e) => User.fromJson(e)));
String postModelToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? bloodGroup;
  int? height;
  double? weight;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.bloodGroup,
    this.height,
    this.weight,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
    };
  }
}


// class UserProvider extends ChangeNotifier {
//   List<User> _products = [];

//   List<User> get products => _products;

//   Future<void> fetchUsers() async {
//     try {
//       QuerySnapshot snapshot =
//           await FirebaseFirestore.instance.collection('Users').get();
//       _products = snapshot.docs.map((doc) {
//         return User(
//           name: doc['name'],
//           age: doc['age'],
//           email: doc['email'],
//         );
//       }).toList();
//       notifyListeners();
//     } catch (e) {
//       print('Error fetching products from Firestore: $e');
//     }
//   }

//   Future<void> addUser(User user) async {
//     try {
//       await FirebaseFirestore.instance.collection('Users').add({
//         'name': user.name,
//         'age': user.age,
//         'email': user.email,
//       });
//     } catch (e) {
//       print('Error adding product: $e');
//     }
//   }
// }
