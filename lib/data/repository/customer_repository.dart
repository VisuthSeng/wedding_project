import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_project/data/model/customer_model.dart';
import '../firebase/firestore_collection.dart';

abstract class ICustomerRepository {
  Future<CustomerModel> saveCustomer(CustomerModel model);
  Stream<List<CustomerModel>> getStreamOfCustomer();
  Future<void> updateCustomer(CustomerModel model);
  Future<void> deleteCustomer(String id);
}

class CustomerRepository extends ICustomerRepository {
  @override
  Future<void> deleteCustomer(String id) async {
    await FirestoreCollection.customer.doc(id).delete();
  }

  @override
  Stream<List<CustomerModel>> getStreamOfCustomer() {
    return FirestoreCollection.customer.snapshots().map(
      (QuerySnapshot snapshot) {
        List<CustomerModel> listCustomer = [];
        for (var doc in snapshot.docs) {
          listCustomer
              .add(CustomerModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return listCustomer;
      },
    );
  }

  @override
  Future<CustomerModel> saveCustomer(CustomerModel model) async {
    await FirestoreCollection.customer.doc(model.id).set(model.toMap());
    return model;
  }

  @override
  Future<void> updateCustomer(CustomerModel model) async {
    await FirestoreCollection.customer.doc(model.id).set(model.toMap());
  }
}
