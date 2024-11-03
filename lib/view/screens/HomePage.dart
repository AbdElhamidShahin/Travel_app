import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cubit/bloc.dart';
import '../../model/cubit/states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FoodCubit(),
      child: BlocConsumer<FoodCubit, FoodState>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = FoodCubit.get(context);

          return Scaffold(
            body: cubit.screens[cubit.currentIndex],  // يعرض الشاشة بناءً على الفهرس الحالي
            bottomNavigationBar: Container(
              height: 70,
              margin: const EdgeInsets.all(0),  // إضافة مسافة حول الشريط السفلي
              decoration: BoxDecoration(
                color: Colors.black54,  // لون خلفية الشريط
                borderRadius: BorderRadius.circular(30),  // جعل الزوايا مستديرة
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),  // قص الحواف لتصبح دائرية
                child: BottomNavigationBar(
                  items: cubit.bottomItems,  // قائمة العناصر السفلية
                  currentIndex: cubit.currentIndex,  // الفهرس الحالي
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);  // تغيير الفهرس عند الضغط على عنصر
                  },
                  backgroundColor: Colors.black54,  // لون الخلفية
                  type: BottomNavigationBarType.fixed,  // نوع الشريط ثابت
                  selectedItemColor: Colors.amber,  // لون العنصر المختار
                  unselectedItemColor: Colors.white54,  // لون العناصر غير المختارة
                  elevation: 0,  // إلغاء الظل الافتراضي
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
