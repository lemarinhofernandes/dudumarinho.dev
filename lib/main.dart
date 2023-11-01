import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypage/mainProvider.dart';
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
          height: toggleLabel ? 500 : 800,
          width: toggleLabel ? 700 : 400,
          decoration: _myBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                toggleLabel
                    ? Column(
                        children: [
                          titulo(),
                          const SizedBox(height: 28),
                          pfpAndBio(),
                          const SizedBox(height: 28),
                          mySocialNetworkings(),
                        ],
                      )
                    : Center(
                        child: Text("nada por aqui :/"),
                      ),
                //TextButton(onPressed: setToggle, child: Text("teste")),
                FloatingActionButton.extended(
                    onPressed: setToggle,
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
            const Text("🙀 omg literally me ☝️☝️")
          ],
        ),
        const SizedBox(
          width: 400,
          height: 240,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Bio"),
            Text(
                "Desenvolvedor mobile com 2 anos de experiência. Principais conhecimentos em Swift, Dart/Flutter, Java, C, MySQL, algoritmos e padrões. Apaixonado e curioso por tecnologia."),
            SizedBox(height: 20),
            Text("Mobile bio"),
            Text(
                "Desenvolvedor mobile com 2 anos de experiência. Principais conhecimentos em Swift, Dart/Flutter, Java, C, MySQL, algoritmos e padrões. Apaixonado e curioso por tecnologia."),
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
      children: _myLinks(),
    );
  }

  List<Widget> _myLinks() {
    List<Widget> links = [];
    MainProvider.myLinks().socialNetwork.forEach((element) {
      links.add(InkWell(
        child: SvgPicture.asset(element.svg, height: 40, color: Colors.black87),
        onTap: () => launch(element.link),
      ));
      if (MainProvider.myLinks().socialNetwork.last != element) {
        links.add(const SizedBox(width: 10));
      }
    });
    return links;
  }
}
