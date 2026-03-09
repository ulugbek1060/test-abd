import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/books/entities/book_detail_model.dart';
import 'package:testabd/features/library/book_detail_cubit.dart';
import 'package:testabd/features/library/book_detail_state.dart';
import 'package:testabd/features/library/read_book_screen.dart';
import 'package:testabd/router/app_router.dart';

class BookDetailScreen extends StatelessWidget {
  final int? bookId;

  const BookDetailScreen({super.key, this.bookId});

  @override
  Widget build(BuildContext context) {
    if (bookId == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'No book selected',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
    }

    return BlocProvider(
      create: (context) => locator<BookDetailCubit>(param1: bookId)..getBook(),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final ScrollController _controller;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _controller.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }
  }

  Color _appBarBg() {
    if (!_controller.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.5, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _appBarBg(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              // TODO: implement share
            },
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
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 64,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.error ?? 'Failed to load book',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                    ),
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

          final book = state.data;

          if (book == null) {
            return const Center(child: Text('Book not found'));
          }

          return CustomScrollView(
            controller: _controller,
            slivers: [
              SliverToBoxAdapter(child: _BookCoverHeader(book: book)),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 140),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 32),

                    Text(
                      book.title ?? 'Untitled',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.18,
                            letterSpacing: -0.3,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 8),

                    if (book.author?.fullName != null)
                      Text(
                        book.author!.fullName!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    const SizedBox(height: 28),

                    _BookStatsRow(book: book),

                    const SizedBox(height: 36),

                    if (book.description?.isNotEmpty == true) ...[
                      Text(
                        'About the book',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        book.description!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.52,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],

                    if (book.tags?.isNotEmpty == true) ...[
                      Text(
                        'Tags',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: book.tags!.map((tag) {
                          final tagStr = tag is String ? tag : tag.toString();
                          return Chip(
                            label: Text(tagStr),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.14),
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 40),
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
        child: BlocBuilder<BookDetailCubit, BookDetailState>(
          builder: (context, state) {
            if (state.data == null) return const SizedBox.shrink();
            return FilledButton.icon(
              onPressed: () => context.push(
                AppRouter.bookReadWithArgs(
                  pdfFile: ReadBookScreenArg(state.data?.pdfFile ?? ""),
                ),
              ),
              icon: const Icon(Icons.menu_book_rounded),
              label: const Text(
                'Start Reading',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────
//               HELPER WIDGETS
// ────────────────────────────────────────────────
class _BookCoverHeader extends StatelessWidget {
  final BookDetailModel book;

  const _BookCoverHeader({required this.book});

  @override
  Widget build(BuildContext context) {
    final cover = book.coverImage ?? '';

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
                Colors.black.withAlpha(12),
                Colors.black.withAlpha(72),
                Colors.black.withAlpha(94),
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: cover,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey.shade900),
            errorWidget: (_, __, ___) => Container(
              color: Colors.grey.shade900,
              child: const Icon(
                Icons.book_rounded,
                size: 80,
                color: Colors.white24,
              ),
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
                    color: Colors.black.withOpacity(0.55),
                    blurRadius: 32,
                    offset: const Offset(0, 22),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: cover,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(color: Colors.grey.shade800),
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.book,
                      size: 60,
                      color: Colors.white38,
                    ),
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
  final BookDetailModel book;

  const _BookStatsRow({required this.book});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    if (book.totalPages != null && book.totalPages! > 0) {
      items.add(
        _StatChip(
          icon: Icons.menu_book_rounded,
          label: '${book.totalPages} pages',
        ),
      );
    }

    if (book.createdAt != null) {
      final year = book.createdAt!.year;
      items.add(_StatChip(icon: Icons.calendar_today_rounded, label: '$year'));
    }

    return Wrap(spacing: 16, runSpacing: 12, children: items);
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookInfoTable extends StatelessWidget {
  final BookDetailModel book;

  const _BookInfoTable({required this.book});

  @override
  Widget build(BuildContext context) {
    final rows = <({String label, String? value})>[];
    // You can extend this when you add more fields to the model
    // rows.add((label: 'Publisher', value: book.publisher));
    // rows.add((label: 'ISBN',      value: book.isbn));
    // rows.add((label: 'Format',    value: book.format));
    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book Details',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ...rows.map(
          (row) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    row.label,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
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
          ),
        ),
      ],
    );
  }
}
