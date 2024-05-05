import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/auth_text_form_field.dart';
import '../../data/models/register_request.dart';
import '../../data/repositories/register_repository_impl.dart';
import '../../domain/repositories/register_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final RegisterRepository registerRepository = RegisterRepositoryImpl();

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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Create new account',
                          style: TextStyle(
                            color: Color(0xFFd5c48e),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: AuthTextFormField(
                              controller: firstNameController,
                              hintText: 'First Name',
                            ),
                          ),
                          Flexible(
                            child: AuthTextFormField(
                              controller: lastNameController,
                              hintText: 'Last name',
                            ),
                          ),
                        ],
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
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          final RegisterRequest registerRequest =
                              RegisterRequest(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          registerRepository.register(registerRequest);
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
                          'Sign up',
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
