import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 150,
            height: 50,
            child: Center(
                child: Text(
              "Bonjour toto",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: AspectRatio(
              aspectRatio: 16 / 12,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 50),
                                    child: Text("Tache du jour"),
                                  ),
                                  CircularPercentIndicator(
                                    radius: 50,
                                    lineWidth: 10,
                                    percent: 0.4,
                                    progressColor: Colors.purple,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 200,
                                      color: Colors.red,
                                      child: ListView.builder(
                                          itemCount: 8,
                                          itemBuilder: ((context, index) {
                                            return Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Text("Toto doit jouer"),
                                              ),
                                            );
                                          })),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 100,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
        )
      ],
    );
  }
}
