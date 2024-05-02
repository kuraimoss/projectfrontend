import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok/Activity/verify.dart';

class Resetpw extends StatelessWidget {
  const Resetpw({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth =
        screenWidth * 0.6; // Misalnya, 60% dari lebar layar
    final double aspectRatio =
        16 / 9; // Sesuaikan aspek rasio gambar sesuai kebutuhan
    final double imageHeight = imageWidth / aspectRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  "Reset Password",
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
                  "Enter your email and we'il send you a link reset password",
                  textAlign: TextAlign.center,
                ))
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: Text('Email'),
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyEmailScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                      ),
                      child: Text(
                        'Reset Password',
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
            TextButton(
              onPressed: () {
                // Handle "Try another way" button
              },
              child: Text('Try another way'),
            ),
          ]),
        ),
      ),
    );
  }
}
