import 'package:flutter/material.dart';
import 'package:social_app/features/feeds/presentation/page/feeds.dart';
import '../../../chat/presentation/pages/chat_screen.dart';
import '../../../new_post/presentation/pages/new_post_screen.dart';
import '../../../settings/presentation/pages/settings_screen.dart';
import '../../../users/presentation/pages/users_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<Widget> screens = const [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  final List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (pageIndex) {
          setState(() {
            currentIndex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(screens.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      index == 0
                          ? Icons.home_outlined
                          : index == 1
                              ? Icons.chat
                              : index == 2
                                  ? Icons.post_add
                                  : index == 3
                                      ? Icons.person
                                      : Icons.settings,
                      color: currentIndex == index ? Colors.blue : Colors.black,
                    ),
                    Text(
                      titles[index],
                      style: TextStyle(
                        color:
                            currentIndex == index ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
