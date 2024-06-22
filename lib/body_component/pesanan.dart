import 'package:flutter/material.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({Key? key}) : super(key: key);

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                      'Pesanan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 8),
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Proses'),
                        Tab(text: 'Selesai'),
                      ],
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
      body: Row(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProsesTab(),
                _buildSelesaiTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
Widget _buildProsesTab() {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/machiato.jpg', 
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8), 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'American Coffee, Ekspresso', 
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(height: 4), 
                      Text(
                        '2 Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16), // Jarak antara kolom
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp. 50.000', // Harga
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16), // Jarak antara baris
        Divider(color: Colors.grey), // Divider di bawah konten
      ],
    ),
  );
}




  Widget _buildSelesaiTab() {
    // Placeholder untuk tab "Selesai"
    return Center(
      child: Text(
        'Halaman Pesanan Selesai',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
