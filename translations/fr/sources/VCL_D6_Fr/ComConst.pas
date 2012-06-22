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
  SCreateRegKeyError = 'Erreur � la cr�ation de l''entr�e de registre syst�me';
  SOleError = 'Erreur OLE %.8x';
  SObjectFactoryMissing = 'Fabrique d''objets manquante pour la classe %s';
  STypeInfoMissing = 'Informations de type manquantes pour la classe %s';
  SBadTypeInfo = 'Informations de type incorrectes pour la classe %s';
  SDispIntfMissing = 'Interface dispatch manquante dans la classe %s';
  SNoMethod = 'M�thode ''%s'' non support�e par l''objet Automation';
  SVarNotObject = 'Le variant ne r�f�rence pas un objet Automation';
  STooManyParams = 'Les m�thodes Dispatch ne g�rent pas plus de 64 param�tres';
  SDCOMNotInstalled = 'DCOM non install�';
  SDAXError = 'Erreur DAX';

  SAutomationWarning = 'Avertissement du serveur COM';
  SNoCloseActiveServer1 = 'Il y a encore des serveurs COM actifs dans cette ' +
    'application.  Un ou plusieurs clients ont peut-�tre des r�f�rences � ces objets. ' +
    'La fermeture manuelle de ';
  SNoCloseActiveServer2 = 'cette application peut donc provoquer des erreurs ' +
    'dans les clients.'#13#10#13#10'Etes-vous s�r de vouloir fermer cette ' +
    'application ?';

implementation

end.
