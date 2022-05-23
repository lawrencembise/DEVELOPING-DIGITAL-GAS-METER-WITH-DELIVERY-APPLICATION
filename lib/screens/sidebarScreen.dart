import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/homeScreen.dart';
import 'package:mtungi_chap_chap/screens/settingsScreen.dart';
import 'package:mtungi_chap_chap/screens/signInScreen.dart';

import '../widgets/sidebarItem.dart';
import '../global/userdata.dart';


class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: myGrey,
            offset: const Offset(0, 10),
            blurRadius: 15.0,
          )
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(34),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage(
              "images/profilePicture.png",
            ),
          ),
          const SizedBox(height: 23),
          Text(
            'Lawrence Mbise',
            style: boldOnes,
          ),
          Text(
            'lawrencejudica@gmail.com',
            style: normalOnes,
          ),
          const SizedBox(
            height: 72,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => HomeScreen()));
            },
            child: SidebarItem(
              title: "Home",
              icon: Icons.home_outlined,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => SettingsScreen()));
            },
            child: SidebarItem(
              title: "Settings",
              icon: Icons.settings_outlined,
            ),
          ),
          GestureDetector(
            onTap: () async{

              await FirebaseAuth.instance.signOut();
              userdata?.remove("uid");
              userdata?.remove("phone");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SignInScreen()),
                  (route) =>false);
            },
            child: SidebarItem(
              title: "Logout",
              icon: Icons.logout_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
