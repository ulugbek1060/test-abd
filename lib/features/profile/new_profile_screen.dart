import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            _profileHeader(),
            const SizedBox(height: 16),
            _statisticsSection(),
            const SizedBox(height: 12),
            _bookmarkButton(),
            const SizedBox(height: 12),

            /// CONTENT
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  _BlocksTab(),
                  _QuestionsTab(),
                  _BooksTab(),
                ],
              ),
            ),
          ],
        ),

        /// BOTTOM TAB BAR
        bottomNavigationBar: const Material(
          color: Colors.black,
          child: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Blocks"),
              Tab(text: "Questions"),
              Tab(text: "Books"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/200",
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _CountItem(title: "Followers", value: "1.2K"),
                    _CountItem(title: "Following", value: "180"),
                    _CountItem(title: "Level", value: "Expert"),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Maverick Developer",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Building apps • Solving problems • Learning daily 🚀",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statisticsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _StatItem(title: "Coins", value: "2,450"),
            _StatItem(title: "Correct", value: "320"),
            _StatItem(title: "Wrong", value: "58"),
            _StatItem(title: "Accuracy", value: "84%"),
          ],
        ),
      ),
    );
  }

  Widget _bookmarkButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.bookmark),
        label: const Text("Bookmarked Questions"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

/// ---------- TABS ----------

class _BlocksTab extends StatelessWidget {
  const _BlocksTab();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: 6,
      itemBuilder: (_, index) => _GridCard(title: "Block ${index + 1}"),
    );
  }
}

class _QuestionsTab extends StatelessWidget {
  const _QuestionsTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) => ListTile(
        tileColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text("Question ${index + 1}"),
        subtitle: const Text("Difficulty: Medium"),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _BooksTab extends StatelessWidget {
  const _BooksTab();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (_, index) => _GridCard(title: "Book ${index + 1}"),
    );
  }
}

/// ---------- COMPONENTS ----------
class _CountItem extends StatelessWidget {
  final String title;
  final String value;

  const _CountItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _GridCard extends StatelessWidget {
  final String title;

  const _GridCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
