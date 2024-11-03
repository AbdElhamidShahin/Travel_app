import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Wedget/CustomTextFeild.dart';
import '../screens/HomePage.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const emailRegex = "@gmail.com";

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            // الصورة الخلفية الثابتة
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // تعديل الشفافية هنا
                  BlendMode.darken,
                ),
                child: Image.asset(
                  'assets/food/293364-wallpaper-1080-2280.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                      const Text(
                        'Time to cook, let\'s Sign in',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Customtextfeild(
                        validator: (value) {
                          if (RegExp(emailRegex).hasMatch(value!)) {
                          } else if (value.isEmpty) {
                            return "@gmail.com";
                          } else {
                            return "@gmail.com";
                          }
                          return null;
                        },
                        hintText: 'Email',
                        lableText: 'Email',
                      ),
                      Customtextfeild(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length > 8) {
                            return 'Must be at least 6 chars';
                          }

                          return null;
                        },
                        hintText: 'PassWord',
                        lableText: 'PassWord',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        height: 55,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );

                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType
                                        .fade, // أو استخدم PageTransitionType.slideRight أو غيرها
                                    duration: const Duration(
                                        milliseconds: 500), // مدة الانتقال
                                    child: const HomePage(),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'SIGN IN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'It\'s your first time here?',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Sign up ',
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
