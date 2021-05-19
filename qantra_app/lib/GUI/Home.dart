import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qantra_app/provider/main_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<MainDataProvider>(
        create: (_) => MainDataProvider(),
        child: _HomeProviderBody(),
      ),
    );
  }
}

class _HomeProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeProviderBodyState();
  }
}

class _HomeProviderBodyState extends State<_HomeProviderBody> {
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  void initState(){
    super.initState();
    instance.authStateChanges().listen((User user) {
      if (user == null ){
        print('no user');
      } else{
        print('there is a user');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataProvider>(
        builder: (_, MainDataProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  // Respond to item press.
                },
                items: [
                  BottomNavigationBarItem(
                    title: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                    icon: Image.asset('images/home.png'),
                  ),
                  BottomNavigationBarItem(
                    title: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Record',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                    icon: Image.asset('images/record.png'),
                  ),
                  BottomNavigationBarItem(
                    title: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                    icon: Image.asset('images/explore.png'),
                  ),
                  BottomNavigationBarItem(
                    title: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Insurance',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                    icon: Image.asset('images/insurance.png'),
                  ),
                  BottomNavigationBarItem(
                    title: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                    icon: Image.asset('images/profile.png'),
                  ),
                ],
              ),
              backgroundColor: Color.fromARGB(250, 242, 244, 247),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              /// user avatar
                              Container(
                                child: Image.asset(
                                  'images/person.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              /// greeting text
                              Text(
                                'Good evening Ali',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ],
                          ),
                          /// drawer
                          Container(
                            child: Image.asset(
                              'images/drawer.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          /// search bar
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Container(
                                child: Image.asset(
                                  'images/search.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),

                              /// search
                              Expanded(
                                  child: new TextFormField(
                                      controller: Provider.of<MainDataProvider>(
                                              context,
                                              listen: false)
                                          .searchController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'What are you looking for ?',
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13.0,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        isDense: true,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      /// trending text
                      Text(
                        'Trending',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /// elezaby adv
                      Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              'images/ezabyadv.png',
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 32,
                              child: Container(
                                width: 70,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: new InkWell(
                                  onTap: () {},
                                  child: new Text('Learn More',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(250, 34, 64, 126),
                                        fontSize: 10,
                                        fontFamily: 'Ubuntu',
                                      )),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /// our services text
                      Text(
                        'Our Services',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Row(children: [
                        /// products
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('images/products.png',
                                      width: 46, height: 46)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Products',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        /// labs
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('images/labs.png',
                                      width: 46, height: 46)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Labs',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        /// doctors
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('images/doctors.png',
                                      width: 46, height: 46)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Doctors',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        /// hospitals
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('images/hospital.png',
                                      width: 46, height: 46)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Hospitals',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      /// reminders text
                      Text(
                        'Reminders',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          /// dosage reminder
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image.asset('images/drugs.png',
                                          width: 46, height: 46)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dose Reminder',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Next Dosage',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          /// appointments
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image.asset('images/calender.png',
                                          width: 46, height: 46)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Appointments',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'see Your Next Appointment',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /// recommended
                      Text(
                        'Recommended For You',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /// list of products
                      Container(
                          height: 170,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              controller: myProvider.scrollCon,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product1.png',
                                                width: 120, height: 100),
                                            Text(
                                              'Dark kiss - Bath&Body Work...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 3,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(107 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('765.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product2.png',
                                                width: 120, height: 100),
                                            Text(
                                              'Stars travel size giftset Bath...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 4,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(7 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('550.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('1,010.00',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough)),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('You Saved',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text('460.00',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product3.png',
                                                width: 120, height: 100),
                                            Text(
                                              'A thousands miles Bath&Bo…',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 4,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(7 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('550.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('1,010.00',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough)),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('You Saved',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text('460.00',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                );
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      /// most selling text
                      Text(
                        'Most Selling',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /// most selling list products
                      Container(
                          height: 170,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              controller: myProvider.scrollCon,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product4.png',
                                                width: 120, height: 100),
                                            Text(
                                              'Organic Argan Oil For Hair&…',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 4,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(7 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('650.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product5.png',
                                                width: 120, height: 100),
                                            Text(
                                              'Health Life V2500M Multi-Func…',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 4,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(7 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('6,850.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('10,010.00',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough)),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('You Saved',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text('3,160.00',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('images/product6.png',
                                                width: 120, height: 100),
                                            Text(
                                              'Centrum Pfizer, Multivitamin fo …',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: RatingBar.builder(
                                                    initialRating: 4,
                                                    maxRating: 10,
                                                    minRating: 0,
                                                    itemSize: 12,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    glow: false,
                                                    itemCount: 5,
                                                    ignoreGestures: false,
                                                    updateOnDrag: false,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0,
                                                            vertical: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  '(7 Reviews)',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('550.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                SizedBox(width: 3),
                                                Text(
                                                  'EGP',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('1,010.00',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough)),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('You Saved',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text('460.00',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      'EGP',
                                                      style: TextStyle(
                                                          fontSize: 7,
                                                          color:
                                                              Colors.grey[500],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                );
                              })),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ))));
    });
  }
}
