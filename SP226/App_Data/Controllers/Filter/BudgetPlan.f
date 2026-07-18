<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn năm" e="Select Year"></title>
  <fields>
    <field name="nam" allowNulls="false" align="right" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOVLaGTMNNCiOUVu/Myl01EBCTHSrx4hlmRGS2MqteU9DLG1ls9Z9cBLYwjTbLBmwhxAy9MhF2nWuhoUO3WtkxX0H9WAYe0QxtEoMPl4C9C+TgspkpzktJdjkJTXLcvF/4I9UkrpzUcfFTuPHIf52taof5r4ceSaRc/bIozWbo0KyhPMDPFLDdKHBPQppdmxf8</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAA7VcBePLMsMhBjkKlkHOflQD9B0U2UNsJouuweqOXp4Cb/ll7WbRpXxpT5gIp4e6HTwmaZk3fLjenurYQpwpfAiRw+nBV63nKEgLGL70p/baV274IwE8XSC9yuO7jQMSJk6UAA2oVN8rAMUdW9J3sMHGgq4+9725qCahJasdSFaKbLrDKaMjV66uELSGSBHpkLgzwmSIjb8ak1mSrDGSUpvNRwGo7vbA0q8H3g8zNiszy92mdTV3p1lZ2wL9jTPh3FiBWpos+rqYC6GqKJr0AQ2lMgdA2w4u5A1Plxc9UOlDgf1ePuuogV2KMbOHwZ3HY9QxXo7SWPa3WpQ79F0+nbFIaNUYevSzeaotsbRhHSb/VA9hoHv6o/ZylnTRIzFo5h+MGv4XU6jWpjqzr7R9/9bR4x6j3e5scFINiSO6vhZ727AeatLXuz5iJvrDxTSZoJtcpR8srhZKyo/EFEz8U/pW21qOsv3dhKhp7DjCHTF54nLoFoC13rKND4BfvlfsKbfJqJ1CavzH+H3V4Tz+q+pwl4/AWMxrLTFxGE42XJURtWk547woB01ecuxq7jsVjUPmMSwcBrwqRJbS2C8fImtN9tpKFIXiwhHekOkigzg==</encrypted>]]>
    </text>
  </script>

</dir>