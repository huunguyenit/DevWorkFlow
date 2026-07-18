<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PTPurchase">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Receipt Date From">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY ext "96">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PTPurchaseFilter', 'Filter', 'PTTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Select Purchase Receipt"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101-: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpdAo+1qmNRefk4jTIcIua5fCM3H/c+17M3t9nkir4Kq8HFmxDoGeJdbLl/sxizkBaMb6p8m2tUU1BKSFjPOV2MSEyhXEY/It7d5O+k7N7P3S/i3LARXETgQd/+GbPPbbSw21Hy0ACN4UfpTV2+YBRAf+YlIR2xOSdCpeCaqO/7P7MHaAzvNtySigehmpGRmBnaSY8fEfx+Enh+4R2ISo/YE0lWJQOa7cAx2ig6H4y0esqhQqGwcW76PKvOTZlgDVrUIrwywZS3PDuyhSi6bk5ACWgIX1zNjsX2P+l8C5u4pnvGXLdsT7GIUzwTF7kwcXdWKx7E2cK1c6Fgb3o3lfiIzYrTKceUQ5l60zSbJw8FfZX3lUfbP2RotkBGJ1CK/Okw=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXADJN/D72KtvWBAStoXeMAP51/hnDOGI+f0ifxcGDoVsqktu5GnCFHBlqKjgoYV9GOv+QY7IppMVI3yASFycQu8KjPJ+rgcn7o1I08AOa8raI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnk7rVrjNxGeG/fyHmnw7I+mROCPsRUNMqTO0ZRq66KnqTK6ej6ZGnErZ4jHs8vh4SzNE4sYiPB40z5UnKCitg+Kt/iB6Ra1p5duD6Vwmr+PciZ6wwQgikJC2HqhxAZwZf42Uk4b7l3bIkDmDQPF+wO1w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpe5lULK1cFZqpupY1zLddAAhYVNkkkwzOx0iC+UZwZ2HH6tpF7742069kbRbeepWMK2K/444lS0CTrzN6XcnepoBycKQCyHyEAvMaFI2kZNp9Pb017inyiRg1JYXDO10Mo7WMBa5FO4Ni9A3IdpIgMsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>