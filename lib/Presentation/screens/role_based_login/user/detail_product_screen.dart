import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/models/app_model.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.appModel});
  final AppModel appModel;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst().kLightGrey,
        centerTitle: true,
        title: Text(
          'Detail Product',
          style: TextStyle(letterSpacing: 1, fontSize: 18),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined),
              ),
              Positioned(
                right: 8,
                top: 5,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: ColorsConst.kRed,
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(color: ColorsConst.kWhite, fontSize: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: ColorsConst().bannerColor,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      widget.appModel.image,
                      fit: BoxFit.cover,
                      height: size.height * 0.4,
                      width: size.width * 0.84,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(3, (index) {
                          return AnimatedContainer(
                            width: 7,
                            height: 7,
                            margin: EdgeInsets.only(right: 4),
                            duration: Duration(seconds: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currentIndex
                                  ? ColorsConst.kBlue
                                  : ColorsConst.kGrey,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'H&M',
                      style: TextStyle(
                        color: ColorsConst.kOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(widget.appModel.rating.toString(), style: TextStyle()),
                    SizedBox(width: 5),
                    Text(
                      '${widget.appModel.review}',
                      style: TextStyle(color: ColorsConst().lightBlack),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, size: 22),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    widget.appModel.name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$${widget.appModel.price.toString()}.00',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorsConst.kPink,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    if (widget.appModel.isCheck == true)
                      Text(
                        '\$${widget.appModel.price + 250}.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorsConst().lightBlack2,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: ColorsConst().lightBlack2,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '$description1 ${widget.appModel.name} $description2',
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsConst.kGrey,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Color',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              ...List.generate(widget.appModel.color.length, (
                                index,
                              ) {
                                final item = widget.appModel;
                                return CircleAvatar(
                                  backgroundColor: item.color[index],
                                  radius: 18,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedColorIndex = index;
                                      });
                                    },
                                    child: Icon(
                                      size: 18,
                                      Icons.check,
                                      color: selectedColorIndex == index
                                          ? ColorsConst.kWhite
                                          : ColorsConst.kTransparent,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Sizes',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              ...List.generate(widget.appModel.size.length, (
                                index,
                              ) {
                                final item = widget.appModel;
                                return CircleAvatar(
                                  backgroundColor: selectedSizeIndex == index
                                      ? ColorsConst.kBlack
                                      : ColorsConst.kWhite,
                                  radius: 18,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedSizeIndex = index;
                                      });
                                    },
                                    child: Text(
                                      item.size[index],
                                      style: TextStyle(
                                        color: selectedSizeIndex == index
                                            ? ColorsConst.kWhite
                                            : ColorsConst.kBlack,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                SizedBox(
                  width: size.width,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDetailsButton(
                        height: 50,
                        color: ColorsConst.kBlack,
                        backgroundColor: WidgetStateProperty.all(
                          ColorsConst.kBlack,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: ColorsConst.kWhite,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorsConst.kWhite,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      ProductDetailsButton(
                        height: 50,
                        color: ColorsConst.kBlack,
                        backgroundColor: WidgetStateProperty.all(
                          ColorsConst.kWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: ColorsConst.kBlack,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorsConst.kBlack,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsButton extends StatelessWidget {
  const ProductDetailsButton({
    super.key,
    this.size,
    required this.color,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.child,
  });

  final Size? size;
  final Color color;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final BoxBorder? border;
  final Widget? child;
  final WidgetStateProperty<Color?>? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(border: border, shape: BoxShape.rectangle),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          elevation: WidgetStateProperty.all(2),
          shape: WidgetStateProperty.all(RoundedRectangleBorder()),
        ),
        child: child,
      ),
    );
  }
}
