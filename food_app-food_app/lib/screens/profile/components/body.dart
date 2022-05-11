import 'package:flutter/material.dart';
import 'package:food_app/api/api.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  //height for cover image
  final double coverHeight = 230;
  final double profileHeight = 144;
  //calling ProductDetails method from api.dart
  ProductDetails user = ProductDetails();

  //method to show buildTop and buildContent in list view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [buildTop(), buildContent()],
      ),
    );
  }

  //method to call cover page and profile page
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: profileHeight / 2),
            child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  //method for user profile cover page
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          "https://i2.wp.com/techsaa.com/wp-content/uploads/2021/09/Importance-of-Technology.jpg?w=612&ssl=1",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

//method for user profile image
  Widget buildProfileImage() => InkWell(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => set_profile()));
        },
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const NetworkImage(
              "https://cdn.pixabay.com/photo/2016/04/26/07/57/woman-1353825__340.png"),
        ),
      );

// method for profile content
  Widget buildContent() {
    return SizedBox(
      height: 1000,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: Colors.purple.shade50,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: FutureBuilder<List>(
                  future: user.getUser(),
                  //user.getUser(),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.3),
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 6,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, i) {
                            return InkWell(
                              child: Card(
                                child: InkWell(
                                  child: GridTile(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Product: ",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              snapshot.data![i]['username'],
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Category: ",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              snapshot.data![i]['email'],
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }
                  },
                ),
              ),
            )),
      ),
    );
  }
}
