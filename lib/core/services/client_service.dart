import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/constants/environment.dart';

class ClientService {
  late final Client client;
  late final Account account;
  late final Databases databases;
  late final Realtime realtime;

  ClientService() {
    client = Client()
      ..setEndpoint(Environment.appwritePublicEndpoint)
      ..setProject(Environment.appwriteProjectId);

    account = Account(client);
    databases = Databases(client);
    realtime = Realtime(client);
  }
}
