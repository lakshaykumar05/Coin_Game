import 'package:flutter/material.dart';
import 'package:coin_game/Constants/constants.dart';

class InstructionsScreen extends StatefulWidget {
  // const InstructionsScreen({Key? key}) : super(key: key);

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Coin Game'),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
        body: Container(
          color: Colors.red,
            child: Column(
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Instructions',style: Ins_style,),
                ),),
                SizedBox(width:350,child: Text('1)  This is a game in which the user has to play against the CPU.\n',style: rule_style,)),
                SizedBox(width:350,child: Text('2)  You will choose some number of coins (less then 500) before the start of the game.\n',style: rule_style,)),
                SizedBox(width:350,child: Text('3)  The user would be allowed to remove 1 , 2  or 3 coins at each step\n',style: rule_style,)),
                SizedBox(width:350,child: Text('4)  The CPU and user will take alternate turn.\n',style: rule_style,)),
                SizedBox(width:350,child: Text('5)  The player that removes the last set of coins will win!\n',style: rule_style,)),
              ],
            ),
        ),
      ),
    );
  }
}


