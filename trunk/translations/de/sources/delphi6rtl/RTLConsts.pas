{ *************************************************************************** }
{                                                                             }
{ Delphi and Kylix Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1995, 2001 Borland Software Corporation                       }
{                                                                             }
{ *************************************************************************** }

unit RTLConsts;

interface

resourcestring
  SAncestorNotFound = 'Vorfahr f�r ''%s'' nicht gefunden';
  SAssignError = '%s kann nicht zu  %s zugewiesen werden';
  SBitsIndexError = 'Bits-Index au�erhalb des zul�ssigen Bereichs';
  SBucketListLocked = 'Liste ist w�hrend eines aktiven ForEach gesperrt';
  SCantWriteResourceStreamError = 'In einen schreibgesch�tzten Ressourcen-Stream kann nicht geschrieben werden';
  SCharExpected = '''''%s'''' erwartet';
  SCheckSynchronizeError = 'CheckSynchronize wurde vom Thread $%x aufgerufen, der NICHT der Haupt-Thread ist.';
  SClassNotFound = 'Klasse %s nicht gefunden';
  SDelimiterQuoteCharError = 'Die Eigenschaften Delimiter und QuoteChar d�rfen nicht denselben Wert besitzen';
  SDuplicateClass = 'Klasse mit der Bezeichnung %s existiert bereits';
  SDuplicateItem = 'Liste gestattet keine doppelten Eintr�ge ($0%x)';
  SDuplicateName = 'Komponente mit der Bezeichnung %s existiert bereits';
  SDuplicateString = 'In der Stringliste sind Duplikate nicht erlaubt';
  SFCreateError = 'Datei %s kann nicht erstellt werden';
  SFixedColTooBig = 'Die Anzahl fester Spalten mu� kleiner als die Spaltenanzahl sein';
  SFixedRowTooBig = 'Die Anzahl fester Zeilen mu� kleiner als die Zeilenanzahl sein';
  SFOpenError = 'Datei %s kann nicht ge�ffnet werden';
  SGridTooLarge = 'Gitter zu gro� f�r Operation';
  SIdentifierExpected = 'Bezeichner erwartet';
  SIndexOutOfRange = 'Gitterindex au�erhalb des zul�ssigen Bereichs';
  SIniFileWriteError = 'In %s kann nicht geschrieben werden';
  SInvalidActionCreation = 'Ung�ltige Aktionserstellung';
  SInvalidActionEnumeration = 'Ung�ltige Aktionsaufz�hlung';
  SInvalidActionRegistration = 'Ung�ltige Aktionsregistrierung';
  SInvalidActionUnregistration = 'Ung�ltige Aufhebung der Aktionsregistrierung';
  SInvalidBinary = 'Ung�ltiger Bin�rwert';
  SInvalidDate = '''''%s'''' ist kein g�ltiges Datum';
  SInvalidDateTime = '''''%s'''' ist kein g�ltiger Datums- und Zeitwert';
  SInvalidFileName = 'Ung�ltiger Dateiname - %s';
  SInvalidImage = 'Ung�ltiges Stream-Format';
  SInvalidInteger = '''''%s'''' ist kein g�ltiger Integerwert';
  SInvalidMask = '''%s'' ist eine ung�ltige Maske f�r (%d)';
  SInvalidName = '''''%s'''' ist kein g�ltiger Komponentenname';
  SInvalidProperty = 'Ung�ltiger Eigenschaftswert';
  SInvalidPropertyElement = 'Ung�ltiges Eigenschaftselement: %s';
  SInvalidPropertyPath = 'Ung�ltiger Pfad f�r Eigenschaft';
  SInvalidPropertyType = 'Ung�ltiger Eigenschaftstyp: %s';
  SInvalidPropertyValue = 'Ung�ltiger Eigenschaftswert';
  SInvalidRegType = 'Ung�ltiger Datentyp f�r ''%s''';
  SInvalidString = 'Ung�ltige Stringkonstante';
  SInvalidStringGridOp = 'Es k�nnen keine Zeilen des Tabellengitters gel�scht oder eingef�gt werden';
  SInvalidTime = '''''%s'''' ist keine g�ltige Zeit';
  SItemNotFound = 'Eintrag nicht gefunden ($0%x)';
  SLineTooLong = 'Zeile zu lang';
  SListCapacityError = 'Kapazit�t der Liste ist ersch�pft (%d)';
  SListCountError = 'Zu viele Eintr�ge in der Liste (%d)';
  SListIndexError = 'Listenindex �berschreitet das Maximum (%d)';
  SMaskErr = 'Ung�ltiger Eingabewert';
  SMaskEditErr = 'Ung�ltiger Eingabewert. Mit der Taste ESC machen Sie die �nderungen r�ckg�ngig.';
  SMemoryStreamError = 'Expandieren des Speicher-Stream wegen Speichermangel nicht m�glich';
  SNoComSupport = '%s wurde nicht als COM-Klasse registriert';
  SNotPrinting = 'Der Drucker druckt aktuell nicht';
  SNumberExpected = 'Zahl erwartet';
  SParseError = '%s in Zeile %d';
  SComponentNameTooLong = 'Komponentenname ''%s'' �berschreitet 64 Zeichen';
  SPropertyException = 'Fehler beim Lesen von %s%s%s: %s';
  SPrinting = 'Druckvorgang l�uft';
  SReadError = 'Stream-Lesefehler';
  SReadOnlyProperty = 'Eigenschaft kann nur gelesen werden';
  SRegCreateFailed = 'Erzeugung von Schl�ssel %s mi�lungen';
  SRegGetDataFailed = 'Fehler beim Holen der Daten f�r ''%s''';
  SRegisterError = 'Ung�ltige Komponentenregistrierung';
  SRegSetDataFailed = 'Fehler beim Setzen der Daten f�r ''%s''';
  SResNotFound = 'Ressource %s wurde nicht gefunden';
  SSeekNotImplemented = '%s.Seek nicht implementiert';
  SSortedListError = 'Operation f�r sortierte Listen nicht zul�ssig';
  SStringExpected = 'String erwartet';
  SSymbolExpected = '%s erwartet';
  STimeEncodeError = 'Ung�ltiges Argument zum Codieren der Uhrzeit';
  STooManyDeleted = 'Zu viele Zeilen oder Spalten gel�scht';
  SUnknownGroup = '%s befindet sich nicht in einer Gruppe f�r Klassenregistrierungen';
  SUnknownProperty = 'Eigenschaft %s existiert nicht.';
  SWriteError = 'Stream-Schreibfehler';
  SStreamSetSize = 'Fehler beim Setzen der Gr��e des Stream';
  SThreadCreateError = 'Fehler beim Erzeugen des Thread: %s';
  SThreadError = 'Thread-Fehler: %s (%d)';

  SInvalidDateDay = '(%d, %d) ist kein g�ltiger Wert f�r die Tagesangabe im Datum';
  SInvalidDateWeek = '(%d, %d, %d) ist kein g�ltiger Wert f�r die Wochenangabe im Datum';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) ist kein g�ltiger Wert f�r die Monats- und Wochenangabe im Datum';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) ist kein g�ltiger Wert f�r dieTages- und Monatsangabe  im Datum';
  SInvalidJulianDate = '%f Julianischer Wert kann nicht als Datum/Uhrzeitwert dargestellt werden';
  SMissingDateTimeField = '?';

  SConvIncompatibleTypes2 = 'Inkompatible Konvertierungstypen [%s, %s]';
  SConvIncompatibleTypes3 = 'Inkompatible Konvertierungstypen [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'Inkompatible Konvertierungstypen [%s - %s, %s - %s]';
  SConvUnknownType = 'Unkannter Konvertierungstyp %s';
  SConvDuplicateType = 'Konvertierungstyp (%s) bereits registriert in %s';
  SConvUnknownFamily = 'Unbekannte Konvertierungsfamilie %s';
  SConvDuplicateFamily = 'Konvertierungsfamilie (%s) bereits registriert';
  SConvUnknownDescription = '[%.8x]';
  SConvIllegalType = 'Ung�ltiger Typ';
  SConvIllegalFamily = 'Ung�ltige Familie';
  SConvFactorZero = '%s hat den Faktor Null';
  SConvStrParseError = '%s konnte nicht analysiert werden';
  SFailedToCallConstructor = 'Der Nachkomme von TStrings %s konnte den geerbten Konstruktor nicht aufrufen';

  sWindowsSocketError = 'Windows-Socket-Fehler: %s (%d), auf API ''%s''';
  sAsyncSocketError = 'Asynchroner Socket-Fehler %d';
  sNoAddress = 'Keine Adresse angegeben';
  sCannotListenOnOpen = 'Offener Socket kann nicht �berwacht werden';
  sCannotCreateSocket = 'Es kann kein neuer Socket erzeugt werden';
  sSocketAlreadyOpen = 'Socket ist bereits ge�ffnet';
  sCantChangeWhileActive = 'Wert kann nicht ge�ndert werden, w�hrend der Socket aktiv ist';
  sSocketMustBeBlocking = 'Socket mu� sich im Blocking-Modus befinden';
  sSocketIOError = '%s-Fehler %d, %s';
  sSocketRead = 'Lesen';
  sSocketWrite = 'Schreiben';

implementation

end.
