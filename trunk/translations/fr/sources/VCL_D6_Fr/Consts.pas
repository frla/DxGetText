
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1995-2001 Borland Software Corporation }
{                                                       }
{*******************************************************}

unit Consts;

interface

resourcestring
  SOpenFileTitle = 'Ouvrir';
  SCantWriteResourceStreamError = 'Impossible d''�crire dans un flux en lecture seule';
  SDuplicateReference = 'WriteObject appel� deux fois pour la m�me instance';
  SClassMismatch = 'La ressource %s est d''une classe incorrecte';
  SInvalidTabIndex = 'Indice d''onglet hors limites';
  SInvalidTabPosition = 'Position d''onglet incompatible avec le style d''onglet actuel';
  SInvalidTabStyle = 'Style d''onglet incompatible avec la position d''onglet actuelle';
  SInvalidBitmap = 'Image bitmap incorrecte';
  SInvalidIcon = 'Image ic�ne incorrecte';
  SInvalidMetafile = 'MetaFichier incorrect';
  SInvalidPixelFormat = 'Format de pixel incorrect';
  SInvalidImage = 'Image non valide';
  SBitmapEmpty = 'Bitmap vide';
  SScanLine = 'Indice ligne hors limites';
  SChangeIconSize = 'Impossible de modifier la taille d''une ic�ne';
  SOleGraphic = 'Op�ration incorrecte sur TOleGraphic';
  SUnknownExtension = 'Extension de fichier image inconnue (.%s)';
  SUnknownClipboardFormat = 'Format de Presse-papiers non support�';
  SOutOfResources = 'Ressources syst�me insuffisantes';
  SNoCanvasHandle = 'Le canevas ne permet pas de dessiner';
  SInvalidImageSize = 'Taille d''image incorrecte';
  STooManyImages = 'Trop d''images';
  SDimsDoNotMatch = 'Les dimensions de l''image ne correspondent pas � celles de la liste d''images';
  SInvalidImageList = 'ImageList incorrecte';
  SReplaceImage = 'Impossible de remplacer l''image';
  SImageIndexError = 'Indice ImageList incorrect';
  SImageReadFail = 'Erreur � la lecture des donn�es ImageList dans le flux';
  SImageWriteFail = 'Erreur � l''�criture des donn�es ImageList dans le flux';
  SWindowDCError = 'Erreur � la cr�ation du contexte p�riph�rique fen�tre';
  SClientNotSet = 'Client de TDrag non initialis�';
  SWindowClass = 'Erreur � la cr�ation de la classe fen�tre';
  SWindowCreate = 'Erreur � la cr�ation de fen�tre';
  SCannotFocus = 'Impossible de focaliser une fen�tre d�sactiv�e ou invisible';
  SParentRequired = 'Le contr�le ''%s'' n''a pas de fen�tre parente';
  SParentGivenNotAParent = 'Le parent donn� n''est pas un parent de ''%s''';
  SMDIChildNotVisible = 'Impossible de cacher une fiche enfant MDI';
  SVisibleChanged = 'Impossible de changer Visible dans OnShow ou OnHide';
  SCannotShowModal = 'Impossible de rendre modale une fen�tre visible';
  SScrollBarRange = 'Propri�t� barre de d�filement hors limites';
  SPropertyOutOfRange = 'Propri�t� %s hors limites';
  SMenuIndexError = 'Indice de menu hors limites';
  SMenuReinserted = 'Menu ins�r� deux fois';
  SMenuNotFound = 'Sous-menu pas dans le menu';
  SNoTimers = 'Pas assez de timers disponibles';
  SNotPrinting = 'L''imprimante n''imprime pas pour l''instant';
  SPrinting = 'Impression en cours';
  SPrinterIndexError = 'Indice imprimante hors limites';
  SInvalidPrinter = 'Imprimante s�lectionn�e incorrecte';
  SDeviceOnPort = '%s sur %s';
  SGroupIndexTooLow = 'GroupIndex ne peut �tre inf�rieur � celui de l''�l�ment de menu pr�c�dent';
  STwoMDIForms = 'Impossible d''avoir plus d''une fiche MDI par application';
  SNoMDIForm = 'Impossible de cr�er la fiche. Aucune fiche Non MDI active';
  SImageCanvasNeedsBitmap = 'Une image ne peut �tre modifi�e que si elle contient un bitmap';
  SControlParentSetToSelf = 'Un contr�le ne peut �tre son propre parent';
  SOKButton = 'OK';
  SCancelButton = 'Annuler';
  SYesButton = '&Oui';
  SNoButton = '&Non';
  SHelpButton = '&Aide';
  SCloseButton = '&Fermer';
  SIgnoreButton = '&Ignorer';
  SRetryButton = '&Retenter';
  SAbortButton = 'Abandon';
  SAllButton = '&Tous';

  SCannotDragForm = 'Impossible de glisser une fiche';
  SPutObjectError = 'PutObject � �l�ment ind�fini';
  SCardDLLNotLoaded = 'Impossible de charger CARDS.DLL';
  SDuplicateCardId = 'CardID dupliqu�';

  SDdeErr = 'Une erreur a �t� renvoy�e par DDE ($0%x)';
  SDdeConvErr = 'Erreur DDE - Conversation non �tablie ($0%x)';
  SDdeMemErr = 'Erreur apparue suite � un manque de m�moire DDE ($0%x)';
  SDdeNoConnect = 'Impossible de connecter la conversation DDE';

  SFB = 'TF';
  SFG = 'T';
  SBG = 'F';
  SOldTShape = 'Impossible de charger version ant�rieure de TShape';
  SVMetafiles = 'M�tafichiers';
  SVEnhMetafiles = 'M�tafichiers �volu�s';
  SVIcons = 'Ic�nes';
  SVBitmaps = 'Bitmaps';
  SGridTooLarge = 'Grille trop grande pour l''op�ration';
  STooManyDeleted = 'Trop de lignes ou colonnes supprim�es';
  SIndexOutOfRange = 'Indice de grille hors limites';
  SFixedColTooBig = 'Le nombre de colonnes fixes doit �tre inf�rieur au nombre de colonnes';
  SFixedRowTooBig = 'Le nombre de lignes fixes doit �tre inf�rieur au nombre de lignes';
  SInvalidStringGridOp = 'Impossible d''ins�rer ou de supprimer les lignes de la grille';
  SInvalidEnumValue = 'Valeur enum incorrecte';
  SInvalidNumber = 'Valeur num�rique incorrecte';
  SOutlineIndexError = 'Indice arborescence non trouv�';
  SOutlineExpandError = 'Le parent doit �tre d�velopp�';
  SInvalidCurrentItem = 'Valeur incorrecte pour l''�l�ment en cours';
  SMaskErr = 'Valeur d''entr�e incorrecte';
  SMaskEditErr = 'Valeur d''entr�e incorrecte. Utiliser Echap pour abandonner les modifications';
  SOutlineError = 'Indice arborescence incorrect';
  SOutlineBadLevel = 'Affectation de niveau incorrect';
  SOutlineSelection = 'S�lection incorrecte';
  SOutlineFileLoad = 'Erreur chargement de fichier';
  SOutlineLongLine = 'Ligne trop longue';
  SOutlineMaxLevels = 'Profondeur maximum arborescence d�pass�e';

  SMsgDlgWarning = 'Avertissement';
  SMsgDlgError = 'Erreur';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Confirmation';
  SMsgDlgYes = '&Oui';
  SMsgDlgNo = '&Non';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Annuler';
  SMsgDlgHelp = '&Aide';
  SMsgDlgHelpNone = 'Aucune aide disponible';
  SMsgDlgHelpHelp = 'Aide';
  SMsgDlgAbort = '&Abandonner';
  SMsgDlgRetry = '&Retenter';
  SMsgDlgIgnore = '&Ignorer';
  SMsgDlgAll = '&Tous';
  SMsgDlgNoToAll = 'Non &pour tout';
  SMsgDlgYesToAll = 'O&ui pour tout';

  SmkcBkSp = 'RetArr';
  SmkcTab = 'Tab';
  SmkcEsc = 'Echap';
  SmkcEnter = 'Entr�e';
  SmkcSpace = 'Espace';
  SmkcPgUp = 'PagePr�c';
  SmkcPgDn = 'PageSuiv';
  SmkcEnd = 'Fin';
  SmkcHome = 'Origine';
  SmkcLeft = 'Gauche';
  SmkcUp = 'Haut';
  SmkcRight = 'Droite';
  SmkcDown = 'Bas';
  SmkcIns = 'Ins';
  SmkcDel = 'Suppr';
  SmkcShift = 'Maj+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(inconnu)';
  srNone = '(vide)';
  SOutOfRange = 'La valeur doit �tre comprise entre %d et %d';

  SDateEncodeError = 'Argument incorrect pour l''encodage de date';
  SDefaultFilter = 'Tous les fichiers (*.*)|*.*';
  sAllFilter = 'Tous';
  SNoVolumeLabel = ': [ Pas de nom de volume ]';
  SInsertLineError = 'Impossible d''ins�rer une ligne';

  SConfirmCreateDir = 'Le r�pertoire sp�cifi� n''existe pas. Le cr�er ?';
  SSelectDirCap = 'S�lection du r�pertoire';
  SDirNameCap = '&Nom de r�pertoire :';
  SDrivesCap = '&Lecteurs :';
  SDirsCap = '&R�pertoires :';
  SFilesCap = '&Fichiers : (*.*)';
  SNetworkCap = 'R�&seau...';

  SColorPrefix = 'Couleurs';               //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP';      //!! obsolete - delete in 5.0

  SInvalidClipFmt = 'Format de Presse-papiers incorrect';
  SIconToClipboard = 'Le Presse-papiers ne supporte pas les ic�nes';
  SCannotOpenClipboard = 'Impossible d''ouvrir le Presse-papiers';

  SDefault = 'Default';

  SInvalidMemoSize = 'Le texte d�passe la capacit� du m�mo';
  SCustomColors = 'Couleurs personnalis�es';
  SInvalidPrinterOp = 'Op�ration non support�e par l''imprimante s�lectionn�e';
  SNoDefaultPrinter = 'Aucune imprimante par d�faut s�lectionn�e';

  SIniFileWriteError = 'Impossible d''�crire dans %s';

  SBitsIndexError = 'Indice de bits hors limites';

  SUntitled = '(sans titre)';

  SInvalidRegType = 'Type de donn�es incorrect pour ''%s''';

  SUnknownConversion = 'Extension de fichier de conversion RichEdit inconnue (.%s)';
  SDuplicateMenus = 'Le menu ''%s'' est d�j� utilis� par une autre fiche';

  SPictureLabel = 'Image :';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'Pr�visualiser';

  SCannotOpenAVI = 'Impossible d''ouvrir l''AVI';

  SNotOpenErr = 'Aucun p�riph�rique MCI ouvert';
  SMPOpenFilter = 'Tous les fichiers (*.*)|*.*|Fichiers wave (*.wav)|*.wav|Fichiers Midi '+
