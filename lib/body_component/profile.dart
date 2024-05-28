import 'package:flutter/material.dart';
import 'package:kelompok/Provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<myProv>(
          builder: (context, profileProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/profil.jpg')
                          as ImageProvider<Object>?,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  icon: Icon(Icons.edit_outlined, size: 18),
                  label: Text('Edit Profile'),
                ),
                buildField('Name', profileProvider.name),
                buildField('Email', profileProvider.email),
                buildField('Phone Number', profileProvider.phoneNumber),
                buildDateField('Birth Date', profileProvider.birthDate),
                buildField('Jenis Kelamin', profileProvider.gender),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(flex: 4, child: Text('Dark Mode')),
                    Expanded(
                      flex: 4,
                      child: Switch(
                        value: profileProvider.isDarkMode,
                        onChanged: (value) {
                          profileProvider.toggleDarkMode();
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika logout di sini
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF107d72)), // Warna latar belakang tombol
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Warna teks tombol
                      ),
                      child: Text('Logout'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika hapus akun di sini
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red), // Warna latar belakang tombol
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Warna teks tombol
                      ),
                      child: Text('Hapus Akun'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildField(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(text: value),
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: label,
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateField(String label, DateTime value) {
    final formattedDate = '${value.day}/${value.month}/${value.year}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(text: formattedDate),
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: label,
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String _selectedGender = '';
  DateTime _selectedDate = DateTime.now();
  File? _image; // Variable to store selected image

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<myProv>(context, listen: false);
    _nameController.text = profileProvider.name;
    _emailController.text = profileProvider.email;
    _phoneNumberController.text = profileProvider.phoneNumber;
    _selectedGender = profileProvider.gender;
    _selectedDate = profileProvider.birthDate;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<myProv>(context,
        listen: false); // Deklarasikan di dalam build

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/profil.jpg')
                          as ImageProvider<Object>?,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: _getImage,
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt), // Tambahkan ikon di sini
                        SizedBox(width: 10), // Beri jarak antara ikon dan teks
                        Text(
                          'Change Profile Picture',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            InkWell(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (selectedDate != null) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Birth Date',
                  border: UnderlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    ),
                    Icon(Icons.edit_calendar_outlined),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                profileProvider.updateName(_nameController.text);
                profileProvider.updateEmail(_emailController.text);
                profileProvider.updatePhoneNumber(_phoneNumberController.text);
                profileProvider.updateGender(_selectedGender);
                profileProvider.updateBirthDate(_selectedDate);
                // Tambahkan pembaruan path gambar profil jika diperlukan
                if (_image != null) {
                  profileProvider.updateProfileImagePath(_image!.path);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your profile has been successfully edited'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xFF107d72)
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        // Perbarui path gambar profil di provider nya
        final profileProvider = Provider.of<myProv>(context, listen: false);
        profileProvider.updateProfileImagePath(pickedFile.path);
      } else {
        // Jika pengguna tidak memilih gambar, gunakan gambar profil default dari provider
        final profileProvider = Provider.of<myProv>(context, listen: false);
        String defaultImagePath = profileProvider.profileImagePath;

        if (defaultImagePath == 'assets/profil.jpg' ||
            defaultImagePath.isEmpty) {
          // Jika path gambar profil default tidak diatur atau kosong, gunakan gambar default bawaan aplikasi
          _image = null; // Atur gambar menjadi null
        } else {
          // Jika path gambar profil default tersedia di provider, gunakan itu
          _image = File(defaultImagePath);
        }
      }
    });
  }
}
