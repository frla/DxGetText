{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{                                                                         }
{ Copyright (c) 1995, 2001 Borland Software Corporation                   }
{                                                                         }
{ *********************************************************************** }

unit SysConst;                                   

interface

resourcestring
  SUnknown = '<unbekannt>';
  SInvalidInteger = '''%s'' ist kein g�ltiger Integerwert';
  SInvalidFloat = '''%s'' ist kein g�ltiger Gleitkommawert';
  SInvalidCurrency = '''%s'' ist kein g�ltiger W�hrungwert';
  SInvalidDate = '''%s'' ist kein g�ltiges Datum';
  SInvalidTime = '''%s'' ist keine g�ltige Uhrzeit';
  SInvalidDateTime = '''%s'' ist keine g�ltige Datums- und Uhrzeitangabe';
  SInvalidDateTimeFloat = '''%g'' kein g�ltiger Datums- und Zeitwet';
  SInvalidTimeStamp = '''%d.%d'' ist kein g�ltiger Zeitstempel';
  SInvalidGUID = '''%s'' kein g�ltiger Wert f�r GUID';
  SInvalidBoolean = '''%s'' ist kein g�ltiger boolescher Wert';
  STimeEncodeError = 'Ung�ltiges Argument f�r Codierung der Uhrzeit';
  SDateEncodeError = 'Ung�ltiges Argument zum Codieren des Datums';
  SOutOfMemory = 'Zu wenig Arbeitsspeicher';
  SInOutError = 'E/A-Fehler %d';
  SFileNotFound = 'Datei nicht gefunden';
  SInvalidFilename = 'Ung�ltiger Dateiname';
  STooManyOpenFiles = 'Zu viele ge�ffnete Dateien';
  SAccessDenied = 'Dateizugriff verweigert';
  SEndOfFile = 'Versuch hinter dem Dateiende zu lesen';
  SDiskFull = 'Zu wenig Speicherplatz';
  SInvalidInput = 'Ung�ltige numerische Eingabe';
  SDivByZero = 'Division durch Null';
  SRangeError = 'Fehler bei Bereichspr�fung';
  SIntOverflow = 'Integer�berlauf';
  SInvalidOp = 'Ung�ltige Gleitkommaoperation';
  SZeroDivide = 'Gleitkommadivision durch Null';
  SOverflow = 'Gleitkomma�berlauf';
  SUnderflow = 'Gleitkommaunterlauf';
  SInvalidPointer = 'Ung�ltige Zeigeroperation';
  SInvalidCast = 'Ung�ltige Typumwandlung';
{$IFDEF MSWINDOWS}
  SAccessViolation = 'Zugriffsverletzung bei Adresse %p. %s von Adresse %p';
{$ENDIF}
{$IFDEF LINUX}
  SAccessViolation = 'Zugriffsverletzung bei Adresse %p beim Zugriff auf Adresse %p';
{$ENDIF}
  SStackOverflow = 'Stack-�berlauf';
  SControlC = 'Strg+C gedr�ckt';
  SQuit = 'Taste zum Verlassen gedr�ckt';
  SPrivilege = 'Privilegierte Anweisung';
  SOperationAborted = 'Operation abgebrochen';
  SException = 'Exception %s in Modul %s bei %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Anwendungsfehler';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction-Aufruf fehlgeschlagen';
{$ENDIF}
  SInvalidFormat = 'Format ''%s'' ung�ltig oder nicht kompatibel mit Argument';
  SArgumentMissing = 'Kein Argument f�r Format ''%s''';
  SDispatchError = 'Variant-Methodenaufruf nicht unterst�tzt';
  SReadAccess = 'Lesen';
  SWriteAccess = 'Schreiben';
  SResultTooLong = 'Formatergebnis l�nger als 4096 Zeichen';
  SFormatTooLong = 'Format-String zu lang';

  SVarArrayCreate = 'Fehler beim Erstellen des Variant-Arrays';
  SVarArrayBounds = 'Index des Variant-Arrays au�erhalb des Bereichs';
  SVarArrayLocked = 'Variant-Array ist gesperrt';

  SInvalidVarCast = 'Ung�ltige Variant-Typumwandlung';
  SInvalidVarOp = 'Ung�ltige Variant-Operation';
  SInvalidVarOpWithHResult = 'Ung�ltige Variant-Operation ($%.8x)';

  SVarNotArray = 'Variant ist kein Array' deprecated; // use SVarInvalid
  SVarTypeUnknown = 'Unbekannter selbstdefinierter Variant-Typ (%.4x)' deprecated; // not used anymore

  SVarTypeOutOfRange = 'Selbstdefinierter Variant-Typ (%.4x) ist nicht im g�ltigen Bereich';
  SVarTypeAlreadyUsed = 'Selbstdefinierter Variant-Typ (%.4x) wird bereits von %s verwendet';
  SVarTypeNotUsable = 'Selbstdefinierter Variant-Typ (%.4x) ist nicht verwendbar';
  SVarTypeTooManyCustom = 'Es wurden zu viele benutzerdefinierte Variant-Typen registriert';

  SVarTypeCouldNotConvert = 'Variante des Typs (%s) konnte nicht in Typ (%s) konvertiert werden';
  SVarTypeConvertOverflow = '�berlauf bei der Konvertierung einer Variante vom Typ (%s) in Typ (%s)';
  SVarOverflow = 'Variant-�berlauf';
  SVarInvalid = 'Ung�ltiges Argument';
  SVarBadType = 'Ung�ltiger Variant-Typ';
  SVarNotImplemented = 'Operation wird nicht unterst�tzt';
  SVarOutOfMemory = 'Speichermangel bei Varinat-Operation';
  SVarUnexpected = 'Unerwarteter Variant-Fehler';

  SVarDataClearRecursing = 'Rekursion beim Durchf�hren eines VarDataClear';
  SVarDataCopyRecursing = 'Rekursion beim Durchf�hren eines VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Rekursion beim Durchf�hren eines VarDataCopyNoInd';
  SVarDataInitRecursing = 'Rekursion beim Durchf�hren eines VarDataInit';
  SVarDataCastToRecursing = 'Rekursion beim Durchf�hren eines VarDataCastTo';
  SVarIsEmpty = 'Die Variante ist leer';
  sUnknownFromType = 'Konvertierung des angegebenen Typs kann nicht durchgef�hrt werden';
  sUnknownToType = 'Konvertierung in den angegebenen Typ kann nicht durchgef�hrt werden';
  SExternalException = 'Externe Exception %x';
  SAssertionFailed = 'Auswertung von assert fehlgeschlagen';
  SIntfCastError = 'Schnittstelle nicht unterst�tzt';
  SSafecallException = 'Exception in safecall-Methode';
  SAssertError = '%s (%s, Zeile %d)';
  SAbstractError = 'Abstrakter Fehler';
  SModuleAccessViolation = 'Zugriffsverletzung bei Adresse %p in Modul ''%s''. %s von Adresse %p';
  SCannotReadPackageInfo = 'Zugriff auf Package-Informationen von ''%s'' nicht m�glich';
  sErrorLoadingPackage = 'Package %s kann nicht geladen werden.'+sLineBreak+'%s';
  SInvalidPackageFile = 'Ung�ltige Package-Datei ''%s''';
  SInvalidPackageHandle = 'Ung�ltiges Package-Handle';
  SDuplicatePackageUnit = 'Package ''%s kann nicht geladen werden.''  Es enth�lt die Unit ''%s,''' +
    'die auch im Package ''%s'' enthalten ist';
  SOSError = 'Systemfehler.  Code: %d.'+sLineBreak+'%s';
  SUnkOSError = 'Ein Aufruf einer Betriebssystemfunktion ist fehlgeschlagen';
{$IFDEF MSWINDOWS}
  SWin32Error = 'Win32 Fehler.  Code: %d.'#10'%s' deprecated; // use SOSError
  SUnkWin32Error = 'Fehler bei einer Win32 API-Funktion' deprecated; // use SUnkOSError
{$ENDIF}
  SNL = 'Die Anwendung ist f�r diese Funktion nicht lizenziert.';

  SConvIncompatibleTypes2 = 'Inkompatible Konvertierungstypen [%s, %s]';
  SConvIncompatibleTypes3 = 'Inkompatible Konvertierungstypen [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'Inkompatible Konvertierungstypen [%s - %s, %s - %s]';
  SConvUnknownType = 'Unkannter Konvertierungstyp %s';
  SConvDuplicateType = 'Konvertierungstyp (%s) ist bereits registriert';
  SConvUnknownFamily = 'Unbekannte Konvertierungsfamilie %s';
  SConvDuplicateFamily = 'Konvertierungsfamilie (%s) bereits registriert';
  SConvUnknownDescription = '[%.8x]';
  SConvIllegalType = 'Ung�ltiger Typ';
  SConvIllegalFamily = 'Ung�ltige Familie';
  SConvFactorZero = '%s hat den Faktor Null';

  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'Feb';
  SShortMonthNameMar = 'M�r';
  SShortMonthNameApr = 'Apr';
  SShortMonthNameMay = 'Mai';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Aug';
  SShortMonthNameSep = 'Sep';
  SShortMonthNameOct = 'Okt';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dez';

  SLongMonthNameJan = 'Januar';
  SLongMonthNameFeb = 'Februar';
  SLongMonthNameMar = 'M�rz';
  SLongMonthNameApr = 'April';
  SLongMonthNameMay = 'Mai';
  SLongMonthNameJun = 'Juni';
  SLongMonthNameJul = 'Juli';
  SLongMonthNameAug = 'August';
  SLongMonthNameSep = 'September';
  SLongMonthNameOct = 'Oktober';
  SLongMonthNameNov = 'November';
  SLongMonthNameDec = 'Dezember';

  SShortDayNameSun = 'So';
  SShortDayNameMon = 'Mo';
  SShortDayNameTue = 'Di';
  SShortDayNameWed = 'Mi';
  SShortDayNameThu = 'Do';
  SShortDayNameFri = 'Fr';
  SShortDayNameSat = 'Sa';

  SLongDayNameSun = 'Sonntag';
  SLongDayNameMon = 'Montag';
  SLongDayNameTue = 'Dienstag';
  SLongDayNameWed = 'Mittwoch';
  SLongDayNameThu = 'Donnerstag';
  SLongDayNameFri = 'Freitag';
  SLongDayNameSat = 'Samstag';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'Das Verzeichnis kann nicht erstellt werden';

implementation

end.
