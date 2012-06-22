
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
  SOpenFileTitle = '�ffnen';
  SCantWriteResourceStreamError = 'In einen zum Lesen ge�ffneten Ressourcen-Stream kann nicht geschrieben werden';
  SDuplicateReference = 'Zweimaliger Aufruf von WriteObject f�r die gleiche Instanz';
  SClassMismatch = 'Ressource %s hat die falsche Klasse';
  SInvalidTabIndex = 'Registerindex au�erhalb des zul�ssigen Bereichs';
  SInvalidTabPosition = 'Position des Register ist nicht mit dem aktuellen Register-Stil kompatibel.';
  SInvalidTabStyle = 'Register-Stil ist mit der aktuellen Position nicht kompatibel.';
  SInvalidBitmap = 'Bitmap ist ung�ltig';
  SInvalidIcon = 'Ung�ltiges Symbol';
  SInvalidMetafile = 'Metadatei ist ung�ltig';
  SInvalidPixelFormat = 'Ung�ltiges Pixel-Format';
  SInvalidImage = 'Ung�ltiges Bild';
  SBitmapEmpty = 'Bitmap ist leer';
  SScanLine = 'Bereichs�berschreitung bei Zeilenindex';
  SChangeIconSize = 'Die Gr��e eines Symbols kann nicht ge�ndert werden';
  SOleGraphic = 'Ung�ltige Operation f�r TOleGraphic';
  SUnknownExtension = 'Unbekannte Bilddateierweiterung (.%s)';
  SUnknownClipboardFormat = 'Format der Zwischenablage wird nicht unterst�tzt';
  SOutOfResources = 'Systemressourcen ersch�pft.';
  SNoCanvasHandle = 'Leinwand/Bild erlaubt kein Zeichnen';
  SInvalidImageSize = 'Ung�ltige Bildgr��e';
  STooManyImages = 'Zu viele Bilder';
  SDimsDoNotMatch = 'Bildgr��e und Bildlistengr��e stimmen nicht �berein';
  SInvalidImageList = 'Ung�ltige Bilderliste';
  SReplaceImage = 'Bild kann nicht ersetzt werden';
  SImageIndexError = 'Ung�ltiger Bilderlistenindex';
  SImageReadFail = 'ImageList-Daten konnten nicht aus dem Stream gelesen werden';
  SImageWriteFail = 'ImageList-Daten konnten nicht in den Stream geschrieben werden';
  SWindowDCError = 'Fehler beim Erstellen des Fenster-Ger�tekontexts';
  SClientNotSet = 'Client von TDrag wurde nicht initialisiert';
  SWindowClass = 'Fehler beim Erzeugen einer Fensterklasse';
  SWindowCreate = 'Fehler beim Erzeugen eines Fensters';
  SCannotFocus = 'Deaktiviertes oder unsichtbares Fenster kann den Fokus nicht erhalten';
  SParentRequired = 'Element ''%s'' hat kein �bergeordnetes Fenster';
  SParentGivenNotAParent = 'Das angegebene �bergeordnete Element ist kein �bergeordnetes Element von ''%s''';
  SMDIChildNotVisible = 'Untergeordnetes MDI-Formular kann nicht verborgen werden';
  SVisibleChanged = 'Eigenschaft Visible kann in OnShow oder OnHide nicht ver�ndert werden';
  SCannotShowModal = 'Aus einem sichtbaren Fenster kann kein modales gemacht werden';
  SScrollBarRange = 'Eigenschaft Scrollbar au�erhalb des zul�ssigen Bereichs';
  SPropertyOutOfRange = 'Eigenschaft %s au�erhalb des g�ltigen Bereichs';
  SMenuIndexError = 'Men�index au�erhalb des zul�ssigen Bereichs';
  SMenuReinserted = 'Men� zweimal eingef�gt';
  SMenuNotFound = 'Untermen� ist nicht im Men�';
  SNoTimers = 'Nicht gen�gend Timer verf�gbar';
  SNotPrinting = 'Der Drucker druckt aktuell nicht';
  SPrinting = 'Druckvorgang l�uft';
  SPrinterIndexError = 'Druckerindex au�erhalb des zul�ssigen Bereichs';
  SInvalidPrinter = 'Ausgew�hlter Drucker ist ung�ltig';
  SDeviceOnPort = '%s an %s';
  SGroupIndexTooLow = 'GroupIndex kann nicht kleiner sein als der GroupIndex eines vorhergehenden Men�elementes';
  STwoMDIForms = 'Es ist nur ein MDI-Formular pro Anwendung m�glich';
  SNoMDIForm = 'Formular kann nicht erstellt werden. Zur Zeit sind keine MDI-Formulare aktiv';
  SImageCanvasNeedsBitmap = 'Bild kann nur ge�ndert werden, wenn es ein Bitmap enth�lt';
  SControlParentSetToSelf = 'Steuerelement kann nicht sich selbst als Vorfahr haben';
  SOKButton = 'OK';
  SCancelButton = 'Abbrechen';
  SYesButton = '&Ja';
  SNoButton = '&Nein';
  SHelpButton = '&Hilfe';
  SCloseButton = 'S&chlie�en';
  SIgnoreButton = '&Ignorieren';
  SRetryButton = '&Wiederholen';
  SAbortButton = 'Abbrechen';
  SAllButton = '&Alle';

  SCannotDragForm = 'Formulare k�nnen nicht gezogen werden';
  SPutObjectError = 'PutObject auf undefiniertes Element';
  SCardDLLNotLoaded = 'CARDS.DLL kann nicht geladen werden';
  SDuplicateCardId = 'Doppelte CardId gefunden';

  SDdeErr = 'Vom DDE wurde ein Fehler zur�ckgegeben ($0%x)';
  SDdeConvErr = 'DDE-Fehler - Konversation konnte nicht eingerichtet werden ($0%x)';
  SDdeMemErr = 'Wegen Speichermangel bei DDE ist ein Fehler aufgetreten ($0%x).';
  SDdeNoConnect = 'DDE-Konversation konnte nicht verbunden werden.';

  SFB = 'VH';
  SFG = 'VG';
  SBG = 'HG';
  SOldTShape = '�ltere Version von TShape kann nicht geladen werden';
  SVMetafiles = 'Metadateien';
  SVEnhMetafiles = 'Erweiterte Metadateien';
  SVIcons = 'Symbole';
  SVBitmaps = 'Bitmaps';
  SGridTooLarge = 'Gitter zu gro� f�r Operation';
  STooManyDeleted = 'Zu viele Zeilen oder Spalten gel�scht';
  SIndexOutOfRange = 'Gitterindex au�erhalb des zul�ssigen Bereichs';
  SFixedColTooBig = 'Die Anzahl fester Spalten mu� kleiner als die Spaltenanzahl sein';
  SFixedRowTooBig = 'Die Anzahl fester Zeilen mu� kleiner als die Zeilenanzahl sein';
  SInvalidStringGridOp = 'Es k�nnen keine Zeilen des Tabellengitters gel�scht oder eingef�gt werden';
  SInvalidEnumValue = 'Ung�ltiger Enum-Wert';
  SInvalidNumber = 'Ung�ltiger numerischer Wert';
  SOutlineIndexError = 'Gliederungsindex nicht gefunden';
  SOutlineExpandError = '�bergeordneter Knoten mu� expandiert sein';
  SInvalidCurrentItem = 'Ung�ltiger Wert';
  SMaskErr = 'Ung�ltiger Eingabewert';
  SMaskEditErr = 'Ung�ltiger Eingabewert. Mit der Taste ESC machen Sie die �nderungen r�ckg�ngig.';
  SOutlineError = 'Ung�ltiger Gliederungsindex';
  SOutlineBadLevel = 'Ung�ltige Zuweisung von Ebenen';
  SOutlineSelection = 'Ung�ltige Auswahl';
  SOutlineFileLoad = 'Fehler beim Laden der Datei';
  SOutlineLongLine = 'Zeile zu lang';
  SOutlineMaxLevels = 'Maximale Gliederungstiefe �berschritten';

  SMsgDlgWarning = 'Warnung';
  SMsgDlgError = 'Fehler';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Best�tigung';
  SMsgDlgYes = '&Ja';
  SMsgDlgNo = '&Nein';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Abbrechen';
  SMsgDlgHelp = '&Hilfe';
  SMsgDlgHelpNone = 'Keine Hilfe verf�gbar';
  SMsgDlgHelpHelp = 'Hilfe';
  SMsgDlgAbort = '&Abbrechen';
  SMsgDlgRetry = '&Wiederholen';
  SMsgDlgIgnore = '&Ignorieren';
  SMsgDlgAll = '&Alle';
  SMsgDlgNoToAll = '&Alle Nein';
  SMsgDlgYesToAll = 'A&lle Ja';

  SmkcBkSp = 'R�ck';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Eingabe';
  SmkcSpace = 'Leertaste';
  SmkcPgUp = 'BildAuf';
  SmkcPgDn = 'BildAb';
  SmkcEnd = 'Ende';
  SmkcHome = 'Pos1';
  SmkcLeft = 'Links';
  SmkcUp = 'Nach oben';
  SmkcRight = 'Rechts';
  SmkcDown = 'Nach unten';
  SmkcIns = 'Einfg';
  SmkcDel = 'Entf';
  SmkcShift = 'Umsch+';
  SmkcCtrl = 'Strg+';
  SmkcAlt = 'Alt+';

  srUnknown = '(Unbekannt)';
  srNone = '(Leer)';
  SOutOfRange = 'Wert mu� zwischen %d und %d liegen';

  SDateEncodeError = 'Ung�ltiges Argument zum Codieren des Datums';
  SDefaultFilter = 'Alle Dateien (*.*)|*.*';
  sAllFilter = 'Alle';
  SNoVolumeLabel = ': [ - Ohne Namen - ]';
  SInsertLineError = 'Zeile kann nicht eingef�gt werden';

  SConfirmCreateDir = 'Das angegebene Verzeichnis existiert nicht. Soll es angelegt werden?';
  SSelectDirCap = 'Verzeichnis ausw�hlen';
  SDirNameCap = 'Verzeichnis&name:';
  SDrivesCap = '&Laufwerke:';
  SDirsCap = '&Verzeichnisse:';
  SFilesCap = '&Dateien: (*.*)';
  SNetworkCap = 'Ne&tzwerk...';

  SColorPrefix = 'Farben';               //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP';      //!! obsolete - delete in 5.0

  SInvalidClipFmt = 'Ung�ltiges Format der Zwischenablage';
  SIconToClipboard = 'Zwischenablage unterst�tzt keine Symbole';
  SCannotOpenClipboard = 'Zwischenablage kann nicht ge�ffnet werden';

  SDefault = 'Standard';

  SInvalidMemoSize = 'Text �berschreitet Memo-Kapazit�t';
  SCustomColors = 'Selbstdefinierte Farben';
  SInvalidPrinterOp = 'Operation auf ausgew�hltem Drucker nicht verf�gbar';
  SNoDefaultPrinter = 'Zur Zeit ist kein Standarddrucker gew�hlt';

  SIniFileWriteError = 'In %s kann nicht geschrieben werden';

  SBitsIndexError = 'Bits-Index au�erhalb des zul�ssigen Bereichs';

  SUntitled = '(Unbenannt)';

  SInvalidRegType = 'Ung�ltiger Datentyp f�r ''%s''';

  SUnknownConversion = 'Unbekannte Dateierweiterung f�r RichEdit-Konvertierung (.%s)';
  SDuplicateMenus = 'Men� ''%s'' wird bereits von einem anderen Formular benutzt';

  SPictureLabel = 'Grafik:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'Vorschau';

  SCannotOpenAVI = 'AVI kann nicht ge�ffnet werden';

  SNotOpenErr = 'Kein MCI-Ger�t ge�ffnet';
  SMPOpenFilter = 'Alle Dateien (*.*)|*.*|Wave-Dateien (*.WAV)|*.WAV|Midi-Dateien (*.MID)|*.MID|Video f�r Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Andere';
  SMCIOverlay = '�berlagert';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Unbekannter Fehler-Code';

  SBoldItalicFont = 'Fett kursiv';
  SBoldFont = 'Fett';
  SItalicFont = 'Kursiv';
  SRegularFont = 'Normal';

  SPropertiesVerb = 'Eigenschaften';

  SServiceFailed = 'Service fehlgeschlagen bei %s:%s';
  SExecute = 'execute';
  SStart = 'start';
  SStop = 'stop';
  SPause = 'Pause';
  SContinue = 'Weiter';
  SInterrogate = 'interrogate';
  SShutdown = 'shutdown';
  SCustomError = 'Service fehlgeschlagen in selbstdef. Meldung (%d): %s';
  SServiceInstallOK = 'Service erfolgreich installiert';
  SServiceInstallFailed = 'Service "%s" konnte nicht installiert werden; Fehler: "%s"';
  SServiceUninstallOK = 'Service erfolgreich deinstalliert';
  SServiceUninstallFailed = 'Service "%s" konnte nicht deinstalliert werden; Fehler: "%s"';

  SInvalidActionRegistration = 'Ung�ltige Aktionsregistrierung';
  SInvalidActionUnregistration = 'Ung�ltige Aufhebung der Registrierung der Aktion';
  SInvalidActionEnumeration = 'Ung�ltige Aktionsaufz�hlung';
  SInvalidActionCreation = 'Ung�ltige Aktionserstellung';

  SDockedCtlNeedsName = 'Angedocktes Steuerelement mu� einen Namen haben.';
  SDockTreeRemoveError = 'Fehler beim Entfernen des Steuerelements aus der Andock-Hierarchie';
  SDockZoneNotFound = ' - Andockzone nicht gefunden';
  SDockZoneHasNoCtl = ' - Andockzone besitzt kein Steuerelement';

  SAllCommands = 'Alle Befehle';

  SDuplicateItem = 'Liste gestattet keine doppelten Eintr�ge ($0%x)';

  STextNotFound = 'Text nicht gefunden: "%s"';
  SBrowserExecError = 'Es ist kein Standard-Browser eingetragen';

  SColorBoxCustomCaption = 'Individuell...';

  SMultiSelectRequired = 'Mehrfachauswahl mu� f�r diese Funktion aktiviert sein';

  SKeyCaption = 'Schl�ssel';
  SValueCaption = 'Wert';
  SKeyConflict = 'Schl�ssel mit der Bezeichnung "%s" existiert bereits';
  SKeyNotFound = 'Taste "%s" nicht gefunden';
  SNoColumnMoving = 'goColMoving wird nicht unterst�tzt';
  SNoEqualsInKey = 'Schl�ssel darf keine Gleichheitszeichen ("=") enthalten';

  SSendError = 'Fehler beim Versenden von Mail';
  SAssignSubItemError = 'Unterelement kann nicht zu Aktionsleiste hinzugef�gt werden, wenn ein �bergeordnetes Element bereits einer Aktionsleiste zugewiesen ist';
  SDeleteItemWithSubItems = 'Element %s hat Unterelemente, trotzdem l�schen?';
  SMoreButtons = 'Weitere Schaltfl�chen';
  SErrorDownloadingURL = 'Fehler beim Download von URL: %s';
  SUrlMonDllMissing = '%s kann nicht geladen werden';
  SAllActions = '(Alle Aktionen)';
  SNoCategory = '(Keine Kategorie)';
  SExpand = 'Einblenden';
  SErrorSettingPath = 'Fehler beim Festlegen des Pfades: "%s"';
  SLBPutError = 'Versuch, Elemente in ein virtuelles Stillistenfeld einzuf�gen';
  SErrorLoadingFile = 'Fehler beim Laden der zuvor gespeicherten Einstellungsdatei: %s'#13'Soll die Datei gel�scht werden?';
  SResetUsageData = 'Alle verwendeten Daten zur�cksetzen';
  SFileRunDialogTitle = 'Start';
  SNoName = '(Kein Name)';      
  SErrorActionManagerNotAssigned = 'ActionManager mu� zuerst zugewiesen werden';
  SAddRemoveButtons = '&Schaltfl�chen hinzuf�gen oder entfernen';
  SResetActionToolBar = 'Symbolleiste zur�cksetzen';
  SCustomize = 'A&npassen';
  SSeparator = 'Separator';
  SCirularReferencesNotAllowed = 'Zirkul�re Verweise sind nicht gestattet';
  SCannotHideActionBand = '%s kann nicht verborgen werden';
  SErrorSettingCount = 'Fehler beim Setzen von %s.Count';
  SListBoxMustBeVirtual = 'Stil des Listenfeldes (%s) mu� virtuell sein, damit Count gesetzt werden kann';
  SUnableToSaveSettings = 'Einstellungen konnten nicht gespeichert werden';
  SRestoreDefaultSchedule = 'Wollen Sie auf die Standard-Priorit�tenverteilung zur�cksetzen?';
      
implementation

end.
