<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctns3" code="ma_ns, stt_rec0" order="ma_ns, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctns3" prime="ctns3" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="loai_tn" type="Byte" width="50" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Không bao gồm thuế" e="Exclude Tax"></header>
      <items style="Mask"></items>
    </field>
    <field name="ho_tro_bh" type="Byte" width="50" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Hỗ trợ tiền bảo hiểm" e="Support Insurance Amount"></header>
      <items style="Mask"></items>
      <handle key="[loai_tn]"/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_ns" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
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
      <field name="loai_tn"/>
      <field name="ho_tro_bh"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
      <field name="ma_ns"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNtQ+lRTrXMGOxpYXqDbL0LAiMT6SeZUBUR/i7aAOddH2XE3TEsOMBqqsN8jbkKkHTnsuzBII8SNimgdY8icRqg=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiOs3RXKiBtzfcghO04915zBYh05RAjM5+CdvdOJ0s8YKqBtW46cuW3apP6FC7XoFSH9h24qggGaKBx79oJ8IsLE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I/YE8mfqiAwPjbp/5AVQGWRneNHYnfApW4JFCxeVnHW8efysvbvZtkeK0IeWdTzT2RyvieM25+zVkk1V1lFzxnWk6YdDAAmyW9xGhUJ5VjMcCLkDRTpSdS1AWpS3NIoTi/jfA+fsPZtImBPQOqJkxly3xdYgS67webL/XYkBuP/mKbcBRjP85FREZfkE5w6m61vqtJOY5iGVodxINXBfZEC/40KM7boe7iVfxsGm/76+0ibXNdZ6S9ZnYqHGhU9rbnvEzbrnIXu6gg8rdJgN8JFzuGZ2PvBKWtOgVVk5XraJRN9ZdY006rTc/2aT5tIzY/zF/uowODYF3YgEtRD77hKyFAvOuRjGlLeaqvzbqaNn6hgHPTaEhJWlE/NhrJa8xp7CtLSc1kFNX+3ui5sjjHzeO3oRhcR0ZKE48rtjnw29OXUwaC4Orb4pgT13fo97M8JbO4mv2aaUPHnLlnRgTDae0SkphLo3EFizb5dBwO+4Ukmu5lpyZJV+XiRE0ZhxQaCPYlf5N1pPt2IQoPMzMHfk2pYEuFpLMolpEs5gdq6g1H+Z1ow+WhT9wxUmXxBi5ER1D7TjuHRMQ5M07396pg=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45KmkYnCcU4ocCBz1RBywnpKdOFQ3ioDlUYAKKY8tUZVvcl1LqpYVrdGxq9TKO+nPIsvq/6BXyyS2YwimoQnO0NMQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>