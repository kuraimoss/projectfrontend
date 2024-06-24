import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kelompok/Provider/provider.dart';
import 'package:kelompok/Content/detailPage.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<myProv>(context);
    final wishlistItems = cartProvider.wishlist;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Color(0xFF107d72),
      ),
      body: wishlistItems.isNotEmpty
          ? ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final itemId = wishlistItems[index];
                final item = _getMenuItemById(itemId);
                final isFavorite = wishlistItems.contains(itemId);

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.imagePath,
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
                        SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
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
                                          builder: (context) => DetailPage(item: item),
                                        ),
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
                                item.description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      '\$${item.price}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[800],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? Colors.red : null,
                                      ),
                                      onPressed: () {
                                        if (isFavorite) {
                                          cartProvider.removeFromWishlist(itemId);
                                        } else {
                                          cartProvider.addToWishlist(itemId);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'Wishlist is empty',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  CartItem _getMenuItemById(String id) {
    // Replace this with your actual data fetching logic
    // Example static data:
    final menuItems = [
      CartItem(
        id: '1',
        name: 'Coffe Latte',
        price: 25000,
        quantity: 1,
        size: 'Regular',
        iceLevel: 'Normal',
        syrup: 'None',
        imagePath: 'assets/home2.jpg',
        description: 'Perpaduan arabica coffee dengan susu UHT',
      ),
      CartItem(
        id: '2',
        name: 'Cappucino Latte',
        price: 20000,
        quantity: 1,
        size: 'Regular',
        iceLevel: 'Normal',
        syrup: 'None',
        imagePath: 'assets/machiato.jpg',
        description: 'Perpaduan arabica coffee dengan susu karamel',
      ),
      CartItem(
        id: '3',
        name: 'Americano Coffee',
        price: 15000,
        quantity: 1,
        size: 'Regular',
        iceLevel: 'Normal',
        syrup: 'None',
        imagePath: 'assets/home3.jpg',
        description: 'Coffe 100% Arabica',
      ),
    ];

    return menuItems.firstWhere((item) => item.id == id);
  }
}

