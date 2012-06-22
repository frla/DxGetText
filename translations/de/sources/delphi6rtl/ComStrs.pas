
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1996-2001 Borland Software Corporation }
{                                                       }
{*******************************************************}

unit ComStrs;

interface

resourcestring
  sTabFailClear = 'Register-Element konnte nicht geleert werden';
  sTabFailDelete = 'Registerseite mit Index %d konnte nicht gel�scht werden';
  sTabFailRetrieve = 'Registerseite mit Index %d konnte nicht gelesen werden';
  sTabFailGetObject = 'Objekt mit Index %d konnte nicht gelesen werden';
  sTabFailSet = 'Registerseite ''%s'' mit Index %d konnte nicht gesetzt werden';
  sTabFailSetObject = 'Objekt mit Index %d konnte nicht gesetzt werden';
  sTabMustBeMultiLine = 'Bei TabPosition tpLeft und tpRight mu� MultiLine True sein';

  sInvalidLevel = 'Ung�ltige Zuweisung von Eintragsebenen';
  sInvalidLevelEx = 'Ung�ltige Ebene (%d) f�r Eintrag "%s"';
  sInvalidIndex = 'Ung�ltiger Index';
  sInsertError = 'Eintrag kann nicht eingef�gt werden';

  sInvalidOwner = 'Ung�ltiger Besitzer';
  sUnableToCreateColumn = 'Neue Spalte kann nicht erzeugt werden';
  sUnableToCreateItem = 'Neuer Eintrag kann nicht erzeugt werden';

  sRichEditInsertError = 'Fehler bei Einf�gen von RichEdit-Zeile';
  sRichEditLoadFail = 'Laden des Streams ist mi�lungen';
  sRichEditSaveFail = 'Speichern des Streams ist mi�lungen';

  sTooManyPanels = 'StatusBar darf nicht mehr als 64 Bedienfelder (Panels) haben';

  sHKError = 'Fehler bei der Zuordnung des Tastenk�rzels zu %s. %s';
  sHKInvalid = 'Tastenk�rzel ist ung�ltig';
  sHKInvalidWindow = 'Fenster ist ung�ltig oder ein untergeordnetes Fenster';
  sHKAssigned = 'Tastenk�rzel ist einem anderen Fenster zugeordnet';

  sUDAssociated = '%s ist bereits mit %s verkn�pft';

  sPageIndexError = '%d ist ein ung�ltiger Wert f�r PageIndex. PageIndex mu� zwischen 0 und %d liegen';

  sInvalidComCtl32 = 'Dieses Element ben�tigt COMCTL32.DLL in der Version 4.70 oder h�her';

  sDateTimeMax = 'Datum �berschreitet das Maximum von %s';
  sDateTimeMin = 'Datum unterschreitet das Minimum von %s';
  sNeedAllowNone = 'Um das Datum zu setzen, mu� der Modus ShowCheckbox aktiv sein';
  sFailSetCalDateTime = 'Kalenderzeit oder -datum konnte nicht gesetzt werden';
  sFailSetCalMaxSelRange = 'Max. Auswahlbereich konnte nicht gesetzt werden';
  sFailSetCalMinMaxRange = 'Max./min. Bereich des Kalenders konnte nicht gesetzt werden';
  sCalRangeNeedsMultiSelect = 'Datumsbereich kann nur im Mehrfachauswahl-Modus verwendet werden';
  sFailsetCalSelRange = 'Ausgew�hlter Bereich des Kalenders kann nicht gesetzt werden';

implementation

end.
