<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ma_nl" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <items style="AutoComplete" controller="CRCriticalResourceList" reference="ten_nl%l" key="status = '1'" check="1=1" information="ma_nl$crdmnl.ten_nl%l"/>
    </field>
    <field name="ten_nl%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="dvt" allowNulls="false" aliasName="CRUnitCapacity" defaultValue="'GIO'">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="CRUnitCapacity" reference="ten_dvt%l" key="status = '1'" check="1 = 1" information="dvt$crdmdvt.ten_dvt%l"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130"/>
      <item value="1100: [ky].Label, [ky]"/>
      <item value="1100100: [ma_nl].Label, [ma_nl], [ten_nl%l]"/>
      <item value="110010-: [dvt].Label, [dvt], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cC2azatXlxy9FaJt8akemxanAbaU81WHrF576e6bUNdAmUdZUi/VllfefoRgA5XWb4MNHUXJP/hvEHNs7a7IsTlaAQQ1NlvaEA1FJ5TcFYl56dBMrigy8SY+/owV0vi9g==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qjjsF2cBOmUaHCb4e2lSAxUMSQuHGu/e/4aEVh1T+7xq001QrvWOl+Oz4HIB4rWHPlesiZlqbqG3AhCex4GpZJgR10mXsbFwLaoob/matj/bvKFPFwM58pJezG576gtz0oOTzMKf3cJuvQCWJJ7OHxTijHTVi2o6frglNeaYy7aFRUSFDW0RPSGQaalH7PXl6kPT3x7K39AhXrkyE02bkqeeCMmnh5j4woy7gXBntCa5R5n+ausX68vZtnaJAGG92KrXiLEkuYVzNBuX3AEAPYqXKq2fVZU7ghdb/hMzH2lPuMEAjyEKJD96lVR3297J9g3hYt7t5MIPlDJnKBUPtseobTD/bDQiI7CfzeyW1SjXA==</Encrypted>]]>
    </text>
  </script>
</dir>