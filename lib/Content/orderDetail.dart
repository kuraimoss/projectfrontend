import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:kelompok/Provider/provider.dart'; // Import provider file

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<myProv>(context);
    final List<CartItem> _orderItems = cartProvider.cartItems;

    int totalHarga = _orderItems.fold(0, (sum, item) => sum + item.price * item.quantity);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFd9d9d9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Color(0xFF107d72),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.delivery_dining),
                      text: 'Delivery',
                    ),
                    Tab(
                      icon: Icon(Icons.storefront),
                      text: 'Pick Up',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Delivery Tab
                    DeliveryPage(orderItems: _orderItems, totalHarga: totalHarga),
                    // Pick Up Tab
                    PickupPage(orderItems: _orderItems, totalHarga: totalHarga),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryPage extends StatelessWidget {
  final List<CartItem> orderItems;
  final int totalHarga;

  const DeliveryPage({Key? key, required this.orderItems, required this.totalHarga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Order Summary',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.name} x${item.quantity}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Size: ${item.size}, Ice: ${item.iceLevel}, Syrup: ${item.syrup}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Rp ${item.price * item.quantity}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp $totalHarga',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your order confirmation logic here
              Provider.of<myProv>(context, listen: false).clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order Confirmed!'),
                ),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text('Confirm Delivery Order'),
            ),
          ),
        ],
      ),
    );
  }
}

class PickupPage extends StatelessWidget {
  final List<CartItem> orderItems;
  final int totalHarga;

  const PickupPage({Key? key, required this.orderItems, required this.totalHarga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Up Order Summary',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.name} x${item.quantity}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Size: ${item.size}, Ice: ${item.iceLevel}, Syrup: ${item.syrup}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Rp ${item.price * item.quantity}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp $totalHarga',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your order confirmation logic here
              Provider.of<myProv>(context, listen: false).clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order Confirmed!'),
                ),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text('Confirm Pick Up Order'),
            ),
          ),
        ],
      ),
    );
  }
}
