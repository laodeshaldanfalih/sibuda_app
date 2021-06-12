import 'package:common/config/_config.dart';
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:common/ui/widget/items_kehamilanku.dart';
import 'package:common/ui/widget/bloc/bloc_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/kehamilanku_home_event.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:sibunda_app/bloc/state/kehamilanku_home_state.dart';



class KehamilankuHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PregnancyHomeBloc>(context);
    bloc.add(GetPregnancyAgeOverview());
    bloc.add(GetTrimester());
    bloc.add(GetFoodRecom(1));

    //final foodList = ["Nasi", "Sego", "Nasi atau Makanan Pokok", "Bubur sego"];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<PregnancyHomeBloc, PregnancyHomeState>(
          builder: (ctx, state) => CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                    child: (state is OnPregnancyHomeAgeOverviewDataChanged)
                        ? ItemMotherOverview.fromData(state.data)
                        : (bloc.ageOverview != null)
                          ? ItemMotherOverview.fromData(bloc.ageOverview!)
                          : DefaultLoading(),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Yuk pantau usia kehamilan Bunda",
                      style: SibTextStyles.size_0_bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ]),
              ),

              (state is OnPregnancyHomeTrimesterDataChanged)
                  ? _MotherTrimesterList(state.data)
                  : (bloc.trimesterList != null)
                    ? _MotherTrimesterList(bloc.trimesterList!)
                    : SliverToBoxAdapter(child: DefaultLoading(),),

              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ItemMotherImunization(
                      image: Container(color: Manifest.theme.colorPrimary,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Pantau perkembangan janin & kehamilan",
                      style: SibTextStyles.size_0_bold,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  ///*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 10,
                        child: ItemMotherGraphMenu(
                          image: Container(color: Manifest.theme.colorPrimary,),
                          text: "Grafik Evaluasi Kehamilan",
                        ),
                      ),
                      Spacer(flex: 1,),
                      Flexible(
                        flex: 10,
                        child: ItemMotherGraphMenu(
                          image: Container(color: Manifest.theme.colorPrimary,),
                          text: "Grafik Berat Badan",
                        ),
                      ),
                    ],
                  ),
// */
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Rekomendasi makanan untuk Bunda",
                      style: SibTextStyles.size_0_bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
/*
                  BlocPreAsyncBuilder<
                      PregnancyHomeBloc, PregnancyHomeState,
                      OnPregnancyHomeFoodRecomDataChanged, List<MotherFoodRecom>
                  >(
                    stateDataGetter: (state) => state.data,
                    blocDataGetter: (bloc) => bloc.foodRecomList,
                    builder: (data) => _MotherFoodRecomList(data),
                  ),
 */
                ]),
              ),
              (state is OnPregnancyHomeFoodRecomDataChanged)
                  ? _MotherFoodRecomList(state.data)
                  : (bloc.foodRecomList != null)
                    ? _MotherFoodRecomList(bloc.foodRecomList!)
                    : SliverToBoxAdapter(child: DefaultLoading(),),
            ],
          ),
        ),
      ),
    );
  }
}


class _MotherTrimesterList extends StatelessWidget {
  final List<MotherTrimester> dataList;

  _MotherTrimesterList(this.dataList);
  //_MotherTrimesterList.def(): dataList = dummyTrimesterList;

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
          (c, i) {
        final data = dataList[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ItemMotherTrimester(
            image: Container(color: Manifest.theme.colorPrimary,),
            trimester: data.trimester,
            pregnancyAgeStart: data.startWeek,
            pregnancyAgeEnd: data.endWeek,
            onClick: ,
          ),
        );
      },
      childCount: dataList.length,
    ),
  );
}

class _MotherFoodRecomList extends StatelessWidget {
  final List<MotherFoodRecom> dataList;

  _MotherFoodRecomList(this.dataList);
  //_MotherFoodRecomList.def(): dataList = dummyFoodRecomList(1);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
        (c, i) {
          final data = dataList[i];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ItemMotherRecomFood(
              image: Container(color: Manifest.theme.colorPrimary,),
              foodName: data.food,
              desc: data.desc,
            ),
          );
        },
      childCount: dataList.length,
    ),
  );
}