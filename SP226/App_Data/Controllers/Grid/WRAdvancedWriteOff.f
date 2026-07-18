<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Identity "WRAdvancedWriteOff">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo chứng từ tất toán cho các hóa đơn" e="Write-off"></title>
  <subTitle v="Từ ngày %d1 đến %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJUQtyXXpmO/p8kSuvgzWgFL/JG1aE2vNLARpub1d+L+g</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqJWNLN2Axcgi52miG98XNjtx3yozRchYHIW8+Amxfn3pJTdce3KXhaNcA2lRJ0PbLQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec_v]'}, Script: 'beforeDrillDown(this);'" align="right" readOnly="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="phai_thu" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_thu" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="con_pt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" readOnly="true">
      <header v="Còn lại" e="Remaining"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_v" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="phai_thu"/>
      <field name="da_thu"/>
      <field name="con_pt"/>
      <field name="ma_nt"/>
      <field name="tk"/>
      <field name="ma_ct"/>
      <field name="stt_rec_v"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH54Ser3yo3rPUE97UIbCsaIZjB2y7MNuBpOQoynSZ97lfw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12P9aUpt5xNH6f9RFYkm305VUU1BrjFWi1k6tRkiF3JXeEWoEmaH89G7MOPVNQdvWoPZLvt3YarE+AL7LeefQC0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+yAXv+qc7cK7UbPXBD2qkE4qoeGEibzJoEmR248ERvxJNS6dZ1z1bvVmUrqyqDJ5FcxMfe2nj08SeVM66B1qoF1MP6tSIPha1oY+Y5ZZhw0wZK/vWLWEOUtUXCeEQaKuJlQzHhdFsmpllP82rJUq1XWHX1THiPDI76beSJz5vTq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+yAXv+qc7cK7UbPXBD2qkGjbhlatySS7kdfSPk4Z8aFPVF9BgU2M2M3b4eddiRCyvs8QUhzSjy2n+91tZwPyehn0W0CbuEpcvjzwEEb13WD</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmNJdsB6OMvyGDRDslybEqOXLNS/0Ollo4wucxE60wCPw+uy22/lVD22tf9Ndv60Zy0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19F5U7hVjVaEQhcY/KP8hu5UeAif+TZ8M7q57uL7GeZnaDMBG+4URj+jZTqmj97oOvmmyH3NWAwV5euvP3MXJ8uHsQ5L7ur493/3VLfM6+akj7I+hV+d5oOuzEUiGWvmvOhTgnqBuWAqdFcJBvg0G4tMduKcjRmJVpOkwhogZ1/c</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4budvMZc9wHpO4xqnFZhAGGVn1pn7Gdf/+wttBIk5YEPLGamaByYcLOd8zB6rOn0yoSJ7qTjFKdoUN8BCggKOWTG8wspWg785x7uPZhbhV5qJESjCwnL93WBYd0nwLrxxeWd6Ct2q6D+njbgsZOM+z1n+TDIfSLaFljO5MXZFO5KbyR5gbzj8/Z77Ir3IJJcfEyM=</Encrypted>]]>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RrOThwVTVRnH1mjYFRCTMpq57EXAXjqSKVgf+p4Wiws</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BIbK4BfDL09jEDHeDmUGGm+u4Tee7SBu8hFBoSWkUcVCHEx+5pIF9vDJucOaDd+PIc1zo90HfSYJW3u0MSCFWLFMq1xaWn21sGyN2Asv7yWX9W+xnCfDueje1cbYziGuh8PsPYR8RiuK3OiS8VOVGdiqeSGmqeKyQ7p3sEttkQdsG6BTCHVKehJgP9KlPgnt/bSkA0Ti1at8VSgb2/eTBImznhUkT90n5swzfGy1wvayaZ63oZdPo2mvDFh9alW53N5mfozyEH7T4WR4LTzF05u4rNxukTwyt+3Giidulqcr7wBpJxWWkV8Mt3CA0SL6g4Uj80pE+F1YOWiKV3bZoVhiZlYTiFIyhCAd16+1Nyze</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqJWNLN2Axcgi52miG98XNjtsOY/TFpxEy86PmfevG4y+c55ok/CzbHZvjeS09RmQDYKcdHVkdQMcxJjhTvU8bF0VwQdzHJyNHtjLNVG8DlmPUkYLaXIOu533hkyRkBMssv2Du0MbjP4zb069+8VpqK0qdpg8KiX2OSHjlwvBcYXexVjrKper7uIAiwrCdHYcTtxf2yDVGRXauQ/QdX+zEQT1FpayU7l9/FsRr8sPC168htEyrJGxvuG3zsqa+0bPTX+C0wYg2mb1eRd01+0e4O6ySP7Nfz9D6jMe+t618sguqnv1xrRVqJ2M3zvwnAZ+DZVylgJhjzt72fRJ+8GVIwGTUxZUO4ryrKUPY/gJyKKJZmiLSTB8yP+hugEvd+zcOA/akmEeTK9BgiOQyIAbFY2/ZASrc/OrNbAf5YV9Mw9zJj0hEw+wG+KaCkPxH1lYaRSOynxzyu9SU8CLXOBNhwQD/eUq8JFsLAoLCeAo4xolWRbSVoC5eM1vHbHlp0vOk9inbvU1blgnG2twm8FaoLwv1K1R0JgVa6b10epvrLpQkGTFbifjzi+3wrVftt/9UMkBk2w9t8ktIMPA/aSVBGM+L0HZ6PHOHCcyeK/PYKBo8peKxUeqHQxzv8Eu08kXcUC87fUO4ZeBGU/bZPt+fAFjJM90Kp57n9pcYUDN/XL/l0t2vtrLXRxedK94sy8sxwGUD7L5nJdbVNAU1JOFFwCkghy3Zm/AbacK7xoppUMy/qMhJYLWqrp6WAdat+zsNKQaqoK9D+rJlaHTgocRZRYFalcfmUZOG8PSn7MDJcGY</Encrypted>]]>
    </text>
  </script>


  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="CreateWriteOff">
      <title v="Tất toán$$90" e="Write-off$$90"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>


  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuywSpdloX6jbQ3ZMCAg6Pn2P+LZggG+143oydDAd3KkrDP0E/YvHK90fBiIoxx/yXn54LH0g/Syk4pkKhr3UU81XM+Q4u6mHfO2Z+nD4T0JHgJzmcMsZJAESxFhpjhTHla1qrYI9UER8T42+56dK3rybx1WkYdNq5bELRhgZh4zEHfpkBy9l44YLAmDv2ja/41VJUzQKk0tXM3GrwoJxhOs=</Encrypted>]]>
    </text>
  </css>
</grid>