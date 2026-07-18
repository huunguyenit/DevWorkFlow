<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ClosingInventoryInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7xeESa572Xo7cF8x/fA/EVuv2TIoM12OWJRM3Ga74/HMXpPS949moO5dwbcs0NqAuikXZZWbAwIsjs5DXM1YoZ1YWWycF15w5wDcuHrSSqggbFq+HPhN99ELvW/ArIw+1gqf3A+H2t1JwoR/Bwx1wmIWOXdyGlkNFOYt9JrQPomfYMEXL1BeeXkswbrgFZTGZwRXyQxDF/SU6fPedKmYsD2FCGPoJRinrqSW/RV9R2DYzeeNOFW4PdnLes9EHktJO8=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridClosing SYSTEM "..\Include\Command\CostingUnitGridClosing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdvtdd2x" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật kiểm kê vật tư cuối kỳ" e="Closing Inventory Input"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="sl_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl dở dang" e="WIP Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>

      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="sl_ck"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridClosing;

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pSMV8w7nNc2c7LF0Z2lwLI87PBjhSfs1c/J3iTAUQZe/ioC6VtgBIXgUfyN8NVxufQwIhGOnt+5eSJ27JiIssBbqBCLe8qJPJbc47BZpAy0i8VMWkKuum2wbAOZl6LAZV99BxPVPgqIaDdb34vKU8mL</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKUa8fuaH25CnMBCoI1FPuJ9SRtfZ2XvsOWXw0DS/RMb8Uf9TsOh47v/bbHkoiIaK9U=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUV0oTtciE8G29OjoeOK5lsMXNiFpZzxyG5TukzVqaFBqmvoFsHfyn23ooMg+N33p8mgrRBF8ZBzexunYw8aSO5WtuuDkarwid7bHEB01fNlzCPLEKnxVrLhWNge/e5xD7JDbWOoKL3rBGKdvvet+j4FmA9euFBFOVzNqpMurTj4mN0tJk1On94Sja170AMpPu/cUclC1Zw95nURNBiLK8V453H0nrDLBsXKtb036Zl07Io7P1n0Gj9M/2w2e/PEm5rPMYivPvL3kQE4tDyIPLPWJ15r2OwiUEx9LgT+pdO1FDuGmr0K3IMnfHxsqjoAVZyH/LJnWP2d1pQMFte94E0LxN8h7kY48jCqPPjnKRdTs2jfyU3xjQm4CXM+5ck9Qw9QWfnROWJ7RLCwWtposOJ+6nz96DTTaC8qeDpQoum1su+RdiV6L2rK/U9hvqB5BkUpfV1o28SqT03vEyiefRDtJioLZIP61tx1lJ92DrCPY1YkdHWkmpjMQ7aHhicJsLCxVuPkTCLdL//psDv7FTLhPLffAKygUyE3tf0pWWM4</Encrypted>]]>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>