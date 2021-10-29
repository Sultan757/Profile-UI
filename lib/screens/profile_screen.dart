import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profile_app/main.dart';

class profileScreen extends StatefulWidget {
   profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> with SingleTickerProviderStateMixin {
  String bckgrnd = 'https://media.istockphoto.com/photos/leaf-background-picture-id844226534?k=20&m=844226534&s=612x612&w=0&h=0s5eix34N-rY2K7kHmdCG5ANURpfjWWFeJ0ITW6jIdI=';

  String imgurl ='https://media-exp1.licdn.com/dms/image/D4D03AQFPR9iL-3CwjA/profile-displayphoto-shrink_800_800/0/1631460159512?e=1640217600&v=beta&t=8F6JE_e98rGlLmRv2kQiitSMHIANqqlYSFLyuvm73Hs';

  late  TabController controller;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this , length: 3);
    super.initState();
  }
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: [

          Image(image: NetworkImage(bckgrnd),
         ),
         Positioned(
             top: 210,

             child: Container(
               height: 550,
               width: 360,
               decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(28.0),topLeft: Radius.circular(28.0)),
                   color: Colors.white),
               child: Column(
                 children: [
                 const   SizedBox(height: 40,),
                 const  Text('Sultan Saeed',
                     style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w500),
                   ),
                  const SizedBox(height: 50,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:const [

                       Text('45',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),

                       Text('08',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: const[

                       Text('Posts',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w100),),

                       Text('Friends',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w100),),
                     ],
                   ),
                   SizedBox(height: 25,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(

                         child: RaisedButton(onPressed: (){}, color: Colors.white,
                           child: Text('Following',
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),
                           ),
                         ),
                         height: 50, width: 140,
                       ),
                       Container(
                         child: RaisedButton(onPressed: (){}, color: Colors.white,
                           child: Text('Message',
                           style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),
                           ),
                         ),
                         height: 50, width: 140,
                       ),
                     ],
                   ),
                 ],
               ),
             ),
         ),
          Positioned(
              top: 110,
              left: 105,

              child: CircleAvatar(backgroundImage: NetworkImage(imgurl),radius: 70,)),
          Positioned( top: 470,
              child: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,color: Colors.white,
              child:  Scaffold(
              body: Container(
                child:
                  TabBar(
                    controller: controller,
                    indicatorColor: Colors.black,
                    tabs:  [
                      Text('Posts',style: TextStyle(color: Colors.black,fontSize: 18),),
                      Text('About',style: TextStyle(color: Colors.black,fontSize: 18)),
                      Text('Interest',style: TextStyle(color: Colors.black,fontSize: 18)),
                    ],
                  ),
              ),
              ),
              ),
              ),

          Positioned(

            top: 400,
            child: TabView(controller: controller,)),
          Padding(
           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
           child: SafeArea(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const [
                 Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                 Icon(Icons.logout, color: Colors.black, size: 30,),
               ],
             ),
           ),
         ),

        ],
      ),
    );
  }
}


class TabView extends StatelessWidget {
  const TabView({Key? key,required this.controller}) : super(key: key);
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBarView(
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          controller: controller,
          children: [
            Container(child: Text('Container 1'),),
            Container(child: Text('Container 2'),),
            Container(child: Text('Container 3'),),

          ]),
    );
  }
}

