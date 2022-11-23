object Dlg_Socio: TDlg_Socio
  Left = 688
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema para Gerenciamento do Educand'#225'rio'
  ClientHeight = 356
  ClientWidth = 514
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
  object Shape3: TShape
    Left = 19
    Top = 231
    Width = 131
    Height = 96
    Brush.Color = clGray
    Shape = stRoundRect
  end
  object Shape1: TShape
    Left = 19
    Top = 35
    Width = 476
    Height = 182
    Brush.Color = clGray
    Shape = stRoundRect
  end
  object Bevel4: TBevel
    Left = 74
    Top = 216
    Width = 3
    Height = 16
    Shape = bsLeftLine
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 149
    Top = 276
    Width = 43
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 368
    Top = 306
    Width = 3
    Height = 38
    Shape = bsLeftLine
    Style = bsRaised
  end
  object SB_Nova: TSpeedButton
    Left = 187
    Top = 221
    Width = 176
    Height = 20
    Caption = ' Novo S'#243'cio - F5'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    ParentFont = False
    Transparent = False
    Visible = False
    OnClick = SB_NovaClick
  end
  object Panel1: TPanel
    Left = 184
    Top = 241
    Width = 311
    Height = 74
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clGray
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 29
      Top = 10
      Width = 115
      Height = 16
      AutoSize = False
      Caption = 'Texto a Pesquisar: '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 5
      Top = 8
      Width = 21
      Height = 21
      Picture.Data = {
        07544269746D617076050000424D760500000000000036000000280000001500
        000015000000010018000000000040050000C40E0000C40E0000000000000000
        0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB707070707070A4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFB8F888070707090686FA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFB50A8EF3090F06F70A0C08870BF5830C0583F
        B0502080300F5F504FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFB50A8EF4FA8F04F68AFAF889FC08870C06040
        CF604FD06850BF583070381FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBB0500FB04820A0503F40A8FF4F68AF6F70A0BF7060
        A04010B04820BF5830C0604080300F5F504FA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBB0500FB0502090300090300050A8EF3090F04F68AFAF889F
        BF70609F3000A04010B0502FC0583F80300FA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFB9030009F3800A03800AF4000AF480050A8EF5FB8F06F70A0
        80686FA05820A07870CFA090E0C8A0D0B0A05F504F606060A4DEFBA4DEFBA4DE
        FB00A4DEFBB0500FA03800A03800AF4800B04800BF50000F782F50A8EFB0A8AF
        8F8880CFA090FFE0AFFFF8CFFFF8D0FFF8D0C090906F5050A4DEFBA4DEFBA4DE
        FB00A4DEFBB0500FAF4800B05000CF6000CF6000CF680000700000800090886F
        EFC09FFFF0BFFFE8B0FFF8D0FFF8EFFFF8EFFFF8FFFFF8EF5F504FA4DEFBA4DE
        FB00CF6000AF4000BF5000C06000CF6800D06800CF7800009000008000C09090
        FFD8AFFFE0AFFFF0BFFFF8D0FFF8EFFFF8FFFFF8FFFFF8DF6F5050707070A4DE
        FB00CF6000B05000CF6000D06800CF780050981020980F708000708000F0D0AF
        FFF0CFFFD8AFFFE8B0FFF8D0FFF8E0FFF8EFFFF8E0FFF8D0B0807F6F686FA4DE
        FB00CF6000C05800D06800DF70000FA0100FA0107F980FAFA820FF9000EFC8A0
        FFF0CFFFD8A0FFE0AFFFF8CFFFF8DFFFF8DFFFF8DFFFF8D0B0807F707070A4DE
        FB00CF6000CF6000DF700050981010B03010A82F1FB03FAFA820EFB040DFB89F
        FFF0CFFFE0AFFFD8AFFFF0BFFFF8C0FFF8CFFFF8C0FFF8CF90686F6F686FA4DE
        FB00A4DEFBCF6800DF78005098101FB0302FC0502FC05F3FC05FA0D070CFA090
        FFF0C0FFF8EFF0F0E0FFE0AFFFE0AFFFE0B0FFF0BFFFF0BF80686FA4DEFBA4DE
        FB00A4DEFBD0802020A8201FB0302FC86040D06F90D07F50D07F50D07FFFD880
        CF9880FFF8FFFFF8F0FFF0C0FFE8B0FFF0C0FFD0A0C09080A4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFB1FB03020B84040D06F50D07FFFE09F8FE89FCFF0C0D0D88F
        DFC86FD0C0A0FFF0C0FFF0CFFFF0BFFFE8B0B0807FAF889FA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFB60D0702FC05050D07F80E090AFF0B0AFF0B0AFF0B05FD07F
        2FC86020A820CF8800D0781F80602F3F7800A4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFB90B84F5FD07F90D07FD0D88FAFF0B0D0D88F50D070
        2FC86020A820E09810E07800DF7800E09810A4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFB70D8806FC86090D07F80E0906FD88F30C860
        2FC05010A82F7F980FF09810A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA0D07070D88050D07070B850
        2FC05050B84FAFA820A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB00}
    end
  end
  object OKBtn: TButton
    Left = 33
    Top = 133
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
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 29
    Top = 43
    Width = 456
    Height = 162
    Color = clSilver
    DataSource = ds_pesquisa
    FixedColor = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Color = clBtnShadow
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = ' Nome'
        Title.Color = clBtnShadow
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 358
        Visible = True
      end>
  end
  object Edit_pesquisa: TEdit
    Left = 188
    Top = 278
    Width = 300
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    OnChange = Edit_pesquisaChange
    OnKeyDown = Edit_pesquisaKeyDown
  end
  object RG_ordem: TRadioGroup
    Left = 24
    Top = 234
    Width = 120
    Height = 83
    Caption = ' Ordem Pesquisa: '
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ItemIndex = 1
    Items.Strings = (
      '&1 - C'#243'digo'
      '&2 - Nome')
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    OnClick = RG_ordemClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 514
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
  end
  object DBNavigator1: TDBNavigator
    Left = 371
    Top = 219
    Width = 124
    Height = 20
    DataSource = ds_pesquisa
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Flat = True
    TabOrder = 6
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 26
    Align = alTop
    Caption = 'Pesquisa de Associados'
    Color = 3947580
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object ds_pesquisa: TDataSource
    AutoEdit = False
    DataSet = SQL_pesquisa
    Left = 45
    Top = 173
  end
  object SQL_pesquisa: TIBQuery
    Database = Dm.IBD_SgEdu
    Transaction = Dm.IBT_SgEdu
    AfterOpen = SQL_pesquisaAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 13
    Top = 173
  end
end
