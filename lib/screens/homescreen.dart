import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Activity {
  final String dayOfWeek;
  final String activityName;

  Activity({required this.dayOfWeek, required this.activityName});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  List<Activity> activities = [
    Activity(
        dayOfWeek: 'Poniedziałek', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Poniedziałek', activityName: '11:00 - Hipopotamy'),
    Activity(
        dayOfWeek: 'Poniedziałek', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Poniedziałek', activityName: '12:30 - Manaty'),
    Activity(dayOfWeek: 'Poniedziałek', activityName: '13:00 - Kotiki'),
    Activity(
        dayOfWeek: 'Poniedziałek', activityName: '13:30 - Pelikany Różowe'),
    Activity(dayOfWeek: 'Poniedziałek', activityName: '15:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Wtorek', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Wtorek', activityName: '09:30 - Flamingi'),
    Activity(dayOfWeek: 'Wtorek', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Wtorek', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Wtorek', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Wtorek', activityName: '14:30 - Wielbłądy'),
    Activity(dayOfWeek: 'Wtorek', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Środa', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Środa', activityName: '10:30 - Lamparty'),
    Activity(dayOfWeek: 'Środa', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Środa', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Środa', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Środa', activityName: '14:00 - Słonie'),
    Activity(dayOfWeek: 'Środa', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Czwartek', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Czwartek', activityName: '10:00 - Tygrysy'),
    Activity(dayOfWeek: 'Czwartek', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Czwartek', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Czwartek', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Czwartek', activityName: '14:30 - Zebry'),
    Activity(dayOfWeek: 'Czwartek', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Piątek', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Piątek', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Piątek', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Piątek', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Piątek', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Piątek', activityName: '11:30 - Nosorożce'),
    Activity(dayOfWeek: 'Piątek', activityName: '14:00 - Orangutany'),
    Activity(dayOfWeek: 'Sobota', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Sobota', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Sobota', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Sobota', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Sobota', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Sobota', activityName: '10:30 - Krokodyle'),
    Activity(dayOfWeek: 'Sobota', activityName: '14:30 - Węże'),
    Activity(dayOfWeek: 'Niedziela', activityName: '09:15 - Żyrafy Siatkowane'),
    Activity(dayOfWeek: 'Niedziela', activityName: '11:00 - Hipopotamy'),
    Activity(dayOfWeek: 'Niedziela', activityName: '12:00 - Pawiany Masajskie'),
    Activity(dayOfWeek: 'Niedziela', activityName: '15:00 - Kotiki'),
    Activity(dayOfWeek: 'Niedziela', activityName: '13:00 - Lemury Katta'),
    Activity(dayOfWeek: 'Niedziela', activityName: '10:00 - Sowy'),
    Activity(dayOfWeek: 'Niedziela', activityName: '14:00 - Panda'),
  ];

  @override
  void initState() {
    super.initState();
  }

  String _getDayOfWeek(int dayIndex) {
    switch (dayIndex) {
      case 1:
        return 'Poniedziałek';
      case 2:
        return 'Wtorek';
      case 3:
        return 'Środa';
      case 4:
        return 'Czwartek';
      case 5:
        return 'Piątek';
      case 6:
        return 'Sobota';
      case 7:
        return 'Niedziela';
      default:
        return '';
    }
  }

  void showFullActivityList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pełny harmonogram'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 7, // Liczba dni tygodnia
              itemBuilder: (context, dayIndex) {
                final dayOfWeek = _getDayOfWeek(dayIndex + 1);
                final dayActivities = activities
                    .where((activity) => activity.dayOfWeek == dayOfWeek)
                    .toList();

                if (dayActivities.isEmpty) {
                  return SizedBox.shrink(); // Pomijanie pustych dni
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayOfWeek,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dayActivities.length,
                      itemBuilder: (context, index) {
                        final activity = dayActivities[index];
                        return ListTile(
                          title: Text(activity.activityName),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Zamknij'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDayOfWeek = DateTime.now().weekday;
    final filteredActivities = activities
        .where(
            (activity) => activity.dayOfWeek == _getDayOfWeek(currentDayOfWeek))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ZOO Wrocław'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Container(
                child: Text("Dzisiejszy harmonogram karmień zwierzaków",
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: showFullActivityList,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.grey[200],
                    ),
                    height: 200,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                        itemCount: filteredActivities.length,
                        itemBuilder: (context, index) {
                          final activity = filteredActivities[index];
                          return ListTile(
                            title: Text(activity.activityName),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, top: 15, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Material(
                            elevation: 5,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 170,
                                maxWidth: 170,
                                minHeight: 170,
                                maxHeight: 170,
                              ),
                              child: Image.asset(
                                "lib/assets/images/catSquare.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Add some spacing between image and text
                        Text(
                          'Galeria', // Add your desired text here
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    context.push('/home/animalgallery');
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 25.0, top: 15, left: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 170,
                                maxWidth: 170,
                                minHeight: 170,
                                maxHeight: 170,
                              ),
                              child: Image.asset(
                                "lib/assets/images/catSquare.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Add some spacing between image and text
                        Text(
                          'Twoje zdjęcia', // Add your desired text here
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    context.push('/home/animalgallery');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
