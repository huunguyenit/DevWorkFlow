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
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_ccv].Label, [ma_ccv], [ten_ccv%l]"/>
      <item value="1100100: [dvt].Label, [dvt], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRD/sBZxDkHMFnhKXxzxv94g/c6y0uDp9YOITUPby/TUuyvMsnLa++0+a293+0r1bylQ0TsS3yWoLcJXXANk3MHYabpeCbgDoYjwqUOlkVd+oR+A+zXaPRqvpUlT5ijfnT</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qjjsF2cBOmUaHCb4e2lSAxUMSQuHGu/e/4aEVh1T+7xq001QrvWOl+Oz4HIB4rWHPljwpoke60An7m8bb4/xXR8haDNbaV+nUG2KLwdckGbMUt29xK+cUEe2ZQePGWNF3+11e+1+iNyK4kY4ykRvvV+KuNQUcGK/6qQRMzKNGryB5AXpu3mmLjSsQxpM3IRntZnonE2x0CJ8jb2ci+I2M/vu3vB4R/RKzkS2mAEB3tLnSqHAOSv3VZiAg0lTfXTiFXa8xiewJ7PSO927YCswZiEiSOQZ/okzuLh2iaPjN54ZA==</Encrypted>]]>
    </text>
  </script>
</dir>