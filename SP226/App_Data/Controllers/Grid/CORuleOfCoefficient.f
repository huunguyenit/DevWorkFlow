<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1)">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CORuleOfCoefficient">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjUyjaREWDBhl85d9jFcODE5+WhLRSFytWhiuszhzrG1OpFgxF4wnl5m6CTyU0cpj2+ZRcCJZwgHx6g+4Qvb0uyroVvbyz9T+gLy/dfgsTAjauXOi0p+jByd/ukXTw1UyhQigef4lJuQE3SSr6BbXOE4Z1a5ZKR3J/ePk42t+8eKc0KCc4Q2/ejLUxnSEUntoz9zEqcImEcp1sBl9n2fw+WqAV3CnnXBjW0U0MqOE3L4DYZsu/o5JiBYfrAnNHTAUrw+mDg2Yg+tuegGQE1uXN/wUSYM4XXXBZ3rddUFsWdtlCVA5u7Culm5DR9EzSbHYRccm+mTlVC5WWULry838OdtqdWuFGlf+b1hrZ8UtaMa7pFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
  <!ENTITY CostingUnitGridShowing SYSTEM "..\Include\Command\CostingUnitGridShowing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxdmcdspx" code="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo đối tượng nhận phân bổ chi phí" e="Setup Rule of Coefficient"></title>
  <subTitle v="Kỳ %s1, năm %s2, mã yếu tố %s3" e="Period %s1, year %s2, factor %s3"></subTitle>
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
      <header v="Mã yếu tố" e="Factor Code"></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowFilter="true" allowSorting="true">
      <header v=" Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_vt%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ma_bp0"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ten_vt%l"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridShowing;

    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJz9aasU3wp31K3P5sP6289GUI4YM8ZE8uct7Jl5vEai0l/AF6stAkeFGUBdCcTiXOZP1nEh2yu79isu+nP7cO8O096f+CZeJ/A6aMg6dumr05a6n0ZxANTbmxWX00UYT30NuqRvWX/Wp4VutGEVsJz0A==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+3nLrREnj93XqSTH611EYYVh8OA4Bujg0tuww80GjRLoalAuFzjAh6b+ijkHYxGaZEVP1mRmTijK6RHJ5kl9epTqTo+CgfkBdWQ+33XiSoW4FDvuW/J9m6R/KnDFFKVeR4wqQH2YKp9Ac2V6EFfFhmFEO8GyjLQfixmtQ9hnnAYvw4S/uYBdct9gy4TAg0Nu4XMDe02O+lwXs5lBQoXtn5QgKjsaAKc5KxXdeqtfYxqQd9FI+qCd07AfLzfHbawARbEYRvD1W3hTKe2MQDjUJT61LmjK7n/SD85LyQIDDiEiDABuEd8x6OztBXM+t8BhYce0R6d4+OyNvXnwx59WAZCPz5z1VTnS9P01yi3nY7WUTUi1dinxBXwhHJKHrkxtNIzAQ2ceBn/BwHzB2qQfnStHOUjaPBT2+AG+ZikHd3uNr14YqiSjCTMq5xmSohPBOkDffmVK+VR2RiylgkkcRRFvQQkW/n9SXYM/HZ3pmDAjTgbiJeWj/f1zMfvcDdB2o</Encrypted>]]>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>


    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>