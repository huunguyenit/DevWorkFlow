<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1)">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CoefficientofDistribution">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjUyjaREWDBhl85d9jFcODE5+WhLRSFytWhiuszhzrG1OpFgxF4wnl5m6CTyU0cpj2+ZRcCJZwgHx6g+4Qvb0uyroVvbyz9T+gLy/dfgsTAjau/mZu6RhY1EP50yqA08BqWWNxQOHZuBOu3IztVl14LzcaB1L+bPsCTdRqGbeMWkTdwueqwpTAM8lkaKga5Gc1tIb5pUo5hhLG3VIH1+tFsOvDz/8FDwQZR7KLBItgcrDzHmbxiSMDto4YLFl4KZdtEd6S8M/+HgWY8IjEEICENpZswOMGcPFzjezACcJnDsn/XQ6lDDexfWjbCKir2GFHbbOoyiw46OMPJRSbwsS4+ac=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridShowing SYSTEM "..\Include\Command\CostingUnitGridShowing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcthspbx" code="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hệ số phân bổ" e="Setup Coefficient of Distribution"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" width="100" isPrimaryKey="true" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã ytcp" e="Factor Code"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowFilter="true" allowSorting="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="he_so"  width="100" type="Decimal" dataFormatString="### ### ### ### ###.0000" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_bp0"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="he_so"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridShowing;
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJz9aasU3wp31K3P5sP6289GYdP/eikWw3UzLvhniMro+gadAhQzrZBp8COk8UTfJbVsG03OVezIjuurSwRRF8b6Na5mE2bojLaFREK288Eddz92azLleaeMxo+h8x9jHQr6bQwhkwl9F9ffEyExJB75TcpGKDzlyCNZ+jIItZxNDw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXJELVKliErwKNMSXmjLtBUjYfLEpMKpnFtoBJa1xVYz/g8rbs6dROAVgM8W+SNlfA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+4E3Ejh2Wy9OoqkOn8aE4z73gqFIyxSq61Ai1qq/LiXlQUE+51Php21P2Z0PqRacDEbkoMpARSQPoiFHQIBWCV8KhRBbTJx0eGHT/jW3g91TewaaOkwoEvzHuHaajPvUoSudYF8S46jkIJd1B2ujsEWIp5/WAJ25Syg74VaEK7FaNIHjaAr1O9CzYjmH3R2Np5uN9g6ori6h2FNf8S73xwGFlpnm7xY5ICoVOt0aRD7hxKDicaJpOdpIBfilx6MoobxoIetHTv6rfefytEY6oWq2NgzcIsrJsnSAqhHqIPX2LpiUBnqCkLC0h1nCyaOMMTX0iuinjAcOeg15reb879Biwq4bBY1f0eTnpYY2nxsgm6OvceCs/08khMhQfUysi9SIsh3d2JF2FStFLtPi5a6F/N8ADuVlPt3dMH5hm/N9YCglPZekmJudX0roW+MCN32Kr4jL1HaAtaQRO7ygdp1vCtVwzVQX7036qiJ4tJVUI7UVJXSJSGssUIQMPTQBs</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>