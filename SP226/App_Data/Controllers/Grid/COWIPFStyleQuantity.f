<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "COWIPFStyleQuantity">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7yoGd3pTDOcQNQgYviIMP4SjjA9c5GxyQSIlZILssu5We0vFXNYokb6YfPcoOlmeuSibT6lwpKvxdMWk0FyY6OCuaCsnmWVxfJE98XfTUJqYfKwiWq3G5eT7oqwmpbLb3sIlyERpi4dEl+dg7qKzEw4L/M2yhjiRFYYQEc5904p62c4SJ9Is/XxeSSZ/NVooCOQPrGHEHe9Ch6XrDDUCs1Xuc4w8nbXg5Cbs8WksY+BMU26yEbvh9t+OltoQr7tH6d11XEvmcJBNjQtrztpjQ44FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridClosing SYSTEM "..\Include\Command\CostingUnitGridClosing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdloaiytddx" code="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số lượng sản phẩm dở dang cuối kỳ" e="Closing WIP Quantity"></title>
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
    <field name="loai_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại yếu tố" e="Factor Type"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="sl_dd_ck0" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl dở dang" e="WIP Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="#00.00" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl hoàn thành" e="Finish Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl quy đổi" e="Exchange"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="loai_yt"/>

      <field name="ma_sp"/>
      <field name="ten_sp%l"/>

      <field name="ma_bp"/>
      <field name="so_lsx"/>

      <field name="sl_dd_ck0"/>
      <field name="tl_ht"/>
      <field name="sl_dd_ck"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridClosing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pSy66Bn1j2gIuk4c+vrLZbPKRX8/7evmJtpRavj+hbAAl9AW7RP3N6+sj93Sp5aMgC5035V97mKA3SxIQKHWiDLpqXiBY7IprKN6TLVgnLElR+lK4t1cBVmboOyA3dvS1N4m1iO1g5jr2LL4LFUZce3</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+bkdEO6iKk0ImaVHWQ3sRs7lXNAX29dGcZiVXD8is/+gGZjSj3T6czVchBQy7Y/e2est84PoqTXlwJbIZrsRMM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUV0oTtciE8G29OjoeOK5lsMXNiFpZzxyG5TukzVqaFBwM1qTfCTSi0LDPGDdZcYstbfmQ2EWUIQKeLEJPq6a19Puiv8oxyAUrIRcJJHD/LsUDkGyzxyo7oijYoASLiHVNHmilbFHKd6T305poN8QWFiTlIpSIRqvkbgKJYrUdz4KX4yTN1i7dRYYlQbgXDvsKVRh7NW9nbFYyk0PHMdKWzHaxfWVIe6r5AZKF3EMqvUwDWHJ0M6uM/AZyb6okrNTQ+0QXdIziBo3+0Bte+R29HBpee+i5ptqTksqh+QpKPnWgFeWJLhL9VVweYEoog/6Lqv6D4hJia703eNZNYurjHZejKT8p+E352qneJe86BLOA7hTzFjMrOezsA/cqRZCzZI17Bl2R6W9xx9QhRIJJkXESxSfzLzj8vK6QmCnCT1zmED+I0aRVgoNZ1liBHr5nTSuFADxxucBFhADQoY2soKMdutoYS1gsI1kFBuC5/lEaWia73nxe5H9OhJGRGzR3V51F7ojN8SVxG30DpiDNvIb9CkeX4m7l55DVNKFzEz</Encrypted>]]>
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