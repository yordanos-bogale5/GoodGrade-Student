import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common/common_widget/your_review_row.dart';


class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  List purArr = ["assets/Enviromental Science.webp","assets/biology.webp","assets/Mathematics.webp"];

    List sResultArr = [
    {
      "img": "assets/Enviromental Science.webp",
      "description":
          "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {
    
      "img": "assets/biology.webp",
      "description":
          "#1 international bestseller and award winning history book.",
      "rate": 4.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              AppBar(
          title: const Text('My Profile'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selam Tesfaye",
                          style: TextStyle(
                          color: Colors.blue[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          "Constantly travelling and keeping up to date with business related books."
                         "am starting learninng in good grade students " ,
                          style:
                              TextStyle(color: TColor.subTitle, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                    height: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/wellcome.jpg",
                        width: 150,
                        height: 150,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me_sharp,
                    color: TColor.subTitle,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(
                    "AddisAbaba - Ethiopia",
                    style: TextStyle(color: TColor.subTitle, fontSize: 13),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.button),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: TColor.primary,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "21",
                        style: TextStyle(
                          color:Colors.lightGreen,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Books",
                        style: TextStyle(color: TColor.subTitle, fontSize: 11),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "5",
                        style: TextStyle(
                            color:Colors.lightGreen,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(color: TColor.subTitle, fontSize: 11),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Your Courses (3)",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: purArr.map((iName) {
                      var isFirst = purArr.first == iName;
                      var isLast = purArr.last == iName;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        padding: isFirst
                            ? const EdgeInsets.only(left: 5)
                            : (isLast
                                ? const EdgeInsets.only(right: 5)
                                : null),
                        child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration:  BoxDecoration(
                            borderRadius:  BorderRadius.circular(15),
                            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))]
                        ), child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            iName,
                            height: media.width * 0.5,
                            fit: BoxFit.fitHeight,
                          ),
                        ),),
                      );
                    }).toList(),
                  ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Your reviews (7)",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              itemCount: sResultArr.length,
              itemBuilder: (context, index) {
                var rObj = sResultArr[index] as Map? ?? {};
              return YourReviewRow(sObj: rObj);
            } )
          ],
        ),
      ),
    );
  }
}
