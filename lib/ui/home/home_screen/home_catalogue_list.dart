import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeCatalogueList extends StatelessWidget {
  const HomeCatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Catalogue').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  // itemExtent: 88,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot? data = snapshot.data?.docs[index];

                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            data?['imageUrl'].toString() ?? 'Loading...',
                          ),
                          colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(0.5),
                            BlendMode.color,
                          ),
                          // AssetImage('assets/images/img_gal.jpg'),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          data?['title'].toString() ?? 'Loading...',
                          textAlign: TextAlign.center,
                          // LocaleKeys.phones.tr(), //'Phones',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                    // }

                    // return const CircularProgressIndicator();

                    // ),
                    // );
                  },
                );
        },
      ),
    );
  }
}
