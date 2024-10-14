import 'package:flutter/material.dart';

class AdminOrderPage extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: 'ORD123',
      customerName: 'John Doe',
      items: [
        OrderItem(name: 'Apple', quantity: 3, price: 1.5),
        OrderItem(name: 'Bread', quantity: 1, price: 2.0),
      ],
      totalAmount: 6.5,
      status: 'Pending',
    ),
    Order(
      id: 'ORD124',
      customerName: 'Jane Smith',
      items: [
        OrderItem(name: 'Bananas', quantity: 5, price: 0.8),
        OrderItem(name: 'Orange Juice', quantity: 1, price: 3.5),
      ],
      totalAmount: 7.5,
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Orders'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return _buildOrderCard(orders[index]);
        },
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Customer: ${order.customerName}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: order.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${item.quantity} x ${item.name}'),
                      Text('\$${item.price * item.quantity}'),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${order.totalAmount}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(
                    order.status,
                    style: TextStyle(
                        color: order.status == 'Completed'
                            ? Colors.green
                            : Colors.orange),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (order.status != 'Completed')
                  ElevatedButton(
                    onPressed: () {
                      // Implement order update logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Mark as Completed'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Order {
  final String id;
  final String customerName;
  final List<OrderItem> items;
  final double totalAmount;
  final String status;

  Order({
    required this.id,
    required this.customerName,
    required this.items,
    required this.totalAmount,
    required this.status,
  });
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
