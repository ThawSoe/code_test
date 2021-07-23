import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  var detail;
  Detail({Key? key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name", style: Theme.of(context).textTheme.headline2),
                Text(detail['name'],
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email", style: Theme.of(context).textTheme.headline2),
                Text(detail['email'],
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address", style: Theme.of(context).textTheme.headline2),
                Text(
                    detail['address']['city'] +
                        '( ' +
                        detail['address']['street'] +
                        ' )',
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phone", style: Theme.of(context).textTheme.headline2),
                Text(detail['phone'],
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Website", style: Theme.of(context).textTheme.headline2),
                Text(detail['website'],
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
