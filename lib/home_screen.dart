import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<Api_Provider>(context, listen: false).getAllDetails();
      // context.watch<Api_Provider>().getAllDetails();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 35,
            backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/8/830/png-transparent-domino-s-pizza-take-out-pizza-delivery-angle-rectangle-logo.png'),
          ),
          title: const Text("Domino's Pizza", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 30, color: Colors.black,)),
            const SizedBox(width: 8,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, size: 30, color: Colors.black,)),
          ],
        ),
        body: Consumer<Api_Provider>(
        builder: (context, value, child) {
          return
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: value.contDetail?.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Container(
                          width: 400,
                          height: 500,
                          child: Column(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 150,
                                      child: CircleAvatar(
                                        radius: 115,
                                        backgroundImage: NetworkImage(
                                            '${value.contDetail?[index].imageUrl}'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('${value.contDetail?[index].title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  SizedBox(height: 10,),
                                  Text('${value.contDetail?[index].publisher}', style: TextStyle(fontSize: 10),),
                                  Text('${value.contDetail?[index].recipeId}', style: TextStyle(fontSize: 10),),

                                ]
                            ),
                        )
                    )
                );
              }
          );
        }
    )
    );

  }
}
