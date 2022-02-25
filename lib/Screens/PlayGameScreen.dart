import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coin_game/Constants/constants.dart';
import 'dart:math';



class PlayGameScreen extends StatefulWidget {
  // const PlayGameScreen({Key? key}) : super(key: key);
  @override
  PlayGameScreen(this.totalcoins);
  int totalcoins;
  //
  // print(playerName);
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  @override

  String playername="Player";
  Size fixedSize;
  // List<bool>dp=[];
  var dp = new List(520);
  // String totalCoinsStr;
  int totalCoins;

  String winnerIsPlayerText="Hurray!!! You won the game.";
  String winnerIsComputerText="Oops!!! Better Luck next time.";


  void initState(){
    super.initState();
    // totalCoins=20;
    totalCoins=widget.totalcoins;
    // print(widget.totalcoins.runtimeType);
  }

  bool playerChance=true;
  bool playerWin=false;

  void calculate(){
    dp[0]=false;
    dp[1]=dp[2]=dp[3]=true;

    // true means computer wants that number of coins to be left for his win.

    for(int i=4;i<=503;i++){
        if(dp[i-1]==false || dp[i-2]==false || dp[i-3]==false){
          dp[i]=true;
        }
        else{
          dp[i]=false;
        }
    }
  }

  int computerplayerChance(){
      int coinsTaken;

      if(totalCoins-1>=0 && dp[totalCoins-1]==false){
            totalCoins--;
            coinsTaken=1;
      }
      else if(totalCoins-2>=0 && dp[totalCoins-2]==false){
            totalCoins-=2;
            coinsTaken=2;
      }
      else if(totalCoins-3>=0 && dp[totalCoins-3]==false){
            totalCoins-=3;
            coinsTaken=3;
      }

      return coinsTaken;
  }
  
  void playerplayerChance(int numberOfCoins){

      if(totalCoins<=0){
          return;
      }

      totalCoins=max(0,totalCoins-numberOfCoins);
      playerChance=false;
      setState(() {});

      print("Remaining coins after player chance");
      print(totalCoins);

      if(totalCoins<=0){
          playerWin=true;
          // return;
      }

      Future.delayed(Duration(seconds: 2),(){

          totalCoins=max(0,totalCoins-computerplayerChance());

          print("Remaining coins after computer chance");
          print(totalCoins);

          playerChance=true;
          setState(() {});

          if(totalCoins<=0){
              showDialog(context: context, builder: (BuildContext context) => popUpDialog(context,playerWin,winnerIsComputerText,winnerIsPlayerText));
              return;
          }
      });

      print(totalCoins);
  }



  Widget build(BuildContext context) {
    // print(playername);

    calculate();

    Size size = MediaQuery.of(context).size;
    // print(size.height);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Game'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
        
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Coins Left: $totalCoins',style: coins_left_style,),
                  ],
              ),
            ),
          ),
          // Container(
          //   width: (size.width),
          //   // height:size.height/2,
          //   color: Colors.green,
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(23.0),
          //           child: Text('Computer',style: comp_player_style,),
          //         ),
          //         SizedBox(
          //           height: 40,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             ElevatedButton(
          //               child: const Text(
          //                 '1',
          //                 style: TextStyle(fontSize: 24),
          //               ),
          //               onPressed: () {

          //               },
          //               style: ElevatedButton.styleFrom(
          //                   // fixedSize: const Size(200, 200),
          //                   shape: const CircleBorder(),
          //               ),
          //             ),
          //             ElevatedButton(
          //               child: const Text(
          //                 '2',
          //                 style: TextStyle(fontSize: 24),
          //               ),
          //               onPressed: () {

          //               },
          //               style: ElevatedButton.styleFrom(
          //                 // fixedSize: const Size(200, 200),
          //                 shape: const CircleBorder(),
          //               ),
          //             ),
          //             ElevatedButton(
          //               child: const Text(
          //                 '3',
          //                 style: TextStyle(fontSize: 24),
          //               ),
          //               onPressed: () {

          //               },
          //               style: ElevatedButton.styleFrom(
          //                 // fixedSize: const Size(200, 200),
          //                 shape: const CircleBorder(),
          //               ),
                        
          //             ),

                      
          //             // computerplayerChance(50),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),


          Expanded(
            child: Container(
              color: Colors.yellow,
              width: size.width,
              // height: size.height,
              // height: size.height-(size.height/2.3),
              child: Center(
                child: Column(
                  children: [
                    Text(playername,style: comp_player_style,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            '1',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                              if(playerChance==true){
                                  playerplayerChance(1);
                                 
                                  // Timer(const Duration(seconds: 2), (){
                                  //   setState((){
                                  //     Center(child: Text('Player removes one coin',style: rule_style,));
                                  //     });
                                  // });

                                  // Text('Player removes one coin');
                              }
                          },
                          style: ElevatedButton.styleFrom(
                            // fixedSize: const Size(200, 200),
                            shape: const CircleBorder(),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            if(playerChance==true){
                                playerplayerChance(2);
                                Text('Player removes two coins');
                            }   
                          },
                          style: ElevatedButton.styleFrom(
                            // fixedSize: const Size(200, 200),
                            shape: const CircleBorder(),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text(
                            '3',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                              if(playerChance==true){
                                playerplayerChance(3);
                                Text('Player removes three coins');
                              }
                          },
                          style: ElevatedButton.styleFrom(
                            // fixedSize: const Size(200, 200),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ],
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



Widget popUpDialog(BuildContext context,bool playerwin,String winnerIsComputer,String winnerIsPlayer) {
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
    title: Center(
      child: Text(
        playerwin? winnerIsPlayer:winnerIsComputer,
        style: TextStyle(
          fontSize: 22,
          // fontFamily: 'Ubuntu',
        ),
      ),
      ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 108.0),
          child: Center(
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: 21,
                // fontFamily: 'Ubuntu',
              ),
            ),
          ),
          //FaIcon(FontAwesomeIcons.times,size: 50,)
        ),
      ),
    ],
  );
}


