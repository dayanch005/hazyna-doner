import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                  child: Image.network(
                    'https://tse2.mm.bing.net/th?id=OIP.hoeN0E2DN1cS9v4da5DzmwHaHa&pid=Api&P=0&h=180',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'Media',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Wideolar'),
            _buildList(context, 'video'),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Suratlar'),
            _buildList(context, 'image'),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Halanlarym'),
            _buildList(context, 'favorite'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, String type) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 5,
        itemBuilder: (context, index) {
          String imageUrl;
          if (type == 'video') {
            imageUrl = 'https://img.youtube.com/vi/2Vv-BfVoq4g/0.jpg';
          } else if (type == 'image') {
            imageUrl = 'https://source.unsplash.com/random/200x200?sig=$index';
          } else {
            imageUrl =
                'https://source.unsplash.com/random/400x200?favorite,$index';
          }

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: '$type #$index',
                    imageUrl: imageUrl,
                    type: type,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: type == 'video'
                  ? const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String type;

  const DetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bu sahypa: $type baradaky jikme-jik maglumatlary görkezýär.',
              style: GoogleFonts.poppins(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          if (type == 'video')
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text('Wideony oýnadyň'),
            )
          else
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: const Text('Halanlaryma goş'),
            ),
        ],
      ),
    );
  }
}
