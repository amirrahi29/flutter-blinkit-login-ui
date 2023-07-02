import 'package:blinkit_ui/FoodLists.dart';
import 'package:blinkit_ui/MyFoodListWidget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = _scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
      double minScrollExtent3 = _scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 50, _scrollController1);
      animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 40, _scrollController2);
      animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 25, _scrollController3);
    });
  }

  void animateToMaxMin(double max, double min, double direction, int seconds, ScrollController scrollController) {
    scrollController.animateTo(
      direction,
      duration: Duration(seconds: seconds),
      curve: Curves.linear,
    ).then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [

            Column(
              children: <Widget>[

                MyFoodListWidget(
                  _scrollController1,
                  FoodLists.myList1,
                ),
                MyFoodListWidget(
                  _scrollController2,
                  FoodLists.myList2,
                ),
                MyFoodListWidget(
                  _scrollController3,
                  FoodLists.myList3,
                ),

              ],
            ),

           Positioned(
             bottom: 16,
               left: 0,
               right: 0,
               child:  Container(
                 color: Colors.white,
                 child: Column(
                   children: <Widget>[

                     Container(
                         margin: EdgeInsets.only(top: 16,bottom: 16),
                         child: Image.asset('assets/images/logo.png',
                             height: 100,width: 100)
                     ),

                     Text("India's last minute app",style: TextStyle(color: Colors.black,
                         fontWeight: FontWeight.bold,fontSize: 20)),

                     Text("Login in or sign up"),

                     Container(
                       height: 45,
                       margin: EdgeInsets.only(top: 16,left: 16,right: 16),
                       decoration: BoxDecoration(
                           border: Border.all(
                               color: Colors.grey
                           ),
                           borderRadius: BorderRadius.circular(8)
                       ),
                       child: Row(
                         children: <Widget>[

                           Container(
                             width:40,
                             margin: EdgeInsets.only(left: 10),
                             child: Text("+91",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                           ),

                           Expanded(
                             child: Container(
                               child: TextField(
                                 cursorColor: Colors.black,
                                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                 keyboardType: TextInputType.number,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     hintText: 'Enter phone number'
                                 ),
                               ),
                             ),
                           )

                         ],
                       ),
                     ),

                     Container(
                       width: MediaQuery.of(context).size.width,
                       padding: EdgeInsets.all(12),
                       alignment: Alignment.center,
                       margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color:  Colors.blueGrey[300]
                       ),
                       child: Text("Continue",
                         style: TextStyle(color: Colors.white,
                             fontSize: 16),),
                     )

                   ],
                 ),
               )
           ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.only(left: 24,right: 24,top: 4,bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 14),),
              ),
            )

          ],
        ),
      ),
    );
  }
}