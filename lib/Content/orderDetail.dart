import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kelompok/Provider/provider.dart';

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

    int totalHarga =
        _orderItems.fold(0, (sum, item) => sum + item.price * item.quantity);

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
                    DeliveryPage(
                        orderItems: _orderItems, totalHarga: totalHarga),
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

  const DeliveryPage(
      {Key? key, required this.orderItems, required this.totalHarga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Pesanan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                return _buildOrderItem(context, item);
              },
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp $totalHarga',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
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

  Widget _buildOrderItem(BuildContext context, CartItem item) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/machiato.jpg'), // Example image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Size: ${item.size}, Ice: ${item.iceLevel}, Syrup: ${item.syrup}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'Rp ${item.price * item.quantity}',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (item.quantity > 1) {
                          Provider.of<myProv>(context, listen: false)
                              .updateCartItemQuantity(item, item.quantity - 1);
                        }
                      },
                    ),
                    Text(item.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Provider.of<myProv>(context, listen: false)
                            .updateCartItemQuantity(item, item.quantity + 1);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<myProv>(context, listen: false)
                            .removeFromCart(item);
                      },
                    ),
                  ],
                ),
              ],
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

  const PickupPage(
      {Key? key, required this.orderItems, required this.totalHarga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Pesanan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                return _buildOrderItem(context, item);
              },
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp $totalHarga',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
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

  Widget _buildOrderItem(BuildContext context, CartItem item) {
     return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/machiato.jpg'), // Example image path
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Size: ${item.size}, Ice: ${item.iceLevel}, Syrup: ${item.syrup}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'Rp ${item.price * item.quantity}',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (item.quantity > 1) {
                          Provider.of<myProv>(context, listen: false)
                              .updateCartItemQuantity(item, item.quantity - 1);
                        }
                      },
                    ),
                    Text(item.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Provider.of<myProv>(context, listen: false)
                            .updateCartItemQuantity(item, item.quantity + 1);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<myProv>(context, listen: false)
                            .removeFromCart(item);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
