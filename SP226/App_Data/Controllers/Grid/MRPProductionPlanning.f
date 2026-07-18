<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "MRPProductionPlanning">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYCgFDUjDD+UsmY8t9hfEUrSV+o42MoJ/C8vuYRaxuYmxg3CYY91y88YNwg5f1VT2+J9KTbj5iDlpB+v2sVqera8cGl1iCX+SZ+rEd+DYXiMtunxwBXmuEyiQz1pqnWoPNbbnoisU1kw28+FlZLA9wV30D/CWLnjd8L0Pk49TJKeAuLuXbAHJoGov4LvSMCKWU=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vmctkhsx" code="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kế hoạch sản xuất" e="Production Planning"></title>
  <subTitle v="Cập nhật kế hoạch sản xuất: thêm, sửa, xóa..." e="Add, Edit, Delete Production Planning..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" isPrimaryKey="true" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" isPrimaryKey="true" allowSorting="true" allowFilter="true">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="so_lsx" width="100" align="right" isPrimaryKey="true" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO No."></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="status" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Trạng thái" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="so_dh"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_kho"/>
      <field name="so_luong"/>
      <field name="dvt"/>
      <field name="status"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQ5YXbFTw5EtQ2DiPCtT2P1IuellQjqWsw8WSI3VQahQs0bojXmfA4mSFsSBabbUiK4Hy/4mCs7HiuEgKzoJevW7Jk/uP0Cd8bdmF2f/ISvmmFj958CO9T4r2WKk50jk0cp50jpHvNq2ByE64iPQaYglWd2R0IHA6ECH74qT6vPXMss6WeJBzUCTORD92LP4psVs2CP609i/LYziYr4LEylC/eOHTTXOo8YdzyC4Sxtbb5aZPyjsRxor++B4/wgdqJbxn3knCz/csCOfv6bqwabLO8uCaYZ3o2xAlJPpgagosOqOaI7fWE+PuA1ZT3RWFQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKU2q9O4ypKQh16RtaEskFN1nPKZpvXMf/TKbWrSRCtZr+lXt6s/1EUWUJGfaWXX7bzEmsvlrmwHHaicIlpwD/qp</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQ4i0T5m1W2j1sTZz5Jh1n14ncFT1SrAplUUF0RzQMThwKvzf8F+hpZtrXsgbCIxddZDDFp8YiIk5xrPR4+8bO6mQRdE6XGOkSocMdbCiEHFhoIx8kvlci/G5Bj1AnMQAb4AmdN7VzmEX5IQW87U32NQpY2BbA4Q5xInVp9mklGXwQm6EhhssG72LKzVtC4unk7h2/1kGvLx6tdH8Y2UgWHeigPho+pGqe6nNJH3F7Uq96O0cjFS+66Og7nsFZS0lIVrtsiQkXdCXO7AceLwUwfzthoSU7uALK7pRS/1V/zu7Haphy070TreK8jhdNej0q+ZHcnlqIa7Z3H4xFmXHMM8GaHgZHFxP/tqbMxPhjg0semkv1WaN9cRc7Fb6huhWz7jznhO0mMAgwj44WIdyzZ1O1ZyteKuQUz6VjOd0Uak5ob7ylK1UIPT5s1YHaWUQRKAt4T8aZyfBCW6IR+QKqL/XvL/tcVmnLVeBGKoF+5Snk6WXVGhJWE73R0QbldSyo/Z2l87siS4Ks47Kvx+GIc=</Encrypted>]]>
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