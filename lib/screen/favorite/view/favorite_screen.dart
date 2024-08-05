import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/homeProvider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getBookMark();
  }
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Screen"),
      ),
      body: Stack(
        children: [
          context.read<HomeProvider>().isTheme?Image.network(
            "https://img.freepik.com/premium-photo/night-sky-stars-galaxies-sky-dusk_494741-51453.jpg",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ):
          Image.asset(
            "assets/image/planet1.jpeg",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.nameList.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
              Container(
              decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                  Colors.white12,
                  Colors.black12
                  ])
                ),
                child: Row(
                  children: [
                    Image.asset(providerR!.imageList[index],height: 100,width: 100,),
                    Text(providerW!.nameList[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {
                      providerW!.removeBookMark(providerW!.nameList[index], providerW!.imageList[index]);
                    }, icon: const Icon(Icons.delete))
                  ],
                ),
              ),
                  const SizedBox(height: 10,),
                ],
              );
            },),
          ),
        ],
      )
    );
  }
}
