import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/components/custom_suffixIcon.dart';
import 'package:inventory_management/models/team.dart';
import '../../../../constants.dart';

class FormCreateTeam extends StatefulWidget {
  @override
  _FormCreateTeamState createState() => _FormCreateTeamState();
}

class _FormCreateTeamState extends State<FormCreateTeam> {
  String teamName;
  final List<String> errors = [];

  TextEditingController teamNameController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Form(
            child: Column(children: [
              teamNameField(size),
              SizedBox(height: 20.0),
              noteTeamField(size),
            ]),
          ),
        ],
      ),
    );
  }

  TextFormField noteTeamField(Size size) {
    return TextFormField(
      controller: noteController,
      keyboardType: TextInputType.streetAddress,
      maxLines: 5,
      onFieldSubmitted: (String note) {
        setState(() {
          Team.noteTeam = note;
        });
      },
      decoration: InputDecoration(
        labelText: "Note",
        hintText: "Note Team",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: size.height / 38,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kTextColor2),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor2),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField teamNameField(Size size) {
    return TextFormField(
      controller: teamNameController,
      onFieldSubmitted: (String team) {
        setState(() {
          Team.teamName = team;
        });
      },
      onSaved: (newValue) => teamName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Team Name",
        hintText: "Enter your team name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: size.height / 38,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kTextColor2),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor2),
          gapPadding: 10,
        ),
      ),
    );
  }
}
