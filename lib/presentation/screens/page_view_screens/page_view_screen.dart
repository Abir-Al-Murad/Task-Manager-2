import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});
  static String name = '/page-view';

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/page1.png",
      "title": "Manage Everything in One Place",
      "subtitle":
      "Create, categorize, and keep track of all your personal and work tasks effortlessly — right from your dashboard."
    },
    {
      "image": "assets/images/page2.png",
      "title": "Stay Organized",
      "subtitle":
      "Easily sort and filter tasks by category, deadline, or priority to stay on top of your goals."
    },
    {
      "image": "assets/images/page3.png",
      "title": "Achieve More",
      "subtitle":
      "Boost productivity with reminders, progress tracking, and insights into your completed tasks."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (predicate)=>false);
          }, child: Text('Skip',style: TextStyle(color: App_colors.brandColor)),)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(page['image']!,height: 250,),
                          const SizedBox(height: 20),
                          Text(
                            page["title"]!,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            page["subtitle"]!,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? App_colors.brandColor
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Spacer(),
              FilledButton(onPressed: (){
                _currentPage == _pages.length-1?Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (predicate)=>false):
                  _pageController.animateToPage(_currentPage+1, duration: Duration(milliseconds: 400), curve: Curves.easeOut);

              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_currentPage == _pages.length-1?"Continue":"Next",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                  const SizedBox(width: 8,),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
