import 'package:easy_animation/src/models/contact_model.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key key, this.onTap, @required this.item})
      : assert(item != null),
        super(key: key);

  final VoidCallback onTap;
  final ContactModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                item.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    item.role,
                    style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
