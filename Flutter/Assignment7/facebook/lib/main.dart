import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookCloneApp());
}

class FacebookCloneApp extends StatelessWidget {
  const FacebookCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1877F2),
        scaffoldBackgroundColor: const Color(0xFFF2F3F5),
        cardColor: const Color.fromARGB(255, 250, 248, 248),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          elevation: 0.5,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Center(child: Text('Friends', style: TextStyle(fontSize: 22))),
    Center(child: Text('Watch', style: TextStyle(fontSize: 22))),
    Center(child: Text('Notifications', style: TextStyle(fontSize: 22))),
    Center(child: Text('Menu', style: TextStyle(fontSize: 22))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1877F2),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_outlined),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}

// ----------------- Models & Dummy Data -----------------
class User {
  final String id;
  final String name;
  final String avatar;

  User({required this.id, required this.name, required this.avatar});
}

class Post {
  final String id;
  final User user;
  final String text;
  final String? image;
  final DateTime createdAt;
  int likes;
  int comments;
  int shares;

  Post({
    required this.id,
    required this.user,
    required this.text,
    this.image,
    required this.createdAt,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}

class Comment {
  final String id;
  final User user;
  final String text;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.createdAt,
  });
}

final Map<String, List<Comment>> postComments = {
  'p1': [
    Comment(
      id: 'c1',
      user: users[1],
      text: 'Those pancakes look amazing! 🥞',
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Comment(
      id: 'c2',
      user: users[2],
      text: 'I’ve been wanting to try that cafe too!',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
  ],
  'p2': [
    Comment(
      id: 'c3',
      user: users[0],
      text: 'Looks so relaxing 🌴',
      createdAt: DateTime.now().subtract(const Duration(minutes: 11)),
    ),
  ],
  'p3': [
    Comment(
      id: 'c4',
      user: users[3],
      text: 'Try “Atomic Habits” — it’s a game changer.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    Comment(
      id: 'c5',
      user: users[1],
      text: 'I second that! Really practical book.',
      createdAt: DateTime.now().subtract(const Duration(seconds: 15)),
    ),
  ],
};

final currentUser = User(
  id: 'u0',
  name: 'You',
  avatar: 'https://i.pravatar.cc/150?img=5',
);

final users = [
  User(id: 'u1', name: 'Aina', avatar: 'https://i.pravatar.cc/150?img=10'),
  User(id: 'u2', name: 'Imran', avatar: 'https://i.pravatar.cc/150?img=12'),
  User(id: 'u3', name: 'Ali', avatar: 'https://i.pravatar.cc/150?img=18'),
  User(id: 'u4', name: 'Rifat', avatar: 'https://i.pravatar.cc/150?img=22'),
];

final List<Post> demoPosts = [
  Post(
    id: 'p1',
    user: users[0],
    text:
        'Had a great brunch today at the new cafe downtown! Highly recommend the pancakes. 🥞',
    image:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80',
    createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    likes: 120,
    comments: 24,
    shares: 8,
  ),
  Post(
    id: 'p2',
    user: users[1],
    text: 'Weekend getaway 🌊',
    image:
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1000&q=80',
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    likes: 540,
    comments: 89,
    shares: 31,
  ),
  Post(
    id: 'p3',
    user: users[2],
    text:
        'Reading a fantastic book on productivity. Anyone has recommendations?',
    createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 5)),
    likes: 30,
    comments: 6,
    shares: 1,
  ),
];

// ----------------- Home Page -----------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Row(
            children: [
              Text(
                'facebook',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(width: 6),
              const Expanded(child: SizedBox()),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_outlined),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                _buildCreatePostCard(context),
                const SizedBox(height: 10),
                _buildStoriesList(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final post = demoPosts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              child: PostCard(
                post: post,
                onLike: () {
                  setState(() => post.likes += 1);
                },
                onComment: () => _showCommentsModal(context, post), // 👈 new
              ),
            );
          }, childCount: demoPosts.length),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }

  void _showCommentsModal(BuildContext context, Post post) {
    final TextEditingController commentController = TextEditingController();
    postComments.putIfAbsent(post.id, () => []);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final comments = postComments[post.id]!;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const Divider(),

                    // Comments list
                    Expanded(
                      child: comments.isEmpty
                          ? const Center(
                              child: Text(
                                'No comments yet. Be the first to comment!',
                                style: TextStyle(color: Colors.black54),
                              ),
                            )
                          : ListView.builder(
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                final c = comments[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      c.user.avatar,
                                    ),
                                  ),
                                  title: Text(
                                    c.user.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(c.text),
                                  trailing: Text(
                                    '${DateTime.now().difference(c.createdAt).inMinutes}m ago',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),

                    const Divider(height: 1),

                    // Comment input
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.avatar),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: const InputDecoration(
                              hintText: 'Write a comment...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.blue),
                          onPressed: () {
                            final text = commentController.text.trim();
                            if (text.isEmpty) return;

                            final newComment = Comment(
                              id: DateTime.now().toIso8601String(),
                              user: currentUser,
                              text: text,
                              createdAt: DateTime.now(),
                            );

                            setModalState(() {
                              comments.add(newComment);
                            });
                            commentController.clear();

                            setState(() {
                              post.comments = comments.length;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCreatePostCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(currentUser.avatar)),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => _showCreatePostModal(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "What's on your mind?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_library, color: Colors.green),
          ),
        ],
      ),
    );
  }

  void _showCreatePostModal(BuildContext context) {
    final TextEditingController txt = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.avatar),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      currentUser.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: txt,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "What's on your mind?",
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final text = txt.text.trim();
                        if (text.isNotEmpty) {
                          setState(() {
                            demoPosts.insert(
                              0,
                              Post(
                                id: DateTime.now().toIso8601String(),
                                user: currentUser,
                                text: text,
                                createdAt: DateTime.now(),
                              ),
                            );
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Post'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStoriesList() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _StoryTile(isAdd: true, user: currentUser),
            );
          }
          final u = users[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _StoryTile(user: u),
          );
        },
      ),
    );
  }
}

class _StoryTile extends StatelessWidget {
  final User? user;
  final bool isAdd;
  const _StoryTile({this.user, this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                  isAdd ? currentUser.avatar : (user?.avatar ?? ''),
                ),
              ),
              if (isAdd)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            isAdd ? 'Create Story' : (user?.name ?? ''),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// ----------------- Post Card -----------------
class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onLike;
  final VoidCallback? onComment; // 👈 add this
  const PostCard({required this.post, this.onLike, this.onComment, super.key});

  String _timeAgo(DateTime dt) {
    final dur = DateTime.now().difference(dt);
    if (dur.inMinutes < 60) return '${dur.inMinutes}m';
    if (dur.inHours < 24) return '${dur.inHours}h';
    return '${dur.inDays}d';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(post.user.avatar)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            _timeAgo(post.createdAt),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.public,
                            size: 12,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
          // text
          if (post.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(post.text),
            ),
          const SizedBox(height: 8),
          // image
          if (post.image != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  post.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
            ),
          const SizedBox(height: 8),
          // stats
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    size: 12,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 6),
                Text('${post.likes}'),
                const Spacer(),
                Text(
                  '${post.comments} Comments',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(width: 8),
                Text(
                  '${post.shares} Shares',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // actions
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: onLike,
                  icon: const Icon(Icons.thumb_up_off_alt),
                  label: const Text('Like'),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: onComment,
                  icon: const Icon(Icons.mode_comment_outlined),
                  label: const Text('Comment'),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                  label: const Text('Share'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
