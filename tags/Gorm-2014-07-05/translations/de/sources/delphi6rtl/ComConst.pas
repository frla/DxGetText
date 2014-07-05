{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

unit ComConst;

interface

resourcestring
  SCreateRegKeyError = 'Fehler beim Erstellen eines Eintrages in der Systemregistrierung';
  SOleError = 'OLE-Fehler %.8x';
  SObjectFactoryMissing = 'Der Objektgenerator f�r die Klasse %s fehlt';
  STypeInfoMissing = 'F�r die Klasse %s fehlt die Typinformation';
  SBadTypeInfo = 'Falsche Typinformation f�r Klasse %s';
  SDispIntfMissing = 'Dispatch-Schnittstelle der Klasse %s fehlt';
  SNoMethod = 'Die Methode ''%s'' wird vom Automatisierungsobjekt nicht unterst�tzt';
  SVarNotObject = 'Variante referenziert kein Automatisierungsobjekt';
  STooManyParams = 'Dispatch-Methoden unterst�tzen maximal 64 Parameter.';
  SDCOMNotInstalled = 'DCOM ist nicht installiert';
  SDAXError = 'DAX-Fehler';

  SAutomationWarning = 'Warnung des COM-Servers';
  SNoCloseActiveServer1 = 'Diese Anwendung enth�lt noch aktive COM-Objekte.' +
    'Mindestens ein Client verweist noch auf diese Objekte,' +
    'so da� manuelles Schlie�en ';
  SNoCloseActiveServer2 = 'dieser Anwendung dazu f�hren k�nnte, da� die Client-Anwendungen' +
    'nicht korrekt funktionieren.'#13#10#13#10'Sind Sie sicher, da� Sie diese Anwendung ' +
    'schlie�en m�chten?';

implementation

end.
