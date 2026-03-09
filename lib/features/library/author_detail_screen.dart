import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/books/entities/author_detail_model.dart';
import 'package:testabd/features/library/author_detail_cubit.dart';
import 'package:testabd/features/library/author_detail_state.dart';

class AuthorDetailScreen extends StatelessWidget {
  final int? authorId;

  const AuthorDetailScreen({super.key, this.authorId});

  @override
  Widget build(BuildContext context) {
    if (authorId == null) {
      return const Scaffold(
        body: Center(child: Text('No author selected')),
      );
    }

    return BlocProvider(
      create: (context) => locator<AuthorDetailCubit>(param1: authorId)..getAuthor(),
      child: const _AuthorDetailView(),
    );
  }
}

class _AuthorDetailView extends StatelessWidget {
  const _AuthorDetailView();

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
            onPressed: () {
              // TODO: share author profile
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<AuthorDetailCubit, AuthorDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 64, color: Colors.redAccent),
                  const SizedBox(height: 16),
                  Text(
                    state.error ?? 'Failed to load author',
                    style: const TextStyle(fontSize: 18, color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => context.read<AuthorDetailCubit>().getAuthor(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          final author = state.data as AuthorDetailModel?;

          if (author == null) {
            return const Center(child: Text('Author not found'));
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _AuthorCoverHeader(author: author),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 140),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 32),

                    // Name + Follow button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            author.fullName ?? 'Unknown Author',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 1.18,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () {
                            // TODO: follow/unfollow logic
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white70, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // You can add born/nationality here later if added to model
                    // For now we skip it or show something else if available

                    const SizedBox(height: 28),

                    // Stats chips (books count & followers would need model extension)
                    _AuthorStatsRow(author: author),

                    const SizedBox(height: 36),

                    // Bio
                    if (author.bio?.isNotEmpty == true) ...[
                      Text(
                        'About the Author',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        author.bio!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.52,
                          color: Colors.white.withOpacity(0.92),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],

                    // ────────────────────────────────────────────────
                    // Popular Books section → kept static as requested
                    // ────────────────────────────────────────────────
                    Text(
                      'Popular Books',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _demoPopularBooks.length,
                        itemBuilder: (context, index) {
                          final book = _demoPopularBooks[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: _BookMiniCard(
                              title: book['title'] as String,
                              cover: book['cover'] as String,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Extra info section (static links)
                    const _AuthorExtraInfo(),
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
            // TODO: navigate to author's books list
            // Example: context.push('/books?authorId=${author?.id}');
          },
          icon: const Icon(Icons.library_books_rounded),
          label: const Text(
            'View All Books',
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

// ─── Static popular books (kept as requested) ────────────────────────────────
final _demoPopularBooks = [
  {
    'title': 'Atomic Habits',
    'cover': 'https://images.unsplash.com/photo-1544947950-fa07a98d4679?w=400',
  },
  {
    'title': 'The Power of Habit',
    'cover': 'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400',
  },
  {
    'title': 'Deep Work',
    'cover': 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
  },
];

// ─── Helper Widgets ──────────────────────────────────────────────────────────

class _AuthorCoverHeader extends StatelessWidget {
  final AuthorDetailModel author;

  const _AuthorCoverHeader({required this.author});

  @override
  Widget build(BuildContext context) {
    final photo = author.image ?? '';

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
                Colors.black.withOpacity(0.15),
                Colors.black.withOpacity(0.75),
                Colors.black.withOpacity(0.94),
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: photo,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey.shade900),
            errorWidget: (_, __, ___) => Container(
              color: Colors.grey.shade900,
              child: const Icon(Icons.person, size: 120, color: Colors.white24),
            ),
          ),
        ),

        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.55),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.4), width: 4),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: photo,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(color: Colors.grey.shade800),
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(Icons.person, size: 80, color: Colors.white38),
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

class _AuthorStatsRow extends StatelessWidget {
  final AuthorDetailModel author;

  const _AuthorStatsRow({required this.author});

  @override
  Widget build(BuildContext context) {
    // Currently model has no booksCount or followers
    // You can extend the model later or show placeholders
    final items = <Widget>[];

    // Example placeholder until you add real data to model
    items.add(const _StatChip(icon: Icons.menu_book_rounded, label: 'Books • —'));
    items.add(const _StatChip(icon: Icons.group, label: 'Followers • —'));

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.white70),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _BookMiniCard extends StatelessWidget {
  final String title;
  final String cover;

  const _BookMiniCard({required this.title, required this.cover});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: cover,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.grey.shade800),
              errorWidget: (_, __, ___) => Container(
                color: Colors.grey.shade800,
                child: const Icon(Icons.book, color: Colors.white38),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 140,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _AuthorExtraInfo extends StatelessWidget {
  const _AuthorExtraInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find more',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _LinkChip(icon: Icons.language, label: 'Website'),
            _LinkChip(icon: Icons.import_contacts, label: 'Twitter'),
            _LinkChip(icon: Icons.article, label: 'Articles'),
          ],
        ),
      ],
    );
  }
}

class _LinkChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _LinkChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: Colors.white70),
      label: Text(label),
      backgroundColor: Colors.white.withOpacity(0.12),
      labelStyle: const TextStyle(color: Colors.white),
      onPressed: () {
        // TODO: open link (you can make this dynamic later)
      },
    );
  }
}