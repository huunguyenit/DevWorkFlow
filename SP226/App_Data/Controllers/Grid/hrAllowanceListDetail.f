<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrdmpcct" code="ma_pc, stt_rec0" order="ma_pc, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttctpc" prime="hrttctpc" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Tiền phụ cấp" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_pc" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_hl_tu"/>
      <field name="ty_le"/>
      <field name="tien"/>
      <field name="ma_pc"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGclHw9nByzRnx7DE8bTzTMnY/exKqYnIrra4X9k1Ikbms7j5SzK897ehNEi1nAwuut6J5FMa043vFQUODJ/Puo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiC8UEtr3Sk8p3A4vRoknHIRZirFMHUoib41Fdq6Q88s6h/LjudJwwSOuMDbUw+TPJHqEMxcG9UwQ+v8ZwkuyDxEpFiYfCf8G1O1WPB/Ao2RZ</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmbJayiNDRtOMKPcQvPqeRjXVfO5c7BRnGLk3uVfAA+bxS8Ek9A2v5fjY8QVpohFR7mQyvzYiRwEQ7E223DFjDJC3tgaG+Cz5RBQ+NXM1rGQhsJdtdWsZPWaHq4wNTGI3sKniD08zVknRjy/wHYULLKXys48V+9M4rAtFCsYRFsRi0L2S5K+zLHIW+DC43d62J0+J1k70yX17X9aKt+6yUWHGc0oQaX+9EHslT2FRtYUbTsNd1nogvBtXenXDP8QIuzgjexxKY3EM7IbbzhP18f9lko9NslXKkrdEKHdLZafByidQcAbNoam3Js8bCjdptKnIbt2/Oc/YWbj4qSmKLjSbXuTe9aHg1d+Nky90xIWA==</encrypted>]]>
    </text>
  </script>
  
  &XMLStandardDetailToolbar;
</grid>