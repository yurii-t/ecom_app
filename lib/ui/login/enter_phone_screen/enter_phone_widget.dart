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
    return Scaffold(
      body: Column(
        children: [
          Container(
                    width: MediaQuery.of(context).size.width,
                    //375,
                    height:197,
                    child: Text(''),
                    decoration: const BoxDecoration(
                      color:Colors.purple,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(300.0)),
                    ),
                  ),
                  Text(''),
                  TextFormField(),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Next')
                    ),
                    TextButton
                    (onPressed: (){}, 
                    child: Text('Skip'))
        ],
      ),
              
    );
  }
}