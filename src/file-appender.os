﻿//////////////////////////////////////////////////////////////////////////
//
// LOGOS: вывод в файл
//
//////////////////////////////////////////////////////////////////////////

Перем мФайлЛога;

Процедура ОткрытьФайл(Знач Путь, Знач Кодировка = "utf-8", Знач Добавлять = Истина) Экспорт
	мФайлЛога = Новый ЗаписьТекста(Путь, Кодировка,,Добавлять);
КонецПроцедуры

Процедура Вывести(Знач Сообщение) Экспорт
	ПроверитьИнициализацию();
	мФайлЛога.ЗаписатьСтроку(Сообщение);
КонецПроцедуры

Процедура Закрыть() Экспорт
	ПроверитьИнициализацию();
	мФайлЛога.Закрыть();
	мФайлЛога = Неопределено;
КонецПроцедуры

// Устанавливает свойство аппендера, заданное в конфигурационном файле
//
Процедура УстановитьСвойство(Знач ИмяСвойства, Знач Значение) Экспорт
	Если ИмяСвойства = "file" Тогда
		ОткрытьФайл(Значение);
	КонецЕсли;
КонецПроцедуры // УстановитьСвойство()

Процедура ПроверитьИнициализацию()
	Если мФайлЛога = Неопределено Тогда
		ВызватьИсключение "Не открыт файл лога";
	КонецЕсли;
КонецПроцедуры
