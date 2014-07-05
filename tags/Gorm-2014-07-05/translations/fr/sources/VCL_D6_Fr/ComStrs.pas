
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
  sTabFailClear = 'Echec � l''effacement du contr�le onglet';
  sTabFailDelete = 'Echec � la suppression de l''onglet d''indice %d';
  sTabFailRetrieve = 'Echec � la r�cup�ration de l''onglet d''indice %d';
  sTabFailGetObject = 'Echec � l''obtention de l''objet � l''indice %d';
  sTabFailSet = 'Echec pour mettre l''onglet "%s" � l''indice %d';
  sTabFailSetObject = 'Echec pour mettre l''objet � l''indice %d';
  sTabMustBeMultiLine = 'MultiLine doit �tre vrai lorsque TabPosition est tpLeft ou tpRight';

  sInvalidLevel = 'Affectation de niveau d''�l�ment incorrecte';
  sInvalidLevelEx = 'Niveau incorrect (%d) pour l''�l�ment "%s"';
  sInvalidIndex = 'Index incorrect';
  sInsertError = 'Impossible d''ins�rer un �l�ment';

  sInvalidOwner = 'Propri�taire incorrect';
  sUnableToCreateColumn = 'Impossible de cr�er une nouvelle colonne';
  sUnableToCreateItem = 'Impossible de cr�er un nouvel �l�ment';

  sRichEditInsertError = 'Erreur d''insertion de ligne RichEdit';
  sRichEditLoadFail = 'Erreur au chargement du flux';
  sRichEditSaveFail = 'Erreur � l''enregistrement du flux';

  sTooManyPanels = 'StatusBar ne peut avoir plus de 64 volets';

  sHKError = 'Erreur d''affectation de raccourci clavier � %s. %s';
  sHKInvalid = 'Raccourci clavier incorrect';
  sHKInvalidWindow = 'Fen�tre incorrecte ou fen�tre enfant';
  sHKAssigned = 'Raccourci clavier affect� � une autre fen�tre';

  sUDAssociated = '%s est d�j� associ� avec %s';

  sPageIndexError = '%d est une valeur de PageIndex incorrecte.  PageIndex doit �tre ' +
   'compris entre 0 et %d';

  sInvalidComCtl32 = 'Ce contr�le n�cessite COMCTL32.DLL version 4.70 ou sup�rieure';

  sDateTimeMax = 'La date d�passe le maximum de %s';
  sDateTimeMin = 'La date est inf�rieure au minimum de %s';
  sNeedAllowNone = 'Vous devez �tre en mode ShowCheckBox pour d�finir cette date';
  sFailSetCalDateTime = 'Echec lors du param�trage de l''heure ou de la date du calendrier';
  sFailSetCalMaxSelRange = 'Echec lors du param�trage de l''�tendue de s�lection maximum';
  sFailSetCalMinMaxRange = 'Echec lors du param�trage de l''�tendue minimum/maximum du calendrier';
  sCalRangeNeedsMultiSelect = 'Une �tendue de date ne peut �tre utilis�e qu''en mode multis�lection';
  sFailsetCalSelRange = 'Echec lors du param�trage de l''�tendue s�lectionn�e du calendrier';

implementation

end.
