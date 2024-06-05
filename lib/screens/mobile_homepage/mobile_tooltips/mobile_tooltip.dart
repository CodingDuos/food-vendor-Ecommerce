import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class MobileToolTipPage extends StatelessWidget {
  const MobileToolTipPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/process.png'), fit: BoxFit.fill)),
        width: screenWidth,
        child: const Stack(
          children: [MobileToolTipPageBody()],
        ),
      ),
    );
  }
}

class MobileToolTipPageBody extends StatelessWidget {
  const MobileToolTipPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        'title': 'Set your location',
        'description': 'A high quality solution beautifully food for customers',
        'icon': 'images/index5.svg'
      },
      {
        'title': 'Select Food',
        'description': 'A high quality solution beautifully food for customers',
        'icon': 'images/index2.svg'
      },
      {
        'title': 'Pay Cash or Online',
        'description': 'Providing an upscale and elegant ambiance for ..',
        'icon': 'images/index1.svg'
      },
      {
        'title': 'Delivery or Pickup',
        'description': 'Allowing customers to easily book tables through',
        'icon': 'images/index3.svg'
      }
    ];

    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, bottom: 100, left: 25, right: 25),
        child: SizedBox(
          child: Column(
            children: [
              Text(
                'The Process of Crafting your Dining Experience',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: AppColors.whitecolor,
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                  itemCount: dataList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ToolTipWidget(
                      title: dataList[index]['title'],
                      description: dataList[index]['description'],
                      index: index,
                      iconPath: dataList[index]['icon'],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ToolTipWidget extends StatefulWidget {
  const ToolTipWidget(
      {super.key,
      required this.index,
      required this.iconPath,
      required this.title,
      required this.description});
  final int index;
  final String iconPath;
  final String title;
  final String description;

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget> {
  bool ishovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {},
        onHover: (val) {
          ishovering = val;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: const Color(0xff0d1633),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: Text(
                        (widget.index + 1).toString(),
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff161f3b),
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 60,
                            decoration: BoxDecoration(
                                color: const Color(0xff262e48),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: SvgPicture.asset(
                                widget.iconPath,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: ishovering ? 120 : 0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xfffa5950).withOpacity(0.80),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 90),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: AppColors.whitecolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.description,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white60,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
