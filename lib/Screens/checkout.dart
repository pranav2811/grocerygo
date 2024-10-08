import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Sample cart items
  List<CartItem> cartItems = [
    CartItem(
        name: 'Apple', price: 1.5, quantity: 2, imageUrl: 'assets/apple.png'),
    CartItem(
        name: 'Bread', price: 2.0, quantity: 1, imageUrl: 'assets/bread.png'),
  ];

  // Sample addresses
  List<String> addresses = [
    '123 Main Street',
    '456 Maple Avenue',
    '789 Oak Lane',
  ];
  String selectedAddress = '';

  // Sample payment methods
  List<String> paymentMethods = [
    'Credit Card',
    'Debit Card',
    'UPI',
    'Cash on Delivery',
  ];
  String selectedPaymentMethod = '';

  @override
  void initState() {
    super.initState();
    selectedAddress = addresses[0];
    selectedPaymentMethod = paymentMethods[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildCartItemsSection(),
                const Divider(),
                _buildAddressSelectionSection(),
                const Divider(),
                _buildPaymentMethodSection(),
              ],
            ),
          ),
          _buildPayNowButton(),
        ],
      ),
    );
  }

  Widget _buildCartItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Your Cart'),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return _buildCartItem(cartItems[index]);
          },
        ),
      ],
    );
  }

  Widget _buildCartItem(CartItem item) {
    return ListTile(
      leading: Image.asset(
        item.imageUrl,
        width: 50,
        height: 50,
      ),
      title: Text(item.name),
      subtitle: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
      trailing: _buildQuantityControl(item),
    );
  }

  Widget _buildQuantityControl(CartItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            setState(() {
              if (item.quantity > 1) item.quantity--;
            });
          },
        ),
        Text(
          '${item.quantity}',
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            setState(() {
              item.quantity++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAddressSelectionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Select Delivery Address'),
        ...addresses.map((address) {
          return RadioListTile(
            title: Text(address),
            value: address,
            groupValue: selectedAddress,
            onChanged: (value) {
              setState(() {
                selectedAddress = value!;
              });
            },
          );
        }),
        TextButton(
          onPressed: () {
            // Navigate to address addition page
          },
          child: const Text('+ Add New Address'),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Select Payment Method'),
        ...paymentMethods.map((method) {
          return RadioListTile(
            title: Text(method),
            value: method,
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          );
        }),
      ],
    );
  }

  Widget _buildPayNowButton() {
    double totalAmount = cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          // Implement payment processing
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text('Pay Now - \$${totalAmount.toStringAsFixed(2)}'),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CartItem {
  String name;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
