import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Aksi saat tombol kembali ditekan
                  Navigator.of(context).pop();
                },
              ),
              Text(
                'Notif',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                  width:
                      48.0), // Spacer untuk menjaga jarak antara teks "INBOX" dan ikon
            ],
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.separated(
              itemCount: 10, // Jumlah pesan dalam daftar
              itemBuilder: (BuildContext context, int index) {
                // Contoh data pesan
                String sender = index.isEven ? 'John' : 'Jane';
                bool isMe = index.isEven; // Jika pesan dari saya

                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding untuk konten
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'DAILY CHECK IN\n',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Daily Check In\n',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Yuk coba fitur Daily Check In sekarang juga di aplikasi KURA SHOP',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    '05 Mei 2024, 10.00', // Tanggal dan waktu pengiriman pesan
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () {
                    // Aksi saat pesan ditekan
                    print('Pesan dari $sender ditekan');
                  },
                  selected: isMe, // Pesan dari saya ditandai
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 1), // Garis pemisah antar pesan
            ),
          ),
        ],
      ),
    );
  }
}
