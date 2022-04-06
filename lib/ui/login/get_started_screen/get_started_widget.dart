import 'package:ecom_app/ui/login/enter_phone_screen/enter_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartedWidget extends StatefulWidget {
   GetStartedWidget({Key? key}) : super(key: key);

  @override
  State<GetStartedWidget> createState() => _GetStartedWidgetState();
  
}

class _GetStartedWidgetState extends State<GetStartedWidget> {
  Duration _animationDuration = Duration(seconds: 1); 
  double _top = 450.0;
 // double _bottom = 10.0;
 // double _right = 10.0;
  double _left = 150;
  Color yellowColor = const Color.fromRGBO(231, 185, 68, 1);
   // yellowColor = const Color(0xFF7B944);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
            
               
                Stack(
                  alignment: AlignmentDirectional.center,
                  children:[ 
                     Container(
                 
                  height: MediaQuery.of(context).size.height,
                  
                  decoration: const BoxDecoration(
                   
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/start_img.gif'),
                    )
                    ),
               ), 
                  
              AnimatedPositioned(
                duration: _animationDuration,
                top:_top,
             //   bottom: _bottom,
              //  right: _right,
                left: _left,
                
    
                child: 
                // Positioned(
                //   left: _left,//150,
                //   top:_top,//340,
                //   child: 
                  Container(
                    width:269,
                    height:146,
                    
                    decoration: BoxDecoration(
                      color:Colors.yellow.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(300.0)),
                    ),
                  ),
               //   ),
              ),
    
                Positioned (
                  top: 560,
                //  bottom: 0,
                  child: Container(
                    height:291,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                    color:Colors.purple,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                     gradient: LinearGradient(
                      colors: [Color.fromRGBO(52, 40, 60, 1),Color.fromRGBO(132, 95, 161, 1),],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                       
                        children: [
                          const SizedBox(height: 28,),
                           RichText(
                             
                            text:const TextSpan(
                              style: TextStyle( fontWeight: FontWeight.w700,fontSize: 31),
                              children:[
                                 TextSpan(text: 'My',style:TextStyle( color:Colors.yellow)),
                                 TextSpan(text: 'Shop',style:TextStyle( color:Colors.white)),
                              ]
                            )
                           ),
                           const SizedBox(height: 24,),
                          const Text("Lorem Ipsum is simply dummy text of the  printing and typesetting industry",
                          textAlign: TextAlign.center,
                          style:TextStyle( color:Colors.white,fontSize: 14)),
                          const SizedBox(height: 32,),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterPhoneWidget()));
                              // setState(() {
                              //   _top=0;
                              // //  _right=200;
                              // //  _bottom=100;
                              //   _left=0;
                              // });
                              
                            },
                            style: ElevatedButton.styleFrom(
                              primary:yellowColor,
                              onPrimary: Colors.white,
                              minimumSize: const Size(239, 48),
                            ),
                            
                            child: const Text('Get Started',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                           
                            
                            )
                        ],
                      ),
                    ),
                  ),
                )
                       
              
                  ]
                ),
              
            
        
          
        ),
    );
    


      
  }
}