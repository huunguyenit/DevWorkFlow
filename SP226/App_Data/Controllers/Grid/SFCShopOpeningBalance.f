<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">

  <!ENTITY TransferID "SFCShopOpeningBalance">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYBd6xQexXdlngDADmkKnZt5L+wJLD+dKF+YFM+UGmWF3ZW+e82OYQTdysP1cIQR83eKqMUrT6EnuPlLHkGxcAlw5JpWZ7wMVQMq+ohDXp4AVJ9XjWaLtozxdGb8Tkm04DWP7CNRvfdLykeTEwSuYeIDhufwT6JIAWFbqZlh8qe1v+iL1CLyJ8mo/UT2I2Ctm3EUo6qR88epHbWSlqlJyDFVh1JCyy27qYTtgtAvd93AA==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdpx" code="nam, ma_dvcs, ma_px, ma_lsx, ma_cd, ma_vt, ma_lo, loai" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="nam, ma_dvcs, ma_px, ma_lsx, ma_cd, ma_vt, ma_lo, loai" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật tồn kho phân xưởng đầu kỳ" e="Floor Stock Opening Balance"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="ma_px" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã phân xưởng" e="Shop"></header>
    </field>
    <field name="ma_lsx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ma_cd" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã công đoạn" e="Operation"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="loai" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_loai%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái tồn kho" e="Stock Type"></header>
    </field>
    <field name="ton00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@quantityViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>
      <field name="ma_lo"/>
      <field name="loai"/>
      <field name="ten_loai%l"/>

      <field name="ton00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89owyAQEq2LcAk0Y8rndDz2gbpWIIexq6p9zx+0p+v4ZboUrBGG288BVJW13JjjthvNZvvlBuFp4RuoOcQ9GrY4ftoegsT2VO+EGMH+fCOmH6u5PcH60Di99Uoc59qztsllorTD/81IKCIyQpSpudVUyl9ZIZFZieo4cH90gAlGu6KK/1oa+8xngowFHhQOmBb0cOBszluk8XYHIngiDfZjnZwzx5zUjesPZfXLec9XvrD/23qVkWLYCTKva4MWhqewnRWjD1EI3MJStWRGVU0N0RKLzJn2w53yBx24gNxX2fnCpmLwhEEmz53iszRSCh9P9doybruIXHwsYdMhjDZaZ1WxRk5d3wtv8KJIwdsCo6VbvrLEHYe+lq2cCzSX+Zq5BtNZkIn6I6Qh4agggHOuaxyQgiLaHInHO9zOrQczxKiEPtvTw5b6ClmYHl2WLq2k=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+Iiiiimwm4+h2s8JyyHn5DuUQAudrwKt0dmUqXtcwi4ZC7qOSKkUoCJeHEtdQ1LmkK0TJDEzJ2Tbnh0yNlUNu82DqnXOuP+K+1jNikYoa+FD4YA4xH0Qu8oLZOkYpnPoGYCNLHFqYkrwrZEC07+iZEY/S7pZ8pKGQnGLQP+CiNrVuv3t8duYZLyoMaJc/aDLbVTVy83zNUhkDyWy2TY+9rjZjiGuilu/XurcWkhtkjCwTmGKvjJvJLJuu/5EP4rYsP273BgF9swdxuMPAoh5L1DMZTn7QCjJF4oXvX7h9qIxVseXuEplTcOg2RsY2vKrhy0inDH3IYCdaC5fJW4Ozgw8ZH2mpSj9Df7YEfI8Jpeu8yG7RgWeNzfWS4IIYIY7z4/hZGhIBMjx+ApMknX+VpRkyIjGnTch93aN4y0scBWjK8U2ZfGeh4WO8rJSp4kYOgRwr4h8qpgltwrbWixMuRpvFsAzb8NGi5s5rOGL1oBoCxQyVzaiHT+kgbVa+EKAA</Encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>