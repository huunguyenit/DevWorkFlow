<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="quy" allowNulls="false" dataFormatString="1, 2, 3, 4" align="right" maxLength="1">
      <header v="Quý" e="Quarter"></header>
      <items style="Mask"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = 1" check="1 = 1"></items>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [quy].Label, [quy]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9rR1Lc1gCk7jL6FrFWROz8hLr5nJKh15hyMSsFbdbRhiQLdzZyK6YBCVfmE2HaBQzjRWvolCy723i9BB2T0M7FbN781seVTba0nJ4owBp8gkso73D2SmipXCABqdBSnsDtL/bXS/aGiHVtVxYyo0jixPExWTlsBY+l7NwBtiyWPf6l+S23fGMlyZ9y4WeHmTXViVqoUpqNnLkQrqBapC08=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq21SKXY84ucg/nMIDEtTVo+uC/plL3hM22HvKi2yVmiEBgTeFUY3KI2H1w90GUWLT1HzC8jfCJa8bJJUr6XI8tkESqTmSl5eQ6JmyNu/7NXxpERU/9eYx4RuOrdwaNCfH9It8mWA68X5+/j/ZqzsiOMjC0Zf2dXMLTrqZHrMxW857jtQ9E/4WOtWPTUBUvaJIY2ccqHSIrreTeHhyyM7yAOQKcs9RFq7Fvx0o+j1N/cPvV8ndtTGTzTpo3M9rhn4Ts=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3jSn0d/7XyoxWbR6coY+NeVUw29NGTpsKo0E9nvZhLotr3muyhC/FBnhauF2S3qqxGr7ODmBlCNumFeg3+3zUkBrKZGytd4K7Vv0HQa12u4L+Riu3GfcjLBxvIrZczGNfGx0Da/Psg0HGnSBvLKzl6e69YOA2w4Qnm7KRiuCPdMgXUXfe9Aa9+Fkm9hDzcIYw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsApUOEwGk2OFNOYQ/GvDTcxEMjT7u3TJif1DrXrWWXXQXn4Raux3ynkEwRtSqzHUFII7rd9iOleSCOEAMhOaBl80rkVYqsybMfnBzNyPEZw6pQ6blHh7p20WFrQyxdR0tVtPqIErk22QooTH0entBin2EK0V4iIyyfXFDEu9VzWzKJYiLbSpI/pOaDzR5JayU50KNDV7UUEExd3mgAvOiNuuhYmBQM+JqGyRX6e78XvSKNFmYEwt/A/agq1jxJqcCFjzDlqoKJ5CxRTVyZzccbOWZcsR1wkDtPUBWUIB+3AB859yh1daJNiLV9jJ0fz8aSI8y2P8Q6CyKfBwSjICIMusLn5JJJX4857TlYqiD+r+MCZPmSThNZTOyNWdUVHn6ChovgslnMfRjku5aypJHcSmRCFVt6N1INUH1aFhYSPnQ=</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>