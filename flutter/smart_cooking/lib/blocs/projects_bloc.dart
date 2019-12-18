import 'dart:async';

import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/models/availableresources_model.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/models/user_donation_history_model.dart';
import 'package:flutter/material.dart';

class ProjectBloc {
  List<ProjectModel> _projectModels = [];
  List<ProjectModel> projectModels = [
    ProjectModel(
        id: 1,
        title: "LECZO NA ZIMNO",
        description: "Potrzebne:\n"
            " - kiełbasa 300g\n"
            " - kalmary 300g\n"
            " - pomidory 400g\n"
            " - cebula 2 szt.\n"
            " - czosnek 1 ząbek\n"
            " - przyprawy\n"
            " - Fix leczo Knorr 1 opakowanie\n\n"
            "Posiadasz:                     Do Kupiena:\n"
            " - kiełbasa                      - czosnek\n"
            " - kalmary                       - Fix leczo Knorr\n"
            " - pomidory\n"
            " - cebula\n"
            " - pieprz\n"
            " - oliwa\n"
            " - sól\n\n"
            "Krok 1\n"
            "   Kiełbasę obierz ze skórki i pokrój w talarki.\n"
            "   Kalmary pokrój w pierścienie.\n"
            "Krok 2\n"
            "   Pomidory pokrój w kostkę, a cebulę w piórka.\n"
            "   Rozgnieć czosnek. Gałązki tymianku oskub\n"
            "   z listków.\n"
            "Krok 3\n"
            "   Na rozgrzanej oliwie przesmaż pokrojoną\n"
            "   kiełbasę, dodaj cebulę, rozgnieciony czosnek\n"
            "   oraz kalmary. Smaż chwilę. Następnie wsyp\n"
            "   zawartość opakowania Knorr i dodaj pomidory\n"
            "   wraz z zalewą. Wymieszaj.\n"
            "Krok 4\n"
            "   Całość doprowadź do wrzenia, zmniejsz ogień.\n"
            "   Dodaj listki tymianku i duś na małym ogniu\n"
            "   5-8 minut. Dopraw do smaku pieprzem \n"
            "   oraz solą, jeśli zachodzi taka potrzeba.\n"
            "   Podawaj z pieczywem.\n",
        amountDouble: 80,
        budgetDouble: 100,
        photo: 'assets/images/leczo.jpg'),
    ProjectModel(
        id: 2,
        title: "RISOTTO Z KURKAMI",
        description: "Leczo na ciepło to leczo na ciepło",
        amountDouble: 70,
        budgetDouble: 100),
    ProjectModel(
        id: 3,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 20,
        budgetDouble: 100),
    ProjectModel(
        id: 4,
        title: "KOTLETY MIELONE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 20,
        budgetDouble: 100),
    ProjectModel(
        id: 5,
        title: "SPHAGETTI CARBONARA",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 10,
        budgetDouble: 100),
    ProjectModel(
        id: 6,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 30,
        budgetDouble: 100),
    ProjectModel(
        id: 7,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 90,
        budgetDouble: 100),
    ProjectModel(
        id: 8,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 40,
        budgetDouble: 100),
    ProjectModel(
        id: 9,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 50,
        budgetDouble: 100),
    ProjectModel(
        id: 10,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 20,
        budgetDouble: 100),
    ProjectModel(
        id: 11,
        title: "SPHAGETTI BOlOŃSKIE",
        description: "Spaghetti bolońskie to spaghetti bolońskie",
        amountDouble: 20,
        budgetDouble: 100),


  ];
  bool done = false;
  List<ProjectModel> donations = [];
  bool canDonate = true;
  bool _cooldown = true;
  bool donationStop = false;

  // ignore: close_sinks
  StreamController<List<ProjectModel>> _projectsStreamController =
      StreamController();

  // ignore: close_sinks
  StreamController<bool> _doneStreamController = StreamController.broadcast();

  Stream<List<ProjectModel>> get projectsStream =>
      _projectsStreamController.stream;

  // ignore: close_sinks
  StreamController<List<ProjectModel>> _donationsHisotryController =
      StreamController();

  Stream<List<ProjectModel>> get donationsHistoryList =>
      _donationsHisotryController.stream;

  Stream<bool> get doneStream =>
      _doneStreamController.stream.asBroadcastStream();

