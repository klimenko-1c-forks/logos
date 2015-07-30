﻿//////////////////////////////////////////////////////////////////
// ЗАГРУЗЧИК МОДУЛЕЙ ПРИЛОЖЕНИЯ

Перем мКаталогПриложения;
Перем мЗагрузчик;

Процедура ПриЗагрузкеБиблиотеки(Знач Загрузчик, Знач Путь, СтандартнаяОбработка, Отказ) Экспорт

	мЗагрузчик = Загрузчик;
	СтандартнаяОбработка = Ложь;
	
	ЗагрузитьКласс("ДиспетчерКомандПриложения", "lib/commands.os");
	ЗагрузитьКласс("СборщикПакета", "lib/builder.os");
	ЗагрузитьКласс("ОписаниеПакета", "lib/package-def.os");
	
	ЗагрузитьМодуль("РаботаСВерсиями", "lib/versions.os");
	
КонецПроцедуры

Процедура ЗагрузитьМодуль(Знач ИмяМодуля, Знач Ресурс)
	
	ПутьМодуля = ОбъединитьПути(мКаталогПриложения, Ресурс);
	мЗагрузчик.ДобавитьМодуль(ПутьМодуля, ИмяМодуля);
	
КонецПроцедуры

Процедура ЗагрузитьКласс(Знач ИмяМодуля, Знач Ресурс)
	
	ПутьМодуля = ОбъединитьПути(мКаталогПриложения, Ресурс);
	мЗагрузчик.ДобавитьКласс(ПутьМодуля, ИмяМодуля);
	
КонецПроцедуры

мКаталогПриложения = ТекущийСценарий().Каталог;
	