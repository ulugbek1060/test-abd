import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/library/book_detail_cubit.dart';
import 'package:testabd/features/library/book_detail_state.dart'; // assuming go_router or similar

class BookDetailScreen extends StatelessWidget {
  final int? bookId;

  const BookDetailScreen({
    super.key,
    this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BookDetailCubit>(param1: bookId)..getBook(),
      child: const _BookDetailView(),
    );
  }
}

class _BookDetailView extends StatelessWidget {
  const _BookDetailView();

  // ─── Static demo data ────────────────────────────────────────────────
  static final _demoBook = {
    'title': 'Atomic Habits',
    'author': 'James Clear',
    'coverUrl':
    'https://images.unsplash.com/photo-1544947950-fa07a98d4679?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
    'description':
    'No matter your goals, Atomic Habits offers a proven framework for improving—every day. James Clear, one of the world’s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.',
    'pageCount': 320,
    'publishedYear': 2018,
    'language': 'English',
    'publisher': 'Avery',
    'isbn': '978-0735211292',
    'genres': ['Self Help', 'Psychology', 'Personal Development', 'Productivity'],
    'format': 'Paperback',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<BookDetailCubit, BookDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.error ?? 'Something went wrong',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => context.read<BookDetailCubit>().getBook(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          // We ignore real data → always show demo for now
          final book = _demoBook;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _BookCoverHeader(book: book),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 140),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 24),

                    Text(
                      book['title'] as String,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book['author'] as String,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.85),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 28),

                    _BookStatsRow(book: book),

                    const SizedBox(height: 32),

                    if ((book['description'] as String?)?.isNotEmpty == true) ...[
                      Text(
                        'About the book',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        book['description'] as String,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.48,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],

                    if ((book['genres'] as List?)?.isNotEmpty == true) ...[
                      Text(
                        'Genres',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: (book['genres'] as List).map((genre) {
                          return Chip(
                            label: Text(genre),
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                            labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                    ],

                    _BookInfoTable(book: book),
                  ]),
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FilledButton.icon(
          onPressed: () {
            // TODO: navigate to reader
          },
          icon: const Icon(Icons.menu_book_rounded),
          label: const Text(
            'Start Reading',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}

// ─── Helper widgets (updated to use Map instead of Book class) ───────

class _BookCoverHeader extends StatelessWidget {
  final Map<String, dynamic> book;

  const _BookCoverHeader({required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.92),
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: book['coverUrl'] as String,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey.shade900),
            errorWidget: (_, __, ___) => Container(
              color: Colors.grey.shade900,
              child: const Icon(Icons.book_rounded, size: 80, color: Colors.white24),
            ),
          ),
        ),

        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 180,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 30,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: book['coverUrl'] as String,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(color: Colors.grey.shade800),
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(Icons.book, size: 60, color: Colors.white38),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BookStatsRow extends StatelessWidget {
  final Map<String, dynamic> book;

  const _BookStatsRow({required this.book});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    if (book['pageCount'] != null) {
      items.add(_StatChip(icon: Icons.menu_book, label: '${book['pageCount']} pages'));
    }
    if (book['publishedYear'] != null) {
      items.add(_StatChip(icon: Icons.calendar_today_rounded, label: '${book['publishedYear']}'));
    }
    if (book['language'] != null) {
      items.add(_StatChip(icon: Icons.language, label: book['language'] as String));
    }

    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: items,
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

class _BookInfoTable extends StatelessWidget {
  final Map<String, dynamic> book;

  const _BookInfoTable({required this.book});

  @override
  Widget build(BuildContext context) {
    final rows = <({String label, String? value})>[];

    if (book['publisher'] != null) rows.add((label: 'Publisher', value: book['publisher'] as String?));
    if (book['isbn'] != null) rows.add((label: 'ISBN', value: book['isbn'] as String?));
    if (book['format'] != null) rows.add((label: 'Format', value: book['format'] as String?));

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ...rows.map((row) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  row.label,
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ),
              Expanded(
                child: Text(
                  row.value ?? '—',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}