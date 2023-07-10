import 'package:flutter/material.dart';


class Screen extends StatelessWidget {
  Screen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hellow Guys"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(200, 176, 133, 141),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(

                )

              ],
            ),

          ),
        ),
      ),
    );
  }


}
