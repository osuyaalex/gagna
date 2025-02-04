import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberSelected;

  NumberPad({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        itemCount: 12, // 10 digits + backspace + blank
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          if (index == 9) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                elevation: 0,
                backgroundColor: Colors.grey.shade100
              ),
              onPressed: () => onNumberSelected('face scan'),
              child: SvgPicture.asset('assets/iconoir_face-id.svg')
            ); // Empty cell
          } else if (index == 10) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  elevation: 0,
                  backgroundColor: Colors.grey.shade100
              ),
              onPressed: () => onNumberSelected('0'),
              child: Text('0',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            );
          } else if (index == 11) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  elevation: 0,
                  backgroundColor: Colors.grey.shade100
              ),
              onPressed: () => onNumberSelected('backspace'),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.red,),
              ),
            );
          } else {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  elevation: 0,
                  backgroundColor: Colors.grey.shade100
              ),
              onPressed: () => onNumberSelected((index + 1).toString()),
              child: Text((index + 1).toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            );
          }
        }, staggeredTileBuilder:  (context) => const StaggeredTile.fit(1)
      ),
    );
  }
}
