import 'package:ecom_app/ui/login/verefication_screen/pin_verification_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerificationVWidget extends StatefulWidget {
  VerificationVWidget({Key? key}) : super(key: key);

  @override
  State<VerificationVWidget> createState() => _VerificationVWidgetState();
}

class _VerificationVWidgetState extends State<VerificationVWidget> {

  Color yellowColor = const Color.fromRGBO(231, 185, 68, 1);

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
                        padding: EdgeInsets.fromLTRB(24, 91, 60, 44),
                        child:  Text('Verification Code',
                        textAlign: TextAlign.left,
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
                    const SizedBox(height: 33,),
                    const Padding(
                      padding: EdgeInsets.only(left: 24,right: 160),
                      child: Text('Please enter Code sent to ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(96, 90, 101, 1),
                      
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 37),
                      child: Row(
                        children: [
                          const Text('+380991234567',
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.black),),
                          
                          TextButton(
                            onPressed:(){
                                Navigator.of(context).pop();
                            }, 
                            child: const Text('Change Phone Number',
                            style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(52, 40, 62, 1),
                              decoration: TextDecoration.underline,
                              )
                              )
                              )
                        ],
                      ) ,
                      ),
                    const SizedBox(height: 24,),
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24),
                      child: PinVerificationBodyWidget(),
                    ),

          
                    
                      const SizedBox(height: 24,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                                primary:yellowColor,
                                onPrimary: Colors.white,
                                minimumSize: const Size(327, 64),
                              ),
                      onPressed: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterPhoneWidget()));
                      },
                      child: const Text('Send Verification Code',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),)
                      ),
                      const SizedBox(height: 24,),
                      Padding(
                        padding: const EdgeInsets.only(left: 24,right: 24),
                        child: TextButton
                        (
                          onPressed: (){}, 
                        child: const Text(
                          'Resend code',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(155, 155, 155, 1),
                            )
                            )
                            ),

                      )
          ],
        ),
                
      ),
    );
  }
}