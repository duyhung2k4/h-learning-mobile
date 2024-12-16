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

  static Future<dynamic> getDetailCourse(int id) async {
    dynamic result = await BaseQuery.query(
      BaseQueryPayload(
        endpoint: CourseEndpoint.getDetailCourse(),
        data: {},
        queryParam: {
          "id": id,
        },
      ),
    );

    dynamic course = result["data"];
    return course;
  }
}
