<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="ma_nhom" onDemand="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="NotifyGroup" reference="ten_nhom%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nhom%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="loai" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue="0" align="right" maxLength="1">
      <header v="Loại" e="Type"></header>
      <footer v="0 - Chưa nhận, 1 - Đã nhận, 2 - Tất cả" e="0 - Not Received, 1 - Received, 2 - All"></footer>
      <items style="Mask"></items>
    </field>

    <field name="user_name" onDemand="true">
      <header v="Người nhận" e="Recipient"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="" check="" information="name$userinfo2.comment%l"/>
    </field>
    <field name="comment%l" clientDefault="Default" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [ma_nhom].Label, [ma_nhom], [ten_nhom%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>
      <item value="110100: [user_name].Label, [user_name], [comment%l]"/>
    </view>
  </views>


  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQy/KLcOxlwXJpqWatbr8nNS33hnheh628jLOo+Lx/0CyGEBb/BWxN2FO5HvxWilqP1hVQjPmG61G72SvNHK4stq2EemoMahRi5bsRiIN6i7z4qBcqXnLW/FMrxS08XHH6s</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TJpRQrHqPFKzGzW1Z/B56c0bHj4tU8h0tv32h/8nzivdjUmr2dR9ntPk2Iio3A6IFMspSSkRL7G0P7qHeJzzLHQEUldp+CBPxPpcCguwXgnmknDHKfI05Co8/dTTnTDKg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPQr4O6FY5q0bAcsZ9/mIjk8aRrlALuvBJlDnATCf2TdmLUjWLOJbXJe7+qK9zHXLIoRr/CH70u3es3g3K9g8y5kZ4qrGeEn3htkeIoGSHUOh3ZhDJ0eLX2mlP8mGyq414OZ+KLZp4yADVzi/txdfFtvYa5+WQ8ZW5a4rQCBu6IA8xZ9SGrr/yTiRF7ZZedc1qW+XtS48dYvKuWBLGgeP60vATh2SMtwQsHdkKIVAGjG46ZZOnqup7Pl0GLqGPAzb1vV389AJKeFMd5K5IQg0iHEtiO87lGhiX4gGk8zPtap58YJhlruTxM5JE9JCvDh/pOvmweqDOvFAGP06fdOWaX4U+czo2bkJzcsngnz9tlTLIyl8rCQpad+yjjiiByOqWeluDicJFL4melnRRekk4L1AqonfAaaYWz6+SOzeD2orWlonRMHtPXcQIL41lduTg</Encrypted>]]>
    </text>
  </script>

</dir>