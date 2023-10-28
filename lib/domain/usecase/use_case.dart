import 'package:marvel/domain/result.dart';

abstract class UseCase<I, O> {
  Future<Result<O>> invoke(I parameter) async {
    try {
      return Result.completed(execute(parameter));
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  O execute(I parameters);
}
