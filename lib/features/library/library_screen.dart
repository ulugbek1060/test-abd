import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/features/library/library_cubit.dart';
import 'package:testabd/features/library/library_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LibraryCubit>()..getBooks(),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Library'), centerTitle: true),
          body: state.isLoading
              ? ProgressView()
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(6),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 3 / 4,
                            ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final book = state.books[index];
                          return BookCard(book: book);
                        }, childCount: state.books.length),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [

          // Background cover image
          Image.network(
            book.coverImage ?? "",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey.shade800,
              child: const Icon(Icons.book, size: 60, color: Colors.white54),
            ),
          ),

          // Gradient overlay for better text readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                stops: const [0.5, 1.0],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  book.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),

                // Author
                Text(
                  book.author?.fullName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),

                // _RatingStars(rating: book.author),
                Text(
                  book.totalPages?.toString() ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- SUPPORTING WIDGETS ----------------

class _RatingStars extends StatelessWidget {
  final double rating;

  const _RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final filled = rating >= index + 1;
        final halfFilled = rating > index && rating < index + 1;

        return Icon(
          filled
              ? Icons.star_rounded
              : halfFilled
              ? Icons.star_half_rounded
              : Icons.star_border_rounded,
          size: 18,
          color: const Color(0xFFFFC107),
        );
      }),
    );
  }
}
