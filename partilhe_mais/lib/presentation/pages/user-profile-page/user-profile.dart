// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partilhe_mais/features/crud-user/read_maxDonate.dart';
import 'package:partilhe_mais/features/crud-user/read_name.dart';
import 'package:partilhe_mais/features/crud-user/read_totalDoado.dart';
import 'package:partilhe_mais/presentation/pages/user-profile-page/donateCard.dart';

// ignore: use_key_in_widget_constructors
class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;

  String docIDs = '';

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: user?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs = document.reference.id;
          }),
        );
  }

  final String userRole =
      "Doador Nível 3 - Defensor Solidário"; // Insira o cargo do usuário aqui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Stack(children: [
            Image.asset(
              'assets/images/header.png',
              width: double.infinity,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/setinha.png')),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('Config');
                          },
                          child: Image.asset('assets/images/engrenagem.png'))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Partilhe+',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Raleway',
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Color(0xFFF0EC57),
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                )
                              ]),
                          child: Image.asset('assets/images/foto_perfil.png')),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(height: 20.0),
          FutureBuilder(
            future: getDocId(),
            builder: ((context, snapshot) {
              return GetUserName(
                  documentId: docIDs,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600, // Peso da fonte 600 (bold)
                    fontStyle: FontStyle.normal,
                    height: 20.0 / 24.0,
                    color: Colors.white,
                  ));
            }),
          ),
          SizedBox(height: 10.0),
          Text(
            userRole,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Raleway',
              fontSize: 20.0,
              fontWeight: FontWeight.w500, // Peso da fonte 500 (medium)
              fontStyle: FontStyle.normal,
              height: 20.0 / 20.0, // Line height = 20px / Font size = 20px
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Espaçamento igual entre os elementos
            children: [
              Container(
                width: 138.0,
                height: 89.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Total doado:',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Raleway',
                          fontSize: 22.0,
                          fontWeight:
                              FontWeight.w600, // Peso da fonte 600 (bold)
                          fontStyle: FontStyle.normal,
                          height: 20.0 /
                              22.0, // Line height = 20px / Font size = 22px
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: getDocId(),
                        builder: ((context, snapshot) {
                          return GetUserTotalDonate(
                              documentId: docIDs,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 24.0,
                                fontWeight:
                                    FontWeight.w600, // Peso da fonte 600 (bold)
                                fontStyle: FontStyle.normal,
                                height: 20.0 / 24.0,
                                color: Colors.white,
                              ));
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 138.0,
                height: 89.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Máx. doado:',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Raleway',
                          fontSize: 22.0,
                          fontWeight:
                              FontWeight.w600, // Peso da fonte 600 (bold)
                          fontStyle: FontStyle.normal,
                          height: 20.0 /
                              22.0, // Line height = 20px / Font size = 22px
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: getDocId(),
                        builder: ((context, snapshot) {
                          return GetUserMaxDonate(
                              documentId: docIDs,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 24.0,
                                fontWeight:
                                    FontWeight.w600, // Peso da fonte 600 (bold)
                                fontStyle: FontStyle.normal,
                                height: 20.0 / 24.0,
                                color: Colors.white,
                              ));
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Histórico de Doações',
                style: TextStyle(
                  color: Color(0xFFFFFFFF), // Cor branca (#FFFFFF)
                  fontFamily: 'Raleway',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600, // Peso da fonte 600 (bold)
                  fontStyle: FontStyle.normal,
                  height: 20.0 / 24.0, // Line height = 20px / Font size = 24px
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DonateCard(
                        date: '26/09/2023',
                        Name: 'Associação de Caridade de PA',
                        price: 'R\$ 150,00',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DonateCard(
                        date: '26/08/2023',
                        Name: 'Lar dos idosos',
                        price: 'R\$ 23,50',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DonateCard(
                        date: '20/08/2023',
                        Name: 'Associação de Caridade de PA',
                        price: 'R\$ 150,00',
                      ),
                    ),
                  ]))),
        ]),
      ),
    );
  }
}
