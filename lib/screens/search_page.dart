import 'package:flutter/material.dart';
import 'package:seezntv/assets_model/assets_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> categories = ['All', 'Comedy', 'Animation', 'Dokumentary'];
  final List<String> movies = [
    AssetsModel.movie1,
    AssetsModel.movie2,
    AssetsModel.movie3,
  ];

  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchField(),
            _buildCategories(),
            _buildTodaySection(),
            const SizedBox(height: 40),
            _buildRecommendedSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Type title, categories, years, etc',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          filled: true,
          fillColor: const Color.fromRGBO(37, 40, 54, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 16, right: 8),
            child: Icon(Icons.search, color: Colors.grey, size: 24),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: _buildCategoryChip(
                categories[index], _selectedCategoryIndex == index),
          ),
        ),
      ),
    );
  }

  Widget _buildTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Today',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 190,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/movie-detail');
            },
            child: Row(
              children: [
                _buildMoviePoster(),
                _buildMovieInfo(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMoviePoster() {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(AssetsModel.movie1),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          _buildPosterGradient(),
          _buildRating(),
        ],
      ),
    );
  }

  Widget _buildPosterGradient() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.star,
              color: Color(0xFFFD8724),
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              '4.5',
              style: TextStyle(
                color: Color(0xFFFD8724),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPremiumBadge(),
            const SizedBox(height: 12),
            _buildMovieTitle(),
            const SizedBox(height: 8),
            _buildMovieMetadata(),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4D4D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Premium',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMovieTitle() {
    return const Text(
      'Spider-Man No Way..',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMovieMetadata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildInfoChip(Icons.calendar_today_outlined, '2021'),
            const SizedBox(width: 16),
            _buildInfoChip(Icons.access_time_outlined, '148 Minutes'),
          ],
        ),
        const SizedBox(height: 8),
        _buildPGRating(),
        const SizedBox(height: 8),
        _buildMovieGenre(),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recommend for you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFFFF4D4D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: _buildMovieCard,
          ),
        ),
      ],
    );
  }

  Widget _buildMovieCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/movie-detail');
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(37, 40, 54, 1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieCardPoster(index),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Spider-Man: No Way Home',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Action',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCardPoster(int index) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        image: DecorationImage(
          image: AssetImage(movies[index]),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: _buildMovieCardRating(),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCardRating() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.star, color: Colors.amber, size: 16),
          SizedBox(width: 4),
          Text(
            '4.5',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieGenre() {
    return Row(
      children: const [
        Icon(Icons.movie_outlined, color: Colors.grey, size: 16),
        SizedBox(width: 4),
        Text('Action', style: TextStyle(color: Colors.grey, fontSize: 14)),
        Text(' | ', style: TextStyle(color: Colors.grey, fontSize: 14)),
        Text('Movie', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildPGRating() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF4D4D)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'PG-13',
        style: TextStyle(color: Color(0xFFFF4D4D), fontSize: 12),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFF4D4D)
            : const Color.fromRGBO(37, 40, 54, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
