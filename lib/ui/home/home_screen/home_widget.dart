import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
   
   Color yellowColor = const Color.fromRGBO(231, 185, 68, 1);
   int _selectedTab =0;

   void onSelectedTab(int index){
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO( 244, 243, 244, 1),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 132,
                 
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
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu,color: Colors.white,),
                        RichText(
                        
                            text:const TextSpan(
                              style: TextStyle( fontWeight: FontWeight.w700,fontSize: 18),
                              children:[
                                 TextSpan(text: 'My',style:TextStyle( color:Colors.yellow)),
                                 TextSpan(text: 'Shop',style:TextStyle( color:Colors.white)),
                              ]
                            )
                           ),
                        Icon(Icons.notifications_outlined,color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Positioned(
                   top: 108,
                  
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SizedBox(
                      width: 375,
                      height: 44,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'What are you looking for',
                         
                        ),
                        
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 34,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [ Container(
                  width: 343,
                  height: 88,
                   decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/img_gal.jpg'),
                      )
                      ),
                    
                ),
                Padding(
                   padding: const EdgeInsets.only(left: 18,top: 14,right: 177),
                  child: Column(
                    children: [
                      Text('Fashion Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                      ),
                      Row(
                        children: [
                          Text('See More',
                          style: TextStyle(
                        color: yellowColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                          ),
                          Icon(Icons.chevron_right,color: yellowColor,)
                        ],
                      )
                    ],
                  ),
                )

                ]
              ),
            ),
             SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Text('Catalogue',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),),
                 
                  Row(
                          children: [
                            Text('See All',
                            
                            style: TextStyle(
                          color: Color.fromRGBO(155, 155, 155, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                            ),
                            Icon(Icons.chevron_right,color: Color.fromRGBO(155, 155, 155, 1),)
                          ],
                        )
                ],
              ),
            ),
            SizedBox(height: 16,),

            SizedBox(
              height:100 ,
              
              child: ListView.builder(
                itemCount: 5,
               // itemExtent: 88,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/img_gal.jpg'),
                        )
                        ),
                        child: Center(
                          child: Text('Phones',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                    ),
                  ),
                  );
                }
            ),
            ),

            SizedBox(height: 32,),
             Padding(
               padding: const EdgeInsets.only(left:16.0),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text('Featured',
                 
                 style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w700)),
               ),
             ),
             SizedBox(height: 16,),




            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.cable),label: 'Catalogue'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.portrait),label: 'Profile'),
          ])
        // Stack(
        //   children: [
        //     Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: 375,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                     
        //       ),
        //       child: Row(
        //         children: [
        //           Icon(Icons.home),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
     
    );
  }
}