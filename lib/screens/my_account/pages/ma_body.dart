import 'package:flutter/material.dart';
import 'package:food_ecommerce/constants/constants_colors.dart';
import 'package:food_ecommerce/services/responsive.dart';

class MyAccountBody extends StatelessWidget {
  const MyAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAccountBodyViewWidget();
  }
}

class MyAccountBodyViewWidget extends StatefulWidget {
  const MyAccountBodyViewWidget({super.key});

  @override
  State<MyAccountBodyViewWidget> createState() =>
      _MyAccountBodyViewWidgetState();
}

class _MyAccountBodyViewWidgetState extends State<MyAccountBodyViewWidget> {
  final List<String> list = [
    'Account Details',
    'My Address',
    'My Orders',
    'Tracking Orders'
  ];
  final List<IconData> listicons = [
    Icons.space_dashboard_sharp,
    Icons.location_on_outlined,
    Icons.shopping_cart,
    Icons.track_changes_outlined
  ];

  String selectedtab = 'Account Details';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.getResponsivePadding(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 300,
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          bool isselected = list[index] == selectedtab;
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedtab = list[index];
                                });
                                // Navigator.pushNamed(context, '/account_details');
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: isselected
                                        ? AppColors.primaryColor
                                        : null),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Icon(
                                      listicons[index],
                                      color: isselected
                                          ? AppColors.whitecolor
                                          : Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      list[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: isselected
                                              ? AppColors.whitecolor
                                              : Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                )),
            const SizedBox(
              width: 40,
            ),
            Expanded(
                flex: 10,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: getScreenPages(selectedtab),
                ))
          ],
        ),
      ),
    );
  }

  getScreenPages(String val) {
    switch (val) {
      case 'Account Details':
        return const AccountDetails();
      case 'My Address':
        return const MyAddressScreen();
      case 'Tracking Orders':
        return const OrdersTracking();
      case 'My Orders':
        return const OrdersPage();
      default:
        return Container();
    }
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Account Details',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const TextFieldWidget(
          name: 'Name',
        ),
        const TextFieldWidget(
          name: 'Phone Number',
        ),
        const TextFieldWidget(
          name: 'Email',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Change Password',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const TextFieldWidget(
          name: 'Current Password',
        ),
        const TextFieldWidget(
          name: 'New Password',
        ),
        const TextFieldWidget(
          name: 'Confirm New Password',
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor),
              child: const Center(
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    'Billing Address',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.headingTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text('Utara Islamabad'),
                const SizedBox(height: 10),
                const Text('Yellow Road, Pakistan'),
                const SizedBox(height: 10),
                const Text('Islamabad'),
                const SizedBox(height: 10),
                const Text('1230'),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(color: AppColors.primaryColor),
                    ))
              ],
            ),
          ),
        )),
        Expanded(
            child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    'Shipping Address',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.headingTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text('4299 Lane express '),
                const SizedBox(height: 10),
                const Text('Sarasota'),
                const SizedBox(height: 10),
                const Text('FL 3434249 USA'),
                const SizedBox(height: 10),
                const Text('Phone +92 123 456 789'),
                const SizedBox(height: 10),
                const Text('Sarasota'),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(color: AppColors.primaryColor),
                    ))
              ],
            ),
          ),
        )),
      ],
    );
  }
}

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Account Details',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'To track your order please enter your OrderID in the box below and press "Track" button. This was given to you on your receipt and in the confirmation email you should have received.',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const TextFieldWidget(name: 'Order Id'),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Found in your order confirmation email',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const TextFieldWidget(name: 'Billing Email'),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 20),
          child: MaterialButton(
            onPressed: () {},
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor),
              child: const Center(
                child: Text(
                  'Track Order',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
          child: Text(
            'Your Orders',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColors.headingTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Row(
              children:
                  ['Product', 'date', 'Status', 'Branch', 'Total', 'Actions']
                      .map((e) => Expanded(
                              child: Center(
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )))
                      .toList(),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      'Kesar Royal Milkshake',
                      'March 45, 2020',
                      'Processing',
                      'Uttara Branch',
                      '£125.00',
                      'Cancel Order'
                    ]
                        .map((e) => Expanded(
                                child: Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    color: e == 'Cancel Order'
                                        ? AppColors.primaryColor
                                        : Colors.black),
                              ),
                            )))
                        .toList(),
                  ),
                ),
              );
            })
      ],
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(name),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: const TextField(
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}
