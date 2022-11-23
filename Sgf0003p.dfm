object Dlg_ccusto: TDlg_ccusto
  Left = 142
  Top = 99
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa Centro de Custo'
  ClientHeight = 355
  ClientWidth = 516
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 78
    Top = 269
    Width = 362
    Height = 62
    Brush.Color = clTeal
    Pen.Color = clWhite
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 87
    Top = 278
    Width = 88
    Height = 13
    Caption = 'Texto a Pesquisar:'
    Transparent = True
  end
  object OKBtn: TButton
    Left = 33
    Top = 131
    Width = 99
    Height = 25
    Caption = '&OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 3
    Top = 2
    Width = 508
    Height = 259
    BevelInner = bvLowered
    Color = clTeal
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 8
      Top = 7
      Width = 492
      Height = 243
      DataSource = ds_pesquisa
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 349
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FLG_E_S'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo (E/S)'
          Width = 56
          Visible = True
        end>
    end
  end
  object Edit_pesquisa: TEdit
    Left = 89
    Top = 293
    Width = 339
    Height = 24
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = Edit_pesquisaChange
    OnKeyDown = Edit_pesquisaKeyDown
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 336
    Width = 516
    Height = 19
    Color = clSilver
    Panels = <
      item
        Alignment = taCenter
        Text = '[Enter] = Confirmar'
        Width = 120
      end
      item
        Alignment = taCenter
        Text = '[Esc] = Cancela'
        Width = 120
      end
      item
        Width = 50
      end>
    ExplicitTop = 337
  end
  object ds_pesquisa: TDataSource
    AutoEdit = False
    DataSet = SQL_pesquisa
    Left = 69
    Top = 83
  end
  object SQL_pesquisa: TIBQuery
    Database = Dm.IBD_Financ
    Transaction = Dm.IBT_Financ
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 37
    Top = 83
  end
end
