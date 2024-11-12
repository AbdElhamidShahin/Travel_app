import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/articalmodel.dart';
import '../model/cubit/bloc.dart';
import '../model/cubit/states.dart';
import '../view/Wedget/CustomDetails.dart';
import '../view/Wedget/IconfavoriteItem.dart';

class Search extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                // استدعاء دالة البحث عند تغيير القيمة
                RecipeCubit.get(context).getSearch(value);
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
          ),
          Flexible(
            child: BlocConsumer<RecipeCubit, RecipeState>(
              listener: (BuildContext context, RecipeState state) {
                if (state is NewsGetSearchLodingState) {
                  // يمكنك إضافة مؤشر تحميل هنا إذا أردت
                }
              },
              builder: (BuildContext context, RecipeState state) {
                var list = RecipeCubit.get(context).searchResults;

                // حالة البحث أثناء التحميل
                if (state is NewsGetSearchLodingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                // حالة عدم العثور على نتائج
                if (list.isEmpty) {
                  return const Center(
                    child: Text(
                      "No results found",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                // إرسال نتائج البحث إلى ArticleBuilder لعرضها
                return ArticleBuilder(travel: list);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleBuilder extends StatelessWidget {
  final List<Travel> travel; // استلام قائمة الأماكن
  const ArticleBuilder({
    Key? key,
    required this.travel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomDetails()),
        );
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          childAspectRatio: .85, // نسبة العرض إلى الارتفاع
        ),
        itemCount: travel.length, // عدد العناصر في القائمة
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Image(
                              image: AssetImage(
                                travel[index].image,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Iconfavoriteitem(
                                  travel: travel[index],
                                )),
                          ), // تمرير travel هنا
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        travel[index].name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${travel[index].price}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "/Person",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Egypt',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Spacer(),
                        Image(
                          image: AssetImage('assets/imagesFood/star.png'),
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          "4.6",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
          // return Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color:  Colors.white , // تغيير اللون بناءً على الفهرس
          //     ),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(8), // إضافة تأثير دائرية للصورة
          //             child: Image.asset(
          //               travel[index].image, // عرض الصورة
          //               height: 150, // حجم الصورة
          //               width: 150,
          //               fit: BoxFit.cover, // ضبط الصورة لملائمة الحجم
          //             ),
          //           ),
          //         ),
          //         const SizedBox(height: 8), // إضافة مسافة بين الصورة والنص
          //         Text(
          //           travel[index].name, // اسم المكان
          //           style: GoogleFonts.poppins(
          //             fontSize: 8,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black,
          //           ),
          //         ),
          //         const SizedBox(height: 4),
          //         Text(
          //           '${travel[index].price}/Person', // السعر لكل شخص
          //           style: GoogleFonts.poppins(
          //             fontSize: 14,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
