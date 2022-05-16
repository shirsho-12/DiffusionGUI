import 'package:diffusion_gui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCzFIBXHlAtvgurbuGSP1wJcGdViyrmdHc",
        authDomain: "diffusiongui.firebaseapp.com",
        databaseURL: "https://diffusiongui-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "diffusiongui",
        storageBucket: "diffusiongui.appspot.com",
        messagingSenderId: "31724390776",
        appId: "1:31724390776:web:e8bfcdf08fa13f938ee08d"
    )
  );
  runApp(const DiffusionApp());
}

class DiffusionApp extends StatelessWidget {
  const DiffusionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      title: "Diffusion GUI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.orangeAccent,
      ),
    );
    // return MaterialApp(
    //     title: "Language Diffusion Research",
    //     home: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Diffusion Research"),
    //         centerTitle: true,
    //         backgroundColor: Colors.blueGrey,
    //       ),
    //       body: Row(
    //         children: <Widget>[
    //           Text("HELLO"),
    //           TextButton(
    //               onPressed: () {},
    //               child: const Text("Start"),
    //               // backgroundColor: Colors.lightGreen[200]
    //           ),
    //           TextButton(
    //               onPressed: () {},
    //               child: const Text("Instructions")
    //           )
    //         ],
    //       ),
    //         // Image.asset('assets/set_1/aeroplane.jpg')
    //         // Text(
    //         //     "Button",
    //         //   style: TextStyle(
    //         //     fontSize: 20,
    //         //     fontWeight: FontWeight.normal,
    //         //     color: Colors.black
    //         //   ),
    //         // ),
    //       // ),
    //       floatingActionButton: FloatingActionButton(
    //         child: const Text("Start"),
    //         backgroundColor: Colors.tealAccent,
    //         onPressed: startAction,
    //       ),
    //     )
    // );
  }

  void startAction() {}
}

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Diffusion Research"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: Container(
            color: Colors.lightGreen,
            padding: const EdgeInsets.all(20.0),
            child: const Text("HELLO")
          ),
          floatingActionButton: FloatingActionButton(
            child: const Text("Start"),
            backgroundColor: Colors.tealAccent,
            onPressed: startAction,
          ),
    );
  }
  void startAction() {}
}

