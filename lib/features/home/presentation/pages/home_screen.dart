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
    return
      Scaffold(
      body:
      PageView(
        controller: _pageController,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        height: 60,
           child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.home_outlined),
                    ),
                    Text(titles[0]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.post_add),
                    ),
                    Text(titles[1]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.person),
                    ),
                    Text(titles[2]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.chat),
                    ),
                    Text(titles[3]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    Text(titles[4]),
                  ],
                ),
              ),
            ],
                   ),
         ),


    );

  }
}
