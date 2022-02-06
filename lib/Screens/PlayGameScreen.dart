import 'package:flutter/material.dart';
import 'package:coin_game/Constants/constants.dart';


class PlayGameScreen extends StatefulWidget {
  // const PlayGameScreen({Key? key}) : super(key: key);
  @override
  PlayGameScreen({this.playerName});
  final playerName;
  //
  // print(playerName);
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {

  // String playername=widget.playerName;
  @override

  String playername;
  Size fixedSize;

  void initState(){
    super.initState();
    playername=widget.playerName;
  }

  void calculate(){
    List<bool>dp=[];

    dp[0]=false;
    dp[1]=dp[2]=dp[3]=true;

    for(int i=4;i<=503;i++){
        if(dp[i-1]==false || dp[i-2]==false || dp[i-3]==false){
          dp[i]=true;
        }
        else{
          dp[i]=false;
        }
    }
  }

  // print(playerName);

  Widget build(BuildContext context) {
    print(playername);
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
            width: (size.width),
            height:size.height/2.3,
            color: Colors.green,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Text('Computer',style: comp_player_style,),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text(
                          '1',
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {

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
          Flexible(
            child: Container(
              color: Colors.yellow,
              width: size.width,
              height: size.height,
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
