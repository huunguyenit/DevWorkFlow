<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS3KW/Lk3+fXWY3PtQ7SDLWfh0VJRFhBUUdiHOTvKPp8X9D0ixjgrFZhXlqPhE+ui9mVxW3pTa2Gw3vZmV/jVSR8Ob22uStgw7+yDSuoFA+Txb+0n2x9QPVWj2e/UGSGXojDceM9moQiExW6YtpZ8VICwA7IiFuC1FeIntG2ZM+7lhZpZ9PutTDTK6BRG0qjNshzYQ/To6Gu6S9EnAWkpBQlHMp6VabmctHHOw7Rvkqr80f61kKRGcuOYWdN/e/kgIFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết quyết toán đầu tư theo dự án, công trình, hạng mục công trình" e="Investment Liquidation by Project, Work and Work Detail"></title>
  <subTitle v="Chi tiết của vụ việc: %c, từ ngày %d1 đến ngày %d2..." e="Job Detail: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP2/6iyuU/wuFddf1cd6ivwO/s5BERIVOyiXrssf2WNCZfVNPSkvsCFH0zYW8S8NVMVY5MAlNSUzvtvTfvSEUfmt12YrPJ3cFGj7CuB+7DQtiAiV/2KwvtQl8HJch5YtmXM2Zb2k7BvX55SKGS3pJLStNNnKQkkmw7zGlKl554lL34fHClKD9FtuBV3/PG8zOxS2OgxJi/Za+xt5O1B3EVu2SYPCfcV0VDcRP+L3/mVqRaUtdTqdqvzEh15clAC+b3ALJht3m4ahXoGe+w6GdE8z13ZUsTBOFCE2QZYvjO6luDeJIlCBXZUBzFoQRo8EnAg=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30A4+yh+VWKqS8zJiKxDGbrsGl1434UeRXfP348yD6cmr1U3OBToOqMzZwVXL1VeyrReYWlFHxU3ryGbZiTiRXT86EMR3RzoexJei4AQPxrQo/jvQgYlgdiZL6tmuEbA2NtjsusCzosilSaEpatxdYUyqyhjfAvqfiiqPG9JE06/uO4qUT22/6cO2BSlP3mTM+UFGu398ofIUArWP1kOkjdDnavgzFmtH8r8JvXfmV5yIsgFVOig577b7JaInTsa8nxVjbP19b4o/WZMBqQr/2YBFmL+nYR2eGPuIGrRMfUncky596Nii2O0Oei++b0zMzvxmzXXpOzntfD+MD6nJleYOv4uq1KuR5LVCApDViHLa1GYyMgWwRqvbhCSCfm/wz3RS/NtTQFMZOqJlWCmzzYMJdU9YWdw5mfoa5rdAfD09EupBCatSL7zrF0a0RMbhWuRrPGYctfJCT0qSWyJJN1/QQW0m0MW4l7qlMf8VjvvySBXklVy15yiXxvbKkZ08C0w3n500Z2A9J30ZNrv7+qXLclwAQf0oTLYiJDgXjJjph+gVikDYgodwrbnEA8o+TNSKGN1rLz6pB65U+07TlrKOzHg09aPRjWaBrMnkQIof2QWpaHLgjOQ9XloO8DQW4xA5418VvUjJdjOTihUu3Tvc6VbMWz/1Z2Aoq/FWTGZdOsw+pGIF227gr4a+HFu+Vc+G3fOPye/U9Jq+a5WKwnRXxt/OnMQsXksICmsd6EODAVMSo3HxZLnVU6BuwI3ULWWCu2tAmcUi5orfZczINuDEBi9bSZ08aQlikWgG9xO1BHYEett1ahIocv//k44haeecltrVB8lRmTiHZXYBCxMObhaJL3/W1TTlANRL0Lpkv9IOZ2esyyVT49a0x8lwWqwFNU8SpHb2iLvmi5YHa66ZwWc8XbDJYNvKM8tm2vnqKDmn6oHL2kd8ENbEMR7i729y/CFr+mHAFnVrJJybRedO98wcRNOxJGNAmQygPEjJJCIVShDMoz4UA2JbDD5AdrAueqxoiQQLUcXtt0CovV4Z//XAbWs3uFiHtJYz5mmu1tUinPuzWPYb5FTH4tITOwFZORoBWBqIxWsOa045l3dqoNUqL6p3QcZLDzk3Se6GnnseoqZ1kB6gnSCm2y8B+w==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfOhASyRGGNxk73joH3SU7cOqPK9yBrXWlvqUoFJ1++JxIOe3a22TogMLZ4pb0q7w1NZopelraD+EvUrv8nRWFtuzvUYjiW5CusNiELoqAKQUmvh4bE8L+aqYIY9Es4AJp</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2Icc4oVPv+Qweyzmp9U9eiHw5cDgG0G2+YIPM03O3x8jhUYd/lZoIXPzZtzo9MnYa7jSbb2IHh3F9x7excCzySbZZGinl7UgSrzIr97+YUw/HHrfVICChZMA0AVj51LzwnioI11rMolcBDC4hWErx6xXzxRKufgVSbN7KXjZ4aDFMZD2xG7HMgqlhPzATz8K5r1tLxWr13PnpLSi5DjqXGC</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>