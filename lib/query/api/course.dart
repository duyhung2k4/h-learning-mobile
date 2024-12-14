import 'package:h_learning_mobile/query/baseQuery.dart';
import 'package:h_learning_mobile/query/endpoint/course.dart';

class CourseApi {
  static Future<dynamic> getAllCourse() async {
    dynamic result = await BaseQuery.query(
      BaseQueryPayload(
        endpoint: CourseEndpoint.getAllCourse(),
        data: {},
        queryParam: {},
      ),
    );

    List courses = result["data"];
    return courses;
  }
}
