Личный автомобильный помощник

Техническое задание

Создать систему для помощи автолюбителям вести учёт расходников/запчастей и следить за состоянием своего автомобиля.

В системе присутствуют: обычные водители (регистрируются сами), владельцы различных сервисов (СТО, шиномонтаж,
автомагазины и пр), системный администратор (создает учетные записи владельцев сервисов).

Каждый пользователь после регистрации может ввести данные своей машины (название марки, модели, год выпуска, тип (
бензин/дизель) и объем двигателя, автоматическая или ручная коробка передач, тип кузова, пробег) и дополнительные
заметки (просто текстовое поле).

Кроме этого водитель может вести журнал по проведенным работам:

- замена масла коробки передач

- удаление воды из топливного фильтра

- замена салонного фильтра

- замена тормозной жидкости

- замена охлаждающей жидкости

- замена приводного ремня

- замена ремня/цепи ГРМ

- замена топливного фильтра

- замена моторного масла и масляного фильтра

- замена воздушного фильтра

Также можно вести учет документов на автомобиль:

- регистрационный номер (0000 АА-7)

- время окончания страховки

- время окончания водительского удостоверения

- время окончания техосмотра

Каждая работа/документ должны иметь дату проведения работы/услуги, пробег при проведении услуги.

Для каждой услуги пользователь должен задать период следующего выполнения работы/услуги (например через 1 год после
последнего проведения, шаг в месяц), пробег (в виде числа тысячи километров, с момента проведения услуги. например,
через 5 тыс километров от текущего пробега).

На основном окне сервиса должны быть указаны отгруппированные результаты:

- по всем непроведенным работам (нет ни единой записи проведения)

- по работам, срок повторного выполнения которых истекает (осталось менее 1000 км, или меньше месяца).

- по документам, которые истекают менее чем через 3 месяца

Каждый владелец сервиса может запросить доступ к системе (регистрируется как пользователь, но выбирает тип "владелец
сервиса"). Данный тип регистрации должен быть подтвержден системным администратором, чтобы быть активированным в
системе.

После регистрации владелец сервиса должен указать какие услуги он предоставляет (например, каждый из пунктов
обслуживания у водителя + автомойка, заправка, автомагазин, разборка и пр).

Также необходимо указать название организации, адрес, контактные данные (мобильный телефон + email)

Услуги должны работать по принципу тегов - внесение услуги в сервисе должны работать с автодополнением (autocomplete).

Пользователи/водители должны иметь возможность просмотреть список всех услуг, доступных в городе

Пользователи должны иметь возможность фильтровать его по типу услуги, адресу, названию организации.

Пользователей, у которых истекает срок/пробег по какой либо услуге или документу, система должна извещать почтовой
рассылкой со списком соответствующих работ/документов и ссылкой на список организаций, которые предоставляют
соответствующие услуги (с заранее предустановленным фильтром).

Каждый организацию/сервис пользователи могут оценивать по 5 бальной шкале и оставлять на их страницах комментарии. 

