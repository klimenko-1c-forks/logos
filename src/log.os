﻿//////////////////////////////////////////////////////////////////////////
//
// LOGOS: реализация логирования в стиле log4j для OneScript
//
//////////////////////////////////////////////////////////////////////////

Перем мТекущийУровень;
Перем мСпособыВывода;
Перем мСпособВыводаЗаданВручную;

Перем мИдентификатор;
Перем мРаскладкаСообщения;

Функция Уровень() Экспорт
	Возврат мТекущийУровень;
КонецФункции

Процедура УстановитьУровень(Знач Уровень) Экспорт
	Если Уровень < 0 или Уровень > УровниЛога.Отключить Тогда
		ВызватьИсключение "Неверное значение аргумента 'Уровень'";
	КонецЕсли;

	мТекущийУровень = Уровень;

КонецПроцедуры

Процедура УстановитьРаскладку(Знач Раскладка) Экспорт
	мРаскладкаСообщения = Раскладка;
КонецПроцедуры

Процедура Закрыть() Экспорт
	Для Каждого СпособВывода Из мСпособыВывода Цикл
		СпособВывода.Закрыть();
	КонецЦикла;
	мСпособыВывода.Очистить();
КонецПроцедуры

Процедура ДобавитьСпособВывода(Знач СпособВывода) Экспорт

	Если Не мСпособВыводаЗаданВручную Тогда
		Закрыть();
		мСпособВыводаЗаданВручную = Истина;
	КонецЕсли;

	мСпособыВывода.Добавить(СпособВывода);

КонецПроцедуры

Процедура УдалитьСпособВывода(Знач СпособВывода) Экспорт

	Для Сч = 0 По мСпособыВывода.Количество()-1 Цикл
		Если мСпособыВывода[Сч] = СпособВывода Тогда
			СпособВывода.Закрыть();
			мСпособыВывода.Удалить(Сч);
			Прервать;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Функция ПолучитьИдентификатор() Экспорт
	Возврат мИдентификатор;
КонецФункции

Процедура Отладка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Отладка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
КонецПроцедуры

Процедура Информация(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Информация, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура Предупреждение(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Предупреждение, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура Ошибка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.Ошибка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура КритичнаяОшибка(Знач Сообщение,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Вывести(Сообщение, УровниЛога.КритичнаяОшибка, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

КонецПроцедуры

Процедура Вывести(Знач Сообщение, Знач УровеньСообщения,
		Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
		Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
		Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт

	Сообщение = СтрШаблон(Сообщение, Параметр1,
		Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);

	Если УровеньСообщения >= Уровень() Тогда
		ВыводимоеСообщение = мРаскладкаСообщения.Форматировать(УровеньСообщения, Сообщение);
		Для Каждого СпособВывода Из мСпособыВывода Цикл
			УровеньСпособаВывода = СпособВывода.Уровень();
			Если УровеньСпособаВывода = Неопределено Или УровеньСообщения >= УровеньСпособаВывода Тогда
				СпособВывода.Вывести(ВыводимоеСообщение, УровеньСообщения);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

КонецПроцедуры

Процедура Инициализация()

	УстановитьУровень(УровниЛога.Информация);
	ИнициализироватьСпособыВывода();
	мИдентификатор = Новый УникальныйИдентификатор;

КонецПроцедуры

Процедура ИнициализироватьСпособыВывода()

	мРаскладкаСообщения = Новый ОсновнаяРаскладкаСообщения;

	мСпособВыводаЗаданВручную = Ложь;
	мСпособыВывода = Новый Массив;

	ВыводПоУмолчанию = Новый ВыводЛогаВКонсоль();
	мСпособыВывода.Добавить(ВыводПоУмолчанию);

КонецПроцедуры


Инициализация();
