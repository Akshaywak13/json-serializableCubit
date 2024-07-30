// import 'dart:convert';

// import 'package:erp_demo/app/practic%20json/user_model.dart';
// import 'package:flutter/material.dart';

// class PracticDemo extends StatefulWidget {
//   const PracticDemo({super.key});

//   @override
//   State<PracticDemo> createState() => _PracticDemoState();
// }

// class _PracticDemoState extends State<PracticDemo> {
//   UserModel userObject = new UserModel(
//       id: "001", email: "akshay@gmail.com", fullname: "Akshay wak");
//   String userJson =
//       '{"id": "001", "fullnaem":"Akshay wak", "email":"akshay@gmail.com"}';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 Map<String, dynamic> userMap = userObject.toMap();
//                 var json = jsonEncode(userMap);
//                 print(json.toString());
//               },
//               child: Text('Serialize')),
//           const SizedBox(
//             width: 25,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 var decoded = jsonDecode(userJson);
//                 Map<String, dynamic> userMap = decoded;
//                 UserModel newUser = new UserModel.fromMap(userMap);
//                 print(newUser.fullname.toString());
//               },
//               child: Text('De-Serialize'))
//         ],
//       )),
//     );
//   }
// }

import 'dart:convert';

import 'package:erp_demo/app/practic/user_model.dart';
import 'package:flutter/material.dart';

class PracticDemo extends StatefulWidget {
  const PracticDemo({super.key});

  @override
  State<PracticDemo> createState() => _PracticDemoState();
}

class _PracticDemoState extends State<PracticDemo> {
  UserModel userObject = new UserModel(
      id: "001", email: "akshay@gmail.com", fullname: "Akshay wak");
  String userJson =
      '{"id": "001", "fullname":"Akshay wak", "email":"akshay@gmail.com"}'; // Fixed the typo here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Map<String, dynamic> userMap = userObject.toMap();
                var json = jsonEncode(userMap);
                print(json.toString());
              },
              child: Text('Serialize')),
          const SizedBox(
            width: 25,
          ),
          ElevatedButton(
              onPressed: () {
                var decoded = jsonDecode(userJson);
                Map<String, dynamic> userMap = decoded;
                UserModel newUser = new UserModel.fromMap(userMap);
                print(newUser.email.toString());
              },
              child: Text('De-Serialize'))
        ],
      )),
    );
  }
}

