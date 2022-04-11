import 'package:flutter/material.dart';
import 'package:true_or_false/question.dart';

class TestData {
  int _questionIndex = 0;

  bool isTestFinished = false;

  final List<Question> _easyQuestions = [
    Question(questionText: "Yüzölçümü en büyük ülke Çin'dir.", answer: false),
    Question(
        questionText:
            '"Burada herşey çok güzel ilerliyor." Cümlesinde yazım yanlışı vardır.',
        answer: true),
    Question(questionText: "Kelebeklerin ömrü bir gündür.", answer: false),
    Question(questionText: "Bir gün 2400 dakikadır.", answer: false),
    Question(
        questionText: "Avrupa'nın en kalabalık şehri İstanbul'dur.",
        answer: true),
    Question(questionText: "Barcelona, İspanya'nın başkentidir.", answer: true),
    Question(
        questionText: "Aynı yere iki defa yıldırım düşmez.", answer: false),
    Question(
        questionText: "Türkiye, Birleşmiş Milletler üyesidir.", answer: true),
    Question(
        questionText: "Titanic gelmiş geçmiş en büyük gemidir.", answer: false),
    Question(questionText: "Bütün rakamların çarpımı 0'dır.", answer: true),
    Question(questionText: "TBMM 20. yüzyılda kurulmuştur", answer: true),
  ];

  final List<Question> _mediumQuestions = [
    Question(
        questionText:
            "Türkiye'de Barış ismini ilk olarak Barış Manço almıştır.",
        answer: true),
    Question(questionText: "Fe, flor elementinin simgesidir.", answer: false),
    Question(
        questionText: "Bazı filler popolarından nefes alabilirler.",
        answer: false),
    Question(
        questionText: "Bazı kaplumbağalar, popolarından nefes alabilir. :)",
        answer: true),
    Question(questionText: "Altın en iyi iletkendir.", answer: false),
    Question(questionText: "Ahtapotların 3 tane kalbi vardır.", answer: true),
    Question(
        questionText:
            "Eğer bir toprak solucanını ortadan ikiye keserseniz iki parça da kendini tamamlar.",
        answer: false),
    Question(
        questionText: "Cumhuriyet 29 Ekim 1920 tarihinde kurulmuştur.",
        answer: false),
    Question(
        questionText:
            "21 Aralık’ta Kuzey Yarım Küre'de günler uzamaya başlarken Güney Yarım Küre'de ise günler kısalmaya başlar.",
        answer: true),
    Question(
        questionText: "Güneş'e en uzak gezegen Uranüs'tür.", answer: false),
    Question(
        questionText: " Çakmak kibritten önce üretilmiştir.", answer: true),
  ];

  final List<Question> _hardQuestions = [
    Question(
        questionText: "İnsan DNA'sı %50 oranında salatalık DNA'sı ile aynıdır.",
        answer: false),
    Question(
        questionText: "Dinozorlar olmasaydı kuşlar olmazdı.", answer: true),
    Question(
        questionText: "Dünyadaki en kısa savaş 2 saat sürmüştür.",
        answer: false),
    Question(
        questionText: "Kaju fıstığı aslında bir meyvenin sapıdır.",
        answer: true),
    Question(
        questionText: "Namaz, Arapça kökenli bir kelimedir.", answer: false),
    Question(
        questionText: "-1,1 sayısı -1,01'den daha büyüktür.", answer: false),
    Question(
        questionText: "Fatih Sultan Mehmet hiç patates yememiştir.",
        answer: true),
    Question(
        questionText: "Fransızlar 80 demek için, 4 - 20 der.", answer: true),
    Question(
        questionText:
            "Dünya Sağlık Örgütü'nün kısaltılmış hali UHW şeklindedir.",
        answer: false),
    Question(questionText: "Atatürk'ün 5 kardeşi vardı.", answer: true),
    Question(
        questionText: "Nokia aslında Finlandiya'da bir şehrin adıdır.",
        answer: true)
  ];

  String getQuestionText(level) {
    if (level == 0) {
      return _easyQuestions[_questionIndex].questionText;
    }
    if (level == 1) {
      return _mediumQuestions[_questionIndex].questionText;
    }
    if (level == 2) {
      return _hardQuestions[_questionIndex].questionText;
    } else {
      return "Soru Bulunamadı";
    }
  }

  bool getAnswer(level) {
    if (level == 0) {
      return _easyQuestions[_questionIndex].answer;
    }
    if (level == 1) {
      return _mediumQuestions[_questionIndex].answer;
    }
    if (level == 2) {
      return _hardQuestions[_questionIndex].answer;
    } else {
      return true;
    }
  }

  void nextQuestion(level) {
    if (level == 0) {
      if (_questionIndex < _easyQuestions.length - 1) {
        _questionIndex++;
      }
      if (_questionIndex == _easyQuestions.length - 1) {
        isTestFinished = true;
      }
    }
    if (level == 1) {
      if (_questionIndex < _mediumQuestions.length - 1) {
        _questionIndex++;
      }
      if (_questionIndex == _mediumQuestions.length - 1) {
        isTestFinished = true;
      }
    }
    if (level == 2) {
      if (_questionIndex < _hardQuestions.length - 1) {
        _questionIndex++;
      }
      if (_questionIndex == _hardQuestions.length - 1) {
        isTestFinished = true;
      }
    }
  }
}
