import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:local_database/model/account_model.dart';

import '../service/get_service.dart';
import '../service/log_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const String id = 'account_page';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final _email = TextEditingController();
  final _number = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.teal[700],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 30,bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  const Text("Welcome", style: TextStyle(color: Colors.white60, fontSize: 17),),
                  const SizedBox(height: 5,),
                  const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            const SizedBox(height: 20,),

            Expanded(
                child:Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(55), topRight: Radius.circular(55)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const SizedBox(height: 40,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Email",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                      Container(
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                        ),
                                        child: TextField(
                                          controller: _email,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              hintStyle: TextStyle(color: Colors.grey[400]),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      const Text("Number",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                      Container(
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                        ),
                                        child: TextField(
                                          controller: _number,
                                          decoration: InputDecoration(
                                              hintText: "Number",
                                              hintStyle: TextStyle(color: Colors.grey[400]),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      const Text("Address",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                      Container(
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                        ),
                                        child: TextField(
                                          controller: _address,
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              hintStyle: TextStyle(color: Colors.grey[400]),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal[700],
                            ),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  var user = Account(_email.text, _number.text, _address.text);
                                  GetService.storeUser(user);
                                  LogService.i(user.toJson().toString());
                                });
                              },
                              child: const Center(
                                child: Text("Sign Up", style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Text("OR", style: TextStyle(
                              color: Colors.grey[400], fontWeight: FontWeight.bold),),
                          const SizedBox(height: 40,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesome.facebook,
                                      color: Colors.blue[800],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesome.twitter,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesome.instagram,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
