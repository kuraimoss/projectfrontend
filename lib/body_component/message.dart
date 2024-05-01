import 'package:flutter/material.dart';

class MyListChat extends StatefulWidget {
  const MyListChat({super.key});

  @override
  State<MyListChat> createState() => _MyListChatState();
}

class _MyListChatState extends State<MyListChat> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 10, // Jumlah pesan dalam daftar
          itemBuilder: (BuildContext context, int index) {
            // Contoh data pesan
            String sender = index.isEven ? 'John' : 'Jane';
            String message = 'Hello, this is message number $index';
            bool isMe = index.isEven; // Jika pesan dari saya

            return ListTile(
              leading: CircleAvatar(
                // Avatar pengirim
                child: Text(sender[0]),
              ),
              title: Text(sender),
              subtitle: Text(message),
              trailing: Text(
                '10:00', // Waktu pengiriman pesan
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Aksi saat pesan ditekan
                print('Pesan dari $sender ditekan');
              },
              selected: isMe, // Pesan dari saya ditandai
            );
          },
        );
  }
}