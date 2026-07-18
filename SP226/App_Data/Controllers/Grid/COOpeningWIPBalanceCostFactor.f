<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@0(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY CostingObjectUnit "if exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(val) = '1') and exists(select 1 from options where name = 'm_dtgt_dvcs' and rtrim(val) = '1') select '&amp;' + CHAR(255) + ';ma_dvcs = ''' + @@unit + ''' and ' else select '&amp;' + CHAR(255) + ';'">

  <!ENTITY TransferID "COOpeningWIPBalanceCostFactor">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7yFEq465i6OKO8K8NdpNdO5L5gHOtpQyM/FTXR42MbpFWC2GGbMjrG9Vy4XTJ/+OItwrCt9HyC0u5vbfBkDZDCZz0ht9fEtGg9rb+0lm022HwcjMama2sZ+iQZG0012FK7sA0kh5dD2k+Vb8PMzDnGvZz55yHK1IHO/Xmoz9GaI27WE25pg/8wAWcg7+nWGb0AU9m6SaAbLKKXiB+oZJ3Xo8uyuPWxHHzHpG0x7RGtYkKpsh5V7sFSSxw5rmlunMRw4jkxfTM2WN/kMNUBr5I/vR6J5Fzu4yEy5vlik/g80aRu81N/JM/aaQJBZ3h0CdZo=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY CostingUnitGridOpening SYSTEM "..\Include\Command\CostingUnitGridOpening.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdytddx" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" filter="&FilterCheckAccessUnit;" initialize="&CostingObjectUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance Input by Cost Factor"></title>
  <subTitle v="&SubTitleBalance.v;Thêm, sửa, xóa giá trị dở dang đầu kỳ theo yếu tố chi phí..." e="&SubTitleBalance.e;New, Edit, Delete Opening WIP Balance by Cost Factor..."></subTitle>

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
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ytcp" e="Cost Factor"></header>
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
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_yt"/>
      <field name="dd_ck_nt"/>
      <field name="dd_ck"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridOpening;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pSUEeybMpEyk31TY966KfEmLM50LOyusL8zKSeIVmuOE+FlARLQB4GxMxZmSev8R7kgAFryqePsJHk1IFWyRJKd3ZpBFt4cnhv+2dJEOD4DdnOHHTqYc0DqpgqVydzvNKzRkT704jjd2pQvNgQC/gWayhtQrXEjWjmsQoNIo8UFFg==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ7Zk7hAlQKBlbYqE8GWBBawzQRaZQlciOZr9kQ/fur5dVl8EFUIFl5ihSdm/SWsbuBfqRTv4Xmw5/VlxHSkoLjM+VPiXEuyQQzVajlehJrQim/z73f3KUU2WLn7WpM8JRQksXiQKtU+yiOQDp+VMnzATYqvZ+CxnLcj4fAsPTAcg21PNUTP0buS8ozKor0rq0X5/wTj6F6RBgzyERiNfVclU6wFCg7r0C0k3cPE4UXtS2AAkTglGeJyPHaRFTifcXnz9RD8jNrWZRtK/jwjC7vUHsfkpuwrllcMuAPM+Aj51+Ll3etYhq3fDJ2yT2m8Rtf0/9zIalwXDLmG6tZrAm136VYmcw4aHZWqnSru820SRxyI5IWKFujcGJArEDdtAooPAAtoTcRM3pa31SNs6zxrfg2Ekftd0PQn9tEfrsxSZw+lpagL1/cxdGrR/Tc52daCXkvD15LsuPyty7mTYPXF1i0VkaAUNABUHmUNmVrEz3HusBXIZsOWqz055A/Ib7PMoE6lSX5sb9oNDQsCeLs4kOR8ibjPevHfl9p2hHj5Cg==</Encrypted>]]>
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