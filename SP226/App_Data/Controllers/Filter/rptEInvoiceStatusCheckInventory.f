<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY f "ma_ct in ('PXA', 'PXB')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_hd1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ" e="Voucher No. from"></header>
      <footer v="Số chứng từ từ/đến" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ đến" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_xt1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Xác thực từ/đến số" e="Reference No. from/to" />
      <items style="Mask" />
    </field>
    <field name="so_xt2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e="" />
      <items style="Mask" />
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIInventory">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>
      <item value="1101: [so_xt1].Label, [so_xt1], [so_xt2]" />
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+82dQrvk+gNkzqPKP7mHFpmf14+R1BzMnHxXD58CrMfwDi+ziSDA1h3k7x2AWUCPpPYwkbc21Ihq9txZlJg/CqhWYeT+xvhdsmApewDt8T5Pi3860cb9JpHKJ9QuaYlEGzSxuzt/45zlMo8LQ6zOs3c0idC69uwujFOlZtwYhiLhXCuU8toXe9UwZMKkI+OKaFGwQFj+hvvT2/893VXIuumVwoDcyuCvUGIRHljSrb6W</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cRzC0R/mVFkg2soK2z4V6nvbhYgQVwBgrB8lBBOPB7Kr6xBupLz8A7amk6v6HbKjr5xERxEFaY5ogmeTrpPd7+dWvd6VQIjISjJgoW7LHUxe/lP6czTkOTxzr6ykMD7Skwa9ZtT9vrX9CsyNOYkTcThngp3pbiqN5uUpterHssA2FmUwRaGF+b5Vlmmch9VRQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdOAE7rf7u4jURSPNN4P/B7ZOfA6PRh1wzNOF3/XyvO3k6WZk8/g63Ih449AH0UKN9VlBL7JCAE6oLR+ypa9lbWs1TSj9lrMR659MGMSEjFC39PlK5FAjWiUaG+70zthFpXiei0oc642DiYHxA7D0b+ArxyyfS5bYxC764gZo/CJZ+8ilUud88nIppOaj9OPyK9IT1kxRKkC4qyQtJ1iLrOSSXgaAkwwWiX00L1QQ6jQdWHNQhBUM+tbXKSKy7xUCw9ygUSQJaPe5CgcHnsZCY6cvGujfZv4aVsQhYg7kp8z3ES+gdlZltgE+OIuiIWcnXFe9sPSOqV4+zprPYhW0WhH5LOGdSkMeTjrIZB4PyxFC/uLdZ1qhtC5N1BcJIpFTAGh9ETcBultJI7DIzKxa4+08yN8BQPZupN4b7J8V9K+Pp+BD5MkAAK6/buQH00Fkw9MtOeaizDDlxzeM0WWsyLw4c8yJ0G+VsIpTE5/blnKh+M8pJ7gDfRNsCS5i6rIhp4mINAW9wcZRthmZ4P1FgwgXdowSpBdob5cCYDgECKPF/qxqdr0RM2q6Qp8IKoJlxT9T1WinnBYipl7ymlpscN4p2Q0eL9xCojsHdBT26+/9bnZjyr3JlFtP7p3pujwA24ailG5CYXMwPiA5MJfuTDLCQICUrFYV+RwWsNBmhvrivkG6tv5XovOtqgmeJUkm3rFyL8uUMvWPG7SGd7pWGNVjAPftTArLY+DOwj1Nsp1pey3DvK4KMe4+BT4NS86wAYfh1ZUJkSxJsq2f7FxK0EQqGKcQqjFh3+nJOLKJWP8Z</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyI8ZCcQblE8Np3nK/w5LUGuwA4vdYDEyJ/POluhKA03h0yFUzmUF7Z9V7sW1Ztk8lSm0qwGoDxxme408QrYurVo5Z/AFvWldaR8LYK4IUb6ihN4vC+My0hgmmLXLER9a31gVZL0qwaWlOx5A4K7trs=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>