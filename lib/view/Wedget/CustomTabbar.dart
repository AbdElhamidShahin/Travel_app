import 'package:flutter/material.dart';
import '../../model/ImageUpper.dart';
import '../screens/StackScreen.dart';

class Customtabbar extends StatefulWidget {
  const Customtabbar({super.key});

  @override
  State<Customtabbar> createState() => _CustomtabbarState();
}

class _CustomtabbarState extends State<Customtabbar> {
  int selectedIndex = 0; // لتتبع التبويب المحدد

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start, // لضمان المحاذاة من اليسار
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // التمرير الأفقي
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              onTabChanged: (index) {
                setState(() {
                  selectedIndex = index; // تحديث التبويب عند التغيير
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 255, // Adjust height to control the size of TabBarView
          child: IndexedStack(
            index:
                selectedIndex, // استخدام IndexedStack لعرض التبويبات بناءً على الاختيار
            children: const [
              StacksScreen(category: 'egyptian_landmarks'),
              StacksScreen(category: 'natural_places'),
              StacksScreen(category: 'egyptian_hills'),
              StacksScreen(category: 'egyptian_cities'),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // محاذاة الأيقونات أفقيًا
          children: [
            _buildTabItem(0, 'assets/travel/Images/Desert.png', 'Desert '),
            _buildTabItem(1, 'assets/travel/Images/download.jpeg', 'Landscapes '),
            _buildTabItem(2, 'assets/travel/Images/Lake.jpeg', 'Hills  '),
            _buildTabItem(3, 'assets/travel/Images/Lake.jpeg', 'City  '),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String image, String text) {
    return GestureDetector(
      onTap: () {
        onTabChanged(index); // تحديث التبويب عند الضغط
      },

      child: Padding(
        padding: const EdgeInsets.only(right: 10 ),
        child: ImageUpper(
          image: image,
          text: text,
          isSelected: selectedIndex == index, // تغيير اللون عند التحديد
        ),
      ),
    );
  }
}
