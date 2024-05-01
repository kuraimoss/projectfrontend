import 'package:flutter/material.dart';

class myDashboard extends StatefulWidget {
  const myDashboard({super.key});

  @override
  State<myDashboard> createState() => _myDashboardState();
}

class _myDashboardState extends State<myDashboard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth =
        screenWidth * 0.4; // Misalnya, 60% dari lebar layar
    final double aspectRatio =
        16 / 9; // Sesuaikan aspek rasio gambar sesuai kebutuhan
    final double imageHeight = imageWidth / aspectRatio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Ganti dengan warna yang Anda inginkan
        title: Text(
          'KURA SHOP', // Ganti dengan teks yang Anda inginkan
          style: TextStyle(
            color: Colors.white, // Ganti dengan warna teks yang Anda inginkan
            fontSize: 20, // Atur ukuran teks yang Anda inginkan
            fontWeight: FontWeight.bold, // Atur gaya teks yang Anda inginkan
          ),
        ),
        centerTitle: true, // Untuk menempatkan teks di tengah
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40, // Atur sesuai kebutuhan Anda
            height: 40, // Atur sesuai kebutuhan Anda
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 18, // Atur radius sesuai kebutuhan Anda
              backgroundColor: Colors
                  .transparent, // Set transparan agar tepi lingkaran tidak terlihat
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png', // Ganti dengan path logo Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                            Icons.search), // Tambahkan ikon pencarian di sini
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4), // Atur padding
                    ),
                    style: TextStyle(fontSize: 16), // Atur ukuran teks
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 3, child: Text('BURGER CAFE'))
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(5.0), // Sesuaikan dengan kebutuhan
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                      ),
                      child:
                          Text('Burger', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                // Tambahkan Padding di sekitar tombol-tombol yang lain sesuai kebutuhan
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                      ),
                      child:
                          Text('Sosis', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                      ),
                      child:
                          Text('Snack', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(Icons.double_arrow),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://tse3.mm.bing.net/th?id=OIP.F4ORZTSoWecpMTKKi4_GFAHaFN&pid=Api&P=0&h=220', // Ganti dengan path gambar Anda
                            width:
                                imageWidth, // Lebar gambar sesuai dengan persentase lebar layar
                            height:
                                imageHeight, // Tinggi gambar sesuai dengan aspek rasio
                            fit: BoxFit.contain, // Sesuaikan tata letak gambar
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2, child: Text('Classic Burger')),
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'A juicy beef patty with lettuce and our sauce',
                                          style: TextStyle(
                                            fontSize: 11, // Ukuran font
                                            fontWeight: FontWeight
                                                .normal, // Ketebalan font
                                            color: Colors.black, // Warna teks
                                            fontStyle: FontStyle
                                                .italic, // Gaya font (misalnya: italic)
                                          ),
                                        )),
                                  ],
                                ),
Row(
  children: [
    Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          // Tambahkan logika untuk onPressed di sini
          print('Tombol ditekan!');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        ),
        child: Text(
          'Tekan',
          style: TextStyle(fontSize: 12), // Ubah ukuran font sesuai kebutuhan
        ),
      ),
    ),
  ],
)

                                // Menambahkan teks 'bbb' di bawah teks 'aaa'
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spasi antara item
              ],
            )
          ],
        ),
      ),
    );
  }
}
