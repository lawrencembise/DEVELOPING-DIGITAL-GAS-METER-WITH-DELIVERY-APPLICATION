import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/data/mitungiExample.dart';
import 'package:mtungi_chap_chap/models/mitungi.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Mitungi> mitungi = allMitungi;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.green,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (context, controler) => Container(
              child: ListView.builder(
                controller: controler,
                itemCount: mitungi.length,
                itemBuilder: (context, index) {
                  final mtungi = mitungi[index];
                  return buildMtungi(mtungi);
                },
              ),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildMtungi(Mitungi mtungi) => ListTile(
      title: Text(
        mtungi.size,
        style: draggableBoldOnes,
      ),
      subtitle: Text(mtungi.weight),
      trailing: Text(mtungi.price),
      onTap: () {},
    );
