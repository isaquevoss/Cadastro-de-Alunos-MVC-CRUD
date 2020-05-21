object DmDatabase: TDmDatabase
  OldCreateOrder = False
  Height = 312
  Width = 529
  object cn: TFDConnection
    Left = 111
    Top = 192
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 111
    Top = 136
  end
  object FDSQLiteSecurity1: TFDSQLiteSecurity
    DriverLink = FDPhysSQLiteDriverLink1
    Left = 111
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrHourGlass
    Left = 111
    Top = 24
  end
end
