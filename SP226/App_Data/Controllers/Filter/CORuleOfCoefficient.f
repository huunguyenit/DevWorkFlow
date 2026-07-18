<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">
]>

<dir table="vxdmcdspx" code="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_dvcs, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1' and (@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1))" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Lấy dữ liệu từ kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf21s0RqkLRL/Gff2E4FsevyedsQIwB+V0LEbxP2riQaQ</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnojAVBwh/R/UldKXrhGXWmMzvcfiWSCDCwDUcGqaIGrdzKgfWoT2b+rDDZDU67CxYyE4FGDdsFtxwlhNmtE0VuLYwn35ZGkAF6xB55a1AM2HpgTDDYj6To0+pU5qEZTwntScVKsgamQbSUv08aKHRpXg+FCu6nrzqjhfgzFVKBvHXCLQvRLpUP3ZzVneffB45D7xsRmjZ7L97S0QRn8n03FBUUbFSYQ6Q86mVyhmW2x</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAHqKIPjsqYzH7vD+idkFBPNeOK3i4mnkBLc63wsB6h86q/rjE4gGG5YTUzX4WarmDyTuzJfolKJmjEF7B78JChEbZPP4EgHB6PZf05fywcIqnnlUk2DUwmMZr6lU8t5IC44DwJ8Ii41Dm2UaB/7Vdg6cm1Z7JF64md9GTgzFMf/kw11zhqF8P7P3RxOfVJ6N6oAn2QbaVdlw+p9O7TGX+5MLiJ7P6fS1b+kYF4h/ixZdgsLsFE5FkDEDTYXOtP+86NhfSzXzsGXdUt32P3ZElWdCUUlvSZk+LtrA97Ktcv34M/lEvN3czvmD5qGjgRTaK7eaksD6mXCI7DJCAn/xZn2LIVbUn+qCp2vDF2G41mBfiiBNKhJ8+aZjlQZ9bAh7vTmOP4mBOkszqpD9crU8J7IcSoZFvVtLPOXSLVWe9KqFNPM932AfV6n96MvT+bYP5BFNp/qY1tUAQ7B2X5sAPnrsNXBppcUv/bd5y8kZ9BUa2ocf72TvMlznKBqLabG8E=</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

</dir>