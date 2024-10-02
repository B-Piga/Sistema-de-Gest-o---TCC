object Sg_0013: TSg_0013
  Left = 390
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema para Gerenciamento Acqua Nad'
  ClientHeight = 544
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 531
    Top = 118
    Width = 66
    Height = 3
    Shape = bsTopLine
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 634
    Top = 183
    Width = 4
    Height = 60
    Shape = bsLeftLine
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 531
    Top = 376
    Width = 66
    Height = 3
    Shape = bsTopLine
    Style = bsRaised
  end
  object Bevel5: TBevel
    Left = 274
    Top = 183
    Width = 4
    Height = 60
    Shape = bsLeftLine
    Style = bsRaised
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 36
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    Caption = ' Fechamento de Caixas -'
    Color = 5980672
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Lbl_Codigo: TLabel
      Left = 259
      Top = 8
      Width = 115
      Height = 24
      Caption = 'Lbl_Codigo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Pan_Dados: TPanel
    Left = 10
    Top = 44
    Width = 536
    Height = 157
    BevelInner = bvLowered
    Color = 5980672
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 142
      Top = 96
      Width = 76
      Height = 16
      Caption = 'Funcion'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 28
      Width = 88
      Height = 16
      Caption = 'Data Abertura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 143
      Top = 28
      Width = 89
      Height = 16
      Caption = 'Hora Abertura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 271
      Top = 28
      Width = 88
      Height = 16
      Caption = 'Data Fecham.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 399
      Top = 28
      Width = 89
      Height = 16
      Caption = 'Hora Fecham.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SB_Func: TsSpeedButton
      Left = 496
      Top = 117
      Width = 20
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      NumGlyphs = 2
    end
    object DBEdit_DTAbertura: TDBEdit
      Left = 15
      Top = 48
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'DT_ABERTURA'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 0
    end
    object DBEdit_HrAbertura: TDBEdit
      Left = 143
      Top = 48
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'HR_ABERTURA'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 1
    end
    object DBEdit_DTFechamento: TDBEdit
      Left = 266
      Top = 48
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'DT_FECHAMENTO'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 2
    end
    object DBEdit_HRFechamento: TDBEdit
      Left = 394
      Top = 48
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'HR_FECHAMENTO'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 3
    end
    object DBEdit_func: TDBEdit
      Left = 224
      Top = 116
      Width = 273
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 4
    end
    object DBEdit_codfunc: TDBEdit
      Left = 143
      Top = 116
      Width = 81
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'COD_FUNC'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 5
    end
  end
  object Pan_Botao: TPanel
    Left = 571
    Top = 44
    Width = 124
    Height = 157
    BevelInner = bvLowered
    Color = 5980672
    ParentBackground = False
    TabOrder = 1
    object bbtn_fechar: TBitBtn
      Tag = 4
      Left = 15
      Top = 34
      Width = 94
      Height = 30
      Caption = '&Fechar     '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5000555555555555577755555555555550B0555555555555F7F7555555555550
        00B05555555555577757555555555550B3B05555555555F7F557555555555000
        3B0555555555577755755555555500B3B0555555555577555755555555550B3B
        055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
        555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
        55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
        555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
        55555575FFFF7755555555570000755555555557777775555555}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = bbtn_fecharClick
    end
    object bbtn_imprimir: TBitBtn
      Tag = 6
      Left = 15
      Top = 63
      Width = 94
      Height = 30
      Caption = 'I&mprimir   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        18000000000078060000C40E0000C40E00000000000000000000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        7F787F6F686F6F686F7F787FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFB7F787F6F686F6F686F6F686F6F
        686F6F686F6F686F00689F00689F0070A05F585F6F686F6F686F6F686F6F686F
        6F686F6F686F6F686F6F686FA4DEFB000000A4DEFBA4DEFB909090A0A0A0A0A0
        A0A0A0A0A0A0A0A0A0A08F888F6F706F6FD0EF80E8FF6FD0EF707870A0A0A0A0
        A0A0A0A0A0A0A0A0A0A0A0A0A0A05050505F585FA4DEFB000000A4DEFBA4DEFB
        909090FFE8DFFFE8DFFFE8DFFFE8DFEFE0D04F484F5F585F60707F9FB8BF5F60
        60AFA0A07F7870EFE0D0FFE8DFFFE8DFFFE8DFFFE8DF5050506F686FA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB5F585FE0E8E0EFE8EFBFB8BF
        AFB0AFB0A8AF70686F7F787F909890EFF0EFEFF0EF909090A4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB6F686FD0D0D0EF
        F0EFE0E8E0B0B8B0AFA8AFA0A8A04F484F6F686F7F787F9F989FC0C0C0FFF8FF
        A0A0A0A4DEFBA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFB9F989FFFF8
        FFF0F0F0EFF0EFE0E8E0DFE0DFA0A8A0A0A8A0AFA8AFAFB0AF9090908080807F
        787F8F888FA0A0A06F686F7F787FA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFB
        A4DEFBA0A0A0F0F0F0EFE8EFDFD8DF707070BFC0BFAFA8AF7F787F6F686F8F88
        8FAFB0AFB0B0B0BFB8BFBFB8BF9F989F8080807F787FA4DEFBA4DEFBA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA0A0A0EFF0EFA0A0A0707070CFC8CFD0D0D0AFB0AF
        9FA09FA0A0A07F807F707070808080B0B0B0BFB8BF6F987F7070707F787FA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFB7F787FB0B0B0DFE0DFDFD8DFD0
        D0D0DFD8DFEFE8EFE0E8E0E0E8E0D0D8D0B0B0B0AFA8AFAFA8AF9090905F605F
        7070707F787FA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFB7F787FE0E0
        E0DFD8DFD0D8D0CFC8CFEFE8EFBFB8BFAFB0AFB0B0B0DFE0DFE0E0E0DFD8DFBF
        C0BFB0B0B0B0B0B06F706F7F787FA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFB
        A4DEFB8F888FDFD8DFD0D0D0CFC8CFEFE8EFB0B8B0EFF0EFEFE8EFEFE8EFE0E8
        E0DFD8DFC0C8C0AFA8AFBFB8BFDFD8DF8080807F787FA4DEFBA4DEFBA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA4DEFBD0D8D0CFC8CFD0D0D0AFA8AFCFC8CFF0F0F0
        EFE8EFEFE8EFEFE8EFE0E8E0E0E0E0E0E0E0D0D8D0A0A8A0707870A4DEFBA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB9FA09FE0E8E0E0
        E8E0A0A8A0AFB0AFBFB8BFAFA8AF8F888F9F989FBFB8BFDFD8DFB0B0B0808080
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FB9F989FF0F0F0F0F8F0C0C0C0BFB8BFB0B0B0BFB8BFCFC8CFCFD0CF9FA09FAF
        A8AF9FA09FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFB909090FFD0AFFFC8A0FFC0A0FFC09FFFB890FFD0
        B0D0C8CF808880A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBAF8080FFD8BFFFD8BFFFD8BF
        FFD8BFFFD8BFFFD8BFA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBBF9080FF
        E0C0FFE0C0FFE0C0FFE0C0FFE0C0FFE0C0A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA07070EFD8C0FFE8D0FFE8D0FFE8D0FFE8D0FFE8D0EFD8C0A4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB000000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBAF787FFFE8DFFFE8DFFFE8DFFFE8DFFFE8DFFFE8DFD0B8
        AFA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00
        0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBCFA8A0CFA8A0CFA8AFCFB8B0CFB0AF
        CFB0AFCFB0AFA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFB000000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB000000}
      ParentFont = False
      TabOrder = 2
      OnClick = bbtn_imprimirClick
    end
    object bbtn_sair: TBitBtn
      Tag = 9
      Left = 15
      Top = 121
      Width = 94
      Height = 30
      Caption = '&Sair           '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        56080000424D560800000000000036000000280000001A0000001A0000000100
        18000000000020080000C40E0000C40E00000000000000000000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFB0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB0000A4DEFBA4DEFB
        A4DEFB4080AF0058900058900058900F609F0F609F0F609F0F609F0F609F0F60
        9F0F609F0060A00060A00060A00060A00060A00060A00060A00058904080AFA4
        DEFBA4DEFBA4DEFB0000A4DEFBA4DEFB2F88C00F70B00F70B01078BF1F78BF1F
        78BF1F78BF1F78BF1F78BF1080BF1080BF1080BF1080BF0F88CF0F88CF0F78BF
        0F78BF0088CF0088CF0078BF0060A04080AFA4DEFBA4DEFB0000A4DEFBA4DEFB
        0F78BF0F80CF1F88CF2088CF2F88CF2F88CF2F88CF2F88CF2090D02090D02098
        D02098D01F98DF1098D01098D01098D000A0DF0098D00098D00088CF0078BF00
        5890A4DEFBA4DEFB0000A4DEFBA4DEFB0F80CF1088D02088D02F90D03090D030
        90D03090D03090D02F98D02F98D02F98DF20A0DF20A0DF1FA0DF10A8DF10A8DF
        0FA8DF0FA8DF00A0DF0098D00078BF0060A0A4DEFBA4DEFB0000A4DEFBA4DEFB
        0F80CF2088D02F90D03090D03F98D0FFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8
        FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FF0FA8DF0FA8DF0098D00088CF00
        60A0A4DEFBA4DEFB0000A4DEFBA4DEFB1088D02090D03090D03F98DF4098DFFF
        F8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FF
        FFF8FF0FA8DF0FA8DF0098D00088CF0060A0A4DEFBA4DEFB0000A4DEFBA4DEFB
        1088D02F90D03F98D04098DF40A0DF40A0DF40A0DF40A0DF40A0DF40A0DF3FA0
        DF2FA8DF2FA8DF2FA8DF20A8E010B0E010B0E00FA8DF0FA8DF00A0DF0F88CF00
        60A0A4DEFBA4DEFB0000A4DEFBA4DEFB2088D03090D04098DF40A0DF4FA0DF4F
        A0DF4FA0DF40A0DF40A0DF40A0DF3FA0DF3FA0DF2FA8DF2FA8DF20A8E020A8E0
        10B0E010A8DF10A8DF1098D00F88CF0060A0A4DEFBA4DEFB0000A4DEFBA4DEFB
        2088D03F98DF40A0DF4FA0DF4FA0DFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8
        FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FF10A8DF10A8DF1098D01080BF00
        60A0A4DEFBA4DEFB0000A4DEFBA4DEFB2090D04098DF4FA0DF50A0DF50A0DFFF
        F8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FF
        FFF8FF1FA0DF1FA0DF1098D01088CF0F609FA4DEFBA4DEFB0000A4DEFBA4DEFB
        2F90D040A0DF50A0DF50A0DF50A0DF50A0DF4FA0DF4FA0DF40A0DF4098DF3FA0
        DF30A0DF2FA0DF20A0DF20A0DF1FA0DF1FA0DF1FA0DF1F98DF1F98DF1F88C010
        68A0A4DEFBA4DEFB0000A4DEFBA4DEFB2F90D04FA0DF50A0DF50A8DF50A8DF50
        A0DF4FA0DF4FA0DF40A0DF4098DF3FA0DF3098DF2F98DF2098DF1F98DF1F98DF
        1F98DF1F98DF1F98DF2098D01F88C00F609FA4DEFBA4DEFB0000A4DEFBA4DEFB
        3098D050A0DF5FA8DF5FA8DFBFD8F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8
        FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFA0D0EF2098D02090D02080C010
        68A0A4DEFBA4DEFB0000A4DEFBA4DEFB3F98DF5FA8DF5FA8DF5FA8DF5FA8DFFF
        F8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FF
        FFF8FF2090D02090D02090D02080C01068A0A4DEFBA4DEFB0000A4DEFBA4DEFB
        3F98DF5FA8DF60B0E060B0DF5FA8DF5FA8DFFFF8FFFFF8FF4098DF4098DF3F98
        D03098D03090D02F90D0FFF8FFFFF8FF2090D02090D02F90D02090D02080C00F
        609FA4DEFBA4DEFB0000A4DEFBA4DEFB4098DF60B0E06FB0E06FB0E060B0DF5F
        A8DF50A0DFFFF8FFFFF8FFB0D8F03F98DF3F98D0AFD0EFFFF8FFFFF8FF2F90D0
        2090D02F90D02F90D02F88CF2080C01068A0A4DEFBA4DEFB0000A4DEFBA4DEFB
        40A0DF6FB0E070B8E070B0E06FB0E05FA8DF5FA8DF50A0DFFFF8FFFFF8FFAFD0
        EFAFD0EFFFF8FFFFF8FF3090D02F90D02F90D02F90D02F90D02F88CF2080C010
        68A0A4DEFBA4DEFB0000A4DEFBA4DEFB4FA0DF7FB8E08FC0E080B8E070B0E060
        B0E060A8DF5FA8DF50A8DFFFF8FFFFF8FFFFF8FFFFF8FF4098DF4098DF3F98D0
        3F98D03098D03090D02F90D02080C00F609FA4DEFBA4DEFB0000A4DEFBA4DEFB
        50A0DF8FC0E090C0EF8FC0E07FB8E070B0E06FB0E060B0E060A8DF5FA8DFFFF8
        FFFFF8FF50A8DF50A0DF50A0DF4FA0DF40A0DF3F98DF3098D02F90D01F78BF0F
        609FA4DEFBA4DEFB0000A4DEFBA4DEFB50A8DF90C0EF9FC8EF90C0EF80B8E070
        B8E06FB0E06FB0E060B0E060B0DF60A8DF5FA8DF5FA8DF5FA8DF50A8DF50A0DF
        4FA0DF4098DF3098D02F88CF1F78BF0F609FA4DEFBA4DEFB0000A4DEFBA4DEFB
        70B0E07FB8E08FC0E080B8E070B0E060B0E060B0DF5FA8DF5FA8DF5FA8DF50A8
        DF50A8DF50A0DF4FA0DF4FA0DF40A0DF4098DF3F98D03090D01F88CF1080BF40
        80AFA4DEFBA4DEFB0000A4DEFBA4DEFBA4DEFB70B0E050A0DF4FA0DF40A0DF40
        98DF3F98DF3F98D03098D03098DF3098D03090D03090D03090D02F90D02F90D0
        2F90D02088D01088D01F80C04F98CFA4DEFBA4DEFBA4DEFB0000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFB0000A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4
        DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB0000}
      ParentFont = False
      TabOrder = 4
      OnClick = bbtn_sairClick
    end
    object bbtn_pesquisar: TBitBtn
      Tag = 7
      Left = 15
      Top = 92
      Width = 94
      Height = 30
      Caption = '&Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76050000424D7605000000000000360000002800000015000000150000000100
        18000000000040050000C40E0000C40E00000000000000000000A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFB707070707070A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFB8F888070707090686FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFB50A8EF3090F06F70A0C08870BF5830C0583FB0502080300F5F50
        4FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFB50A8EF4FA8F04F68AFAF889FC08870C06040CF604FD06850BF58
        3070381FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBB0500FB04820A0503F40A8FF4F68AF6F70A0BF7060A04010B04820BF58
        30C0604080300F5F504FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        B0500FB0502090300090300050A8EF3090F04F68AFAF889FBF70609F3000A040
        10B0502FC0583F80300FA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        9030009F3800A03800AF4000AF480050A8EF5FB8F06F70A080686FA05820A078
        70CFA090E0C8A0D0B0A05F504F606060A4DEFBA4DEFBA4DEFB00A4DEFBB0500F
        A03800A03800AF4800B04800BF50000F782F50A8EFB0A8AF8F8880CFA090FFE0
        AFFFF8CFFFF8D0FFF8D0C090906F5050A4DEFBA4DEFBA4DEFB00A4DEFBB0500F
        AF4800B05000CF6000CF6000CF680000700000800090886FEFC09FFFF0BFFFE8
        B0FFF8D0FFF8EFFFF8EFFFF8FFFFF8EF5F504FA4DEFBA4DEFB00CF6000AF4000
        BF5000C06000CF6800D06800CF7800009000008000C09090FFD8AFFFE0AFFFF0
        BFFFF8D0FFF8EFFFF8FFFFF8FFFFF8DF6F5050707070A4DEFB00CF6000B05000
        CF6000D06800CF780050981020980F708000708000F0D0AFFFF0CFFFD8AFFFE8
        B0FFF8D0FFF8E0FFF8EFFFF8E0FFF8D0B0807F6F686FA4DEFB00CF6000C05800
        D06800DF70000FA0100FA0107F980FAFA820FF9000EFC8A0FFF0CFFFD8A0FFE0
        AFFFF8CFFFF8DFFFF8DFFFF8DFFFF8D0B0807F707070A4DEFB00CF6000CF6000
        DF700050981010B03010A82F1FB03FAFA820EFB040DFB89FFFF0CFFFE0AFFFD8
        AFFFF0BFFFF8C0FFF8CFFFF8C0FFF8CF90686F6F686FA4DEFB00A4DEFBCF6800
        DF78005098101FB0302FC0502FC05F3FC05FA0D070CFA090FFF0C0FFF8EFF0F0
        E0FFE0AFFFE0AFFFE0B0FFF0BFFFF0BF80686FA4DEFBA4DEFB00A4DEFBD08020
        20A8201FB0302FC86040D06F90D07F50D07F50D07FFFD880CF9880FFF8FFFFF8
        F0FFF0C0FFE8B0FFF0C0FFD0A0C09080A4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        1FB03020B84040D06F50D07FFFE09F8FE89FCFF0C0D0D88FDFC86FD0C0A0FFF0
        C0FFF0CFFFF0BFFFE8B0B0807FAF889FA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        60D0702FC05050D07F80E090AFF0B0AFF0B0AFF0B05FD07F2FC86020A820CF88
        00D0781F80602F3F7800A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFB90B84F5FD07F90D07FD0D88FAFF0B0D0D88F50D0702FC86020A820E098
        10E07800DF7800E09810A4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFB70D8806FC86090D07F80E0906FD88F30C8602FC05010A82F7F98
        0FF09810A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA0D07070D88050D07070B8502FC05050B84FAFA8
        20A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00A4DEFBA4DEFB
        A4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DE
        FBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFBA4DEFB00}
      ParentFont = False
      TabOrder = 3
      OnClick = bbtn_pesquisarClick
    end
    object bbtn_atualizar: TBitBtn
      Tag = 4
      Left = 15
      Top = 6
      Width = 94
      Height = 30
      Caption = '&Atualizar  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
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
      TabOrder = 0
      OnClick = bbtn_atualizarClick
    end
  end
  object Pan_Valores: TPanel
    Left = 10
    Top = 213
    Width = 536
    Height = 231
    BevelInner = bvLowered
    Color = 5980672
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object GB_Entrada: TGroupBox
      Left = 17
      Top = 11
      Width = 241
      Height = 204
      Caption = 'Entradas: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label11: TLabel
        Left = 12
        Top = 41
        Width = 46
        Height = 16
        Caption = 'Vendas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 12
        Top = 97
        Width = 100
        Height = 16
        Caption = 'Outras Entradas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 12
        Top = 153
        Width = 90
        Height = 16
        Caption = 'Recebimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit_vendas: TDBEdit
        Left = 126
        Top = 39
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'VENDAS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit_Oentrada: TDBEdit
        Left = 126
        Top = 94
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'OUTRAS_ENTRADAS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit_Receb: TDBEdit
        Left = 126
        Top = 151
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'RECEBIMENTOS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GB_Saida: TGroupBox
      Left = 281
      Top = 11
      Width = 231
      Height = 204
      Caption = 'Sa'#237'das: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label17: TLabel
        Left = 12
        Top = 41
        Width = 56
        Height = 16
        Caption = 'Compras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 12
        Top = 97
        Width = 88
        Height = 16
        Caption = 'Outras Sa'#237'das'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 12
        Top = 153
        Width = 79
        Height = 16
        Caption = 'Pagamentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit_compras: TDBEdit
        Left = 117
        Top = 39
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'COMPRAS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit_oSaidas: TDBEdit
        Left = 117
        Top = 94
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'OUTRAS_SAIDAS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit_pagamentos: TDBEdit
        Left = 117
        Top = 151
        Width = 100
        Height = 23
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'PAGAMENTOS'
        DataSource = Dm.DS_Caixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object Pan_Saldo: TPanel
    Left = 571
    Top = 213
    Width = 124
    Height = 231
    BevelInner = bvLowered
    Color = 5980672
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label6: TLabel
      Left = 16
      Top = 15
      Width = 88
      Height = 16
      Caption = 'Saldo Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 66
      Width = 79
      Height = 16
      Caption = 'Saldo Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 117
      Width = 85
      Height = 16
      Caption = 'Saldo Caixa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 168
      Width = 69
      Height = 16
      Caption = 'Diferen'#231'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit_SaldoI: TDBEdit
      Left = 11
      Top = 31
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'SALDO_INICIO'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 0
    end
    object DBEdit_SaldoF: TDBEdit
      Left = 11
      Top = 84
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'SALDO_FIM'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 1
    end
    object DBEdit_SaldoC: TDBEdit
      Left = 11
      Top = 133
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'VLR_GAVETA'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 2
    end
    object DBEdit_Diferen: TDBEdit
      Left = 12
      Top = 184
      Width = 100
      Height = 23
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'VLR_DIFERENCA'
      DataSource = Dm.DS_Caixa
      MaxLength = 50
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 10
    Top = 452
    Width = 536
    Height = 84
    BevelInner = bvLowered
    Color = 5980672
    ParentBackground = False
    TabOrder = 5
    object GroupBox1: TGroupBox
      Left = 17
      Top = 8
      Width = 241
      Height = 65
      Caption = 'Entradas Doces:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 12
        Top = 28
        Width = 46
        Height = 16
        Caption = 'Vendas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit_Doces: TDBEdit
        Left = 126
        Top = 26
        Width = 100
        Height = 23
        DataField = 'VENDAS'
        DataSource = Dm.DS_Caixa
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'POINT INFORMATICA LTDA'
    RegistroUsuario.SerieProduto = 'SINGLE-0615/01649'
    RegistroUsuario.AutorizacaoKey = '5E33-1QQQ-385V-ASCD-RRJM'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 644
    Top = 5
  end
  object IBQ_PesqDoce: TIBQuery
    Database = Dm.IBD_Aquanad
    Transaction = Dm.IBT_Aquanad
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 664
    Top = 496
  end
end
