import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../shared/componests/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.teal,
        //   leading: const Icon(
        //     Icons.menu,
        //   ),
        //   title: const Text('ABDALRHMAN'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       icon: const Icon(
        //         Icons.notification_important,
        //       ),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       icon: const Icon(
        //         Icons.search,
        //       ),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        body: Stack(
      children: [
        Image.asset(
          'assets/images/background_image.jpg',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 450,
                width: 320,
                padding: const EdgeInsets.only(top: 40),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(71, 71, 71, 0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: const Border(
                    top: BorderSide(color: Color(0xFFd5c48e), width: 5),
                  ),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage('assets/images/SPU.jpg'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'User Login',
                        style: TextStyle(
                          color: Color(0xFFd5c48e),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      suffixIcon: Icons.email_outlined,
                      hintText: 'Email Address',
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      obscureText: true,
                      suffixIcon: Icons.password,
                      hintText: 'Password',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't Have An Account? ",
                            style: TextStyle(
                              color: Color(0xFFcccccc),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsetsDirectional.only(end: 20),
                              alignment: AlignmentDirectional.centerEnd,
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Color(0xFFcccccc),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFFe4d199)),
                        fixedSize:
                            const MaterialStatePropertyAll(Size.fromWidth(270)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF362d0e),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    )
        // body: Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Form(
        //     key: formKey,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           "Login",
        //           style: TextStyle(
        //             fontSize: 40,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         const SizedBox(height: 20),
        //         defoultbTextFormField(
        //           controller: emailController,
        //           label: 'Email',
        //           prifix: Icons.email,
        //           type: TextInputType.emailAddress,
        //           validate: (value) {
        //             if (value!.isEmpty) {
        //               return 'password is must not be empty';
        //             }
        //             return null;
        //           },
        //         ),
        //         const SizedBox(height: 10),
        //         defoultbTextFormField(
        //             controller: passwordController,
        //             label: 'Password',
        //             prifix: Icons.lock,
        //             type: TextInputType.visiblePassword,
        //             isPassword: obscureText,
        //             suffix: obscureText
        //                 ? Icons.visibility_outlined
        //                 : Icons.visibility,
        //             suffixPresert: () {
        //               setState(() {
        //                 obscureText = !obscureText;
        //               });
        //             },
        //             validate: (value) {
        //               if (value!.isEmpty) {
        //                 return 'password is must not be empty';
        //               }
        //               return null;
        //             }),
        //         const SizedBox(height: 20),
        //         defaultButton(
        //           text: 'LogIN',
        //           isUpprCsae: false,
        //           function: () {
        //             if (formKey.currentState!.validate()) {}
        //           },
        //         ),
        //         const SizedBox(height: 10),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Text('Don`t have an account?'),
        //             TextButton(
        //               onPressed: () {},
        //               child: const Text(
        //                 'now',
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
