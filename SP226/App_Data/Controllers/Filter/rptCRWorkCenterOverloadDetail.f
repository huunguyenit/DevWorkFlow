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
    <field name="ma_ccv" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Trung tâm công việc" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ccv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_ccv%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="1100100: [ma_ccv].Label, [ma_ccv], [ten_ccv%l]"/>
      <item value="110010-: [dvt].Label, [dvt], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UeNokiaIQfc+ZrE7utdfDl9HP3iVbAUdlPSoDJg5Wb2L8OkE2q8cATs2XGCQowO3t7mfXJz+YFvyTTUWilAWzIPXEZq/aP4cmWDfIgnoNsorLPmEkXvg4/lkJgtj/yHMA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qjjsF2cBOmUaHCb4e2lSAxUMSQuHGu/e/4aEVh1T+7xq001QrvWOl+Oz4HIB4rWHPlesiZlqbqG3AhCex4GpZJgR10mXsbFwLaoob/matj/bvKFPFwM58pJezG576gtz0oOTzMKf3cJuvQCWJJ7OHxTijHTVi2o6frglNeaYy7aFX1+mrbM0qFT9y0XUP1AX7QKL4OxswvaLiWmGV4jS1Q+0cWkiI2ENR2SXV6r05l/41UH+QIAMKaeFdlCxE/3BDb2h0+7zf+VDnesaztKsifDCi356gAitjJzNas3Say2kpXxeQDRwYAbkoYpiClelVKz51kSbx2Mge9iHZ2ks9Ti9kTi4SLWul9oW9e87aHKFA==</Encrypted>]]>
    </text>
  </script>
</dir>