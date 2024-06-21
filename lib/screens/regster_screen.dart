// import 'dart:html';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/chat_screen.dart';

import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_filed.dart';
import 'package:chat_app/widgets/helper/show_snak_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegsterScreen extends StatelessWidget {
  RegsterScreen({super.key, this.email, this.password});
  String? email;
  String? password;
  bool isLoding = false;
  GlobalKey<FormState> FormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: FormKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      'REGSTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormFiled(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Gmail',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'PassWord',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBotton(
                  onTap: () async {
                    if (FormKey.currentState!.validate()) {
                      isLoding = true;
                      try {
                        await registerUser();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ChatScreen();
                            },
                          ),
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnakBar(
                              context, 'The password provided is too weak.');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnakBar(context, 'you have an acconnt');
                        }
                      } catch (ex) {
                        showSnakBar(context, 'there was an error');
                      }
                      isLoding = false;
                    }
                  },
                  text: 'REGSTER',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' SIGN IN',
                        style: TextStyle(
                            color: Color(0xffC7EDE6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    // ignore: unused_local_variable, non_constant_identifier_names
    UserCredential User = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
