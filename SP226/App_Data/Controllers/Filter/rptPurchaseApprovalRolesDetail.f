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
    <field name="loai_duyet" dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua, * - Tất cả" e="1 - Purchase Requisition, 2 - Purchase Order, * - All"></footer>
      <items style="Mask"/>
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
      <footer v="1 - Loại duyệt, 2 - Người duyệt" e="1 - Type, 2 - Approving Officer"></footer>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1110: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
      <item value="1101: [nguoi_duyet].Label, [nguoi_duyet], [comment%l]"/>
      <item value="1110: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kq3KBRlbEZEAcphadqUGAzBwKLT1OGvDE/aIRDkEANqJG7zeg6ls4KC9BrlqUs/VLP7fu3z6WaryRHO/Tzm7qgw0Pmlvl9ouCFjqN2OnRSOvEdT+Fel0VhuTgVfIjW6C+UrjRCzA7CL7j12BIwGRHHU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01HObsD7vpTtSU7BW58oBskrbrRd+Bz5nDgFSGgibzIFlHAzkF+yFrzu/0NG+2eSfXNpDPGik3nwy1PPUAuD2ULQx5BL78ujF8qBkQLbCO1LLH8xxelz6R8YsUzGcCU2SPVY9+Zc7vA8yWzUI4sS8TziyjHAgvSPdO21JeJ03+fvDZBq62M/7FqeoPykOTHPPxaznQdhQf6l6pFJtla++uqhEqyxD0B5UnIuUHT1sMK+3Dz5Ul83ESURV9vABqDlZQiD2upRAW+arfZO7QpkUsdVcMmgiRtkm59wknDrjyb7uX9PV4Mmji3XxuJEvFlsRMrjPvjzDPQhSWwHyZuJ/9gE=</encrypted>]]>
    </text>
  </script>
</dir>