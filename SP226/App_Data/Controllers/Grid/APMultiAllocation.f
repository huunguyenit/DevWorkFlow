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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdgtDy1anhVcp2vOR1hUhDqYibnRY/OsjN2S/13QAvJ6JS3gCN5dGRFnDiSq9hO6AKvFuh7lC5toqpadwos5jlVuZm9ahme66EeyrsPtbt4SvtIoxrot5zkMIWS1EdND1JYQW89l1KFZlrNKxAquEmrfW77dkhE5jaWF8U2BPXgALKLXKgnHMdf3CyW0k1IGRYtBU9T+HQsInH6YyZLd+Oxd7M12qx8EmmT1vHfsoLGRxf0LjPgQM+eHYUdCGvEP9IQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPMw7RjPOq7PRd06eTCHvunSs46AoBVfWXLruAwgwPM5+R1nMNmgaZ+WXWLHPjHf4BdlSh7bMtgMS01xq7/hR3wgF8zBR+ZlLt5/7lzWLw9UrSRDWwYd4fNcxhjT+yqlsvwQAOWSoz8P6Wruvx+YD5+l+AExJZ+wmgVzUp7kZHB1n+mMwAwbXxhs0+kZfIbiriF3n+i8cT0sZiUrGalMjwD19OuqnIeG0v5SGeu63cinr0siRVK3xpvRoQFJtACUrEmDcyZ+fBFxl5ienz1h3U3n8URQfWIqJL6ms7XAwsvnuI19ytVio/tXp8iesoB4qxKnlIBr4aUDMf/FpG7fcZ2WOjURkaUaUpTgfcHVTjRIGS5PK6Rq2AS9CTypeXSsWQ==</Encrypted>]]>
      </text>
    </action>

    <action id="Edit">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2xe8m93cBZVMoXhqIu+giSkEgj6dbLdrGGUKiyF6MWulkNxgnPi+W9McdyWSsj2Mu6Td820Rm4JlSHUlwVwsUjHUroT25QYaaIAI5ixfTdcjt9TG0wnR+xjrybb6JZYs/o4Ar1m217tCfw3gzxOQLbuRYuGy1/gpMefvQZAsnVM5X7GSbAcNGNSkl5LAP0EQtVqnK4eyy/jHUctPY+yJyWHHR1rWeSrvlvVJ9q7KwsM</Encrypted>]]>
      </text>
    </action>

    <action id="Delete">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzC2e1t9/sd9qn3dLkStO2w2ShXBzcjPe7SaeHdWBJnO4Ke8rKSw0L3zVHYu/8L3tV1Ww8qqTSnjZYi886wcEZ01Nlgqpk6rM1BPnJwLIq7pGM9reUEvEq5pcceLsAeB284ZFAr0CgQtA+24O4kaQ89U8x7nRlkEWTCnNanGJki+fEQhEz0K1uHftZrEzcp3x/tNYymAk8rJ9Bc2HzlWoFSxgWaPN//JHDZLpNny7m/fsj05MgcQiji972IJAz9SBk8kM6AGiqqB32TYJ8N1NM01DLXwNQltlis2gVcy4lmV6De1GVVeI4ZUpks32kUPnJpv+/jDC95lRGrXuL9p/ZwsYXxLPHpucUlvgYXf1qnZ6W08ZGY2t9Op3zN72mxuLla8RVMkYn71NPHrzvG5nnzVf7PQFfw393+8o7LDGdHOdKMl0q4lyxqAMBYvFaOBlOK2GXlEJsl64dwG0R9dBm9CG34qMlDqcDEpCzBL9qFHd2rGANafOMl9NN2dpGxHOJx5WcZIUae1XtBP5DAISgVAPmUeXVqvb/HzvGr42vx8mVaFUtkorjEExV54VV6uQW6s1QIUtB8gz8U1Qcq3nb+KdRieYNA09xmD8T7mCI6a7vmn3Yn9Z40Yx3aHr8Y4Wycn3OQAf3XZsQO+AoqibTyi965sT0oWT4k0EMRP4JJ7eEP/uCGZRigNnAeDzySZSbfhVZ2Qzbb1Q99V8PPi+h0yJeFUe1YPJfKmVVcZRV/vbcmiobTIKxcsdGIdjn3xvIczmxsv3zOCerWPFrIXwFVtP/nBFpPTOgsN2u+FCEeqwK108R4RWwnn78GX9E/OoQ==</Encrypted>]]>

        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8McnRNiBu2QVBz/eN5jqdzqrEvo3iASSQDqOtqbX2jF1Cjwvma4VI0ZL1Sxwgy1rsALgJWtZhFhpTKQouQdgfMgW9lOyUwiPk4n0Q/hbhnhk0+QKakqSUoqhhFn5U34IfP2IwxglXEvWlrqn7mbCqurBFI0BOaNZzMgy5vyYbzpheLtSQLp6awDa6rVNlP8cWeyDI1FciORXQkwayEcRJLZwnbKOyj/BjFTe7wD0BQXNSuxU1wEY6fklIcAKqPKUqD5vCMjiwxBYSf2gjiza2hnGDqf97S/pID0XH9QmKmjwPVD+3Ukj6Wsq22NfTtWuYHy5oxKeiajXyJQbyI/nKWwidVGV2soerdLDSceMHmtm8zmnddgsKNDKTn46HfUhIvC+cQZUSsMIuuncX6J/isC4bdFTHdBNWJt1Hffl1JLKKnx7iHQBzdnDjaSv7r3nU4DDOLrpCBIa/iZ6ocv0PI4DD2TeoljLewulD76KSGO4oiUx5tza1Sf3J117ZgDr4=</Encrypted>]]>

        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHJNcwQ8tbexRVNHXpc6YyG21sSZ13bQvcvT5dFX8mpTI/CAjahDM7c5PiWZP7iIWR22P5BBZVmrmTPxIrKjDXmtxACK+z+GA5l27DvZHDMWif+OLp//NVDiMcLcLG3RQod0n7VAwTxAd8glBHNC432I5HRR9ZixgI4+7gnw3Mfh/ksykICYIKDiHlgsrI05kIIciZ6UL4w6QPVZfVIUY+XuBBenVe7e33v87c1z79n74yanLIo5uzdVlcsziWfGuvymqJf8vDbZ5OJ0KYff6E5PzQdulEc64NSP/EgsaGUkXAnLvqzIBR8RoeqqYTBM5RLK0/wv91YHsoxfB7RsTJ0H4i/RIG9W9hmA0WJZhiT8s/4CMzUJSq1l7FfU0O7z0LdEGkkokl/VXQJ0r1c5KG1r+UwJJNXUQYFovuF6jfWoLWG5f/mImA+X42djymhX5Q==</Encrypted>]]>

        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwUnptHOgy1oeO/lRpYuejh+pkYBZG6QhHAsd4nXVfexHHLeR7eCl8bywyjlnkSoX0xd+QRouCks84Z7/ZuGqPAatFN9wLmiAbL+k6UMflPt8bFKOBhb/4hBBPDWXC9NBAeJ2Lo5agE7kQaoFMhiRHCM13wwpgu1jdzmQdWKEz0bTqC3TuBP/vYiCZ8DDkWsLNjEL97TOy6i6yd46L9zfPhgGgo4Fx9eIZtv/RMXMuU3TkX2WqarXuqjlQJB7m81lP28vB4u2IGXUSgI51boa1Y4Mi7t90OUTtoD3pRhwtOZPrtB1TUfr/iZPhBmX+jdQvzcEeWdSTo11Gvu+hFZOONue1xkkOob6T4cSHm/p2f/OU2kaPB3S+m8+9A7ED5VaMDcPQ4HvZue0vRTRvoxNqAPvCW+hut43BGElPaw1hPj30xgOBvV6tgu8g4dgAB7JqbzfHcJM9YFuLqOvr9HQtzW68gWUl3L+Y3svuRoUcQUCrTS8XvHYjky8xSKtM5+FQX+spcn84Me5tISwjytsrmneScUWBY0d8HwDO4tdVwD3cVdcgX/wU68q4FnRvu0bAmJGLnaw4VjaROOd0prCM9LiUS9GZs3jyKJMbapl/KIk+CiJNiSbNUG9cG9kWX4D0aWQCIr+fAtQFVjv2HluzGmAQnyGEmsHaiRFuz86jKHYU63qoFUIEb/kdb0/NsPR448MWqyv61HeXhib+rRDegiVyZSpy/u+lq2t9T8sOhWtw+KT5Lkc/37MC4kYB/tY0/V+wLKyaSGGyomXutk3VICdeHGWvDNhoIjnWuo2E/EPaw7cLalIZrtEpWjVcNPia5XCVHz7QlS9STsKj2t+/SOH2DWtVWWrcr5EQp/HwlmdzXMoGwzx+fHft2+hn8Wog==</Encrypted>]]>
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