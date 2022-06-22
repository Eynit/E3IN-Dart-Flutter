
import 'membres.dart';
import 'dart:math';
import 'package:flutter/material.dart';

var nb_dep;
var nb_photo_1;
var nb_photo_2;
var nb_photo_3;
var nb_photo_4;
var nb_select_1;
var nb_select_2;
var nb_iden;
var connect = 0;
var user = "images/not_connect.jpeg";

void main() {
runApp(IHM());
}
class IHM extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "MyApp.nico",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/select': (BuildContext context) => Select(),
        '/select_2': (BuildContext context) => Select_2(),
        '/identite': (BuildContext context) => Identite(),
        '/login': (BuildContext context) => Login(),
        '/contact': (BuildContext context) => Contact(),
      });
  }
}

class Home extends StatelessWidget{
  var dep_1 = Departement("Bas-rhin","67","Strasbourg");
  var dep_2 = Departement("Val d'oise","95","Cergy");
  @override
  Widget build(BuildContext context){
    List depart = [dep_1,dep_2];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
          actions: [
            Icon_login()
          ]
            ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: depart.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile( 
            leading : Text(depart[index].num_dep),
              title : Text(depart[index].dep),
              subtitle : Text(depart[index].ville),
              onTap: (){
                nb_dep = depart[index].num_dep;
                Navigator.of(context).pushNamed('/select');
      },
      ); 
    }
    )
  );
  }
}

class Select extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Random_Number(){
      List liste = [];
      for (var i in Membre.membres) {
      if (i.dep == nb_dep){
        liste.add(i);
      }}
    int random = Random().nextInt(liste.length);
    return liste[random];
    }
    nb_photo_1 = Random_Number();
    nb_photo_2 = Random_Number();
    nb_photo_3 = Random_Number();
    nb_photo_4 = Random_Number();
    return Scaffold(
          appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
          actions: [
            Icon_login()
          ],
        ),
      body: Center(
          child : Column(
            children: [
              Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/select_2');
                    nb_select_1 = nb_photo_1;
                    nb_select_2 = nb_photo_2;
                  },
                  child: Row(children: [ 
                  Expanded(child:Image.asset(nb_photo_1.photo)),
                  Expanded(child:Image.asset(nb_photo_2.photo))
                  ],) 
                  )),
              Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/select_2');
                    nb_select_1 = nb_photo_3;
                    nb_select_2 = nb_photo_4;
                  },
                  child: Row(children: [ 
                  Expanded(child:Image.asset(nb_photo_3.photo)),
                  Expanded(child:Image.asset(nb_photo_4.photo))
                  ],) 
                  )),
              Container(child: TextButton(onPressed: () {Navigator.of(context).pushNamed('/select');}, child: Text("Suivant"),
  ))])));
  }
}

class Select_2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
          actions: [
            Icon_login()
          ],
        ),
      body: Center(
          child : Column(
            children: [
              Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/identite');
                    nb_iden = nb_select_1;
                  },
                  child:Expanded(child:Image.asset(nb_select_1.photo)),
                  )),
              Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/identite');
                    nb_iden = nb_select_2;
                  },
                  child:Expanded(child:Image.asset(nb_select_2.photo)),
                  )),

              Container(child: TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Suivant"),
  ))])));
  }
}

class Identite extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
          actions: [
            Icon_login()
          ],
        ),
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Row (children : [
                Container(width: 200, height: 100, child: Column (children : [ Text(nb_iden.prenom,textAlign: TextAlign.center,style: TextStyle(fontSize: 30,)),Text(nb_iden.nom,textAlign: TextAlign.center,style: TextStyle(fontSize: 30,))])), 
                Expanded(child: Image.asset(nb_iden.photo) 
              )])),
              Container(height: 50,child: TextButton(onPressed: () {
                if (connect == 0){Navigator.of(context).pushNamed('/login');} 
                else {Navigator.of(context).pushNamed('/contact');} }, 
                child: Text("Contactez"),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 0, 68, 255),
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),)))
            ],
        )
        ),
    ); }
} 


class Login extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
        ),
        body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tinder',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Connexion',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Utilisateur',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe ',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                  for (var i in Membre.membres){
                    if (i.login == nameController.text && i.mdp == passwordController.text){
                      Navigator.of(context).pop();
                      connect = 1;
                      user = i.photo;
                      break;
                    }
                  }
                  if (connect == 0){
                  showDialog(context: context, builder: (BuildContext context){
                         return AlertDialog(
                             title: Text("Erreur"),
                             content: Text("Identifiants Incorrect"),
                         );
                  },
                );}}
            ),
        )],
        )));
  }
}

class Contact extends StatelessWidget{
  TextEditingController messController = TextEditingController();
  var personne = nb_iden.prenom;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tinder"),
        ),
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
              child: Center(child: TextField(
                controller: messController,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texte',
                ),
              ),
            )),
              Container(child: TextButton(
                onPressed: () {
                Navigator.of(context).pushNamed('/home');
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Ok"),
                    content: Text("Votre message a été envoyé à $personne"),
                  );
                });
                }, 
                child: Text("Envoyer"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromARGB(255, 0, 68, 255),
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),)))
            ],
        )
        ),
    ); }
    }


class Icon_login extends StatelessWidget{

  @override
   Widget build(BuildContext context){
  return IconButton (
              icon: Image.asset(user),
              onPressed: () {
                if (connect == 0){
                  Navigator.of(context).pushNamed('/login');
                }
                else {
                  connect = 0;
                  user = "images/not_connect.jpeg";
                  Navigator.of(context).pushNamed('/home');
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      content: Text("Vous êtes déconnecté"),
                    );
                  },
                );
                }
              }
            );}
}


class Departement {
  var dep;
  var num_dep;
  var ville;

  Departement(this.dep, this.num_dep,this.ville);
}

class Membre {
  var id; 
  var dep;
  var nom;
  var prenom;
  var photo;
  var login;
  var mdp;
  static List membres = [membre_1,membre_2,membre_3,membre_4,membre_5,membre_6,membre_7,membre_8,membre_9,membre_10,membre_11,membre_12];

  Membre(this.id,this.dep,this.nom, this.prenom,this.photo,this.login,this.mdp);
}