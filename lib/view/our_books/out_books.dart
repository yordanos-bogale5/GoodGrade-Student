import '/common/color_extenstion.dart';
import 'package:flutter/material.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {

  List imageArr = ["assets/Gender, family and social change.webp","assets/Mathematics.webp","assets/biology.webp"];

  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [

              Image.asset("assets/cre.webp", width:  media.width, fit: BoxFit.fitWidth, ),
             

              AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(
                  height: media.width * 0.9 ,
                 
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  Row( children: imageArr.map((iName) {
                      var isFirst= imageArr.first == iName;
                      var isLast = imageArr.last == iName;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: isFirst ? const EdgeInsets.only(left: 15 ) : ( isLast ? const EdgeInsets.only(right: 15) : null ) ,
                      child: Image.asset( iName,  height: 120 , fit: BoxFit.fitHeight, ),);
                  } ).toList() , ),),
                )

              

            ],),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Text("""The Book Grocer online offers a broad and ever increasing range of discounted remainder and secondhand books.
            
            Our specialty is sourcing discounted books of amazing quality and passing on to our customers the best possible price.
            We take our book buying very seriously indeed. We scour the globe and the best publishers and suppliers for the best bargains, but no book simply arrives in our warehouse simply because it's cheap. It has to be something we want to read ourselves and would reccomend to others.
            We like to be known as the business which sells discounted books yet looks and feels like a retail bookstore.
            
            We are an Australian, family-owned business. We have been buying and selling books since 2000, when the first Castlebooks store opened in Kingston, ACT.
.""", textAlign: TextAlign.center , style: TextStyle(color: TColor.subTitle, fontSize: 15),),
            )
            
          ],
        ),
      ),
    );
  }
}
