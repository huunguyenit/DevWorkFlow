<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Deductible SYSTEM "..\Include\Deductible.ent">
  %Deductible;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vp00$000000" code="stt_rec" order="ma_dvcs, ma_ct, ngay_ct, so_ct, stt_rec" filter="(@@admin = 1 or (ma_dvcs in(select ma_dvcs from sysunitrights where user_id = @@userID and r_edit = 1)))"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chuyển các giao dịch vào sổ cái" e="Post Transaction"></title>
  <subTitle v="Chuyển các giao dịch ở trạng thái chờ duyệt, chuyển kế toán tổng hợp... vào sổ cái." e="Post Open and Posting-to-GL/ On hold transactions to GL."></subTitle>
  <fields>
    <field name="&Tag;" type="Boolean" width="60" filterSource="tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZKvmQI0R2WMMMmFOZYFZQU/Sjtq8RSfnKyygaHdGgVh</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã đvcs" e="Unit"></header>
    </field>
    <field name="ma_ct" width="60" readOnly="true" allowSorting="true" allowFilter="true" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="Code"></header>
    </field>
    <field name="ten_ct%l" width="300" readOnly="true" allowSorting="true" allowFilter="true" aliasName="b">
      <header v="Tên chứng từ" e="Voucher"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="VC Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" allowSorting="true" allowFilter="true" align="right" aliasName="a">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" readOnly="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tổng ps nt" e="FC Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowSorting="true" allowFilter="true" aliasName="a">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" clientDefault="0" readOnly="true" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" clientDefault="0" readOnly="true" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tổng ps" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Decription"></header>
    </field>
    <field name="comment%l" width="150" readOnly="true" allowSorting="true" allowFilter="true" aliasName="c">
      <header v="Người sửa" e="User Modified"></header>
    </field>
    <field name="datetime2" type="DateTime" width="120" dataFormatString="dd/MM/yyyy HH:mm:ss" allowSorting="true" allowFilter="true" readOnly="true" aliasName="a">
      <header v="Ngày sửa" e="Date Modified"></header>
    </field>
    <field name="chuoi_ngay" width="0" hidden="true" readOnly="true" aliasName="a">
      <header v="Ngày sửa" e="Date Modified"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="&Tag;"/>
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="tien"/>
      <field name="dien_giai"/>

      <field name="comment%l"/>
      <field name="datetime2"/>
      <field name="chuoi_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFefnYcJvcpIPOT/I7Rco4jL5aK0Hzqyh+jSWOAXFYDypSIXo7AENCTZ48u8dlOCiSi8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8gbAtT/vmJfZmlPtU3L4mNIsPSbhCY2N/H3WOSbkn9u2dXlU0VEpdak0gCXz6SVebhTKJg2kR112N4WQh+1m7IG</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753HSwI88Umk8pSBKg4pN8/55bYE4c/ntfZJ/XjRxGp9GcXB47XclJ36Kk8bwk8JsmrJRpy0goiMY3H0yV9g+org=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UYWZuA3UO3MSUt/vKlYJWAlfnK/nrEFszqTF8HjLMr9yogJ98ppCqELgVuR64/RIsg2aARCjlleo5q7TPNoKpPrwGkamfCm8PNU0LJSPd71efQpi/GUU18Am6BhToLRoZ60CRTem5eLHvPmxfC+aEg=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <response>
    <action id="GLPost">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSBvZL2B6M2QJw6Bs+Z6+olASNvWzQsaxfwIE3rrU0xEs7Bin/B8JMOlRP5ifcAf4KQbYLAwS1+CpLjcC73620vVjb7/W5AmTv9Ni6h2vsADnDDJcjzovaB8QtZ6B/WN0/e59nnkOOb+Jy4Do6j5DrVXYBgJmShY8QzUrLkXvWOex/g6PTM8TpctgJM9AqiWyQ=</Encrypted>]]>&DeductibleOption;
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1cQ81Y6MJZRh7BOmZVquf1G+0kS+B2Du1pfQD5tCHNsU7e0VzwONmtq4aXUwHV0lQpWC27b7ODl0D6o5WfFaENuTUiy/OLub+iPzfsahfn6GB7w/fahexrXin9VPz9bTopHqd9aKIbDOGJu8/wazXLZoo3GMs2n9t9LAU7c3fqgZfHDLVbyzsOBgjGUj7LI8+ohbODo4b9iafm0uhnbSWQ=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="GLPost">
      <title v="Chuyển vào sổ cái$$120" e="Post to GL$$120"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>