import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingprcnt;

  ChartBar(this.label, this.spendingAmount, this.spendingprcnt);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${spendingAmount.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.60,
              width: 10,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).highlightColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingprcnt,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).highlightColor, width: 1),
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label,
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
