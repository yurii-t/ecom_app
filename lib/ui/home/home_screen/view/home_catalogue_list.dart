import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/blocs/catalogue/bloc/catalogue_screen_bloc.dart';
import 'package:ecom_app/ui/home/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCatalogueList extends StatelessWidget {
  const HomeCatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<CatalogueScreenBloc, CatalogueScreenState>(
        //StreamBuilder<QuerySnapshot>(
        // stream: FirebaseFirestore.instance.collection('Catalogue').snapshots(),
        builder: (context, state) {
          if (state is CatalogueScreenLoading) {
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is CatalogueScreenLoaded) {
            return ListView.builder(
              itemCount: state.catalogue.length, //snapshot.data?.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // final DocumentSnapshot? data = snapshot.data?.docs[index];

                return Container(
                  margin: const EdgeInsets.all(8),
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        state.catalogue[index].imageUrl,
                        // data?['imageUrl'].toString() ?? 'Loading...',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.5),
                        BlendMode.color,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      state.catalogue[index].title,
                      // data?['title'].toString() ?? 'Loading...',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Text('Error');
        },
      ),
    );
  }
}
