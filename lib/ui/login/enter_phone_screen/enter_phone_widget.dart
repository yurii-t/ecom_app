import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnterPhoneWidget extends StatefulWidget {
  const EnterPhoneWidget({Key? key}) : super(key: key);

  @override
  State<EnterPhoneWidget> createState() => _EnterPhoneWidgetState();
}

class _EnterPhoneWidgetState extends State<EnterPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                      width: MediaQuery.of(context).size.width,
                      //375,
                      height:197,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(24, 91, 39, 44),
                        child:  Text('What Is Your Phone Number?',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),),
                      ),
                      decoration: const BoxDecoration(
                        color:Colors.purple,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(300.0)),
                         gradient: LinearGradient(
                      colors: [Color.fromRGBO(52, 40, 60, 1),Color.fromRGBO(132, 95, 161, 1),],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      ),
                      ),
                    ),
                    SizedBox(height: 33,),
                    const Text('Please enter your phone number to verify your account',
                    style: TextStyle(
                      fontSize:17,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(96, 90, 101, 1),

                    ),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('Next')
                      ),
                      TextButton
                      (onPressed: (){}, 
                      child: const Text('Skip'))
          ],
        ),
                
      ),
    );
  }
}