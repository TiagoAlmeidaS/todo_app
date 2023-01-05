import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_card_note/todo_card_note.dart';
import 'package:todo_app/app/modules/components/todo_header_page/todo_header_page.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/my_notes_controller.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({Key? key}) : super(key: key);

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();
  var controller = Modular.get<MyNotesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Observer(
            builder: (context) {
              if (controller.myNotesObservable?.status ==
                  FutureStatus.pending) {
                return contentLoading(context);
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: TodoTitlePage(
                        margin: EdgeInsets.zero,
                        firstLabel: "Note",
                        secondLabel: "Feed",
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const TodoHeaderPage(
                      label: "Projects",
                      icon: LineAwesomeIcons.search,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    content()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        CarouselSlider(
          items: controller.myNotesModel.myNotes
              ?.map(
                (myNotes) => TodoCardNote(
                  titleCard: myNotes.title,
                  descriptionCard: myNotes.description,
                ),
              )
              .toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              controller.myNotesModel.myNotes?.asMap().entries.map((entry) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    );
                  }).toList() ??
                  [],
        ),
        const SizedBox(
          height: 24,
        ),
        const TodoHeaderPage(
          label: "History notes",
          icon: LineAwesomeIcons.search,
          padding: EdgeInsets.zero,
        ),
        const SizedBox(height: 20,),
        ...?controller.myNotesModel.myNotes?.map((note) => TodoCardNote(
          margin: const EdgeInsets.symmetric(vertical: 5),
          titleCard: note.title,
          descriptionCard: note.description,
        ))
      ],
    );
  }

  Widget contentLoading(context) {
    return Column(
      children: [
        const SizedBox(
          height: 27,
        ),
        const TodoHeaderPage(
          label: "Projects",
          icon: LineAwesomeIcons.search,
          padding: EdgeInsets.zero,
        ),
        TodoShimmer(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
            width: double.maxFinite,
          ),
        ),
        const SizedBox(
          height: 27,
        ),
        const TodoHeaderPage(
          label: "History Notes",
          icon: LineAwesomeIcons.search,
          padding: EdgeInsets.zero,
        ),
        const TodoCardNote(
          state: TodoCardNoteState.loading,
        ),
        const TodoCardNote(
          state: TodoCardNoteState.loading,
        ),
        const TodoCardNote(
          state: TodoCardNoteState.loading,
        ),
      ],
    );
  }

  Widget caroselLoading() {
    var items = List.filled(2, 0);
    return TodoShimmer(
      child: CarouselSlider(
        items: items
            .asMap()
            .entries
            .map(
              (e) => Container(),
            )
            .toList(),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
      ),
    );
  }
}
