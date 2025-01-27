import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'English (UK)';

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
          'Language',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLanguageSection('Suggested Languages', [
              'English (UK)',
              'English',
              'Bahasa Indonesia',
            ]),
            const SizedBox(height: 24),
            _buildLanguageSection('Other Languages', [
              'Chineses',
              'Croatian',
              'Czech',
              'Danish',
              'Filipino',
              'Finnish',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection(String title, List<String> languages) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: const Color.fromRGBO(68, 78, 97, 1)),
        color: Color.fromRGBO(31, 29, 43, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          ...languages.asMap().entries.map((entry) {
            final isLast = entry.key == languages.length - 1;
            return Column(
              children: [
                _buildLanguageItem(entry.value),
                if (!isLast)
                  const Divider(
                      height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String language) {
    final isSelected = language == selectedLanguage;

    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Color(0xFFF14D3D),
                size: 28,
              ),
          ],
        ),
      ),
    );
  }
}
