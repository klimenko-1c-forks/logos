﻿////////////////////////////////////////////////////////////////////////////
//
// Скрипт управляет запуском синхронизации с GIT по нескольким репозиториям
// Copyright EvilBeaver 2015
//
////////////////////////////////////////////////////////////////////////////

#Использовать cmdline

Перем мКонтроллер;
Перем мНастройки;
Перем Лог;
Перем мФлагПринудительнойСинхронизации;

Процедура Инициализация()
	Лог = Логирование.ПолучитьЛог("oscript.app.gitsync");
КонецПроцедуры

////////////////////////////////////////////////////////////////////////
// Программный интерфейс

Процедура ВыполнитьСинхронизациюПоФайлуНастроек(Знач Контроллер, Знач ФайлНастроек, Знач Принудительно = Ложь) Экспорт

	ПрочитатьНастройкиИзФайла(ФайлНастроек);
	мФлагПринудительнойСинхронизации = Принудительно;
	мКонтроллер = Контроллер;
	
	СинхронизироватьХранилища();

КонецПроцедуры

////////////////////////////////////////////////////////////////////////
// Работа с конфигурационным файлом

Процедура ПрочитатьНастройкиИзФайла(Знач ФайлНастроек)
	
	Конфиг = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "xml-config.os"));
	мНастройки = Конфиг.ПрочитатьНастройкиИзФайла(ФайлНастроек);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////
// Вспомогательные методы

Функция ИмяФайлаБазыХранилища(Знач Каталог)
	Возврат ОбъединитьПути(Каталог, "1cv8ddb.1CD");
КонецФункции

Функция НеобходимоСинхронизироватьХранилище(Знач Репо)
	
	ФайлХранилища = ИмяФайлаБазыХранилища(Репо.КаталогХранилища1С); 
	
	Возврат мКонтроллер.ТребуетсяСинхронизироватьХранилище(ФайлХранилища, Репо.КаталогВыгрузки);
	
КонецФункции

Функция СинхронизироватьПринудительно()
	
	Возврат мФлагПринудительнойСинхронизации;
	
КонецФункции

Процедура СинхронизироватьХранилища()

	СинхронизироватьПринудительно = СинхронизироватьПринудительно();
	
	СообщениеСборки("Синхронизация началась");
	
	Для Каждого Репо Из мНастройки.Репозитарии Цикл
		
		Попытка
			
			Если СинхронизироватьПринудительно Тогда
				ВыполнитьСинхронизациюПоОдномуРепо(Репо);
			Иначе
				ВыполнитьСинхронизациюПриНеобходимости(Репо);
			КонецЕсли;
			
		Исключение
			СообщениеСборки(ОписаниеОшибки());
			Продолжить;
		КонецПопытки;
		
	КонецЦикла;
	СообщениеСборки("Синхронизация завершена");
КонецПроцедуры

Процедура ВыполнитьСинхронизациюПоОдномуРепо(Знач Репо)
	
	СообщениеСборки("Синхронизация для '"+Репо.Имя+"'");
	мКонтроллер.Синхронизировать(Репо.КаталогХранилища1С, Репо.GitURL, Репо.КаталогВыгрузки, Репо.ДоменПочтыДляGit, Репо.ПутьКПлатформе83)
	
КонецПроцедуры

Процедура ВыполнитьСинхронизациюПриНеобходимости(Знач Репо)
	
	Лог.Информация("Проверяю необходимость синхронизации: " + Репо.Имя);
	Если Не НеобходимоСинхронизироватьХранилище(Репо) Тогда
		СообщениеСборки("Синхронизация для '"+Репо.Имя+"' не требуется");
		Возврат;
	КонецЕсли;
	
	ВыполнитьСинхронизациюПоОдномуРепо(Репо);
	
КонецПроцедуры

Процедура СообщениеСборки(Знач Текст)
	Лог.Информация(Текст);
КонецПроцедуры

///////////////////////////////////////////////////////////////
//

Инициализация();
