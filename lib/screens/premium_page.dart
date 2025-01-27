import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1D2B),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(36, 38, 52, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(CupertinoIcons.left_chevron, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'VIP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                _buildAccessButton(),
                const SizedBox(height: 24),
                const Text(
                  'The latest movies and\nseries are here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                        child: _buildSubscriptionCard(
                      title: 'Monthly\nSubscription',
                      price: 'Rp54.000',
                      period: 'Month',
                      isSelected: true,
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildSubscriptionCard(
                      title: 'Annual\nSubscription',
                      price: 'Rp200.000',
                      period: 'Years',
                      isSelected: false,
                    )),
                  ],
                ),
                const SizedBox(height: 40),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                  children: [
                    _buildFeatureItem(Icons.hd, 'Streaming in high\nquality'),
                    _buildFeatureItem(
                        Icons.block, 'Ad-free viewing\nexperience'),
                    _buildFeatureItem(
                        Icons.download, 'Download to\nwatch later'),
                    _buildFeatureItem(
                        Icons.closed_caption, 'Text of different\nlanguages'),
                    _buildFeatureItem(
                        Icons.devices, 'Stream on\nmultiple devices'),
                    _buildFeatureItem(
                        Icons.volume_up, 'With the best\naudio quality'),
                  ],
                ),
                const SizedBox(height: 40), // Replace Spacer with fixed height
                _buildPaymentButton(context),
                const SizedBox(height: 16),
                _buildLoginText(),
                const SizedBox(height: 24), // Add bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        'Access Premium',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String price,
    required String period,
    required bool isSelected,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF14D3D) : const Color(0xFF252836),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
              Text(
                price.substring(2, price.length) + '/',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            '$period',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/payment-method');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF12CDD9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Payment Method',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already subscribed? ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Login',
              style: TextStyle(
                color: Color(0xFFF14D3D),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