'(*.mid)|*.mid|Vid�o pour Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'Vid�o AVI';
  SMCICDAudio = 'CD Audio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'Vid�o num�rique';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Autre';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'S�quenceur';
  SMCIVCR = 'Magn�toscope';
  SMCIVideodisc = 'Vid�odisque';
  SMCIWaveAudio = 'Audio wav';
  SMCIUnknownError = 'Code d''erreur inconnu';

  SBoldItalicFont = 'Gras Italique';
  SBoldFont = 'Gras';
  SItalicFont = 'Italique';
  SRegularFont = 'Normal';

  SPropertiesVerb = 'Propri�t�s';

  SServiceFailed = 'Le service a �chou� pour %s : %s';
  SExecute = 'ex�cuter';
  SStart = 'lancer';
  SStop = 'arr�ter';
  SPause = 'pause';
  SContinue = 'continuer';
  SInterrogate = 'interroger';
  SShutdown = 'terminer';
  SCustomError = 'Le service a �chou� dans le message personnalis�e (%d) : %s';
  SServiceInstallOK = 'Service install� avec succ�s';
  SServiceInstallFailed = 'Le service "%s" a �chou� pendant son installation avec l''erreur : "%s"';
  SServiceUninstallOK = 'Service d�sinstall� avec succ�s';
  SServiceUninstallFailed = 'Le service "%s" a �chou� pendant sa d�sinstallation avec l''erreur : "%s"';

  SInvalidActionRegistration = 'Enregistrement d''action incorrecte';
  SInvalidActionUnregistration = 'D�senregistrement d''action incorrecte';
  SInvalidActionEnumeration = 'Enum�ration d''action incorrecte';
  SInvalidActionCreation = 'Cr�ation d''action incorrecte';

  SDockedCtlNeedsName = 'Le composant ancr� doit avoir un nom';
  SDockTreeRemoveError = 'Erreur � la suppression du contr�le de l''arbre ancr�';
  SDockZoneNotFound = ' - Zone d''ancrage non trouv�e';
  SDockZoneHasNoCtl = ' - La zone d''ancrage n''a pas de contr�le';

  SAllCommands = 'Toutes les commandes';

  SDuplicateItem = 'La liste n''autorise pas les doublons ($0%x)';

  STextNotFound = 'Texte non trouv� : "%s"';
  SBrowserExecError = 'Aucun navigateur par d�faut n''a �t� sp�cifi�';

  SColorBoxCustomCaption = 'Personnaliser...';

  SMultiSelectRequired = 'Le mode multis�lection doit �tre activ� pour cette fonction.';

  SKeyCaption = 'Cl�';
  SValueCaption = 'Valeur';
  SKeyConflict = 'Une cl� nomm�e "%s" existe d�j�';
  SKeyNotFound = 'Cl� "%s" introuvable';
  SNoColumnMoving = 'goColMoving n''est pas une option prise en charge.';
  SNoEqualsInKey = 'La cl� ne doit pas contenir de signe �gal ("=")';

  SSendError = 'Erreur � l''envoi du courrier';
  SAssignSubItemError = 'Impossible d''affecter un sous-�l�ment � une barre d''actions lorsque l''un de ses parents est d�j� affect� � une barre d''actions';
  SDeleteItemWithSubItems = 'L''�l�ment %s comporte des sous-�l�ments ; le supprimer quand m�me ?';
  SMoreButtons = 'Boutons suppl�mentaires';
  SErrorDownloadingURL = 'Erreur de t�l�chargement de l''URL : %s';
  SUrlMonDllMissing = 'Impossible de charger %s';
  SAllActions = '(Toutes les actions)';
  SNoCategory = '(pas de cat�gorie)';
  SExpand = 'Etendre';
  SErrorSettingPath = 'Erreur de d�finition du chemin : "%s"';
  SLBPutError = 'Tentative de placement des �l�ments dans une zone de liste de styles virtuelle';
  SErrorLoadingFile = 'Erreur lors du chargement du fichier de param�tres pr�c�demment enregistr� : %s'#13'Souhaitez-vous le supprimer ?';
  SResetUsageData = 'R�initialiser toutes les donn�es d''utilisation ?';
  SFileRunDialogTitle = 'Ex�cuter';
  SNoName = '(pas de nom)';      
  SErrorActionManagerNotAssigned = 'ActionManager doit �tre affect� en premier lieu.';
  SAddRemoveButtons = '&Ajouter ou supprimer des boutons';
  SResetActionToolBar = 'R�initialiser la barre d''outils';
  SCustomize = '&Personnaliser';
  SSeparator = 'S�parateur';
  SCirularReferencesNotAllowed = 'Les r�f�rences circulaires ne sont pas autoris�es.';
  SCannotHideActionBand = '%s ne permet pas la dissimulation';
  SErrorSettingCount = 'Erreur lors de la d�finition de la valeur %s.Count';
  SListBoxMustBeVirtual = 'Le style de la bo�te de liste (%s) doit �tre virtuel afin de pouvoir d�finir la valeur Count';
  SUnableToSaveSettings = 'Impossible de sauvegarder les param�tres';
  SRestoreDefaultSchedule = 'Voulez-vous r�initialiser au planning de priorit� par d�faut ?';
      
implementation

end.
