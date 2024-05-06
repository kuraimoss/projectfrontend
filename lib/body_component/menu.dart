import 'package:flutter/material.dart';
import 'package:kelompok/Content/detailPage.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  Map<int, bool> _isFavoriteMap =
      {}; // Variabel untuk menyimpan status ikon love

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/home.jpg',
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Color(0xFF357543), // warna ikon
                          ),
                          SizedBox(
                              width:
                                  10), // spasi antara ikon dan garis vertikal
                          Container(
                            width: 1, // lebar garis vertikal
                            height: 30,
                            color: Colors.grey[400],
                          ),
                          SizedBox(
                              width:
                                  10), // spasi antara garis vertikal dan teks
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Medan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '1.2 Km',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        width:
                                            10), // spasi antara alamat lokasi dan keterangan tambahan
                                    Text(
                                      'Terdekat',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF357543),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2.0), // Atur tinggi garis
            child: Container(
              color: Colors.white, // Warna garis
              height: 2.0, // Tinggi garis
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 1.0, color: Colors.grey), // Garis pemisah atas
            bottom: BorderSide(
                width: 1.0, color: Colors.grey), // Garis pemisah bawah
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8.0), // Padding body
        child: Column(
          children: [
            Divider(color: Colors.grey, thickness: 1),
            _buildMenuItem(2, 'assets/machiato.jpg', 'Cappucino Latte',
                'Perpaduan arabica coffee dengan susu karamel', 'Rp 20.000'),
            Divider(color: Colors.grey, thickness: 1),
            _buildMenuItem(1, 'assets/home2.jpg', 'Coffe Latte',
                'Perpaduan arabica coffee dengan susu UHT', 'Rp 25.000'),
            Divider(color: Colors.grey, thickness: 1),
            _buildMenuItem(3, 'assets/home3.jpg', 'Americano Coffee',
                'Coffe 100% Arabica', 'Rp 15.000'),
            Divider(color: Colors.grey, thickness: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int id, String imagePath, String title,
      String description, String price) {
    bool isFavorite = _isFavoriteMap[id] ?? false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 1,
          height: 80,
          color: Colors.grey[400],
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title, // Title
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage()), // Navigasi ke halaman detail
                      );
                    },
                    child: Text(
                      'Buy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                description, // Description
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price, // Price
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavoriteMap[id] = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
