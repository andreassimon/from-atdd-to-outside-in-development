# language: de
# encoding: utf-8

Funktionalität: Pizzen

  Szenariogrundriss: Pizza-Preise
    Wenn ich eine "<Größe>" "<Sorte>" mit "<Extras>" bestelle
    Dann kostet die Pizza "<Preis>"


  Beispiele:
    |  Größe     |  Sorte      |  Extras                         |  Preis  |
    |  kleine    |  Salami     |  Ohne Extras                    |   4,50  |
    |  kleine    |  Calzone    |  Ohne Extras                    |   5,00  |
    |  kleine    |  Salami     |  Extra Käse                     |   5,00  |
    |  kleine    |  Salami     |  Extra Knoblauch                |   4,50  |
    |  kleine    |  Thunfisch  |  Extra Knoblauch                |   4,50  |
    |  mittlere  |  Salami     |  Extra Käse, Extra Knoblauch    |   6,00  |
    |  große     |  Calzone    |  Extra Salami, Extra Thunfisch  |  12,00  |
    |  Familien  |  Calzone    |  ohne Käse                      |  17,00  |
