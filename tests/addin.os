﻿#Использовать "component"

Перем юТест;

Функция ПолучитьСписокТестов(Знач Тесты) Экспорт

	юТест = Тесты;
	
	Список = Новый Массив;
	Список.Добавить("ТестДолжен_ПроверитьПодключениеГлобальногоКонтекста");
	
	Возврат Список;
	
КонецФункции

Функция ВернутьПеречисление(Значение)

	Возврат Значение;

КонецФункции

Процедура ТестДолжен_ПроверитьПодключениеГлобальногоКонтекста() Экспорт
	
	Коллекция1 = Новый ПростоКоллекция; // Объект создаётся

	Объект1 = Новый ПростоКласс;
	Объект2 = Новый ПростоКласс(4); // Разные конструкторы
	
	юТест.ПроверитьНеРавенство(Объект1.ЦелочисленноеСвойство, Объект2.ЦелочисленноеСвойство);
	юТест.ПроверитьРавенство(Объект2.ЦелочисленноеСвойство, 4);

	Коллекция1.Добавить(Объект1);

	юТест.ПроверитьРавенство(Коллекция1.Количество(), 1);

	// Обход по коллекции
	Для Каждого мОбъект Из Коллекция1 Цикл

		юТест.ПроверитьРавенство(мОбъект, Объект1);

	КонецЦикла;

	// Перечисление в глобальном контексте
	Объект1.СвойствоПеречисление = ПростоПеречисление.Элемент1;

	юТест.ПроверитьРавенство(Объект1.СвойствоПеречисление, ПростоПеречисление.Элемент1);
	юТест.ПроверитьНеРавенство(Объект1.СвойствоПеречисление, ПростоПеречисление.Элемент2);
	
	// Работа маршаллера
	юТест.ПроверитьРавенство(ВернутьПеречисление(Объект1.СвойствоПеречисление), ПростоПеречисление.Элемент1);

КонецПроцедуры