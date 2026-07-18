<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\SessionInit.txt">

  <!ENTITY k1 "ma_nl">
  <!ENTITY k2 "ky">
  <!ENTITY v "">
  <!ENTITY e "">
  <!ENTITY Url "~/Main/rpt_crctttcvvm.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "">
  <!ENTITY Fields "">
  <!ENTITY Seprate "">

  <!ENTITY Parameter "">
  <!ENTITY Session "">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo trung tâm công việc vượt mức" e="Work Center Overload Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ky" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ma_nl" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="Script:">
      <header v="Mã trung tâm công việc" e="Work Center"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe9/yg7GiBHLAPDwcX7hGN7PibRCJLp8wsaL6qJZ0Mkml96iSM4hhVrVkpSC43Rgrw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nl" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trung tâm công việc" e="Work Center Name"></header>
    </field>
    <field name="cs_du" type="Decimal" aggregate="Sum" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Công suất đáp ứng" e="Available Capacity"></header>
      <items style="Numeric"/>
    </field>
    <field name="cs_sd" type="Decimal" aggregate="Sum" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Công suất sử dụng" e="Capacity Used"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="ma_nl"/>
      <field name="ten_nl"/>
      <field name="cs_du"/>
      <field name="cs_sd"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SK/xjnPuOo0OqrflkBosCIy0ooOqhYvp01BJWFTp9KUooRr5gZU8TQyl7eokUA0jsj5NHdkGFbHoEbwN+zs0BYGoqBTlv0aiJS+/pPX4tzRS8evPM3xLPVG8NtXGj07Cl1zcHwZPkexjDRkPTIt3G0=</Encrypted>]]>&Url;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162yaV0ymCL5CFU7BHL5d7lrHR96mWBLKwPHWV3dd+w5bvJtSyMD+AxFzgE+b+esZUc=</Encrypted>]]>&Parameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4W2QhLBj6PZQ4AAXbzbb2/YJ95DRn1Yek+p722GFqg7zZ51Slc1WmrqbduT/bGtHIBZMU5oRjhQhm0gVxAg72XLkzjYeIMjFV688vNxBzykX</Encrypted>]]>&k1;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egXGTkhNMPd5JtygFY/Tdr3Ygmq3lJ9gMm6L4HGwWKqqpRDVlovDIzEUq8lyULSNXccZJIY4D0U1Lo7J6WpNKgLDvWJ7nRbdzJqr9fTgtgg6b</Encrypted>]]>&k2;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egUqmp9vFTgZM9q61CfhDI9UCKHxpJdpxTkNxDHmkiYefZCtCPjNtkwOKhVr8h1wi4FeUrf559qhB7zD5IgJf/5EE1agrIIDwL/btx4+QXOd7vh6bjUek/M/6afW7fNCv0PoUqjvNv8roGJmze+eELWP2eE6g5th2Em5eV64De4Xjr3u2Te4wBk0lHM7PoQJW3w==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFDQK+UnljrIVDawsVR1A/jifCQV99HTXFmCXFSfuJzljCiQIhRaJtv4ZsN61XGIlP1w77Ts6yBbugKxlIYQ4h+KZXlcNK5Gny9+/qlCGV6aKNDooV4pqAoqV3RbHesZdwPMfppYjEAfNKpCYvbTXufw=</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOhBs6xNe4U3qnRfc7twg5Qj7q0YLb6XgMFd+t0NyYbjNg==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>