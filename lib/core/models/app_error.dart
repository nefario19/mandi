// lib/core/models/app_error.dart

enum ErrorType {
  // Network
  network,
  timeout,

  // Auth
  sessionExpired,
  unauthorized,
  invalidCredentials,

  // Storage
  fileNotFound,
  fileTooLarge,
  invalidFileType,

  // Server
  serverError,
  rateLimitExceeded,

  // Data
  notFound,
  validation,

  // Unknown
  unknown,
}

class AppError implements Exception {
  final ErrorType type;
  final String message; // User-friendly message
  final String? technicalDetails; // For developer logs
  final int? statusCode; // HTTP status code
  final DateTime timestamp;
  final StackTrace? stackTrace; // ← YOU REQUESTED!
  final String? userId; // ← YOU REQUESTED! (for logging)

  AppError({
    required this.type,
    required this.message,
    this.technicalDetails,
    this.statusCode,
    this.stackTrace,
    this.userId,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    return 'AppError($type): $message'
        '${technicalDetails != null ? '\nDetails: $technicalDetails' : ''}'
        '${userId != null ? '\nUser: $userId' : ''}';
  }

  // Factory constructors

  // Network
  factory AppError.network({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.network,
      message: 'No internet connection',
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

  factory AppError.timeout({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.timeout,
      message: 'Request timed out',
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

  // Auth
  factory AppError.sessionExpired({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.sessionExpired,
      message: 'Your session has expired. Please login again.',
      statusCode: 401,
      stackTrace: stackTrace,
    );
  }

  factory AppError.unauthorized({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.unauthorized,
      message: 'You don\'t have permission to access this.',
      technicalDetails: details,
      statusCode: 403,
      stackTrace: stackTrace,
    );
  }

  factory AppError.invalidCredentials({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.invalidCredentials,
      message: 'Invalid email or password.',
      statusCode: 401,
      stackTrace: stackTrace,
    );
  }

  // Storage
  factory AppError.fileNotFound({String? fileName, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.fileNotFound,
      message: 'File not found',
      technicalDetails: fileName,
      statusCode: 404,
      stackTrace: stackTrace,
    );
  }

  factory AppError.fileTooLarge({int? maxSize, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.fileTooLarge,
      message: 'File is too large',
      technicalDetails: maxSize != null ? 'Max size: $maxSize bytes' : null,
      statusCode: 400,
      stackTrace: stackTrace,
    );
  }

  factory AppError.invalidFileType({String? expectedType, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.invalidFileType,
      message: 'Invalid file type',
      technicalDetails: expectedType,
      statusCode: 400,
      stackTrace: stackTrace,
    );
  }

  // Server
  factory AppError.serverError({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.serverError,
      message: 'Something went wrong. Please try again later.',
      technicalDetails: details,
      statusCode: 500,
      stackTrace: stackTrace,
    );
  }

  factory AppError.rateLimitExceeded({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.rateLimitExceeded,
      message: 'Too many requests. Please slow down.',
      statusCode: 429,
      stackTrace: stackTrace,
    );
  }

  // Data
  factory AppError.notFound({String? resource, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.notFound,
      message: 'Resource not found',
      technicalDetails: resource,
      statusCode: 404,
      stackTrace: stackTrace,
    );
  }

  factory AppError.validation({
    required String field,
    required String reason,
    StackTrace? stackTrace,
  }) {
    return AppError(
      type: ErrorType.validation,
      message: 'Invalid $field: $reason',
      technicalDetails: 'Field: $field, Reason: $reason',
      stackTrace: stackTrace,
    );
  }

  // Unknown
  factory AppError.unknown({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.unknown,
      message: 'An unexpected error occurred.',
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }
}
