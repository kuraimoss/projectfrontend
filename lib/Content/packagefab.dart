import 'package:flutter/material.dart';

class packageFab extends StatefulWidget {
  const packageFab({Key? key}) : super(key: key);

  @override
  State<packageFab> createState() => _packageFabState();
}

class _packageFabState extends State<packageFab> {
  bool isExpandedCaraPakai = false;
  bool isExpandedSyaratKetentuan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF107d72),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kura Coffee Package',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 100,
            child: Container(
              color: Color(0xFF107d72), // Warna bagian atas
            ),
          ),
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white, // Warna bagian bawah
            ),
          ),
          Positioned(
            top: 150,
            left: 40,
            right: 40,
            height: 500, // Ubah tinggi rectangle sesuai kebutuhan
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Warna rectangle di tengah
                borderRadius: BorderRadius.circular(12), // Rounded
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Warna shadow
                    spreadRadius: 2, // Menyebar
                    blurRadius: 5, // Kabur
                    offset: Offset(0, 5), // Offset (0,3) untuk shadow di bawah
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Warna shadow
                    spreadRadius: 1, // Menyebar
                    blurRadius: 1, // Kabur
                    offset: Offset(-1, 0), // Offset (-3,0) untuk shadow di kiri
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Warna shadow
                    spreadRadius: 1, // Menyebar
                    blurRadius: 1, // Kabur
                    offset: Offset(1, 0), // Offset (3,0) untuk shadow di kanan
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Center(
                      child: Text(
                        'Monthly Package',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            Color(0xFFd9d9d9), // Warna teks di dalam rectangle
                        borderRadius: BorderRadius.circular(30), // Rounded
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hemat Hingga ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Rp 60.000',
                              style: TextStyle(
                                color: Color(0xFF107d72), // Warna Rp 60.000
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 21,
                    right: 21,
                    child: Container(
                      height: 35,
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Keuntungan',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 16,
                    right: 16,
                    height: 140, // Ubah tinggi rectangle sesuai kebutuhan
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFd3e3e1), // Warna rectangle di tengah
                        borderRadius: BorderRadius.circular(20), // Rounded
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 18,
                    right: 40,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Potongan belanja Rp 15000',
                              style: TextStyle(
                                color: Color(0xFF107d72), // Warna Rp 60.000
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1.5,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 0,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 35,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Min. Transaksi ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Rp 40.000',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Penggunaan ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              '1x Per hari',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Masa Belaku ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              '30 hari',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 330,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            Color(0xFFd9d9d9), // Warna teks di dalam rectangle
                        borderRadius: BorderRadius.circular(12), // Rounded
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 12), // Spasi antara ikon dan teks

                          Icon(
                            Icons.info, // Ganti 'icon' dengan ikon yang sesuai
                            color: Colors.black,
                          ),
                          SizedBox(width: 8), // Spasi antara ikon dan teks
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Berlaku sekali pembelian dalam 1 periode',
                                    style: TextStyle(
                                        color: Color(
                                            0xFF107d72), // Warna Rp 60.000
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 440,
                    left: 16,
                    right: 16,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpandedCaraPakai = !isExpandedCaraPakai;

                                isExpandedSyaratKetentuan = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cara Pakai Voucher',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  isExpandedCaraPakai
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_right,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          if (isExpandedCaraPakai)
                            Text(
                              'Teks untuk cara pakai voucher yang panjang...',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpandedSyaratKetentuan =
                                    !isExpandedSyaratKetentuan;

                                isExpandedCaraPakai = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Syarat & Ketentuan',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  isExpandedSyaratKetentuan
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_right,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          if (isExpandedSyaratKetentuan)
                            Text(
                              'Teks untuk syarat & ketentuan yang panjang...',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 680,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika logout di sini
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF107d72)), // Warna latar belakang tombol
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Warna teks tombol
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), 
                  ))),
              child: Text('Beli Paket - Rp. 20.000'),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: packageFab(),
  ));
}
