class RealtimeChannels {
  RealtimeChannels._();

  static const String account = 'account';

  static String documents({
    required String databaseId,
    required String collectionId,
  }) {
    return 'databases.$databaseId.collections.$collectionId.documents';
  }

  static String document({
    required String databaseId,
    required String collectionId,
    required String documentId,
  }) {
    return 'databases.$databaseId.collections.$collectionId.documents.$documentId';
  }

  static String files({
    required String bucketId,
  }) {
    return 'buckets.$bucketId.files';
  }

  static String file({
    required String bucketId,
    required String fileId,
  }) {
    return 'buckets.$bucketId.files.$fileId';
  }
}
