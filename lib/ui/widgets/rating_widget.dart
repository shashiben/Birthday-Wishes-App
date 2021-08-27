import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    Key? key,
    required this.onChanged,
    required this.value,
    this.itemCount = 5,
    this.spacing = 0.0,
    this.defaultIcon,
    this.color,
    this.borderColor,
    this.size = 35,
    this.filledIcon,
    this.halfFilledIcon,
    this.allowHalfRating = true,
    this.showTextForm = false,
    this.suffixIcon,
    this.controller,
    this.inputDecorations,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  }) : super(key: key);

  final int itemCount;
  final Color? color;
  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final Widget? filledIcon;
  final Widget? halfFilledIcon;
  final Widget? defaultIcon;
  final double spacing;
  final double value;
  final RatingChangeCallback onChanged;
  final bool showTextForm;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final InputDecoration? inputDecorations;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double tempValue = 3.0;
  Widget buildRatingBar(BuildContext context, int index) {
    Widget icon;
    if (index >= tempValue) {
      icon = widget.defaultIcon ??
          Icon(
            Icons.star_border,
            color: widget.borderColor ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else if (!widget.showTextForm
        ? index > tempValue - (widget.allowHalfRating ? 0.5 : 1.0) &&
            index < tempValue
        : index + 1 == tempValue + 0.5) {
      icon = widget.halfFilledIcon ??
          Icon(
            Icons.star_half,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    } else {
      icon = widget.filledIcon ??
          Icon(
            Icons.star,
            color: widget.color ?? Theme.of(context).primaryColor,
            size: widget.size,
          );
    }

    return GestureDetector(
      onTap: () {
        widget.onChanged(index + 1.0);
        setState(() {
          tempValue = index + 1.0;
        });
      },
      onHorizontalDragUpdate: (dragDetails) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final _pos = box.globalToLocal(dragDetails.globalPosition);
        final i = _pos.dx / widget.size;
        var newRating = widget.allowHalfRating ? i : i.round().toDouble();
        if (newRating > widget.itemCount) {
          newRating = widget.itemCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        setState(() {
          tempValue = newRating;
        });
        widget.onChanged(newRating);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) => widget.showTextForm
      ? Column(children: <Widget>[
          Container(
            margin: widget.margin,
            padding: widget.padding,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: widget.inputDecorations ??
                  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating',
                    suffixIcon: widget.suffixIcon,
                  ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: widget.spacing,
              children: List.generate(
                widget.itemCount,
                (index) => buildRatingBar(context, index),
              ),
            ),
          )
        ])
      : Material(
          color: Colors.transparent,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: widget.spacing,
            children: List.generate(
              widget.itemCount,
              (index) => buildRatingBar(context, index),
            ),
          ),
        );
}
