import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/books/entities/author_model.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/features/library/library_cubit.dart';
import 'package:testabd/features/library/library_state.dart';
import 'package:testabd/router/app_router.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<LibraryCubit>()
      ..getBooks()
      ..getAuthor(),
    child: const _View(),
  );
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: context.read<LibraryCubit>().refresh,
      color: theme.colorScheme.primary,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xFF0F0F17)
            : const Color(0xFFF8F9FF),
        appBar: AppBar(
          title: const Text(
            'My Library',
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.3),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            if (state.booksState.isLoading && state.authorsState.isLoading) {
              return const ProgressView();
            }

            return CustomScrollView(
              slivers: [
                // ─── Featured Authors ───
                if (state.authorsState.authors.isNotEmpty) AuthorSection(),

                // ─── Books Grid ───
                BooksSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────
//                AUTHORS SECTION
// ────────────────────────────────────────────────
class AuthorSection extends StatelessWidget {
  const AuthorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      buildWhen: (prev, curr) => prev.authorsState != curr.authorsState,
      builder: (context, state) {
        final authors = state.authorsState.authors;

        return SliverToBoxAdapter(
          child: SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: authors.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final author = authors[index];
                return AuthorItem(
                  author: author,
                  onTap: () => context.push(
                    AppRouter.authorDetailWithArgs(authorId: author.id),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class AuthorItem extends StatelessWidget {
  final AuthorModel author; // replace with your AuthorModel
  final VoidCallback onTap;

  const AuthorItem({
    super.key,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar with modern gradient border + subtle glass effect
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.25),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.4), // subtle dark fallback
                ),
                child: ClipOval(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background blur when image is loading or missing
                      if (author.image?.isNotEmpty != true)
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(color: Colors.transparent),
                        ),

                      // Actual image with caching
                      if (author.image?.isNotEmpty == true)
                        CachedNetworkImage(
                          imageUrl: author.image!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade900,
                            child: const Center(
                              child: SizedBox(
                                width: 36,
                                height: 36,
                                child: CircularProgressIndicator(strokeWidth: 2.5),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => _placeholderAvatar(),
                        )
                      else
                        _placeholderAvatar(),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Name with subtle shadow for depth
          SizedBox(
            width: 80,
            child: Text(
              author.fullName ?? 'Author',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface,
                // shadows: [
                //   Shadow(
                //     blurRadius: 6,
                //     color: Colors.black54,
                //     offset: Offset(0, 2),
                //   ),
                // ],
              ),
            ),
          ),

          // Optional: small subtitle (e.g. books count, genre, country)
          // if (author.subtitle != null) ...[
          //   const SizedBox(height: 2),
          //   Text(
          //     author.subtitle!,
          //     style: TextStyle(
          //       fontSize: 11,
          //       color: Colors.white.withOpacity(0.65),
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }

  Widget _placeholderAvatar() {
    return Container(
      color: Colors.grey.shade800,
      child: const Icon(
        Icons.person_rounded,
        color: Colors.white70,
        size: 44,
      ),
    );
  }
}

// ────────────────────────────────────────────────
//                BOOKS GRID SECTION
// ────────────────────────────────────────────────
class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      buildWhen: (p, c) => p.booksState != c.booksState,
      builder: (context, state) {
        final books = state.booksState.books;

        if (books.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'No books yet...\nStart reading!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 4, // slightly taller cards
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final book = books[index];
              return BookCard(
                book: book,
                onTap: () =>
                    context.push(AppRouter.bookDetailWithArgs(bookId: book.id)),
              );
            }, childCount: books.length),
          ),
        );
      },
    );
  }
}

class BookCard extends StatelessWidget {
  final BookModel book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Full background cover image (sharp at top)
              Image.network(
                book.coverImage ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade800,
                  child: const Icon(
                    Icons.book,
                    size: 60,
                    color: Colors.white54,
                  ),
                ),
              ),

              // 2. Gradient overlay + increasing blur from bottom to top
              Positioned.fill(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // no blur at top
                        Colors.black.withOpacity(0.1), // very light
                        Colors.black.withOpacity(0.45), // medium
                        Colors.black.withOpacity(0.75), // strong at bottom
                      ],
                      stops: const [0.0, 0.5, 0.75, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.darken,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 12),
                    // main blur strength
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),

              // 3. Title + Author container (strongest blur area)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.85),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title ?? 'Untitled',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          shadows: [
                            Shadow(
                              blurRadius: 6,
                              color: Colors.black87,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        book.author?.fullName ?? 'Unknown Author',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
