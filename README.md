# 5024127 MADL

Ten weekly Flutter practicals applied to a simple student campus app topic. Each week is a small, separately runnable example focused on that week's task, using sample data.

| Week | Application topic | Weekly task |
| --- | --- | --- |
| 01 | Student Portal | Flutter setup and welcome screen |
| 02 | Student Portal welcome | Hello World |
| 03 | Student ID Card | Common widgets and updating a name |
| 04 | Student Registration | Form, validation and confirmation |
| 05 | Student Profile | Layout of student details |
| 06 | Student Attendance | Icon, image and attendance chart |
| 07 | Course Enrollment | Two screens, navigation and tap gesture |
| 08 | Student Notes | Save and load a text file |
| 09 | Student Register | Write/read a Firebase student record |
| 10 | Verify Student Registration | Check and run the Week04 app |

Run `flutter pub get`, then use the command in a week's README, for example `flutter run -t Week04_form/main.dart`. All commands run from this repository root; examples share the Flutter project and dependencies. Week09 needs your own Firebase configuration and database rules; live database access is untested. Week08 requires a native platform such as Android.

Basic checks: `flutter analyze` and `flutter test`. Widget tests cover screen rendering, registration, course enrollment and the Firebase configuration message. Device file storage and live Firebase access have not been verified. No APK builds, exam content or mini-projects are included.
