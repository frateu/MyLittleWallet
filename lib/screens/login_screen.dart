import 'package:flutter/material.dart';
import 'package:mylittlewallet/screens/dashboard_screen.dart';
import 'package:mylittlewallet/functions/authenticator.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState(){
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/Finance-Wallet-icon.png',
                height: 150,
                fit:BoxFit.fill,
              ),
              const Text(
                "MyLittleWallet",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){},
                      child: const Text(
                      "Forget Password?"
                  ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
                ),
                child: MaterialButton(
                  onPressed: (){
                    if (authenticator(emailController.text, passwordController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardScreen()),
                      );
                    }
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 30,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                    ),

                  ),
                  TextButton(onPressed: (){}, child: const Text(
                      "Register Account"
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}