import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    const Color primaryBrown = Color(0xFF8B5E3C);
    const Color softBrown = Color(0xFFE8D8C8);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7),
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: primaryBrown,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: 170,
                      color: softBrown,
                      child: const Icon(Icons.broken_image, size: 60, color: primaryBrown),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A3525),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Oleh ${book.author} • ${book.year}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.brown[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  label: Text(
                    book.genre,
                    style: const TextStyle(
                      color: primaryBrown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: softBrown,
                  side: BorderSide.none,
                ),
                const SizedBox(width: 8),
                Chip(
                  avatar: const Icon(Icons.star, color: Colors.amber, size: 18),
                  label: Text(
                    "${book.rating}",
                    style: const TextStyle(color: Color(0xFF4A3525)),
                  ),
                  backgroundColor: softBrown.withValues(alpha: 0.5),
                  side: BorderSide.none,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFE0D0C0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoTile("Penerbit", book.publisher),
                _buildInfoTile("Halaman", "${book.pages} hlm"),
              ],
            ),
            const Divider(color: Color(0xFFE0D0C0)),
            const SizedBox(height: 12),
            const Text(
              "Sinopsis",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A3525),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF5C4033),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.brown[500]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A3525),
          ),
        ),
      ],
    );
  }
}