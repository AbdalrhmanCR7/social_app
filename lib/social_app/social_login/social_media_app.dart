import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:social_app/modules/componests/componests.dart';

class loginscreen extends StatefulWidget {
  @override
  State<loginscreen> createState() => _loginscreenState();
}
class _loginscreenState extends State<loginscreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const Icon(
          Icons.menu,
        ),
        title: Text(' SPU Social Medil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print('abd');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              print('abd');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              defoultbTextFormField(
                controller: emailController,
                label: 'Email',
                prifix: Icons.email,
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'password is must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              defoultbTextFormField(
                  controller: passwordController,
                  label: 'Password',
                  prifix: Icons.lock,
                  type: TextInputType.visiblePassword,
                  isPassword: ispassword,
                  suffix:
                      ispassword ? Icons.visibility_outlined : Icons.visibility,
                  suffixPresert: () {
                    setState(() {
                      ispassword = !ispassword;
                    });
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'password is must not be empty';
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              // هاد تابع مستعا من صفحة عامل فيها زر ال لوك ان
              // ريسبل كومبوننت

              defaultButton(
                text: 'LogIN',
                isUpprCsae: false,
                //radius: 10.0,
                function: () {
                  if (formkey.currentState!.validate()) {
                    print(emailController.text);
                    print(passwordController.text);
                  }
                },
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don`t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'now',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
