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
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and kieu_hd &lt;&gt; '0'" check="kieu_hd &lt;&gt; '0'"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ma_cb">
      <header v="Loại cảnh báo" e="Action Messsage Type"></header>
      <items style="Lookup" controller="MRPActionMesssageType" key="status = '1'" check="1 = 1"/>
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
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1100100: [version].Label, [version], [version_name%l]"/>
      <item value="110000-: [ma_cb].Label, [ma_cb]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4ojaECy5JvAGH8BzOS658FEjWmrTa/8P4oGgW+QHqIVtEMzmYJ5O3ZCTZ0tTebWR4O9s6x59Y/+MBjITZxFbmAmWUbFYvgxTBiTx+9uFQ//OB2xHutBEReGBvmdTYHOHE46AK+1PTaeertT5fDxZyZkXS2PYXCQiawvPxOIW0oT</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01HObsD7vpTtSU7BW58oBskrbrRd+Bz5nDgFSGgibzIFlHAzkF+yFrzu/0NG+2eSfXNpDPGik3nwy1PPUAuD2ULQx5BL78ujF8qBkQLbCO1LL2lfAuN8PIOck+k1Vz7JKYrHC8qP9gewEn5ktP7G383D2qs700FTX1Qsxq7Huf0V8CjmioSaKR3vMe66xxGC2pXRN/Kt8IhrEYIN3+Cd4FvXizx9GpvV5fjmaphHAH3W+XfMlg/K/KiJzUENGOQkth5hn8nhnCsc95aZMIrs6xRc=</encrypted>]]>
    </text>
  </script>
</dir>