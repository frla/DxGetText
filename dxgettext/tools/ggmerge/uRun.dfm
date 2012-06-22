object FormRun: TFormRun
  Left = 256
  Top = 186
  ActiveControl = EditTemplate
  BorderStyle = bsDialog
  Caption = 'Merge translation with new translation template'
  ClientHeight = 198
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    464
    198)
  PixelsPerInch = 96
  TextHeight = 14
  object ButtonGo: TButton
    Left = 184
    Top = 168
    Width = 105
    Height = 25
    Caption = '&Merge'
    Default = True
    TabOrder = 7
    OnClick = ButtonGoClick
  end
  object EditTranslation: TLabeledEdit
    Left = 8
    Top = 24
    Width = 423
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 73
    EditLabel.Height = 14
    EditLabel.Caption = 'Translation file:'
    TabOrder = 0
  end
  object EditTemplate: TLabeledEdit
    Left = 8
    Top = 64
    Width = 423
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 99
    EditLabel.Height = 14
    EditLabel.Caption = 'Translation template:'
    TabOrder = 2
  end
  object ButtonChooseTemplate: TButton
    Left = 430
    Top = 64
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 3
    OnClick = ButtonChooseTemplateClick
  end
  object ButtonChooseTranslation: TButton
    Left = 430
    Top = 24
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 1
    OnClick = ButtonChooseTranslationClick
  end
  object CheckBoxCreateBackup: TCheckBox
    Left = 8
    Top = 96
    Width = 431
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Create backup file of old translation (recommended)'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheckBoxSaveSettings: TCheckBox
    Left = 8
    Top = 144
    Width = 431
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Remember settings'
    TabOrder = 6
  end
  object CheckBoxNonAscii: TCheckBox
    Left = 8
    Top = 120
    Width = 431
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Support non-ascii msgid values (not recommended)'
    TabOrder = 5
  end
  object XPManifest: TXPManifest
    Left = 120
    Top = 32
  end
end
