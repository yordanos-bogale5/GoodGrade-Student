import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/common/color_extenstion.dart';

class BookReadingView extends StatefulWidget {
  final Map bObj;
  const BookReadingView({super.key, required this.bObj});

  @override
  State<BookReadingView> createState() => _BookReadingViewState();
}

class _BookReadingViewState extends State<BookReadingView> {
  double fontSize = 20;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  isDark ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                widget.bObj["Nutrition And Lifestyle"].toString(),
                style: TextStyle(
                    color:  isDark ? Colors.white : TColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Switch(
                      activeColor: TColor.primary,
                      value: isDark , onChanged:(value) {
                        setState(() {
                          isDark = value;
                        });
                    },),

                    Text("Dark ", style: TextStyle(color: isDark ? Colors.white : TColor.text , fontWeight: FontWeight.bold ), ),

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          builder: (context) {
                            var orientation = MediaQuery.of(context).orientation;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: orientation == Orientation.portrait
                                      ? 25
                                      : 60),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: TColor.text,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.text_decrease,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                              updateUi();
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.text_increase,
                                        color: TColor.text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 50,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: TColor.textbox,
                                        border: Border.all(
                                            color: Colors.black26, width: 0.5),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: const Text("Font"),
                                      underline: Container(),
                                      items: ["Font1", "Font2"].map((name) {
                                        return DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        );
                                      }).toList(),
                                      onChanged: (selectVal) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 20,
                                      ),
                                      Expanded(child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Slider(
                                            activeColor: TColor.text,
                                            inactiveColor: TColor.subTitle,
                                            thumbColor: Colors.white,
                                            min: 8.0,
                                            max: 70.0,
                                            value: fontSize,
                                            onChanged: (value) {
                                              setState(() {
                                                fontSize = value;
                                              });
                                            },
                                          );
                                        },
                                      )),
                                      Icon(
                                        Icons.light_mode,
                                        color: TColor.text,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.portraitDown,
                                            DeviceOrientation.portraitUp
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.portrait
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_portrait,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations([
                                            DeviceOrientation.landscapeLeft,
                                            DeviceOrientation.landscapeRight
                                          ]);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: orientation ==
                                                      Orientation.landscape
                                                  ? TColor.subTitle
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.stay_current_landscape,
                                            color: TColor.text,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.settings,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            )
          ];
        },
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: SelectableText(
              """
Nutrition and Lifestyle in Pregnancy offers an overview of the latest research findings and international recommendations on a variety of nutrition-related aspects and outcomes of pregnancy. Ensuring a healthy nutritional status and lifestyle before and during pregnancy is one of the best ways to help support the healthy growth and development of the unborn child. We will look at how a healthy diet and lifestyle should ideally be achieved before conception and provide recommendations for preconception counselling of women.

We will also review nutritional recommendations for a healthy pregnancy to ensure optimal maternal and fetal outcomes, as well as focus on the most common nutrition-related pregnancy complications; obesity and gestational diabetes. The learner will have the opportunity to immerse themselves in the cutting-edge world of epigenetic and metabolomics research and appreciate the enormous role that these programming effects have in long-term health and disease outcomes. Finally, we offer real-life, everyday situations and questions from pregnant women to help health professionals in the nutritional counselling of pregnant women and their families. In addition to the original in English, Portuguese subtitles are available now!
""",
              style: TextStyle(color: isDark ? Colors.white : TColor.text, fontSize: fontSize),
            ),
          ),
      ),
    );
  }

  void updateUi(){
    setState(() {
    });
  }
}