  Future<List<ProjectModel>> getProjectModels() async {
    try{
//    if (_nextPageToken != null) {
//      response = await AppuniteHttpClient()
//          .get('/api/v1/projects?limit=10&next_page_token=$_nextPageToken');
//    } else {
//      response = await AppuniteHttpClient().get('/api/v1/projects?limit=10');
    List<ProjectModel> response;
     return response = [
        ProjectModel(
          id: 1,
          title: "LECZO NA ZIMNO",
          description:
                "Potrzebne:\n"
                " - kiełbasa 300g\n"
                " - kalmary 300g\n"
                " - pomidory 400g\n"
                " - cebula 2 szt.\n"
                " - czosnek 1 ząbek\n"
                " - przyprawy\n"
                " - Fix leczo Knorr 1 opakowanie\n\n"
                "Posiadasz:                     Do Kupiena:\n"
                " - kiełbasa                      - czosnek\n"
                " - kalmary                       - Fix leczo Knorr\n"
                " - pomidory\n"
                " - cebula\n"
                " - pieprz\n"
                " - oliwa\n"
                " - sól\n\n"
                "Krok 1\n"
                "   Kiełbasę obierz ze skórki i pokrój w talarki.\n"
                "   Kalmary pokrój w pierścienie.\n"
                "Krok 2\n"
                "   Pomidory pokrój w kostkę, a cebulę w piórka.\n"
                "   Rozgnieć czosnek. Gałązki tymianku oskub\n"
                "   z listków.\n"
                "Krok 3\n"
                "   Na rozgrzanej oliwie przesmaż pokrojoną\n"
                "   kiełbasę, dodaj cebulę, rozgnieciony czosnek\n"
                "   oraz kalmary. Smaż chwilę. Następnie wsyp\n"
                "   zawartość opakowania Knorr i dodaj pomidory\n"
                "   wraz z zalewą. Wymieszaj.\n"
                "Krok 4\n"
                "   Całość doprowadź do wrzenia, zmniejsz ogień.\n"
                "   Dodaj listki tymianku i duś na małym ogniu\n"
                "   5-8 minut. Dopraw do smaku pieprzem \n"
                "   oraz solą, jeśli zachodzi taka potrzeba.\n"
                "   Podawaj z pieczywem.\n"
            ,
          amountDouble: 80,
          budgetDouble: 100,
          photo: 'assets/images/leczo.jpg'),
        ProjectModel(
            id: 2,
            title: "RISOTTO Z KURKAMI",
            description: "Leczo na ciepło to leczo na ciepło",
            amountDouble: 69,
            budgetDouble: 100),
        ProjectModel(
            id: 3,
            title: "SPHAGETTI BOlOŃSKIE",
            description: "Spaghetti bolońskie to spaghetti bolońskie",
            amountDouble: 20,
            budgetDouble: 100),
       ProjectModel(
           id: 4,
           title: "KOTLETY MIELONE",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 20,
           budgetDouble: 100),
       ProjectModel(
           id: 5,
           title: "SPHAGETTI CARBONARA",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 10,
           budgetDouble: 100),
       ProjectModel(
           id: 6,
           title: "GOŁĄBKI",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 30,
           budgetDouble: 100),
       ProjectModel(
           id: 7,
           title: "PIECZEŃ",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 90,
           budgetDouble: 100),
       ProjectModel(
           id: 8,
           title: "PIECZONA KACZKA",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 40,
           budgetDouble: 100),
       ProjectModel(
           id: 9,
           title: "INDYK",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 50,
           budgetDouble: 100),
       ProjectModel(
           id: 10,
           title: "SHORMA",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 40,
           budgetDouble: 100),
       ProjectModel(
           id: 11,
           title: "HOT DOGI",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 45,
           budgetDouble: 100),
       ProjectModel(
           id: 12,
           title: "BIGOS",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 87,
           budgetDouble: 100),
       ProjectModel(
           id: 13,
           title: "GULASZ",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 50,
           budgetDouble: 100),
       ProjectModel(
           id: 14,
           title: "ROSÓŁ",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 20,
           budgetDouble: 100),
       ProjectModel(
           id: 15,
           title: "SOS PIECZARKOWY",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 30,
           budgetDouble: 100),
       ProjectModel(
           id: 16,
           title: "HOT DOGI",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 45,
           budgetDouble: 100),
       ProjectModel(
           id: 17,
           title: "BIGOS",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 87,
           budgetDouble: 100),
       ProjectModel(
           id: 18,
           title: "GULASZ",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 50,
           budgetDouble: 100),
       ProjectModel(
           id: 19,
           title: "ROSÓŁ",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 20,
           budgetDouble: 100),
       ProjectModel(
           id: 20,
           title: "SOS PIECZARKOWY",
           description: "Spaghetti bolońskie to spaghetti bolońskie",
           amountDouble: 30,
           budgetDouble: 100)


      ];
    }catch(error){throw error;}
  }

  Future<bool> getUserResources() async {
    try {
      final response = await AppuniteHttpClient()
          .get('/api/v1/donations/available_resources');
      if (response.statusCode == 200) {
        return AvailableResourcesModel.fromJson(response.data).canDonate;
      }
      return false;
    } catch (error) {
      throw error;
    }
  }

  Future<List<ProjectModel>> _getUserDonations() async {
    final response =
        await AppuniteHttpClient().get('/api/v1/donations/history');
    if (response.statusCode == 200) {
      return UserDonationHistoryModel.fromJson(response.data).models;
    } else {
      throw Exception("Error");
    }
  }
final BuildContext context;

  ProjectBloc(this.context) {
    _doneStreamController.sink.add(true);
    _donationsHisotryController.sink.add([]);
    generateMore();
  }


  refreshDonations(List<ProjectModel> models) {
    _getUserDonations().then((items) {
      donations = items;
      _donationsHisotryController.sink.add(items);
      for (int i = 0; i < models.length; i++) {
        if (donations.contains(models[i])) {
          models[i].paid = true;
        }
      }
      _projectsStreamController.sink.add(models);
    });
  }

  generateMore() {
      getProjectModels().then(
        (items) {
          for (ProjectModel _model in items) {
            if (_projectModels.contains(_model)) {
              done = true;
              _doneStreamController.sink.add(done);
              break;
            } else {
              _projectModels.add(_model);
            }
          }
          if (!done) {
            _doneStreamController.sink.add(true);
            _projectsStreamController.sink.add(_projectModels);
            refreshDonations(_projectModels);
          }
        },
      ).catchError((_) {
        WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
      });
  }

}
