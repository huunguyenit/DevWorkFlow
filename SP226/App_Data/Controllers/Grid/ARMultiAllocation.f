<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo chứng từ phân bổ cho các hóa đơn" e="Auto Generation of Payment Allocation to Invoices"></title>
  <subTitle v="Từ ngày %s1 đến ngày %s2..." e="Date from %s1 to %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
      <items style="CheckBox"/>
    </field>

    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị" e="Unit"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ct" e="VC. Date" />
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec_v]'}, Script: 'beforeDrillDown(this);'" align="right" readOnly="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="tk" type="String" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="t_tt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_pb_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true" aggregate="Sum">
      <header v="Đã phân bổ" e="Allocated"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true" aggregate="Sum">
      <header v="Còn lại" e="Remaining"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_v" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="tk"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="t_tt_nt"/>
      <field name="t_tien_pb_nt"/>
      <field name="cl_nt"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="stt_rec_v"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdgtDy1anhVcp2vOR1hUhDqYibnRY/OsjN2S/13QAvJ6JS3gCN5dGRFnDiSq9hO6AKvFuh7lC5toqpadwos5jlVuZm9ahme66EeyrsPtbt4SvuM1Vi6wOWtskKUNDLbPaXr9UyL7PRQMrow2p07f+U3pak6byhfqXw1Hv3fqjWh49iIBPuk6aRDYk46H3z0HlyBabEPTrQ9tlxHqwtMtH/rIplSoEuLrTQI9EmMlDnDz2iKqvbbskm45MUc/X4VE8rg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <response>
    <action id="Allocate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPMw7RjPOq7PRd06eTCHvunSs46AoBVfWXLruAwgwPM5a+/Uhriq0gN7riDH7TmaKDFpgtzP1mqd+8hVnkei++XqteFa1Ph8FPvbQxoPvivqRtQsoLEaJreEoJ2B/CSwU0yvcs1GHuxy9drGVKhFZDSdZsF2qvLUzgY1z+U1/yQpPlAc4rCZjNnuN+pnJH7rJ2TXr0LcfxWFqYEHtsM3x0WfPnrgVLsMN40lKnhFddo2uNhig7EbUq0HF9AWgipFWBJjId+zesVbYgBfEgLfawHIOsMOTr6/InmaO5kx/4olHlOewF8R503yTHjYCVUsOQ5+v+J0RGiBqaCWQilQX0mtzaZXl5fQNNT/tEyK7XYznLCW7tXXtGRo4w02UF1BAg==</Encrypted>]]>
      </text>
    </action>

    <action id="Edit">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2xe8m93cBZVMoXhqIu+giSkEgj6dbLdrGGUKiyF6MWulkNxgnPi+W9McdyWSsj2MksF945hQL5OkNxmJiocj4JmNLRg6ZA6QxsOreBTUotvsu2QEKjS+DM9e72UcjuBLnDYqiknEJS+Y87nHp698yPH6xj5Bf+6C71tFgdKpO5e9VpV4hyAMohnYEJQgIYgz4J6l0BHNGIgZ36QsETOiwIr3JqxodElEzsY8C9lipaX</Encrypted>]]>
      </text>
    </action>

    <action id="Delete">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzC2e1t9/sd9qn3dLkStO2w2ShXBzcjPe7SaeHdWBJnO4Ke8rKSw0L3zVHYu/8L3tV1Ww8qqTSnjZYi886wcEZ01Nlgqpk6rM1BPnJwLIq7pISjFrjr8W+APKFIm0omRDq7HPkvlZcwnFi9F5QKdCWqI5pLNwTzxtA3fWmZ8tpVZexv65FFsa8B38ALWSLNuzJnZUvSYATFyguyDN3VtTui5TFK2HbbcvMORJMbRcR5MheddJJsLVpeRQjDfgBllB3s4B4DA2NK6BiINUCfnJ2wr9vWtQS/Gas9/sliwGWkVr33H5gc1F9+BvZ0bI/+TtKn9jIwu6YGfdbDKDaEE7cvHcJXVlyIqDBX//B3TlHHxpEDy0HNsIVPv/rakadmQbWrGEebC4sftnCpRBZ6V/Xtjn0t5tc+7cfm4vpFDUcKl11a20SEd034e78lpQHM5wJA5g7iJ9hH4WaeKWnbt69bdqG53572Cc6tmCzSBW9b0YoQYWS04XpIqgUq8yedrfdpF67UIOY9xXSwzxNx1l9cQ98piD8s9gKijYQ+D0AYJ61cq/QsDERQYF6ooFR8X6D8DKsWbpYBAA9QdaYUHZ/UKn5mWhC5r0ks5vmfU9gmK/glj6x2v/SU9m+H4Cy6njan9qeY+RZnS0B8CHh6Js4c6+o5mzmBTWIZIep1Uh+2zohSIIH2dPmJS4p+Fub4TnP9L3Iyf4PGJictCnbURlbdhR8kuJzwZe0o1oJZL5NwbOKzQTl9qgMGcNm+8ghev06ZthQwLwPRw241AHu8/tQ1OYeoIVRubOuF+Ua05MVtyenjC/ZnDrVADx/UlYy8IWA==</Encrypted>]]>

        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8McnRNiBu2QVBz/eN5jqdzqrEvo3iASSQDqOtqbX2jF1Cjwvma4VI0ZL1Sxwgy1rsALgJWtZhFhpTKQouQdgfMgW9lOyUwiPk4n0Q/hbhnhk0+QKakqSUoqhhFn5U34IfP2IwxglXEvWlrqn7mbCqurBFI0BOaNZzMgy5vyYbzpheLtSQLp6awDa6rVNlP8cWeyDI1FciORXQkwayEcRJLZwnbKOyj/BjFTe7wD0BQXNSuxU1wEY6fklIcAKqPKUqD5vCMjiwxBYSf2gjiza2hnGDqf97S/pID0XH9QmKmjwPVD+3Ukj6Wsq22NfTtWuYHy5oxKeiajXyJQbyI/nKWwidVGV2soerdLDSceMHmtm8zmnddgsKNDKTn46HfUhIvC+cQZUSsMIuuncX6J/isC4bdFTHdBNWJt1Hffl1JLKKnx7iHQBzdnDjaSv7r3nU4DDOLrpCBIa/iZ6ocv0PI4DD2TeoljLewulD76KSGO4oiUx5tza1Sf3J117ZgDr4=</Encrypted>]]>

        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHJNcwQ8tbexRVNHXpc6YyG21sSZ13bQvcvT5dFX8mpTI/CAjahDM7c5PiWZP7iIWR22P5BBZVmrmTPxIrKjDXmtxACK+z+GA5l27DvZHDMWif+OLp//NVDiMcLcLG3RQod0n7VAwTxAd8glBHNC432I5HRR9ZixgI4+7gnw3Mfh/ksykICYIKDiHlgsrI05kIIciZ6UL4w6QPVZfVIUY+XuBBenVe7e33v87c1z79n74yanLIo5uzdVlcsziWfGuvymqJf8vDbZ5OJ0KYff6E5PzQdulEc64NSP/EgsaGUkXAnLvqzIBR8RoeqqYTBM5RLK0/wv91YHsoxfB7RsTJ0H4i/RIG9W9hmA0WJZhiT8s/4CMzUJSq1l7FfU0O7z0Jbx6CoFI2qUWpiQFsnjIYX0ciW/egc3iz2BDfcCwsXomtb7m7clnDxUqXP6I3jwug==</Encrypted>]]>

        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vMhjxYRsYWviwKhIlqoAhXglsG48ZGsoU/ouRSojADbduRJfs+/qXayktXxLe5jXUbxShvJehKzM2FVVjs9JBoiyDmzOGFa5K4DXZiqIzVkKycaiX28G/kdbcwEms1yxZVIUvforTJ9+duJQ9WyWJlUIKAHgmGwaVFqPk3b8B2r7PpSp3EYPG+/O8W5gG5OROXzjq05ypen2BbA6b9za3mc7p90tBLOcKhUPjFWYoJ6YwbWeXO7PZQEsk2BDsEdGQvdkYI6nTAtiLoU00ssZFkn6+Pmt7N4S3aM91sF5+ltAC2sChBFZf7xaod12ebv1kwYD3Fidnursi2RDr9RBxZk58SIeoKGeEs2eMkt5M61PqnCO3T3BfioKtAyxidIoQw6lQNp2CU5WGwxfYV4mn7Pn4o06UhlQX8lU1YDt05tuIkfdBwlnqHh2HTwPLz5QuNhvjjG7pdpVBLIWLUDYc7F5jP3WAD82QpQVQRgS56W9GkPUny/49WOupe5q3aO7aMyPNoDKqIIiB2xWOf+Jqi7tInCuxIduUUkposCd/+9cEP4I6y9RCZ+0agEUoBMvtSV3HPcrlcoXboieSS6vcMVxUOcgOMMMpq6OZ3bLrlzxNdH4rS/qSqv/zrDPwrVc5NJCKBlc6xdWpSq22zKEbDDo5SIcCaqDYfRKRR/yqI/gc7YNz+BhVbBCBCxjPRjALUMMWdVA/GRA4wv0cxioTzmGhddzTWZhGEpz0Lx1nhUa2t2DT3a54YcW2A4xKF0a7qf4zBQltUa3Kx3K3fCXNEZ/6NgSYI8NsyA2WBTCfMmsVzd0gJUvgHb2O1u3qz6Ztu6PvRrIkU+TzEzK5DBtoR5vJJ/Yya8A/ZEj54IOxrXj3Hq/tzkdzDSuXMFofxnQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy5PiQSDUq6ETw5QEoC03AGEXjQnb/wBd3JSeF8iEL7dG/ZP6HjkoJhux/JgRc/6BtCUCPEzz4Ytb364ZzqCyRL/H5Iz4eAjdDLU/26RLIru00ulCi84uwXZislGML6RbE8Nz1Q4NFPNkYr4vwoKnrN2fvtKyeClG61Q9Xm9+cHEd3StMK70c1YjkR6Xj1ifvA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Thêm phân bổ (Ctrl + Insert)$Thêm..." e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Sửa phân bổ (Ctrl + E)$Sửa..." e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Xóa phân bổ (Ctrl + Delete)$Xóa..." e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>

    <button command="Allocate">
      <title v="Phân bổ$$75" e="Allocate$$75"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>