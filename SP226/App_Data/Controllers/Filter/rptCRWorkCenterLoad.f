<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_ccv" dataFormatString="@upperCaseFormat">
      <header v="Trung tâm công việc" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ma_ccv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_ma_ccv%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_ccv].Label, [ma_ccv], [ten_ma_ccv%l]"/>
      <item value="1100100: [dvt].Label, [dvt], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRD/sBZxDkHMFnhKXxzxv94q9DrO6plWv0mJmpZ34UFiLylLLj1AnFY/2uRk3bdiffAbls0e2V46DRHGeY9UohLVPNd/Mx4KlEFb6e5d4aq1F2+quXu/zL/sRAO1IUct3r</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qjjsF2cBOmUaHCb4e2lSAxUMSQuHGu/e/4aEVh1T+7xq001QrvWOl+Oz4HIB4rWHPmUoNljXJTScYWYyzomIWPgPPGDWRJmBr4Czyguj+TBpLScGCsBC668/2WTo2qwdKFwoijOStxVInnjZiQYuz5Xn5+3aMt8aHa0HNRz/d5MuyqYy5Cb8pzOQNc3ksYiuS7EFd3LOAXdZky3/wHRgSSevrGP3v7Xv1cDUwXpPWXWi4cSH+ejdmNh04iUyPytUyDSbjP4rbs4UTv5XFln2az7AFLhf4/rk31cwhA+O5/A8g==</Encrypted>]]>
    </text>
  </script>
</dir>