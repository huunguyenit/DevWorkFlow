<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrhsqdtntt" code="stt" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo hệ số qui đổi thu nhập tính thuế" e="Taxable Income Conversion Ratio Declaration"></title>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" dataFormatString="##0" allowNulls="false">
      <header v="Số thứ tự" e="Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0">
      <header v="TNQĐ trên" e="Conversion Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="#0.00" defaultValue="0">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 50, 50, 330"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="110: [tien].Label, [tien]"/>
      <item value="110: [he_so].Label, [he_so]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulitjEInIl8R1FIqf1WCLWCVq89tG66EE7rps6ay5a6QiGE+Rp7ZgEmWNw1wKHIjnYuhG6GOx8kxK2nCBugNRTUoGyhRO5qUfVMk2kd+0ah+GNQwGe/2T+4b06sMMBZxvYs/X8FTqPazMqbTCliVuEazp7yyfalGC9jDfS40ime9B5sw/ls3z8Tn/l4pMjKqSLFe947dNC7lBR5ceyHDmoReRlJw5W3aJQ9Y3SkqXlw03YJaTefEak/RPGw5SaK0hEdpY563/QH33M+G/tjGYde21HRt7S1ISXdGbOVhKRkHfsPOwloH9vfJgm4NdlGLHQ16HPQ0wBEPnt8CHwBRAvF2bp+tNGcinHUwMnPO0g2FCQvI9vDRF307P+G/epduSbM</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nOF4cZPPxGWcaSKyXUlKGKz/OwUpTX3/4QwB1Ey4ZQHYq0T7Qj3XP/Ry3HNTx7q+7RFu+I58UBORlaNCxaOphb6UybcFVnDEbldpcnR8aVpGCVtLe5F9a0zWQSu6ThCt06L9YXdQCSN9rLWR0vuvQ5PUP5QmhNLpL5xv0WCYUvWopJISDPVpnu8fwJjUwjxdI</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jVCr9zd45gLuwINxG/8BD72SQSq80RkTm8HoE8azvtNKlpBlDLrDL/TwvSZnc17+30I1s45PItjHeouXllibKIDIoeP1/rPrjwBvvHrkXV+5ZmRIeMgomEQGzvg82kRpUq2iOgzfm+fz7lkWrwkI+KE8W8jSIsimcAx5Z32oaY16uZxWWJ0VO1P+N9dCQQQ39nqZ194fQJ6xDw22wLhSgDg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbense+DuKZ0i4Xdrn4SIrJvzL5sjnQWz5Dir9CeM2pi5k</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>