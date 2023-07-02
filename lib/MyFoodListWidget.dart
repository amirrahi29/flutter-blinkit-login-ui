import 'package:flutter/material.dart';

Widget MyFoodListWidget(ScrollController scrollController, List myList){
  return SizedBox(
    height: 150,
    child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey[50]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/${myList[index]}',
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
  );
}