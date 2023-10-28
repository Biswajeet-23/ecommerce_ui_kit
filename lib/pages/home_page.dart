import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:ecommerce_ui_kit/json/constant.dart';
import 'package:ecommerce_ui_kit/theme/colors.dart';
import 'package:ecommerce_ui_kit/widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeImg), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    color: white,
                    size: 28,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Feather.search,
                    color: white,
                    size: 25,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Winter Collection",
                        style: TextStyle(
                            fontSize: 25,
                            color: white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("DISCOVER",
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: white,
                          size: 18,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("All", style: TextStyle(color: grey)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Container(
                  width: 180,
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(categories[index]['imgUrl'] as String? ?? ''),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            categories[index]['title']  as String? ?? '',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended for you",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("All", style: TextStyle(color: grey)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(recommends.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(recommends[index]['imgUrl'] as String? ?? ''),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recommends[index]['title']  as String? ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ " + recommends[index]['price'].toString() ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: grey,
                              height: 1.5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
        ),
        SizedBox(
          height: 40,
        ),
        CustomeCarouselHomePage(
          items: slider,
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent viewed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("All", style: TextStyle(color: grey)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(recently.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(recently[index]['imgUrl']  as String? ?? ''),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recently[index]['title']  as String? ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ " + recently[index]['price'].toString() ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: grey,
                              height: 1.5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
