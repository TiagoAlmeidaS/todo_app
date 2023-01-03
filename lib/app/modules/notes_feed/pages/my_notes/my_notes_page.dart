import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_card_note/todo_card_note.dart';
import 'package:todo_app/app/modules/components/todo_circle_button/todo_circle_button.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({Key? key}) : super(key: key);

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History Note",
                    style: Modular.get<ITodoTheme>().headerLabel,
                  ),
                  TodoCircleButton(
                    icon: LineAwesomeIcons.search,
                    margin: EdgeInsets.zero,
                    onTap: () => {},
                  )
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              CarouselSlider(
                items: [
                  Column(
                    children: const [
                      TodoCardNote(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        titleCard: "Exemplo 1",
                        descriptionCard: "Testando dois parâmetros aqui.",
                      ),
                      TodoCardNote(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        titleCard: "Exemplo 1",
                        descriptionCard: "Testando dois parâmetros aqui.",
                      ),
                    ],
                  )
                ],
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
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
