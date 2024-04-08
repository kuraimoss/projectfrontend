import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok/Activity/daftar.dart';
import 'package:kelompok/Activity/resetpw.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth * 0.6; // Misalnya, 60% dari lebar layar
    final double aspectRatio = 16 / 9; // Sesuaikan aspek rasio gambar sesuai kebutuhan
    final double imageHeight = imageWidth / aspectRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body:
      Padding(padding: EdgeInsets.all(5.0),
      child:  
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Login",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Sign in to continue",
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),

                Row(
                  children: [
                    Expanded( child: SizedBox()),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            label: Text("Username")
                          ),
                        ),
                      ),
                    ),
                    Expanded( child: SizedBox()),
                  ],
                ),
              SizedBox(height: 15),
                Row(
                  children: [
                    Expanded( child: SizedBox()),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            label: Text('Password'),                      
                          ),
                        ),
                      ),
                    ),
                    Expanded( child: SizedBox()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Colors
                                .blue, // Warna latar belakang tombol// Gaya teks tombol
                          ),
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      
                      child: SizedBox(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Resetpw()),
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(flex: 3, child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => DaftarPage()),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                )
          ]),
        ),
      ),
    );
  }
}
