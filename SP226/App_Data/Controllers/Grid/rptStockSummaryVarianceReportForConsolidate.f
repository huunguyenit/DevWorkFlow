<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\SessionInit.txt">

  <!ENTITY k1 "ma_vt">
  <!ENTITY k2 "ma_kho">
  <!ENTITY v "">
  <!ENTITY e "">
  <!ENTITY Url "~/Main/rpt_bkctsstt.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "">
  <!ENTITY Fields "">
  <!ENTITY Seprate "">

  <!ENTITY Parameter "">
  <!ENTITY Session "">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh nhập xuất tồn sổ sách, thực tế" e="Stock Summary Variance Report for Consolidate"></title>
  <subTitle v="Kho: %s, từ ngày %d1 đến ngày %d2..." e="Site: %s, date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="Script:">
      <header v="Mã vật tư" e="Item Code"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe9/yg7GiBHLAPDwcX7hGN7PibRCJLp8wsaL6qJZ0Mkml96iSM4hhVrVkpSC43Rgrw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ton_dau_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn đầu ss" e="Opening"></header>
      <items style ="Numeric"/>
    </field>
    <field name="ton_dau_tt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn đầu tt" e="Physical Opening"/>
      <items style ="Numeric"/>
    </field>
    <field name="sl_nhap_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl nhập ss" e="Received"></header>
      <items style ="Numeric"/>
    </field>
    <field name="sl_nhap_tt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl nhập tt" e="Physical Received"/>
      <items style ="Numeric"/>
    </field>
    <field name="sl_xuat_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl xuất ss" e="Issued"></header>
      <items style ="Numeric"/>
    </field>
    <field name="sl_xuat_tt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl xuất tt" e="Physical Issued"/>
      <items style ="Numeric"/>
    </field>
    <field name="ton_cuoi_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn cuối ss" e="Closing"></header>
      <items style ="Numeric"/>
    </field>
    <field name="ton_cuoi_tt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn cuối tt" e="Physical Closing"/>
      <items style ="Numeric"/>
    </field>

    <field name="sl_cl" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Chênh lệch" e="Variance"/>
      <items style ="Numeric"/>
    </field>

    <field name="view_nhap_yn" width="0" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="view_xuat_yn" width="0" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ton_dau_ss"/>
      <field name="ton_dau_tt"/>
      <field name="sl_nhap_ss"/>
      <field name="sl_nhap_tt"/>
      <field name="sl_xuat_ss"/>
      <field name="sl_xuat_tt"/>
      <field name="ton_cuoi_ss"/>
      <field name="ton_cuoi_tt"/>
      <field name="sl_cl"/>
      <field name="view_nhap_yn"/>
      <field name="view_xuat_yn"/>

      <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP03PMdXgyuJwwTPia4zeDtbQiI8C3Op3LSVs8rghzXrnekTiDo+aBQ0NUFLrqPEuuL939akeK41i/jKSaDz5tBD8o6UOepwgy3JiPrHz3dSehKq8iWO/pRt20ZROOmHeaOoppGb7omq00GkfiZHfJrdjzz34ybWhi7MMYfEml+/uolzK99o1aF3PfTdUMbzztyfk/BNSd6ODzL5rSXMZKKA08yehCA/aeP92J4JDuf+Rar7mZa4C4UNPnYM53BIuqZgY5eJCMw9+kW7imhnqM3ISgFecZ0yfh/xRBot6qPs3v+t4gvOKm07X/fSMvwgNess8unai+JOLe1zB5vGTJSdiTnA3eniqJ4ZjJFdA2mRAOEG/8TCTxdH7GtdqMMi9YHRnwbPqEVApmasCrxwcsJ4MD8d6EzRGGRnFnuIZ4ridBoEDyoPyDt+4V7uecjLHyfYodZobvfP2RKx7S0tmiItKZ56UzA64UG7ZGmvH9bAl6gCkzJwTRDKdAmu8AAzK7To2lODFmkIxt62Qp8raWNOoFUN/+kLBMb7SXWCus0oNo=</Encrypted>]]>&Url;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162yaV0ymCL5CFU7BHL5d7lrHR96mWBLKwPHWV3dd+w5bvJtSyMD+AxFzgE+b+esZUc=</Encrypted>]]>&Parameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f5cv01dnfQ7A7D17EAqD8DRR6xdEWAvSl+ShUAWXm3MlESCc41WEGTn+Td3H5qTsfmtZeMnWmZrEcejgEALKlHIbZubw4bA5eQnTdIXSpAs5N1zN2oECqDcm+M+bI0PV2zUXQt7WNHUAuV4CsuQzDokmJodaQTcWXcstpvIo0J3s2iG7I2lIVo/V81SYZ3CSVMfaJYi1W+UBXLxZGk58qk=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egXWiOOoJKzSgYf7u63CS7K6HHOITS874/6CgCvGJRF5+iaGBOLTBguuocAavg88mBYlJ5wdUoPd2Ok5bbZWOU2HJc3UuAuqSKQbNCmYOvvobHvhxps0QrojKE+hd0JnUdidFwIrpqLA+8g79xPRJ7VYe1ULY/8ws94HgLcaEvv+BavMUeZHhqt2FD/V20akGTg==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFM7869DY+6XQy8+HPFNZqvBvcN2d2dWtE9Sp25Mww6DPht7E84xJpVkHFwFHuggZOabdwuryF3HksOJHpSL+GoQ=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHgbb5uFui5J9d2D7APTZK90yzsnr1Zrx6aU+b/f393yjECmeNF/LlFDIuM0KwJJSpqsT0eUUQOH6rnYhVJODYnan7vHi8V12Q62MVo8hfjt2QBetFxXQq6dMYPbja1iRZPALOXvKbTcLr/xD1z/j8t0RaiYxFbEDY800ssahLNS1bCtiUQDDl2AgJcJ4CjKSDtHeeUAJi4TTYP6I3hWpi74/AfNKld6bS5ssURQEfRcKS7TBUlZjVmHTwwKF6/Bo+cWx2Rw+9OTgCNidkhuq3s=</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOhBs6xNe4U3qnRfc7twg5Qj7q0YLb6XgMFd+t0NyYbjNg==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>