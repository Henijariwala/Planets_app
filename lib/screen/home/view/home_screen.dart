import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    context.read<HomeProvider>().getData();
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planet"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            providerW!.isTheme ?Image.asset(
              "assets/image/planet5.avif",
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.cover,
            ):Image.asset(
              "assets/image/planet2.jpg",
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: providerR!.planetList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail',
                          arguments: providerR!.planetList[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [Colors.white12, Colors.black12])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          index != 8
                              ? RotationTransition(
                                  turns: controller!,
                                  child: Hero(
                                    tag:
                                        "${providerW!.planetList[index].image}",
                                    child: Image.asset(
                                      "${providerW!.planetList[index].image}",
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                )
                              : Hero(
                                  tag:
                                      "${providerW!.planetList[index].image}",
                                  child: Image.asset(
                                    "${providerW!.planetList[index].image}",
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${providerW!.planetList[index].name}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Center(child: Text("Drawer",style: TextStyle(fontSize: 30),)),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("favorite ",style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    IconButton(onPressed: () {
                      Navigator.pushNamed(context, 'favorite');
                    }, icon: const Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Theme",style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    Switch(value: providerW!.isTheme, onChanged: (value) {
                      providerR!.setThemeData();
                    },)
                  ],
                ),
              )
            ],
          ),
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
