import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_calendary/todo_calendary.dart';
import 'package:todo_app/app/modules/components/todo_card_note/todo_card_note.dart';
import 'package:todo_app/app/modules/components/todo_header_page/todo_header_page.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_controller.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';

class NotesFeedPage extends StatefulWidget {
  const NotesFeedPage({Key? key}) : super(key: key);

  @override
  State<NotesFeedPage> createState() => _NotesFeedPageState();
}

class _NotesFeedPageState extends State<NotesFeedPage> {
  CarouselController buttonCarouselController = CarouselController();
  var controller = Modular.get<NotesFeedController>();

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
                    const SizedBox(height: 10,),
                    const TodoCalendary(
                      padding: EdgeInsets.zero,
                      temperature: 24,
                      month: 'Janeiro',
                      timerNow: '5:00 PM',
                      location: "Sapé - Paraíba",
                      srcImage: "https://sape.pb.gov.br/wp-content/uploads/2022/11/Sape.jpeg",
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
        const SizedBox(
          height: 24,
        ),
        TodoHeaderPage(
          label: "History notes",
          icon: LineAwesomeIcons.edit,
          padding: EdgeInsets.zero,
          status: TodoHeaderPageStatus.standard,
          actionIcon: () => Modular.to.pushNamed(
            NotesFeedRouters.note.fullRoute,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ...?controller.myNotesModel.myNotes?.map(
          (note) => TodoCardNote(
            margin: const EdgeInsets.symmetric(vertical: 5),
            titleCard: note.title,
            descriptionCard: note.description,
            onTapCard: () {
              Modular.to.pushNamed(
                NotesFeedRouters.note.fullRoute,
                arguments:  note
              );
            },
          ),
        ),
      ],
    );
  }

  Widget contentLoading(context) {
    return Column(
      children: [
        const SizedBox(
          height: 27,
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
