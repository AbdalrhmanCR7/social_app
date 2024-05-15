import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/auth_text_form_field.dart';
import '../../data/models/login_request.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/repositories/login_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepository loginRepository = LoginRepositoryImpl();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(71, 71, 71, 0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: const Border(
                    top: BorderSide(color: Color(0xFFd5c48e), width: 5),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/SPU.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
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
                      AuthTextFormField(
                        controller: emailController,
                        suffixIcon: Icons.email_outlined,
                        hintText: 'Email Address',
                      ),
                      AuthTextFormField(
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
                              onTap: () {
                                Navigator.of(context).pushNamed(Routes.registerPage);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsetsDirectional.only(end: 20),
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
                        onPressed: ()async {
                          try {
                            final LoginRequest loginRequest = LoginRequest(
                                email: emailController.text,
                                password: passwordController.text);
                            await loginRepository.login(loginRequest);
                            Navigator.of(context).pushNamed(Routes.feedsScreen);
                          }catch(e){}
                        },

                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFe4d199)),
                          fixedSize: const MaterialStatePropertyAll(
                              Size.fromWidth(270)),
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
          ),
        )
      ],
    ));
  }
}
