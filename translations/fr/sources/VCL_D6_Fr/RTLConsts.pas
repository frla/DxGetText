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
  SAncestorNotFound = 'Anc�tre de ''%s'' non trouv�';
  SAssignError = 'Impossible d''affecter %s � %s';
  SBitsIndexError = 'Indice de bits hors limites';
  SBucketListLocked = 'Liste verrouill�e lors d''une op�ration ForEach active';
  SCantWriteResourceStreamError = 'Impossible d''�crire dans un flux en lecture seule';
  SCharExpected = '''''%s'''' attendu';
  SCheckSynchronizeError = 'CheckSynchronize a �t� appel�e depuis le thread $%x, qui n''est PAS le thread principal';
  SClassNotFound = 'Classe %s non trouv�e';
  SDelimiterQuoteCharError = 'Les propri�t�s Delimiter et QuoteChar ne peuvent avoir la m�me valeur';
  SDuplicateClass = 'Une classe nomm�e %s existe d�j�';
  SDuplicateItem = 'La liste n''autorise pas les doublons ($0%x)';
  SDuplicateName = 'Un composant nomm� %s existe d�j�';
  SDuplicateString = 'La liste de cha�nes n''autorise pas les doublons';
  SFCreateError = 'Impossible de cr�er le fichier %s';
  SFixedColTooBig = 'Le nombre de colonnes fixes doit �tre inf�rieur au nombre de colonnes';
  SFixedRowTooBig = 'Le nombre de lignes fixes doit �tre inf�rieur au nombre de lignes';
  SFOpenError = 'Impossible d''ouvrir le fichier %s';
  SGridTooLarge = 'Grille trop grande pour l''op�ration';
  SIdentifierExpected = 'Identificateur attendu';
  SIndexOutOfRange = 'Indice de grille hors limites';
  SIniFileWriteError = 'Impossible d''�crire dans %s';
  SInvalidActionCreation = 'Cr�ation d''action incorrecte';
  SInvalidActionEnumeration = 'Enum�ration d''action incorrecte';
  SInvalidActionRegistration = 'Enregistrement d''action incorrecte';
  SInvalidActionUnregistration = 'D�senregistrement d''action incorrecte';
  SInvalidBinary = 'Valeur binaire incorrecte';
  SInvalidDate = '''''%s'''' n''est pas une date correcte';
  SInvalidDateTime = '''''%s'''' ne correspond pas � une date et une heure correctes';
  SInvalidFileName = 'Nom de fichier incorrect - %s';
  SInvalidImage = 'Format de flux incorrect';
  SInvalidInteger = '''''%s'''' n''est pas une valeur enti�re correcte';
  SInvalidMask = '''%s'' est un masque incorrect � (%d)';
  SInvalidName = '''''%s'''' n''est pas un nom de composant correct';
  SInvalidProperty = 'Valeur de propri�t� incorrecte';
  SInvalidPropertyElement = 'El�ment de propri�t� incorrect : %s';
  SInvalidPropertyPath = 'Chemin de propri�t� incorrect';
  SInvalidPropertyType = 'Type de propri�t� incorrect : %s';
  SInvalidPropertyValue = 'Valeur de propri�t� incorrecte';
  SInvalidRegType = 'Type de donn�es incorrect pour ''%s''';
  SInvalidString = 'Constante cha�ne incorrecte';
  SInvalidStringGridOp = 'Impossible d''ins�rer ou de supprimer les lignes de la grille';
  SInvalidTime = '''''%s'''' n''est pas une heure correcte';
  SItemNotFound = 'El�ment non trouv� ($0%x)';
  SLineTooLong = 'Ligne trop longue';
  SListCapacityError = 'Capacit� de liste hors limites (%d)';
  SListCountError = 'Compte de liste hors limites (%d)';
  SListIndexError = 'Indice de liste hors limites (%d)';
  SMaskErr = 'Valeur d''entr�e incorrecte';
  SMaskEditErr = 'Valeur d''entr�e incorrecte. Utiliser Echap pour abandonner les modifications';
  SMemoryStreamError = 'M�moire insuffisante lors de l''extension du flux m�moire';
  SNoComSupport = '%s n''a pas �t� recens� comme classe COM';
  SNotPrinting = 'L''imprimante n''imprime pas actuellement';
  SNumberExpected = 'Nombre attendu';
  SParseError = '%s � la ligne %d';
  SComponentNameTooLong = 'Le nom de composant ''%s'' d�passe la limite des 64 caract�res';
  SPropertyException = 'Erreur lors de la lecture de %s%s%s: %s';
  SPrinting = 'Impression en cours';
  SReadError = 'Erreur de lecture du flux';
  SReadOnlyProperty = 'Propri�t� en lecture seule';
  SRegCreateFailed = 'Echec � la cr�ation de la cl� %s';
  SRegGetDataFailed = 'Echec � l''obtention des donn�es pour ''%s''';
  SRegisterError = 'Recensement de composant incorrect';
  SRegSetDataFailed = 'Echec � la d�finition des donn�es pour ''%s''';
  SResNotFound = 'Ressource %s non trouv�e';
  SSeekNotImplemented = '%s.Positionnement non impl�ment�';
  SSortedListError = 'Op�ration non autoris�e dans une liste ordonn�e';
  SStringExpected = 'Cha�ne attendue';
  SSymbolExpected = '%s attendu';
  STimeEncodeError = 'Argument incorrect pour l''encodage de l''heure';
  STooManyDeleted = 'Trop de lignes ou colonnes supprim�es';
  SUnknownGroup = '%s n''est pas dans un groupe de recensement de classes';
  SUnknownProperty = 'La propri�t� %s n''existe pas';
  SWriteError = 'Erreur d''�criture dans le flux';
  SStreamSetSize = 'Erreur lors de la d�finition de la taille du flux';
  SThreadCreateError = 'Erreur de cr�ation de thread : %s';
  SThreadError = 'Erreur de thread : %s (%d)';

  SInvalidDateDay = '(%d, %d) n''est pas une paire DateDay correcte.';
  SInvalidDateWeek = '(%d, %d, %d) n''est pas un triplet DateWeek correct.';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) n''est pas un quad DateMonthWeek correct.';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) n''est pas un quad DayOfWeekInMonth correct.';
  SInvalidJulianDate = '%f Julien ne peut pas �tre repr�sent� en tant que DateTime.';
  SMissingDateTimeField = ' ?';

  SConvIncompatibleTypes2 = 'Types de conversion incompatibles [%s, %s]';
  SConvIncompatibleTypes3 = 'Types de conversion incompatibles [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'Types de conversion incompatibles [%s - %s, %s - %s]';
  SConvUnknownType = 'Type de conversion %s inconnu';
  SConvDuplicateType = 'Le type de conversion (%s) est d�j� recens� dans %s.';
  SConvUnknownFamily = 'Famille de conversion %s inconnue';
  SConvDuplicateFamily = 'Famille de conversion (%s) d�j� recens�e';
  SConvUnknownDescription = '[%.8x]';
  SConvIllegalType = 'Type incorrect';
  SConvIllegalFamily = 'Famille incorrecte';
  SConvFactorZero = '%s a un facteur de z�ro.';
  SConvStrParseError = 'Impossible d''analyser %s';
  SFailedToCallConstructor = 'Le %s d�croissant de TStrings n''a pas r�ussi � appeler le constructeur h�rit�.';

  sWindowsSocketError = 'Erreur socket Windows : %s (%d), avec l''API ''%s''';
  sAsyncSocketError = 'Erreur socket asynchrone %d';
  sNoAddress = 'Aucune adresse sp�cifi�e';
  sCannotListenOnOpen = 'Ecoute impossible sur un socket ouvert';
  sCannotCreateSocket = 'Impossible de cr�er le nouveau socket';
  sSocketAlreadyOpen = 'Socket d�j� ouvert';
  sCantChangeWhileActive = 'Modification de valeur impossible lorsque le socket est actif';
  sSocketMustBeBlocking = 'Le socket doit �tre en mode bloquant';
  sSocketIOError = '%s erreur %d, %s';
  sSocketRead = 'Lecture';
  sSocketWrite = 'Ecriture';

implementation

end.
