class DatabaseException implements Exception {}

class DatabaseAlreadyOpenException implements DatabaseException {}

class DatabaseIsClosedException implements DatabaseException {}

// C

class UnableToCreatePhotoSetException extends DatabaseException {}

class UnableToCreatePhotoException extends DatabaseException {}

// R
class UnableToGetPhotoSetException extends DatabaseException {}

class UnableToGetPhotoException extends DatabaseException {}

// U
class UnableToUpdatePhotoException extends DatabaseException {}

class UnableToUpdatePhotoWordExcpetion extends DatabaseException {}

// D
class UnableToDeletePhotoSetException extends DatabaseException {}

class UnableToDeletePhotoException extends DatabaseException {}

class UnableToDeletePhotoWordException extends DatabaseException {}
