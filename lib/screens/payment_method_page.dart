import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seezntv/assets_model/assets_model.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int selectedCard = 0;

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
            color: const Color(0xFF252836),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(CupertinoIcons.left_chevron, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Payment Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Enjoy the viewing\nexperience after you confirm\nthe payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildCardItem(
              isVisa: true,
              isSelected: selectedCard == 0,
              cardNumber: '•••• •••• •••• 87652',
              index: 0,
            ),
            const SizedBox(height: 16),
            _buildCardItem(
              isVisa: false,
              isSelected: selectedCard == 1,
              cardNumber: '•••• •••• •••• 87652',
              index: 1,
            ),
            const SizedBox(height: 16),
            _buildAddNewCard(),
            const Spacer(),
            _buildPurchaseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem({
    required bool isVisa,
    required bool isSelected,
    required String cardNumber,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF252836),
          border: isSelected
              ? Border.all(color: const Color(0xFFF14D3D), width: 2)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Image.asset(
            isVisa ? AssetsModel.visaLogo : AssetsModel.mastercardLogo,
            height: 70,
            width: 70,
          ),
          title: Text(
            cardNumber,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing: Container(
            alignment: Alignment.center,
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFF14D3D)
                    : Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.circle, color: Color(0xFFF14D3D), size: 20)
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF252836),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add, color: Colors.white, size: 24),
          SizedBox(width: 8),
          Text(
            'Add New',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: _buildSuccessDialog(context),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF12CDD9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Purchase Now',
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

  Widget _buildSuccessDialog(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF252836),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetsModel.paymentCompleted,
              width: 130,
            ),
            const SizedBox(height: 24),
            const Text(
              'Your payment has\ncompleted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ullamcorper imperdiet urna id non sed est\nsem. Rhoncus amet, enim purus gravida\ndonec aliquet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 180,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF14D3D),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
