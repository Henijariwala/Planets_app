import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';
import 'package:galaxy_planets/screen/home/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>with TickerProviderStateMixin{
  AnimationController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getBookMark();
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 3));
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
   Planet l1 = ModalRoute.of(context)!.settings.arguments as Planet;
    return Scaffold(
      appBar: AppBar(
        title: Text("${l1.name}",style: const TextStyle(fontSize: 30),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            context.read<HomeProvider>().setBookMark(l1.name!, l1.image!);
          }, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            context.read<HomeProvider>().isTheme?Image.asset(
          "assets/image/planet4.avif",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
        )
                : Image.asset(
          "assets/image/planet1.jpeg",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80,),
                RotationTransition(
                    turns: controller!,
                    child: Hero(
                      tag: "${l1.image}",
                        child: Image.asset("${l1.image}",
                          fit: BoxFit.cover,height: 300,width: 300,))),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("${l1.position})",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 10,),
                      Text("${l1.name}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${l1.description}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Text("Velocity :=${l1.velocity}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Distance :=${l1.distance}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            )
        ]
            ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
}
