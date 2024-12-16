import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:h_learning_mobile/components/loading_custom/index.dart';
import 'package:h_learning_mobile/query/api/course.dart';
import 'package:h_learning_mobile/router/index.dart';

class DetailCourse extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ArgsCourseDetailCourse?;
    final courseId = useState<int?>(args?.id);
    final course = useState<dynamic>(null);
    final isLoading = useState<bool>(false);

    useEffect(() {
      if (courseId.value != null) {
        fetchCourse(courseId.value!, course, isLoading);
      }
      return null;
    }, [courseId.value]);

    if (course.value == null && isLoading.value) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF151517),
          body: LoadingCustom(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF151517),
        body: RefreshIndicator(
          onRefresh: () async => {
            await refresh(
              courseId.value ?? 0,
              course,
              isLoading,
            )
          },
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              course.value != null ? Text(course.value["name"]) : Text(""),
              ElevatedButton(
                onPressed: () {
                  rootNavigatorKey.currentState!.pop();
                },
                child: Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> refresh(
    int id,
    ValueNotifier<dynamic> course,
    ValueNotifier<bool> isLoading,
  ) async {
    await fetchCourse(id, course, isLoading);
  }

  Future<void> fetchCourse(
    int id,
    ValueNotifier<dynamic> course,
    ValueNotifier<bool> isLoading,
  ) async {
    isLoading.value = true;
    try {
      dynamic data = await CourseApi.getDetailCourse(id);
      course.value = data;
    } catch (e) {
      print("Error fetching course: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

class ArgsCourseDetailCourse {
  final int id;

  ArgsCourseDetailCourse({required this.id});
}
