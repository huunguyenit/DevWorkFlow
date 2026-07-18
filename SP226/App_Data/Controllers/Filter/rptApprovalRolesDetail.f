<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="loai_duyet">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="GNApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_duyet" onDemand="true">
      <header v="Người duyệt" e="Approving Officer"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="sx_theo" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="1 - Chức năng, 2 - Người duyệt" e="1 - Function, 2 - Approving Officer"></footer>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 40, 40, 100, 100, 130"/>
      <item value="1100---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1100100: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
      <item value="1100100: [nguoi_duyet].Label, [nguoi_duyet], [comment%l]"/>
      <item value="1110000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KuF4FuS/0Zu1LdFWiQldqnebyrPWWH55ybsl6FYwsHPYVrK07Ybyz+s/MyLtkLaeOhFjVgS1bk+Hzen1RpNV//wRsZIoeFuHfW3HF3navQpfQJTAtX8sd2SgmhJ2dT8eGw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01HObsD7vpTtSU7BW58oBskrbrRd+Bz5nDgFSGgibzIFlHAzkF+yFrzu/0NG+2eSfXNpDPGik3nwy1PPUAuD2ULQx5BL78ujF8qBkQLbCO1LLH8xxelz6R8YsUzGcCU2SPVY9+Zc7vA8yWzUI4sS8TziyjHAgvSPdO21JeJ03+fvDZBq62M/7FqeoPykOTHPPxaznQdhQf6l6pFJtla++uqhEqyxD0B5UnIuUHT1sMK+3Dz5Ul83ESURV9vABqDlZQiD2upRAW+arfZO7QpkUsdVcMmgiRtkm59wknDrjyb7uX9PV4Mmji3XxuJEvFlsRMrjPvjzDPQhSWwHyZuJ/9gE=</encrypted>]]>
    </text>
  </script>
</dir>