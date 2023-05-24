import 'dart:math';

import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({Key? key}) : super(key: key);

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  List<String> hamleler = [];

  Map<int, String> kodLab = {};
  Map<String, String> bord = {};
  Map<String, String> bordYedek = {};
  Map<int, Map<String, String>> bordListesi = {};

  int count = 0;
  late int countMax;
  String sira = "b";
  String hangiTas = "";

  void initBord() {
    hamleler = ['pe4', 'pe5', 'pd4', 'pa5', 'pb4'];

    kodLab = {
      1: "a8",
      2: "b8",
      3: "c8",
      4: "d8",
      5: "e8",
      6: "f8",
      7: "g8",
      8: "h8",
      9: "a7",
      10: "b7",
      11: "c7",
      12: "d7",
      13: "e7",
      14: "f7",
      15: "g7",
      16: "h7",
      17: "a6",
      18: "b6",
      19: "c6",
      20: "d6",
      21: "e6",
      22: "f6",
      23: "g6",
      24: "h6",
      25: "a5",
      26: "b5",
      27: "c5",
      28: "d5",
      29: "e5",
      30: "f5",
      31: "g5",
      32: "h5",
      33: "a4",
      34: "b4",
      35: "c4",
      36: "d4",
      37: "e4",
      38: "f4",
      39: "g4",
      40: "h4",
      41: "a3",
      42: "b3",
      43: "c3",
      44: "d3",
      45: "e3",
      46: "f3",
      47: "g3",
      48: "h3",
      49: "a2",
      50: "b2",
      51: "c2",
      52: "d2",
      53: "e2",
      54: "f2",
      55: "g2",
      56: "h2",
      57: "a1",
      58: "b1",
      59: "c1",
      60: "d1",
      61: "e1",
      62: "f1",
      63: "g1",
      64: "h1",
    };

    bord = {
      "a8": "assets/sk.png",
      "b8": "assets/sa.png",
      "c8": "assets/sf.png",
      "d8": "assets/sv.png",
      "e8": "assets/ss.png",
      "f8": "assets/sf.png",
      "g8": "assets/sa.png",
      "h8": "assets/sk.png",
      "a7": "assets/sp.png",
      "b7": "assets/sp.png",
      "c7": "assets/sp.png",
      "d7": "assets/sp.png",
      "e7": "assets/sp.png",
      "f7": "assets/sp.png",
      "g7": "assets/sp.png",
      "h7": "assets/sp.png",
      "a6": "",
      "b6": "",
      "c6": "",
      "d6": "",
      "e6": "",
      "f6": "",
      "g6": "",
      "h6": "",
      "a5": "",
      "b5": "",
      "c5": "",
      "d5": "",
      "e5": "",
      "f5": "",
      "g5": "",
      "h5": "",
      "a4": "",
      "b4": "",
      "c4": "",
      "d4": "",
      "e4": "",
      "f4": "",
      "g4": "",
      "h4": "",
      "a3": "",
      "b3": "",
      "c3": "",
      "d3": "",
      "e3": "",
      "f3": "",
      "g3": "",
      "h3": "",
      "a2": "assets/bp.png",
      "b2": "assets/bp.png",
      "c2": "assets/bp.png",
      "d2": "assets/bp.png",
      "e2": "assets/bp.png",
      "f2": "assets/bp.png",
      "g2": "assets/bp.png",
      "h2": "assets/bp.png",
      "a1": "assets/bk.png",
      "b1": "assets/ba.png",
      "c1": "assets/bf.png",
      "d1": "assets/bv.png",
      "e1": "assets/bs.png",
      "f1": "assets/bf.png",
      "g1": "assets/ba.png",
      "h1": "assets/bk.png",
    };
  }

  @override
  void initState() {
    initBord();
    bordListOlustur();
    super.initState();
  }

  void bordListOlustur() {
    bordYedek = Map.from(
        bord); // bordYedek haritasını bord haritasından bağımsız hale getiriyoruz
    bordListesi[0] = Map.from(bordYedek);

    for (int i = 0; i < hamleler.length; i++) {
      sira = i % 2 == 0 ? "b" : "s";

      String kordinatHarfSayi = hamleler[i].substring(1, 3); //e4
      String kordinatHarf = hamleler[i].substring(1, 2); //e
      String kordinatSayi = hamleler[i].substring(2, 3); // 4

      if (sira == "b") {
        print("Beyazın Hamlesi :" + i.toString());
        print(kordinatHarfSayi); //e4
        print(kordinatHarf); //e
        print(kordinatSayi); //4

        String terkEdilen =
            kordinatHarf + (int.parse(kordinatSayi) - 2).toString(); //e2

        bordYedek[kordinatHarfSayi] = bordYedek[terkEdilen]!;
        bordYedek[terkEdilen] = "";
        bordListesi[i + 1] = Map.from(bordYedek);
      }

      if (sira == "s") {
        print("Siyahın Hamlesi :" + i.toString());
        print(kordinatHarfSayi); //e4
        print(kordinatHarf); //e
        print(kordinatSayi); //4
        String terkEdilen =
            kordinatHarf + (int.parse(kordinatSayi) + 2).toString(); //e2

        bordYedek[kordinatHarfSayi] = bordYedek[terkEdilen]!;
        bordYedek[terkEdilen] = "";
        bordListesi[i + 1] = Map.from(bordYedek);
      }

      print("**********");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chess Board'),
      ),
      body: Center(
        child: Column(
          children: [
            BoardBox(bord: bord, kodlab: kodLab),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                        bord = bordListesi[0]!;
                        print(count.toString());
                      });
                    },
                    child: Text("|<"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (count != 0) {
                        setState(() {
                          count--;
                          bord = bordListesi[count]!;
                        });
                        print(count.toString());
                      }
                    },
                    child: Text("Geri"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (count < bordListesi.length - 1) {
                        setState(() {
                          count++;
                          bord = bordListesi[count]!;
                        });
                        print(count.toString());
                      }
                    },
                    child: Text("İleri"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = bordListesi.length;
                        bord = bordListesi[count - 1]!;
                        print(count.toString());
                      });
                    },
                    child: Text(">|"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Ters Çevir"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//'pe4','pg6','Nf3','Bg7','pe5','pe6','pd4','Ne7','pc4','O-O','Nc3','pb6','Bd2',
//'Bb7','Qc2','pd6','O-O-O','dxe5','Nxe5','Nd7'
String tasCinsiBul(String hamleler) {
  bool piyon = hamleler.startsWith('p');
  bool at = hamleler.startsWith('N');
  bool fil = hamleler.startsWith('B');
  bool kale = hamleler.startsWith('R');
  bool vezir = hamleler.startsWith('Q');

  if (piyon) {
    return "piyon";
  }
  if (at) {
    return "at";
  }
  if (fil) {
    return "fil";
  }
  if (kale) {
    return "kale";
  }
  if (vezir) {
    return "vezir";
  }

  return "a";
  //List<Bool> hangisi = [piyon, at, fil, kale, vezir];
}

class BoardBox extends StatelessWidget {
  BoardBox({
    super.key,
    required this.bord,
    required this.kodlab,
  });

  Map<String, String> bord = {};
  Map<int, String> kodlab = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: 64,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          int row = index ~/ 8;
          int col = index % 8;
          bool isWhite = (row + col) % 2 == 0;
          String? imagePath = bord[kodlab[index + 1].toString()];
          return Container(
            color: isWhite ? Color(0xFF86a666) : Color(0xFFffffdd),
            child: imagePath!.isNotEmpty ? Image.asset(imagePath) : SizedBox(),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChessBoard(),
  ));
}
