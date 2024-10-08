import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';

 class SignIn extends StatefulWidget{
  const SignIn({super.key});
  
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn>{
	TextEditingController _emailAddressController = TextEditingController();
	TextEditingController _passwordController = TextEditingController();
	
	@override	
	Widget build(BuildContext context){	
		return GestureDetector(
			onTap: () {
				FocusScopeNode currentFocus = FocusScope.of(context);
				if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null){
				currentFocus.focusedChild?.unfocus();	
				}	
			},
			child: Scaffold(
			body: Padding(
				padding: const EdgeInsets .fromLTRB(20, 110, 20, 110),
				child: Column(
					mainAxisAlignment : MainAxisAlignment.center,
			  		crossAxisAlignment: CrossAxisAlignment. start,
					children: [
					const Text(
						'Login',
						style: TextStyle(fontSize: 32,fontWeight : FontWeight.bold),
					),	
					const SizedBox (height: 10),
					const Text(
					'please sign in to continuue.',
					style: TextStyle(fontSize: 20, color: Colors.grey),
					),
					const SizedBox(height: 40),
					TextFormField(
						controller: _emailAddressController,
						style: const TextStyle(color: Colors.black, fontFamily: 'sFUIDisplay'),
						decoration: const InputDecoration(
							border: InputBorder.none,
							labelText: 'EMAIL',
							prefixIcon: Icon(Icons. email_outlined),
							labelStyle: TextStyle (fontSize: 12)
					),
				),
				const SizedBox(height: 10),
				TextFormField (
				controller: _passwordController,
           			obscureText: true,
					style: TextStyle (color: Colors.black, fontFamily: 'SFUIDisplay'),
					decoration: InputDecoration(
					 border: InputBorder.none,
					 labelText: 'PASSWORD',
					 prefixIcon: const Icon(Icons.lock_outlined),
					 suffixIcon: TextButton(
					 	onPressed: () {},
					 	child: const Text(
						 'FORGOT',
						 style: TextStyle(color: Colors.green),
						 ),
					 ),
					 labelStyle: const TextStyle(fontSize: 12),
					),
				),
				const SizedBox(height: 10),
						Align(
							alignment: Alignment.centerRight,
							child: SizedBox(
								height:50,
								child: ElevatedButton(
									onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailAddressController.text, password: _passwordController.text).
                    then((value) => {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()))
                    });
                  	},
									style: ElevatedButton.styleFrom(
										//primary: Colors.green,
										shape: RoundedRectangleBorder(
											borderRadius:BorderRadius.circular(30.0))),
									child: const Row(
										mainAxisSize: MainAxisSize.min,
										children: [
											const Text(' LOGIN'),
											const SizedBox(width: 5),
											const Icon(Icons.arrow_forward, size: 24.0)
										],
									),
								),
							),
						),
					],
				),
			),
			bottomNavigationBar: SizedBox(
			 	height: 60,
			 	child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
			 		const Text(
			 			"Dont't have an account? ",
			 			style: TextStyle(
			  				fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15),
			 ),
				 TextButton(
			 		onPressed: () {},
			 		child: const Text(
				 		'Sign Up',
				 		style: TextStyle(
							 fontFamily: 'SFUIDisplay',
							 color: Colors.green,
							 fontSize: 15),
				 ))
			 ]),
			 )),
		);
    
	}			
}
 