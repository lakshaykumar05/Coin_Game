import 'package:flutter/material.dart';
import 'package:coin_game/Screens/PlayGameScreen.dart';


class StartGameScreen extends StatefulWidget {
  // const StartGameScreen({Key? key}) : super(key: key);

  @override
  _StartGameScreenState createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {

  TextEditingController textController=TextEditingController();

  String start='Start Game';
  bool visi=false;
  String playerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Coin Game'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(top:48,right: 8,left: 4),
                child: Center(
                  child: Text(
                    'Enter your Name',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      //  fontFamily: 'Pacifico',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.amberAccent,
            padding: EdgeInsets.only(top:25,left:45,right: 45),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Username',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Ubuntu',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: textController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: InkWell(
              // child: Text('jbhkbjj,hb ',style: TextStyle(color: Colors.green),),
              onTap: () {
                setState(() {
                  start = "Loading";
                  visi = true;
                });

                playerName=textController.text;

                // user_det = await CodeForces().getUserData(userName);
                // user_all_det = await CodeForces().getAllInfo(userName);
                // print(user_all_det);
                // print(playerName);

                if (playerName == null || playerName.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => popUpDialog(context),
                  );
                } else {
                  // fun(user_all_det);
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return PlayGameScreen(playerName: playerName,);
                      }));
                  }
                setState(() {
                  start = "Start Game";
                  visi = false;
                });
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            start,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                            ),
                          ),
                          Visibility(
                            visible: visi,
                            child: Container(
                              // color: Colors.white,
                              width: 50,
                              height: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget popUpDialog(BuildContext context) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
    title: Center(
      child: Text(
        'Please enter a name',
        style: TextStyle(
          fontSize: 22,
          // fontFamily: 'Ubuntu',
        ),
      ),),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 108.0),
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Ubuntu',
            ),
          ),
          //FaIcon(FontAwesomeIcons.times,size: 50,)
        ),
      ),
    ],
  );
}


