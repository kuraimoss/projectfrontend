// // MyProfile.dart
// import 'package:flutter/material.dart';
// import 'package:kelompok/Provider/provider.dart';
// import 'package:provider/provider.dart';

// class MyProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer<myProv>(
//           builder: (context, profileProvider, _) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 30),
//                 Text(
//                   'My Profile',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(
//                       'assets/profil.jpg'), // Replace 'assets/profile_photo.jpg' with your actual image path
//                 ),
//                 SizedBox(height: 20),
//                 buildField(
//                   'Name',
//                   profileProvider.name,
//                   () => _showEditDialog(
//                     context,
//                     profileProvider,
//                     'Name',
//                     profileProvider.name,
//                     (String newName) {
//                       profileProvider.updateName(newName);
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 buildField(
//                   'Email',
//                   profileProvider.email,
//                   () => _showVerifyEmailDialog(
//                     context,
//                     profileProvider,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 buildField(
//                   'Phone Number',
//                   profileProvider.phoneNumber,
//                   () => _showVerifyNumberDialog(
//                     context,
//                     profileProvider,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 buildDateField(
//                   'Birth Date',
//                   profileProvider.birthDate,
//                   () => _showDatePicker(
//                     context,
//                     profileProvider,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 buildField(
//                   'Jenis Kelamin',
//                   profileProvider.gender,
//                   () => _showEditGenderDialog(
//                     context,
//                     profileProvider,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(flex: 1, child: SizedBox()),
//                     Expanded(flex: 4, child: Text('Dark Mode')),
//                     Expanded(
//                       flex: 4,
//                       child: Switch(
//                         value: profileProvider.isDarkMode,
//                         onChanged: (value) {
//                           profileProvider.toggleDarkMode();
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Tambahkan logika logout di sini
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Color(0xFF107d72)), // Warna latar belakang tombol
//                         foregroundColor: MaterialStateProperty.all<Color>(
//                             Colors.white), // Warna teks tombol
//                       ),
//                       child: Text('Logout'),
//                     ),
//                     SizedBox(width: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Tambahkan logika hapus akun di sini
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.red), // Warna latar belakang tombol
//                         foregroundColor: MaterialStateProperty.all<Color>(
//                             Colors.white), // Warna teks tombol
//                       ),
//                       child: Text('Hapus Akun'),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildField(
//     String label,
//     String value,
//     VoidCallback onTap,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextField(
//               readOnly: true,
//               controller: TextEditingController(text: value),
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 labelText: label,
//                 labelStyle: TextStyle(color: Colors.grey),
//                 contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.edit_outlined),
//                   onPressed: onTap,
//                 ),
//               ),
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildDateField(
//     String label,
//     DateTime value,
//     VoidCallback onTap,
//   ) {
//     final formattedDate = '${value.day}/${value.month}/${value.year}';
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextField(
//               readOnly: true,
//               controller: TextEditingController(text: formattedDate),
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 labelText: label,
//                 labelStyle: TextStyle(color: Colors.grey),
//                 contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.edit_calendar_outlined),
//                   onPressed: onTap,
//                 ),
//               ),
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showEditDialog(
//     BuildContext context,
//     myProv profileProvider,
//     String title,
//     String currentValue,
//     Function(String) onSave,
//   ) {
//     String newValue = currentValue;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit $title'),
//           content: TextField(
//             onChanged: (value) {
//               newValue = value;
//             },
//             decoration: InputDecoration(hintText: 'Enter new $title'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 onSave(newValue);
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDatePicker(BuildContext context, myProv profileProvider) async {
//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: profileProvider.birthDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (selectedDate != null) {
//       profileProvider.updateBirthDate(selectedDate);
//     }
//   }

//   void _showVerifyEmailDialog(BuildContext context, myProv profileProvider) {
//     String newEmail = profileProvider.email;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//               'Enter the verification code sent to your current email: $newEmail'),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(
//               4,
//               (index) => SizedBox(
//                 width: 50,
//                 child: TextField(
//                   maxLength: 1,
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     counterText: '',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _showEditNewEmailDialog(context, profileProvider);
//               },
//               child: Text('Verify'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showVerifyNumberDialog(BuildContext context, myProv profileProvider) {
//     String phoneNumber = profileProvider.phoneNumber;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//               'Enter the verification code sent to your current phone number: $phoneNumber'),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(
//               4,
//               (index) => SizedBox(
//                 width: 50,
//                 child: TextField(
//                   maxLength: 1,
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     counterText: '',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _showEditNewNumberDialog(context, profileProvider);
//               },
//               child: Text('Verify'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditGenderDialog(BuildContext context, myProv profileProvider) {
//     String newGender = profileProvider.gender;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Gender'),
//           content: DropdownButtonFormField<String>(
//             value: newGender,
//             onChanged: (value) {
//               newGender = value!;
//             },
//             items: ['Male', 'Female']
//                 .map((gender) => DropdownMenuItem(
//                       value: gender,
//                       child: Text(gender),
//                     ))
//                 .toList(),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 profileProvider.updateGender(newGender);
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditNewEmailDialog(BuildContext context, myProv profileProvider) {
//     String newEmail = profileProvider.email;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Email'),
//           content: TextField(
//             onChanged: (value) {
//               newEmail = value;
//             },
//             decoration: InputDecoration(hintText: 'Enter your new email'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 profileProvider.updateEmail(newEmail);
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditNewNumberDialog(BuildContext context, myProv profileProvider) {
//     String phoneNumber = profileProvider.phoneNumber;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit Phone Number'),
//           content: TextField(
//             onChanged: (value) {
//               phoneNumber = value;
//             },
//             decoration:
//                 InputDecoration(hintText: 'Enter your new phone number'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 profileProvider.updatePhoneNumber(phoneNumber);
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
