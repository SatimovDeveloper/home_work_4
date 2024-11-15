import 'package:flutter/material.dart';
import 'package:home_work_4/config/colors.dart';
import 'package:home_work_4/config/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
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
          horizontal: 32,
        ),
        child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                suffixIcon:  Icon(Icons.search, color: Color(0xffd6d2d2),),
                border: OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xff263238),
            hintText: "Qidiruv",
            hintStyle: TextStyle(
                color: Color(0xffa5a5a5),
                fontSize: 16,
                fontWeight: FontWeight.w300)),

      ),
    )],
    )
    ,
    );
  }
}
