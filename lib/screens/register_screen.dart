import 'package:flutter/material.dart';
import 'package:mess_erp/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget
{
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
{
  final _fromKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  // final userIDController = TextEditingController();
  final emailIDController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String selectedRole = "Member"; // dafualt role

  @override
  void dispose()
  {
    nameController.dispose();
    // userIDController.dispose();
    emailIDController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void register()
  {
    if(_fromKey.currentState!.validate())
    {
      // future logic
      // call api
      // save role
      // on success

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20,),
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
                  
                  // create account message
                  const SizedBox(height: 24,),
                  const Text('Create Account', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 8,),

                  const Text(
                    'Fill in the details to create your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 32,),
                  // Full Name
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter Your Full Name' : null,
                  ),

                  //  User ID Email
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: emailIDController,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter your Email ID' : null,
                  ),
                  // password
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'New Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter Your New Password' : null,
                  ),
                 // confirm password
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: confirmController,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter Your confirmPassword' : null,
                  ),


                  const SizedBox(height: 16,),

                  // Role DopDown
                  DropdownButtonFormField<String>(
                      value: selectedRole,
                      decoration: InputDecoration(
                        labelText: 'Select Role',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),

                      items: const [
                        DropdownMenuItem(
                          value: 'Admin',
                          child: Text("Admin"),
                        ),
                        DropdownMenuItem(
                          value: 'Manager',
                          child: Text("Manager"),
                        ),
                        DropdownMenuItem(
                          value: 'Member',
                          child: Text("Member"),
                        ),


                      ],

                      onChanged: (value)
                  {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                  ),
                  
                  const SizedBox(height: 28,),
                  // Register Button 
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                      ),
                      onPressed: register, child: const Text('Register', style: TextStyle(fontSize: 16, color: Colors.white),)),


                  const SizedBox(height: 16,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ? '),
                      TextButton(onPressed: (){
                        // call login screen
                        Navigator.pop(context);

                      }, child: const Text("Login"),),
                    ],
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),


          ) ,
      ),
    );
  }
}

