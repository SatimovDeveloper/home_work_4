import 'package:flutter/material.dart';
import 'package:home_work_4/config/colors.dart';

class DetailScreen extends StatefulWidget {
  final List data;

  const DetailScreen({super.key, required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState(data);
}

class _DetailScreenState extends State<DetailScreen> {
  final List data;

  _DetailScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
                style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide.none),
                    backgroundColor: Colors.transparent,
                    elevation: 5),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            backgroundColor: AppColor.backgroundColor,
            expandedHeight: 360,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data[0]["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            data[0]["location"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      data[0]["score"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
              background: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  child: Image.asset(data[0]["image"], fit: BoxFit.cover)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Batafsil\n\n",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: data[0]["description"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ]),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: Color(0xff5edfff))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.map_outlined,
                              color: Color(0xff5edfff),
                            ),
                            SizedBox(width: 16,),
                            Text(
                              "Joylashuv",
                              style: TextStyle(
                                  color: Color(0xff5edfff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: Color(0xff5edfff))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.language,
                              color: Color(0xff5edfff),
                            ),
                            SizedBox(width: 16,),
                            Text(
                              "Manba",
                              style: TextStyle(
                                  color: Color(0xff5edfff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
