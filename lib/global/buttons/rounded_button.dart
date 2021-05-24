import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double width;
  final double height;

  final Color color;

  const RoundedButton(
      {Key key,
      @required this.title,
      this.onPressed,
      this.color,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal *
            (this.width != null ? this.width : 75),
        height: SizeConfig.blockSizeVertical *
            (this.height != null ? this.height : 7),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: this.color == null
                  ? Color.fromARGB(255, 130, 46, 129)
                  : this.color,
              shadowColor: Color.fromARGB(255, 130, 46, 129),
            ),
            onPressed: this.onPressed,
            child: Text(
              this.title,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
