import 'package:flutter/material.dart';
import 'package:home_work_4/config/colors.dart';
import 'package:home_work_4/config/strings.dart';
import 'package:home_work_4/data/data.dart';
import 'package:home_work_4/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  int selectedIndex = 0;
  List displayList = [];

  void onClickCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void updateList(String value) {
    setState(() {
      displayList = Data.getQueryList(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            AppText.homeText1,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                updateList(value);
              },
              decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xffd6d2d2),
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color(0xff263238),
                  hintText: "Qidiruv",
                  hintStyle: TextStyle(
                      color: Color(0xffa5a5a5),
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 34,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onClickCategory(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? const Color(0xff5edfff)
                            : const Color(0xff263238),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        Data.getCategories()[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? const Color(0xff263238)
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: Data.getCategories().length),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Mashhurlar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            var data = Data.getItem(
                                Data.getFamousItems()[index]["id"]);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      data: data,
                                    )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              width: 120,
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        Data.getFamousItems()[index]["image"]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(.7),
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [0.0, 0.4]),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            Data.getFamousItems()[index]
                                                ["name"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 8),
                                          child: Text(
                                            Data.getFamousItems()[index]
                                                ["location"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 12,
                        );
                      },
                      itemCount: Data.getFamousItems().length),
                ),
                const SizedBox(
                  height: 32,
                ),
                searchController.text.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          Data.getCategories()[selectedIndex],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : Container(),
                searchController.text.isEmpty
                    ? const SizedBox(
                        height: 16,
                      )
                    : Container(),
                searchController.text.isEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              var data = Data.getItem(Data.getCategoryList(
                                      Data.getCategories()[selectedIndex])[
                                  index]["id"]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        data: data,
                                      )));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Data.getCategoryList(Data.getCategories()[
                                          selectedIndex])[index]["image"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [0.0, 0.3]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              Data.getCategoryList(
                                                      Data.getCategories()[
                                                          selectedIndex])[index]
                                                  ["name"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              Data.getCategoryList(
                                                      Data.getCategories()[
                                                          selectedIndex])[index]
                                                  ["location"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          Data.getCategoryList(
                                                  Data.getCategories()[
                                                      selectedIndex])[index]
                                              ["score"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 24,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (contex, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: Data.getCategoryList(
                                Data.getCategories()[selectedIndex])
                            .length)
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              var data = Data.getItem(Data.getCategoryList(
                                      Data.getCategories()[selectedIndex])[
                                  index]["id"]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        data: data,
                                      )));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                     displayList[index]["image"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [0.0, 0.3]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              displayList[index]["name"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              displayList[index]["location"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          displayList[index]["score"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 24,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (contex, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: displayList.length)
              ],
            ),
          )
        ],
      ),
    );
  }
}
