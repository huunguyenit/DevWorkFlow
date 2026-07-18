<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chi tiết nguồn gốc sử dụng công suất kỳ" e="Resource Load Pegged Requirements for Period"></title>
  <fields>
    <field name="ma_ky">
      <header v="Kỳ" e="Time Bucket"></header>
    </field>
    <field name="d1" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="rptRCCPGetResourceDetailByPeriod" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ky, ma_ky" e="String: ma_ky, ma_ky"></text>
        </item>
      </items>
    </field>
  </fields>


  <views>
    <view id="Dir" height="292" anchor="5">
      <item value="100, 30, 70, 100, 453, 0, 0, 0"/>
      <item value="110: [ma_ky].Label, [ma_ky]"/>
      <item value="1: [d1]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSKJPlSnGN9/aYKLcBiqn6WuICZCwAgZqVRG5fIk5pVjGS/gAYFnPDFa6Qv1QY2PJu+Gm76bqqMc8daNhheBRU=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y7yL4YHdcmt6/SxnP/f71dXX34OHlqMR7+zk2pkcWqnDKa4q0J7uxcZO1AHFCuTpUx2CcO4tssAMQ6CvUMq/7Y/ZaC6OZq3ZX8eNtKr/0asEkVG9cdpCOB5tkNAWz1M0A=</Encrypted>]]>
    </text>
  </script>
</dir>