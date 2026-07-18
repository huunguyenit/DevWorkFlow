<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and kieu_hd &lt;&gt; '0'" check="kieu_hd &lt;&gt; '0'"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="version" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Phiên bản" e="Version"></header>
      <items style="AutoComplete" controller="MPSVersionList" reference="version_name%l" key="status = '1' and loai = '2'" check="1=1 and loai = '2'"/>
    </field>
    <field name="version_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130"/>
      <item value="1100100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1100100: [version].Label, [version], [version_name%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KtHCAjdFQMiNMS/PZk2vTmTlZ5wKaDngIfGITmEIjYxU3jKDRSqfi2FMc8Ot+kL/qlFjZ7Kcc5RlQ5Xg94Eyw7BoQP6QqDHArB5/YmyjH2Mk</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01HObsD7vpTtSU7BW58oBskrbrRd+Bz5nDgFSGgibzIFlHAzkF+yFrzu/0NG+2eSfXNpDPGik3nwy1PPUAuD2ULQr1vpIGyt6V2ohFCXEAWbx/iIsLWAlDcWXPd2uf6Cl1/2vIXUL9uKWRQO3Z7dh760=</encrypted>]]>
    </text>
  </script>
</dir>