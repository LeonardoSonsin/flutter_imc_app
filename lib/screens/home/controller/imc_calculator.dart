double? calculateIMC(String weigth, String heigth)
{
  if (valueValidator(weigth) && valueValidator(heigth))
  {
    double imc = double.parse(weigth) / (double.parse(heigth) * double.parse(heigth));
    return imc;
  }
  else
  {
    return 0;
  }
}

bool valueValidator(String? value)
{
  if (value == '0' ||value == null || value.isEmpty)
  {
    return false;
  }
  return true;
}
