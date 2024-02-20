import 'package:flutter/material.dart';
import 'package:reservia/utils/app_layout.dart';
import 'package:reservia/utils/app_style.dart';
import 'package:reservia/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.ticket});
  final Map<String, dynamic> ticket;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width:size.width,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right:16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*
              showing the blue part of the card
            */
            Container(
              decoration: const BoxDecoration(
                color:  Color(0xFF536799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21)),
                
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'], style: Styles.headLineStyle3,),
                      Expanded(child: Container()),
                      const ThickContainer(),
                      Expanded(child: Stack(
                        children: [
                        SizedBox(
                          height: 24,
                          child: LayoutBuilder(
                            builder: (BuildContext context,BoxConstraints constraints){
                              print("The width is ${constraints.constrainWidth()}");
                            return Flex(direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                              children: List.generate((constraints.constrainWidth()/6).floor() , (index) => SizedBox(
                                width: 3,
                                height: 1,
                                child: DecoratedBox(decoration: BoxDecoration(
                                  color: Colors.white
                                ),))
                                )
                            );
                            },
                          ),
                        ),
                      Center(child: Transform.rotate(angle: 1.5, child: const Icon(Icons.local_airport_rounded, color: Colors.white,),)),
                    ]
                    )),
                      const ThickContainer(),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'], style: Styles.headLineStyle3,)

                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(ticket['from']['name'], style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                      Text(ticket['flying_time'], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                       SizedBox(
                        width: 100,
                        child: Text(ticket['to']['name'],textAlign: TextAlign.end ,style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
              showing the orange part of the card
            */
            Container(
              color: Styles.orangeColor, //const Color(0xFFF37B67),
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    )),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context,BoxConstraints constraints ){
                        return Flex(direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                      width: 5, height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    )),
                    );
                      }
                      ),
                  ) ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                    )),
                  )
                ],
              ),
            ),
            /*
              showing the orange part of the card
            */
            Container(
               decoration:  BoxDecoration(
                color:  Styles.orangeColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21)),
              ),
              padding: const EdgeInsets.only(left:16, right: 16, top: 10, bottom: 16),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ticket['date'], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text("DATE", style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(ticket["departure_time"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text("Departure time", style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(ticket['number'].toString(), style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text("Number", style: Styles.headLineStyle4.copyWith(color: Colors.white),)
                      ],
                    )
                  ],
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}