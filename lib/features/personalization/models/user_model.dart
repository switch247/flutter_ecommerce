import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id, userName, email;
  String firstName, lastName, phoneNumber, profilePicture;
  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.profilePicture});

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String first = nameParts[0].toLowerCase();
    String last = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String prefixedCamelCaseUsername = 'usr_$first $last';
    return prefixedCamelCaseUsername;
  }

  // create empty user model
  static UserModel empty() => UserModel(
      id: '',
      userName: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

  // convert to json for storing in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture
    };
  }

  // factory method to create user model from a firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return empty();
    }
  }
}
