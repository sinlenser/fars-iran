import 'package:fars/model/travelmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(pilban());
}

class pilban extends StatelessWidget {
  const pilban({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainpage(),
    );
  }
}

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int _selectet = 0;
  double imagesize = 55;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: size.height / 1.8,
            child: Stack(
              children: [
                //bg image
                Container(
                  width: double.infinity,
                  height: size.height / 2.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(55),
                        bottomRight: Radius.circular(55),
                      ),
                      image: DecorationImage(
                          image: AssetImage(travelList[_selectet].image),
                          fit: BoxFit.cover)),
                ),
                //head icons
                Positioned(
                  right: 0,
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(101, 255, 255, 255),
                          ),
                          child: const Icon(CupertinoIcons.arrow_left),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(101, 255, 255, 255),
                          ),
                          child: const Icon(CupertinoIcons.heart),
                        ),
                      ],
                    ),
                  ),
                ),
                //image list
                Positioned(
                  right: 0,
                  top: 100,
                  child: SizedBox(
                    width: 85,
                    height: double.maxFinite,
                    child: ListView.builder(
                      itemCount: travelList.length,
                      itemBuilder: (context, index) {
                        return imageitem(index);
                      },
                    ),
                  ),
                )
                //name and plase
                ,
                Positioned(
                  bottom: 80,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        travelList[_selectet].name,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.placemark_fill,
                            color: Colors.white,
                          ),
                          Text(
                            travelList[_selectet].locasion,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(60, 0, 0, 0),
                                width: 1,
                              )),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("مساحت"),
                                Text(
                                  travelList[_selectet].disceription +
                                      " کیلومتر مربع",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(60, 0, 0, 0),
                                width: 1,
                              )),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("جمعیت"),
                                Text(travelList[_selectet].temp),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(60, 0, 0, 0),
                                width: 1,
                              )),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("دما"),
                                Text(travelList[_selectet].rating + "درجه"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "اطلاعات در مورد این شهر",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Column imageitem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectet = index;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: _selectet == index ? Colors.white : Colors.white),
                  borderRadius: _selectet == index
                      ? BorderRadius.circular(1000)
                      : BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      travelList[index].image,
                    ),
                  )),
              width: _selectet == index ? imagesize + 15 : imagesize,
              height: _selectet == index ? imagesize + 15 : imagesize,
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ),
      ],
    );
  }
}
