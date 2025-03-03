abstract class Failures {
  final String message;
  Failures(this.message);
}

class ServerFailures extends Failures {
  ServerFailures(super.message);
}
class NetworkFailures extends Failures {
  NetworkFailures(super.message);
}
class CacheFailures extends Failures{
  CacheFailures(super.message);
}
class InvalidInputFailures extends Failures {
  InvalidInputFailures(super.message);
}