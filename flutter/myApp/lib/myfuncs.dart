bool Is_letter(str){
  return RegExp(r"^[a-zA-Z]+$").hasMatch(str) ? true : false;
}

bool Is_numeric(str){
  return RegExp(r"^[0-9]+$").hasMatch(str) ? true : false;
}