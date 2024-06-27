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
          _buildPesananProsesItem(
            'assets/machiato.jpg',
            'American Coffee, Ekspresso',
            '2 Item',
            'Rp. 50.000',
            '08/1/2024 21.00',
            'Proses',
            'Pick Up',
            Color(0xFF107d72),
          ),
          Divider(color: Colors.grey),
          _buildPesananProsesItem(
            'assets/machiato.jpg',
            'American Coffee, Ekspresso',
            '2 Item',
            'Rp. 50.000',
            '08/1/2024 21.00',
            'Proses',
            'Delivery',
            Color(0xFFbd5c17),
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPesananProsesItem(
      String imagePath,
      String title,
      String quantity,
      String price,
      String dateTime,
      String prosesText,
      String statusText,
      Color statusColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    quantity,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Colors.black,
                        size: 13,
                      ),
                      SizedBox(width: 4),
                      Text(
                        prosesText,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      print(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Chat Kuraashop', 'Bantuan'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                dateTime, // Tanggal dan waktu
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelesaiTab() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPesananSelesaiItem(
            'assets/machiato.jpg',
            'American Coffee, Ekspresso',
            '2 Item',
            'Rp. 50.000',
            '08/1/2024 21.00',
            'Selesai',
            'Pick Up',
            Color(0xFF107d72),
          ),
          Divider(color: Colors.grey),
          _buildPesananSelesaiItem(
            'assets/machiato.jpg',
            'American Coffee, Ekspresso',
            '2 Item',
            'Rp. 50.000',
            '08/1/2024 21.00',
            'Dibatalkan',
            'Delivery',
            Color(0xFFbd5c17),
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPesananSelesaiItem(
    String imagePath,
    String title,
    String quantity,
    String price,
    String dateTime,
    String prosesText,
    String statusText,
    Color statusColor,
  ) {
    IconData iconData;
    switch (prosesText) {
      case 'Selesai':
        iconData = Icons.check_circle;
        break;
      case 'Dibatalkan': // Add more cases if needed for different icons
        iconData = Icons.cancel;
        break;
      default:
        iconData = Icons.check_circle; // Default to a sensible icon
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    quantity,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        iconData, // Use the dynamically determined iconData
                        color: Colors.black,
                        size: 13,
                      ),
                      SizedBox(width: 4),
                      Text(
                        prosesText,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price, // Harga
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      // Handle menu item selection
                      print(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Chat Kuraashop', 'Bantuan'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                dateTime, // Tanggal dan waktu
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
