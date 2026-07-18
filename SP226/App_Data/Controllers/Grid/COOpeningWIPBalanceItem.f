<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "COOpeningWIPBalanceItem">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7yFEq465i6OKO8K8NdpNdO50RoyDSIesIG34pVjZzONHrjm0WSf4xlMiyN8NT6S8amdk199klXN9SEhM1K0o1nXiouw6S/OorBfCd7NOrE581Qcg5d6IXVqcNcoQeiYBeIgQFw1Wpq4Zu2pwDrqoiwyw/cpegBoyXV1Vsfx8FMJC9jWrYi1UMoQCFikFSUH3DeB3H8d/Wp84pXxUaygZuS0LesyTTHggEWohrLbzX1Qpjs94Zzq1DROe/WRX0+5q4E=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY CostingUnitGridOpening SYSTEM "..\Include\Command\CostingUnitGridOpening.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdvtddx" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật vật tư dở dang đầu kỳ" e="Opening WIP Balance Input by Item"></title>
  <subTitle v="&SubTitleBalance.v;Thêm, sửa, xóa vật tư dở dang đầu kỳ..." e="&SubTitleBalance.e;New, Edit, Delete Opening WIP Balance by Item..."></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Cost Factor"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
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
    <field name="ten_vt%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="sl_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
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
      <field name="dd_ck_nt"/>
      <field name="dd_ck"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridOpening;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pSUEeybMpEyk31TY966KfEmIlYUDR9qQQPG3l6R4x1xHD5I36rirfSlKGrQ7yPlbvhK0qrhCA73DOvO8+I5C1ZGwI+NPbrWwwycsLJ15cmoblJaTL942ZvOGFJ74UoSlBJ/QinXphn03/Z0FB+faZ0k</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ7Zk7hAlQKBlbYqE8GWBBawzQRaZQlciOZr9kQ/fur5dVl8EFUIFl5ihSdm/SWsbuAPJ+Q34cm0tWjOdybBMAvlcTpUGBXakVJHcRkldnPwdo2b6m+/mEYTHeHwoaatO4aVGE45wDbHjcfdPof2DHSXhQibKuy36/esxLgsgWfV475565KqCxkgBa0EfVuog/xshX0PTeGm0oQ8JOqVHv8+KrtGqP/3wdVv8wJltkZjzyt8rnasktIEJ6oDSndgKYsFvbS+VizTUuauPBiBEmkVhZqiFLjNEfr5TIVa4zn786jV+1vLU9QpNlFcU+CvU+xdvPZVmUTh6XJIe0dehb2r8O+l/A4RKGshGJstAVTfy8ZcnVkqNu6ThG6JvX5sAfHHL68k3pZ0nNNVHlkkmNqEoNBIWdKaA4+cZi0Gmze7hNj0TG30c8JG51J05IfJd8Sl0QLO6SPel05+z6SxrckUdF9bD9DTmZD9Ba6PFFDQjDcSqOu2DAflalyunXiH2BywupG+Awin8DgLEqGTgViTNnniNjo4S5VG6li4OXMX8g==</Encrypted>]]>
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