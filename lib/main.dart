import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypage/models/socialNetworkModel.dart';
import 'package:mypage/providers/mainProvider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dudumarinho.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool toggleLabel = true;

  void setToggle() {
    setState(() {
      toggleLabel = !toggleLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: null,
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 600,
          width: 700,
          decoration: _myBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    titulo(),
                    const SizedBox(height: 28),
                    pfpAndBio(),
                    const SizedBox(height: 28),
                    mySocialNetworkings(),
                  ],
                ),
                //TextButton(onPressed: setToggle, child: Text("teste")),
                FloatingActionButton.extended(
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.white70,
                    onPressed: setToggle,
                    icon: toggleLabel
                        ? Icon(Icons.arrow_forward_ios)
                        : Icon(Icons.arrow_back_ios_new),
                    extendedIconLabelSpacing: 10,
                    label:
                        toggleLabel == true ? Text("portifolio") : Text("Bio"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text titulo() {
    return const Text(
      "Desenvolvedor iOS",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28),
    );
  }

  Widget pfpAndBio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: 180.0,
              width: 180.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('eu.jpg'),
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  "assets/backhand.gif",
                  height: 20,
                  width: 20,
                ),
                Image.asset(
                  "assets/backhand.gif",
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 5),
                const Text("omg literally me")
              ],
            )
          ],
        ),
        SizedBox(
          width: 400,
          height: 340,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(MainProvider.bios[0].title),
            Text(MainProvider.bios[0].body),
            SizedBox(height: 20),
            Text(MainProvider.bios[1].title),
            Text(MainProvider.bios[1].body),
          ]),
        )
      ],
    );
  }

  BoxDecoration _myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  Widget mySocialNetworkings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _myLinks(),
    );
  }

  List<Widget> _myLinks() {
    List<Widget> links = [];
    for (var element in MainProvider.myLinks.socialNetwork) {
      links.add(InkWell(
        child: _link(element: element),
        onTap: () => launch(element.link),
      ));
      if (MainProvider.myLinks.socialNetwork.last != element) {
        links.add(const SizedBox(width: 15));
      }
    }
    return links;
  }

  Widget _link({required SocialNetwork element}) {
    Color defaultColor = Colors.black87;
    if (element.svg == null) {
      return Text(
        element.placeHolder!,
        style: TextStyle(fontSize: 16, color: defaultColor),
      );
    }
    return SvgPicture.asset(element.svg!, height: 40, color: Colors.black87);
  }
}
