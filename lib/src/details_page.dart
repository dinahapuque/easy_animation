import 'package:easy_animation/src/models/contact_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactModel contact = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _ContactHeader(contact),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height - _minHeaderExtent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    contact.bio,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black54),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtent = 300.0;
const _minHeaderExtent = 110.0;

const _maxImageSize = 160.0;
const _minImageSize = 60.0;

const _paddingImageTop = 110.0;

class _ContactHeader extends SliverPersistentHeaderDelegate {
  final ContactModel contact;

  _ContactHeader(this.contact);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    final currentImageSize =
        (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);

    final _defaultMargin = 30.0;
    final _centerImageScreen =
        MediaQuery.of(context).size.width / 2 - currentImageSize / 2;

    return Container(
      color: Colors.deepOrange[100],
      child: Stack(
        children: [
          Positioned(
            top: _defaultMargin,
            child: Transform.translate(
              offset: Offset((80.0 * percent).clamp(0.0, 80.0), 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contact.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      contact.role,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: (_centerImageScreen * (1 - percent))
                .clamp(_defaultMargin, _centerImageScreen),
            top: (_paddingImageTop * (1 - percent))
                .clamp(_defaultMargin, _paddingImageTop),
            child: Center(
              child: Image.network(
                contact.imageUrl,
                fit: BoxFit.fitWidth,
                height: currentImageSize,
                width: currentImageSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
