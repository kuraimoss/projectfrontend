import 'package:flutter/material.dart';

class packageFab extends StatefulWidget {
  const packageFab({Key? key}) : super(key: key);

  @override
  State<packageFab> createState() => _packageFabState();
}

class _packageFabState extends State<packageFab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isExpandedCaraPakai = false;
  bool isExpandedSyaratKetentuan = false;

  final List<Map<String, String>> packages = [
    {
      'title': 'Monthly Package',
      'duration': '30 hari',
      'saving': 'Rp 60.000',
      'benefit': 'Potongan belanja Rp 15000',
      'price': 'Rp. 50.000'
    },
    {
      'title': 'Weekly Package',
      'duration': '7 hari',
      'saving': 'Rp 20.000',
      'benefit': 'Potongan belanja Rp 5000',
      'price': 'Rp. 20.000'
    },
    {
      'title': 'Daily Package',
      'duration': '1 hari',
      'saving': 'Rp 5.000',
      'benefit': 'Potongan belanja Rp 1000',
      'price': 'Rp. 5.000'
    },
  ];

  void initState() {
    super.initState();
    _tabController = TabController(length: packages.length, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update UI when the tab changes
    });
  }

  Widget buildPackage(Map<String, String> package) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-1, 0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 0),
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
                package['title']!,
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
                color: Color(0xFFd9d9d9),
                borderRadius: BorderRadius.circular(30),
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
                      text: package['saving']!,
                      style: TextStyle(
                        color: Color(0xFF107d72),
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
            height: 140,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFd3e3e1),
                borderRadius: BorderRadius.circular(20),
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
                      text: package['benefit']!,
                      style: TextStyle(
                        color: Color(0xFF107d72),
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
                      package['duration']!,
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
                color: Color(0xFFd9d9d9), // Warna teks di dalam rectangle
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
                            text: 'Berlaku sekali pembelian dalam 1 periode',
                            style: TextStyle(
                                color: Color(0xFF107d72), // Warna Rp 60.000
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
                    Container(
                      constraints: BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: Text(
                          'Teks untuk cara pakai voucher yang panjang...',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandedSyaratKetentuan = !isExpandedSyaratKetentuan;
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
                    Container(
                      constraints: BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: Text(
                          'Teks untuk syarat & ketentuan yang panjang...',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF107d72),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF107d72),
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 12.5),
          tabs:
              packages.map((package) => Tab(text: package['title']!)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: packages.map((package) => buildPackage(package)).toList(),
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika pembelian paket di sini
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xFF107d72),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child:
              Text('Beli Paket - ${packages[_tabController.index]['price']}'),
        ),
      ),
    );
  }
}
