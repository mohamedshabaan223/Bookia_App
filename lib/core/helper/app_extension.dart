import 'package:flutter/material.dart';

extension Navigation on BuildContext {
   pushNamed(String routeName){
   return  Navigator.pushNamed(this, routeName);
  }
   pushAndRemoveUntil(String routeName , bool predicate){
   return  Navigator.pushNamedAndRemoveUntil(this, routeName ,(p) => predicate );
  }
  pop() => Navigator.pop(this);
}