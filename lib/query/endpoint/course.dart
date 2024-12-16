import 'package:h_learning_mobile/constant/method.dart';
import 'package:h_learning_mobile/query/baseQuery.dart';

class CourseEndpoint {
  static EndpointConfig getAllCourse() {
    return EndpointConfig(
      url: "api/v1/public/course/all",
      method: Method.get,
      header: {},
    );
  }

  static EndpointConfig getDetailCourse() {
    return EndpointConfig(
      url: "api/v1/public/course/detail",
      method: Method.get,
      header: {},
    );
  }
}
