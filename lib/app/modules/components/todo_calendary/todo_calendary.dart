import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

import '../todo_date_picker/todo_date_picker.dart';

class TodoCalendary extends StatefulWidget {
  const TodoCalendary({
    Key? key,
    this.padding,
    this.margin,
    this.status = TodoCalendaryStatus.standard,
    this.weatherStatus,
    this.temperature,
    this.month = "",
    this.timerNow = "",
    this.location = "",
    this.srcImage,
    this.isMinBoard = false
  }) : super(key: key);

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TodoCalendaryStatus? status;
  final TodoWeatherStatus? weatherStatus;
  final int? temperature;
  final String? month;
  final String? timerNow;
  final String? location;
  final String? srcImage;
  final bool? isMinBoard;

  @override
  State<TodoCalendary> createState() => _TodoCalendaryState();
}

class _TodoCalendaryState extends State<TodoCalendary> {
  final TodoDatePickerController _controller = TodoDatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border:
              Border.all(color: Modular.get<ITodoTheme>().shadesOfDark[200]!)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(19),
                topRight: Radius.circular(19),
              ),
              color: Modular.get<ITodoTheme>().primaryColorLighter,
            ),
            child: TodoDatePicker(
              DateTime.now().subtract(
                const Duration(days: 2),
              ),
              width: 70,
              controller: _controller,
              initialSelectedDate: DateTime.now(),
              selectionColor: Modular.get<ITodoTheme>()
                  .shadesOfLight[200]!
                  .withOpacity(0.3),
              selectedTextColor: Colors.white,
              dayTextStyle: Modular.get<ITodoTheme>().dayLabel,
              monthTextStyle: Modular.get<ITodoTheme>().monthLabel,
              dateTextStyle: Modular.get<ITodoTheme>().numberDayLabel,
              onDateChange: (date) {
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (widget.isMinBoard ?? false) ? [
                Text(
                  '${widget.timerNow}',
                  style: Modular.get<ITodoTheme>().timerNow,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.temperature}',
                      style: Modular.get<ITodoTheme>().tempature.copyWith(fontSize: 26),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        '° C',
                        style: Modular.get<ITodoTheme>().grade.copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Icon(
                        actionIcon(),
                        size: 15,
                        color: Modular.get<ITodoTheme>()
                            .primaryColorMain,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${widget.location}",
                      style: Modular.get<ITodoTheme>().location,
                    ),
                    Icon(
                      LineAwesomeIcons.map_marker,
                      color: Modular.get<ITodoTheme>().primaryColorMain,
                    ),
                  ],
                ),
              ] : [
                Container(
                  child: widget.status == TodoCalendaryStatus.loading
                      ? const TodoShimmer(
                          child: SizedBox(
                            height: 50,
                            width: 30,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.temperature}',
                                  style: Modular.get<ITodoTheme>().tempature,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Text(
                                    '°C',
                                    style: Modular.get<ITodoTheme>().grade,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Icon(
                                    actionIcon(),
                                    size: 15,
                                    color: Modular.get<ITodoTheme>()
                                        .primaryColorMain,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${widget.month}',
                              style: Modular.get<ITodoTheme>().month,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${widget.timerNow}',
                              style: Modular.get<ITodoTheme>().timerNow,
                            ),
                          ],
                        ),
                ),
                const SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: widget.srcImage != null ? Image.network(
                          "${widget.srcImage}",
                          fit: BoxFit.contain,
                        ) : const TodoShimmer(),
                      )
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.map_marker,
                          color: Modular.get<ITodoTheme>().primaryColorMain,
                        ),
                        Text(
                          "${widget.location}",
                          style: Modular.get<ITodoTheme>().location,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData actionIcon() {
    switch (widget.weatherStatus) {
      case TodoWeatherStatus.cloudSun:
        return LineAwesomeIcons.cloud_with_sun;
      case TodoWeatherStatus.cloud:
        return LineAwesomeIcons.cloud;
      case TodoWeatherStatus.rain:
        return LineAwesomeIcons.cloud_with_rain;
      case TodoWeatherStatus.storm:
        return LineAwesomeIcons.poo_storm;
      default:
        return LineAwesomeIcons.sun;
    }
  }
}

enum TodoCalendaryStatus { standard, loading }

enum TodoWeatherStatus { sun, cloud, cloudSun, rain, storm }
