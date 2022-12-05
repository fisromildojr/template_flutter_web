import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class CardSmall extends StatelessWidget {
  final String cta;
  final String? img;
  final Function() tap;
  final String title;
  final String description;

  CardSmall({
    this.title = "Placeholder Title",
    this.description = "",
    this.cta = "",
    this.img = "https://via.placeholder.com/200",
    this.tap = defaultFunc,
  });

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Card(
        elevation: 0.4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding / 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                child: Image.network(
                  img!,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.only(
              //       topLeft: Radius.circular(6.0),
              //       topRight: Radius.circular(6.0),
              //     ),
              //     image: DecorationImage(
              //       image: Image.network(img!,),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyText2),
                    Text(cta, style: Theme.of(context).textTheme.bodyText1),
                    Padding(
                      padding: const EdgeInsets.only(top: defaultPadding / 2),
                      child: Text(cta,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
