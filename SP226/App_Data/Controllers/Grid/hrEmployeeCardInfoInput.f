<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$us12D/loR/PH36Y/kWCWUd32rvwn8KF9psPl1fOyqKEdBQFiGl4e4V0iZUbhOpRoFastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZsUxx9WGkbY46SkireWV3+irBvwMxEatODwLO/uAXkQV7QuixbdFVjzfwyTz+3PFsC5+5ohwfVonyRHePy1F31Hu2ZjBWNh6SHi47CczMItsTy7SyfIxJVaLOpuCDQKO1m5AHNOFWD2fY+Tn0z04GKWkB/3KfwCV6gkQ/eExNdRLOXPCyFRvKI3hrkz7udxDwHYHL2Bn5cN2QGV/+MiApBFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrnv" code="stt_rec" order="ma_nv" id="H02" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin chấm công nhân viên" e="Employee Card Info Input"></title>
  <subTitle v="Cập nhật thông tin thẻ, ca, công ngầm định..." e="Input Employee Card, Shift, Default Workday......"></subTitle>
  <partition table="hrnv" prime="hrnv" inquiry="hrnv" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int32" width="50" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Stt" e="No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nv" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_gt" width="60" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Giới tính" e="Gender"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" hidden="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Vị trí công việc" e="Position"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_ttnv%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tình trạng" e="Status"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_gt"/>
      <field name="ngay_sinh"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ten_ttnv%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZEJKd0Sb+jhj106psDtPrarQmjFlhSsM2qP/R8yWDasmiR+8endS1aY5fq7xA1UBgRCWfENXr+yCcdbIuaLgpDk6EmgtJ/G0IkXaxbj45W/jKqRpTEAgZ57OvElcln2YRQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJN8UpZTJfziOqdOOjZKyuM7ISQ6mU79xI8oNzAx8gx1Zk7fcluZvXigDbT9dUdWQlfxSpvVEYYLPKxD44P20Uza</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O52coehFhQvJM36AYyhQ67/Yr1GgU9rMkXkSaO5+8GopBsr5vdbBTpdzNfxcYd6MBqhNMGov9VDKNNtrqMTycPImpQPiWzpHoAtIPHleHRYlc1ICrWz/IVjx5fIaFOG/Kf9M7KUBkeOYARVBYzxeJbNojpoyuXJhtXcIBKd7Sad+8u9KKCjx1UTqcKNDQepdwVMILHmmPdRSnNGfJxfJ+bTWtpdm/i2JkhteUPrHscvOqZk9c+rY1kXEI3BYfXb+EEbOUCSBi/RXIUrfVhdHXh3Bk3pFsNjYUfCmOp2ObOLO86e8DE2k9tr62FsiWQBLyFjSbW8V4IIRl112+iGKEPnkYUWj4MrtHTO5rwheezd1IJ0Wogj4IndkzzGUpzjjOwjb55bWeXAuPyqkxI/na/cw++M69TgzBu3MCeVMqgmxiVRNBU00l8htjWEOb4Tt/tIHPnlkfKIRC94OWyeoTdN24f9+4oDUSmIXChuSIy7fdlVy+8ceb/VaEoH/pyYeDWI=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597XDWnVUwJvW8Frz+jnTFLXFY33AeI85mZAuoYwmtfhRW7VZtveeoQsQ8wDNZTOvtfqBnaE4k0bQbxlPd7aVgMW/rmqJC5LP9PoBtumhkxGM8LRVDlcbmlOQ/D8NxzrS9BPHNM9xpvZOmGegSyEOR+KEYjiSmIsXHRF2yn6Gv0/gMbxXr9zziTMZTVm+DNLonBY1zxSxmGiJ0svsm4LdN5tOSuRa8Ek9yZ9/VAlDd0tGrhLdri/j7PF5hvoQnbnes9WypS9dWtX/r8KJjyIt1XXfkZcvdShnlGY2qsfSkhwviZJ+rZAZYr+zdcoR9FQ2az4mT08uMbWS19CPHa364Cp85oOjXzsLkpfdcUUtXx8mVYy8HEjSvyjOnAgp69y4huJQC4HxQBhLF2OFSh1M8mCoQ9HOWJ4OIxtDuEK0UqM1hpqayyrz+DEFj1NdbeJpqzq9NjvdoIP16zcRXAqeYdOkIYIDf7fPJvmJHorpwQb1W4wuC6Nixna+oEJuSDCEwE83W3XXbKR56grGTM8ML9BT4niwC2OAPBp0eif/V65VbScg5ydqASZi4FrVwsSLx52QCHPjX6fLbv9ZJvESRGCYYms/uh7OjYk3DMX1gCiorvYQYIoP+NntzPNw0r9XF5ZK/h1yTBErjC4AT5WC9E9DYCsSeCY9Bcp+kSIiXZDZcedG57JtuuC1YiR7w3E90L8/CvyOxVhpsBtgPAIzWTmRyb7OjEWpAW0oZoR+OxFH53L6M4EshjgPObDizLKgYo6TLveU3exu4P0ZRe2Tdl28bsq8tTNpjz3dstqxOFn60VP36ZVjSicbGyR9JoT7WShjjQVfiXFqoSOdox9V/KjbZJs0BX0b9tMfxsudfS1WtVA6A1Ge2OW64/Tg+qmm/Ru0BXU+P9S2tgPu4RZWO07dXDMYz6/3vDEk8rfyVdbEaQ1mBqUiT+Um6T6Ecdzr9s2/eDA/N1isX38e0ayoAdsAY22bUonlHtZ1DKI+hDx9F3yIPfx8Wa4WNoEZJkAxu+SeQM7VzWkqPdlKdUzkDOx16/7TiNJxvJozWF/CO4holm8zYCzVI55fFcAZFA58N4GZ2pDenoOpSAINLg33WSMoXzJ3t1MZFZHY2F2yMQaevqbaoZ1IfrbXMiPsTaZuOTS5SU8LhB9AAHT20Tw6gX4Ojay6lxPPlcucT+77ZsDNE=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>