import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart';

void main(){
  runApp(
    DevicePreview(
      enabled: kReleaseMode, 
      builder: (context){
        return MyApp();
      },
    ),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: MyHomePage(),
          theme: ThemeData(
             primaryColor: Colors.white38
          ),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List cartList = [
    {
      "img": "https://m.media-amazon.com/images/I/51uhLZNBiYL._UX522_.jpg",
      "title": "Pullover",
      "color": "Black",
      "Size": "L",
      "Price": "51",
      "count": 0,
    },
    {
      "img": "https://catchmydrift.in/cdn/shop/products/real-girls-have-muscles-special-black-t-shirt-for-women-printrove-119473.jpg?v=1674877618&width=493",
      "title": "T-Shirt",
      "color": "Gray",
      "Size": "L",
      "Price": "30",
      "count": 0,
    },
    {
      "img": "https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/77/8037921/1.jpg?7909",
      "title": "Sport dress",
      "color": "Black",
      "Size": "M",
      "Price": "43",
      "count": 0,
    },
  ];
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search,color: Colors.black,size: 28,),
          )
        ],
      ),
      body: ResponsiveBuilder(
        builder: (context, sizeInformation) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20,left: 10),
                child: Text("My Bag",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    int itemTotal = (int.parse(cartList[index]["Price"]) * cartList[index]["count"]).toInt();
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            child: AspectRatio(
                                aspectRatio: 16 / 16,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(cartList[index]["img"],),fit: BoxFit.cover
                                      )
                                  ),
                                )
                            ),
                          ),

                          const SizedBox(width: 15,),

                          Padding(
                            padding:
                            const EdgeInsets.only(left: 5, top: 8, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cartList[index]["title"], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Color: ",
                                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                                          children: [
                                            TextSpan(
                                                text: "${cartList[index]["color"]}",
                                                style:
                                                const TextStyle(color: Colors.black, fontSize: 12))
                                          ]),
                                    ),

                                    const SizedBox(width: 16,),

                                    RichText(
                                      text: TextSpan(
                                          text: "Size: ",
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                          children: [
                                            TextSpan(
                                                text: "${cartList[index]["Size"]}",
                                                style:
                                                const TextStyle(color: Colors.black))
                                          ]),
                                    )
                                  ],
                                ),

                                const SizedBox(height: 20,),

                                Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.4),
                                                spreadRadius: 1,
                                                blurRadius: 5)
                                          ]),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (cartList[index]["count"] > 0) {
                                                cartList[index]["count"]--;
                                                totalAmount -= int.parse(
                                                    cartList[index]["Price"]);
                                              }
                                            });
                                          },
                                          child: const Icon(Icons.remove, color: Colors.grey,)),
                                    ),

                                    const SizedBox(width: 18,),

                                    Container(
                                      child: Text("${cartList[index]["count"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),

                                    const SizedBox(width: 18,),

                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.4),
                                                spreadRadius: 1,
                                                blurRadius: 5)
                                          ]),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              cartList[index]["count"]++;
                                              totalAmount +=
                                                  int.parse(cartList[index]["Price"]);
                                            });
                                          },
                                          child: const Icon(Icons.add,color: Colors.grey,)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          const Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(right: 12, top: 10, bottom: 5),
                            child: Column(
                              children: [
                                const Icon(Icons.more_vert, size: 28, color: Colors.grey,),

                                const Spacer(),

                                Text(
                                  '${cartList[index]["Price"]}\$',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 15),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Text("Total Amount:", style: TextStyle(fontSize: 17, color: Colors.grey),),

                    const Spacer(),

                    Text("${totalAmount}\$", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {
                          final message = SnackBar(content: Text("Congratulations!!"));
                          ScaffoldMessenger.of(context).showSnackBar(message);
                        },
                        child: const Text(
                          "CHECK OUT",
                          style: TextStyle(
                              fontFamily: 'Sans-Serif',
                              color: Colors.white,
                              fontSize: 16.0),
                        ))),
              )
            ],
          );
        }
      ),
    );
  }
}

