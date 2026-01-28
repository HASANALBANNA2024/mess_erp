import 'package:flutter/material.dart';
import 'package:mess_erp/admin_screen/manager_dashboard.dart';
import 'package:mess_erp/screens/forgot_password.dart';
import 'package:mess_erp/screens/register_screen.dart';
import 'package:mess_erp/admin_screen/admin_dashboard.dart';

class LoginScreen extends StatelessWidget
{
  // controller add
  final userIDController = TextEditingController();
  final passwordIDController = TextEditingController();





   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App logo
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.location_city_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              // App Name
              const Text('Mess ERP',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 8,),
              const Text(
                'Login to manage your mess',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14,
                color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40,),

              // TextField for user ID
              TextField(
                controller: userIDController,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  hintText: 'Enter Your ID',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
              const SizedBox(height: 16,),
              //TextField for Password
              TextField(
              obscureText: true,
                controller: passwordIDController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
              const SizedBox(height: 12,),

              // forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                  //future
                  //Navigate to forgot password screen

                }, child: Text('Forgot Password')),
              ),

              const SizedBox(height: 20,),
              //login Button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),


                  onPressed: (){

                    final userId = userIDController.text.trim();
                    final password = passwordIDController.text.trim();


                    // static login (temporary)

                    if(userId == "admin" && password == "admin")
                      {
                        // admin dashboard call
                        Navigator.pushReplacement(context,

                            MaterialPageRoute(builder: (_) => const AdminDashboard()));

                      }
                    else if(userId == "manager" && password == "manager")
                      {
                        // Manager Dashboard
                        Navigator.pushReplacement(context,

                            MaterialPageRoute(builder: (_) => const ManagerDashboardScreen()));
                      }
                    else
                      {
                        // Wrong Credentials
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inavlid user id or Password")));
                      }





                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
                    //Future login Logic
                    //call api
                    // verify user ID & password
                    // get role /admin /manager/ member
                    // navigate based on role
                  }, child: const Text('Login', style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ),

              const SizedBox(height: 20,),
              //Register Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),


                onPressed: (){
                  //Future login Logic
                  //call api
                  // verify user ID & password
                  // get role /admin /manager/ member
                  // navigate based on role
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));


                }, child: const Text('Register (New)', style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ),

              // Footer for company name
              const SizedBox(height: 30,),
              //footer text
              const Text('Powered by Banna Innovative Software ltd',
              textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12,
                  color: Colors.black),)



            ],

          ),

        ),





      )),
    );
  }
}