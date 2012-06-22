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
  SUnknown = '<inconnu>';
  SInvalidInteger = '''%s'' n''est pas une valeur enti�re correcte';
  SInvalidFloat = '''%s'' n''est pas une valeur en virgule flottante correcte';
  SInvalidCurrency = '''%s'' n''est pas une valeur mon�taire correcte';
  SInvalidDate = '''%s'' n''est pas une date correcte';
  SInvalidTime = '''%s'' n''est pas une heure correcte';
  SInvalidDateTime = '''%s'' ne correspond pas � une date et une heure correctes';
  SInvalidDateTimeFloat = '''%g'' ne correspond pas � une date et une heure correctes';
  SInvalidTimeStamp = '''%d.%d'' n''est pas une heure correcte';
  SInvalidGUID = '''%s'' n''est pas une valeur GUID correcte';
  SInvalidBoolean = '''%s'' n''est pas une valeur bool�enne';
  STimeEncodeError = 'Argument incorrect pour l''encodage de l''heure';
  SDateEncodeError = 'Argument incorrect pour l''encodage de date';
  SOutOfMemory = 'M�moire insuffisante';
  SInOutError = 'Erreur E/S %d';
  SFileNotFound = 'Fichier introuvable';
  SInvalidFilename = 'Nom de fichier incorrect';
  STooManyOpenFiles = 'Trop de fichiers ouverts';
  SAccessDenied = 'Acc�s au fichier refus�';
  SEndOfFile = 'Lecture au-del� de la fin de fichier';
  SDiskFull = 'Disque plein';
  SInvalidInput = 'Saisie num�rique incorrecte';
  SDivByZero = 'Division par z�ro';
  SRangeError = 'Erreur de v�rification d''�tendue';
  SIntOverflow = 'D�bordement d''entier';
  SInvalidOp = 'Op�ration en virgule flottante incorrecte';
  SZeroDivide = 'Division par z�ro en virgule flottante';
  SOverflow = 'D�bordement en virgule flottante';
  SUnderflow = 'D�bordement inf�rieur flottant';
  SInvalidPointer = 'Op�ration de pointeur incorrecte';
  SInvalidCast = 'Transtypage de classe incorrect';
{$IFDEF MSWINDOWS}
  SAccessViolation = 'Violation d''acc�s � l''adresse %p. %s de l''adresse %p';
{$ENDIF}
{$IFDEF LINUX}
  SAccessViolation = 'Violation d''acc�s � l''adresse %p, acc�s � l''adresse %p en cours';
{$ENDIF}
  SStackOverflow = 'D�bordement de pile';
  SControlC = 'Frappe de Contr�le-C';
  SQuit = 'Frappes de la touche de sortie';
  SPrivilege = 'Instruction privil�gi�e';
  SOperationAborted = 'Op�ration abandonn�e';
  SException = 'Exception %s dans le module %s dans %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Erreur d''application';
{$IFDEF LINUX}
  SSigactionFailed = 'Echec de l''appel sigaction';
{$ENDIF}
  SInvalidFormat = 'Le format ''%s'' est incorrect ou incompatible avec l''argument';
  SArgumentMissing = 'Aucun argument pour le format ''%s''';
  SDispatchError = 'Appels de m�thode variante non support�s';
  SReadAccess = 'Lecture';
  SWriteAccess = 'Ecriture';
  SResultTooLong = 'R�sultat de format sup�rieur � 4096 caract�res';
  SFormatTooLong = 'Cha�ne de format trop longue';

  SVarArrayCreate = 'Erreur lors de la cr�ation de tableau de variants';
  SVarArrayBounds = 'Indice de tableau de variants hors limites';
  SVarArrayLocked = 'Le tableau de variant est verrouill�';

  SInvalidVarCast = 'Conversion de type variant incorrecte';
  SInvalidVarOp = 'Op�ration de variant incorrecte';
  SInvalidVarOpWithHResult = 'Op�ration variant incorrecte ($%.8x)';

  SVarNotArray = 'Le variant n''est pas un tableau' deprecated; // use SVarInvalid
  SVarTypeUnknown = 'Type de variant personnalis� inconnu (%.4x)' deprecated; // not used anymore

  SVarTypeOutOfRange = 'Type de variant personnalis� (%.4x) hors limites';
  SVarTypeAlreadyUsed = 'Type de variant personnalis� (%.4x) d�j� utilis� par %s';
  SVarTypeNotUsable = 'Le type de variant personnalis� (%.4x) n''est pas utilisable';
  SVarTypeTooManyCustom = 'Trop de types de variants personnalis�s ont �t� enregistr�s';

  SVarTypeCouldNotConvert = 'Impossible de convertir le variant de type (%s) en type (%s)';
  SVarTypeConvertOverflow = 'D�bordement lors de la conversion du variant de type (%s) en type (%s)';
  SVarOverflow = 'D�bordement de variant';
  SVarInvalid = 'Argument incorrect';
  SVarBadType = 'Type de variant incorrect';
  SVarNotImplemented = 'Op�ration non support�e';
  SVarOutOfMemory = 'M�moire insuffisante pour l''op�ration variant';
  SVarUnexpected = 'Erreur de variant inattendue';

  SVarDataClearRecursing = 'R�cursivit� pendant une op�ration VarDataClear';
  SVarDataCopyRecursing = 'R�cursivit� pendant une op�ration VarDataCopy';
  SVarDataCopyNoIndRecursing = 'R�cursivit� pendant une op�ration VarDataCopyNoInd';
  SVarDataInitRecursing = 'R�cursivit� pendant une op�ration VarDataInit';
  SVarDataCastToRecursing = 'R�cursivit� pendant une op�ration VarDataCastTo';
  SVarIsEmpty = 'Le variant est vide';
  sUnknownFromType = 'Conversion impossible � partir du type sp�cifi�';
  sUnknownToType = 'Conversion impossible vers le type sp�cifi�';
  SExternalException = 'Exception externe %x';
  SAssertionFailed = 'Echec de l''assertion';
  SIntfCastError = 'Interface non support�e';
  SSafecallException = 'Exception dans m�thode safecall';
  SAssertError = '%s (%s, ligne %d)';
  SAbstractError = 'Erreur abstraite';
  SModuleAccessViolation = 'Violation d''acc�s � l''adresse %p dans le module ''%s''. %s de l''adresse %p';
  SCannotReadPackageInfo = 'Impossible d''acc�der � l''information de paquet pour le paquet ''%s''';
  sErrorLoadingPackage = 'Impossible de charger le paquet %s.'+sLineBreak+'%s';
  SInvalidPackageFile = 'Fichier paquet ''%s'' incorrect';
  SInvalidPackageHandle = 'Handle de paquet incorrect';
  SDuplicatePackageUnit = 'Impossible de charger le paquet ''%s.''  Il contient l''unit� ''%s,''' +
    'qui est aussi contenue dans le paquet ''%s''';
  SOSError = 'Erreur syst�me.  Code : %d.'+sLineBreak+'%s';
  SUnkOSError = 'Un appel � une fonction du syst�me d''exploitation a �chou�';
{$IFDEF MSWINDOWS}
  SWin32Error = 'Erreur Win32.  Code : %d.'#10'%s' deprecated; // use SOSError
  SUnkWin32Error = 'Une fonction de l''API Win32 a �chou�' deprecated; // use SUnkOSError
{$ENDIF}
  SNL = 'L''application n''a pas de licence pour cette fonctionnalit�';

  SConvIncompatibleTypes2 = 'Types de conversion incompatibles [%s, %s]';
  SConvIncompatibleTypes3 = 'Types de conversion incompatibles [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'Types de conversion incompatibles [%s - %s, %s - %s]';
  SConvUnknownType = 'Type de conversion %s inconnu';
  SConvDuplicateType = 'Type de conversion (%s) d�j� recens�';
  SConvUnknownFamily = 'Famille de conversion %s inconnue';
  SConvDuplicateFamily = 'Famille de conversion (%s) d�j� recens�e';
  SConvUnknownDescription = '[%.8x]';
  SConvIllegalType = 'Type incorrect';
  SConvIllegalFamily = 'Famille incorrecte';
  SConvFactorZero = '%s a un facteur de z�ro';

  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'F�v';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Avr';
  SShortMonthNameMay = 'Mai';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Ao�';
  SShortMonthNameSep = 'Sep';
  SShortMonthNameOct = 'Oct';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'D�c';

  SLongMonthNameJan = 'Janvier';
  SLongMonthNameFeb = 'F�vrier';
  SLongMonthNameMar = 'Mars';
  SLongMonthNameApr = 'Avril';
  SLongMonthNameMay = 'Mai';
  SLongMonthNameJun = 'Juin';
  SLongMonthNameJul = 'Juillet';
  SLongMonthNameAug = 'Ao�t';
  SLongMonthNameSep = 'Septembre';
  SLongMonthNameOct = 'Octobre';
  SLongMonthNameNov = 'Novembre';
  SLongMonthNameDec = 'D�cembre';

  SShortDayNameSun = 'Dim';
  SShortDayNameMon = 'Lun';
  SShortDayNameTue = 'Mar';
  SShortDayNameWed = 'Mer';
  SShortDayNameThu = 'Jeu';
  SShortDayNameFri = 'Ven';
  SShortDayNameSat = 'Sam';

  SLongDayNameSun = 'Dimanche';
  SLongDayNameMon = 'Lundi';
  SLongDayNameTue = 'Mardi';
  SLongDayNameWed = 'Mercredi';
  SLongDayNameThu = 'Jeudi';
  SLongDayNameFri = 'Vendredi';
  SLongDayNameSat = 'Samedi';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'Impossible de cr�er le r�pertoire';

implementation

end.
