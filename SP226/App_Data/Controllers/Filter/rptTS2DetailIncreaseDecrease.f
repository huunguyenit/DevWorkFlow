<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ld">
      <header v="Mã tăng/giảm" e="Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_ld%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99GQ4BGD5Achb5VyYwJ30bxvkjDnjGrl6h6+8UrPajeSJKIoPbfHpi/U6Px/CAntTitPezwFbY985Usmw+O2Foo8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ld%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="isdetail" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết theo bộ phận" e="Detailed by Department"/>
      <footer v="1 - Có chi tiết, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tăng/giảm" e="Increase/Decrease"></header>
      <footer v="1 - Tăng, 2 - Giảm" e="1 - Increase , 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại CCDC" e="Tool &amp; Supply Type"/>
        </item>
        <item value="2">
          <text v="Bộ phận sử dụng" e="Using Department"/>
        </item>
        <item value="3">
          <text v="Bộ phận sử dụng - Loại CCDC" e="Using Department - Tool &amp; Supply Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111----: [den_ky].Description, [den_ky], [den_nam]"/>

      <item value="1100100: [ma_ld].Label, [ma_ld], [ten_ld%l]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="111000: [isdetail].Label, [isdetail], [isdetail].Description"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>

      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK6ZBEtlDIlF7Ri7WQ4NkcxTtkDuWEnM9d0asp+oYRHRBI87TnMrN2lXrMwaD3PbczfNUpNYBewU3r2zUZRXYXWyh6ZBYQKIePhYjmPajtBxnDY6/3sSZdaxALHvXUCwwftfXKdkxyJtJCE+SOZtycbYmv1AUapcMmbOw9TGxx6UiuBK00rUt5DRr+IOL8RClRk/fUXYaUcQ3oaeg707+zfLp4fL6Xm01Cos1MtBK2mEsDagyPQNWLDB9mQcZcKqDGlmKpiWuRbH7rV2FRtohfrwJPgsm80eXcrlG/8kCx+36BdNIi955VHqAW9YC4DDWl</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVHCyPErcrNMbewXznlm6nanMXTap1mWWJVHVnpwfjnBq/7x/vM4w7gmA70hksb9IpmGKDCyUPiiffMn/kcioXY+J+iuaWIa/Ave8Rp1whvWduCzzuuhyjKmX0jGL8LUPF0N4nXLNj2xtIFghpFAv8SmgNSb7n5f4lNkDfFA5ATpiim7RxbmyjedS/EqD1MAY4UBexjfXYMrspHbeicTfd4W1NR/01MgxpYM2cF38+aGi9qu5Lxp26D73R5wE0L8GIAG2RQJxOPxyBMjszZO9SSslVjrc1uETMaSsoTBz6pDcchuib+bm6kyY6bQKcnjZ8E2AA6MFaiW7sRUl45wI/gG5xqKBZaOCF2FjF39Wz3gvJuUo3AkmjlSaFHe7OXf8HFH0KlKOxXRwyoBAtrh9tbDufWFrxLuB+ZRxT5/Ye3UXBXddVYrTKbdsEcbeFGy3zxutN0zOwSctc2A2bSo05vZNbnNxxc0rbphLzrB87uGh86pGQQc7P7C7rshC5usK5mKcLcP+1S/BcBNheGN0fGl/k3o4znKwEivWhXy/F1LdxJ5IPJ0bJWAPW1WYuCet8Kg7LDm4BEtiZHvBBUFHUGJQ/F4zQes/O+vzxDfcocyF2iMTKLRUelub53sWer5cY9NiReJFyrCQAp6UBq+QiUFCgGGARLq9KWvWv+9apXL73cSgnwIDmjTxPmUNQSoHBT4zeb/QATIOEbrbMHwE2um/PnY2g3sfiAJKzBneAJcWq8co3DOU4ZiwdIA6eUGKUg=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReasonType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5cSyMkESXcCwj0oZ4F+LdEbPmcsIU9AoD1rycut2XOPG/07XbcXEIgUjQ7wFaDLJqMXWwW4NOgf+zWu2vbyWLKp77lpX3GgY5tV3aTfno5GVvQS1Z4tQYxrKg6k4w/JO0=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>