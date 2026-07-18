<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\TransferLockedDateUnit.txt">
  <!ENTITY Calc "exec rs_ConvertManagementObject2NextYear @loai_dtqt, @nam, @ma_dvcs, @@userID, @@admin">

  <!ENTITY ManagementObjectChange "">
  <!ENTITY % ManagementObjectReport "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Kết chuyển số dư đối tượng quản trị sang năm sau" e="Transfer Management Object Balance to Next Year"></title>

  <fields>
    &ManagementObjectTypeField;

    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <label v="Từ năm" e="From Year"></label>
      <header v="đến năm %s" e="To Year %s"></header>
      <footer v="&lt;span style=&quot;color:#666666;&quot; id='idf_nam'>&lt;/span>" e="&lt;span style=&quot;color:#666666;&quot; id='idf_nam'>&lt;/span>"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LQFV0ME1nekfbIew3TkvTDccDcQ1+Z/tycFVAH5vx7P+aRnREVpfZBJHuTfSGtulQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      &ManagementObjectTypeView;
      <item value="111000: [nam].Label, [nam], [nam].Description"/>
      <item value="110010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iBfv++Nrv2QggTpPBJ02JHP4mnUNdv4yG53FtqxoCp9ZZSUCp0baijx2lOoAV5iwpuIhByf0LvZ1AmEaCe6KvqI1DOyKNlty3hxjxs52yqVCm3PzjKAKuMIr1y+yxB6V2R0hEA9yS4NxNPIjZXgw3ILQyR/OmJYa6wRIOm+7etgNTHAIGqhKPyJ+xLFZAAYXbcJ3PTb+hpNkoE5QcEb3yS2i7aydabwfT7Q3+vx0BSAZpNtaGNKAuVHvDis8jbvSD</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAzZPfcbzh+su4dGDO0HdcXrGSkq5tBUCX1O6Jh3ClRlJiA8cUy7wsVF5Gb4Yp6t3Wk=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &Calc;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDye9+lZfDv5UM4PlMTSlPRzIhnaJ3e8jIwBO23rVjB8edo3+ZMWv7+HRVuZsfT3HXMoLemhFC4AlQ0+S6Xtp7VqymE8UXa+xu+hAyfvk4XeJxff3DzrFrhFuvR/PRBAaagoduzB1yf22I9M9YB85I2kidEQJRp5lOIyPvXSnGu5lqQxiFtasDlDFNOoyAu2447rO3NCyiC//uNqSndg6gAXYKjmN7rW4drT9zWlCCOhtOlpb/ZMEjnzYsmaAmZ0iaiv+1alxIk+yndSte9DWT1UK</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>