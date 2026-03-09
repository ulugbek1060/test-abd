import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/library/author_detail_cubit.dart'; // or your navigation method

class AuthorDetailScreen extends StatelessWidget {
  final int? authorId; // or String slug, etc.

  const AuthorDetailScreen({super.key, this.authorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<AuthorDetailCubit>(param1: authorId)..getAuthor(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

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
      body: const _AuthorDetailContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FilledButton.icon(
          onPressed: () {
            // TODO: navigate to author's books list / library filter
            // context.push('/books?authorId=$authorId');
          },
          icon: const Icon(Icons.library_books_rounded),
          label: const Text(
            'View All Books',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthorDetailContent extends StatelessWidget {
  const _AuthorDetailContent();

  // ─── Static demo data ────────────────────────────────────────────────
  static final _demoAuthor = {
    'name': 'James Clear',
    'photoUrl':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
    'bio':
        'James Clear is an American writer and habit expert. He is the author of the #1 New York Times bestseller Atomic Habits, which has sold more than 15 million copies worldwide and has been translated into more than 50 languages. His work has appeared in Entrepreneur magazine, Time magazine, the New York Times, the Wall Street Journal, and on CBS This Morning.',
    'born': '1986',
    'nationality': 'American',
    'booksCount': 3,
    'followers': '1.2M',
    'popularBooks': [
      {
        'title': 'Atomic Habits',
        'cover':
            'https://images.unsplash.com/photo-1544947950-fa07a98d4679?w=400',
      },
      {
        'title': 'Habits',
        'cover':
            'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400',
      },
      {
        'title': 'Clear Thinking',
        'cover':
            'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final author = _demoAuthor;

    return CustomScrollView(
      slivers: [
        // Hero author image section
        SliverToBoxAdapter(child: _AuthorCoverHeader(author: author)),

        // Main content
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
                      author['name'] as String,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.15,
                            letterSpacing: -0.4,
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Follow',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Text(
                '${author['nationality']} • Born ${author['born']}',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white70),
              ),

              const SizedBox(height: 28),

              // Stats chips
              _AuthorStatsRow(author: author),

              const SizedBox(height: 36),

              // Bio
              if ((author['bio'] as String?)?.isNotEmpty == true) ...[
                Text(
                  'About the Author',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  author['bio'] as String,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                    color: Colors.white.withOpacity(0.92),
                  ),
                ),
                const SizedBox(height: 40),
              ],

              // Popular books section
              Text(
                'Popular Books',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (author['popularBooks'] as List).length,
                  itemBuilder: (context, index) {
                    final book = (author['popularBooks'] as List)[index] as Map;
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

              // Extra info (website, twitter, etc.) if you want to add
              _AuthorExtraInfo(),
            ]),
          ),
        ),
      ],
    );
  }
}

// ─── Helper Widgets ──────────────────────────────────────────────────

class _AuthorCoverHeader extends StatelessWidget {
  final Map<String, dynamic> author;

  const _AuthorCoverHeader({required this.author});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred background
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
            imageUrl: author['photoUrl'] as String,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey.shade900),
            errorWidget: (_, __, ___) => Container(
              color: Colors.grey.shade900,
              child: const Icon(Icons.person, size: 120, color: Colors.white24),
            ),
          ),
        ),

        // Centered circular portrait
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
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: 4,
                ),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: author['photoUrl'] as String,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(color: Colors.grey.shade800),
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.person,
                      size: 80,
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

class _AuthorStatsRow extends StatelessWidget {
  final Map<String, dynamic> author;

  const _AuthorStatsRow({required this.author});

  @override
  Widget build(BuildContext context) {
    final items = [
      _StatChip(icon: Icons.menu_book, label: '${author['booksCount']} Books'),
      _StatChip(icon: Icons.group, label: '${author['followers']} Followers'),
    ];

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
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _LinkChip(icon: Icons.language, label: 'Website'),
            _LinkChip(icon: Icons.import_contacts, label: 'Twitter'),
            // use actual Icons.twitter if available
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
        // TODO: open link
      },
    );
  }
}
