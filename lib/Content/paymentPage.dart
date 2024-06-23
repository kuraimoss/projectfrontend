import 'package:flutter/material.dart';
import 'package:kelompok/Activity/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:kelompok/Provider/provider.dart';

class paymentPage extends StatefulWidget {
  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentOption('assets/tunai.png', 'Tunai', 'tunai'),
            _buildPaymentOption('assets/dana.jpg', 'Dana', 'dana'),
            _buildPaymentOption('assets/shopee.png', 'Shopeepay', 'shopeepay'),
            _buildPaymentOption('assets/gopay.png', 'GoPay', 'gopay'),
            _buildPaymentOption('assets/ovo.png', 'OVO', 'ovo'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedPaymentMethod != null) {
                  Provider.of<myProv>(context, listen: false).bnIndex = 1;
                  Provider.of<myProv>(context, listen: false).clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembayaran $_selectedPaymentMethod berhasil!'),
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => myHome()), // Ganti dengan halaman dashboard yang sesuai
                    (route) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pilih metode pembayaran terlebih dahulu!'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String imagePath, String title, String value) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? newValue) {
          setState(() {
            _selectedPaymentMethod = newValue;
          });
        },
      ),
    );
  }
}
