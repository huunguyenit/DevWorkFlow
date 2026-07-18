<?xml version="1.0" encoding="utf-8"?>
<dir table="dmloaick" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại chiết khấu" e="Discount Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" allowNulls="false" disabled="true">
      <header v="Mã loại" e="Code"></header>
      <items style="AutoComplete" controller="DiscountType" reference="ten_loai%l" key="1=1" check="1=1" information="ma_loai$dmloaick.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1dxTpMsM2aOGa5Pr6AJP1c51Hb2wC1c7+O7af3Q0dzpoTeSI1Xe3Oh+SSpBMeWiE+c=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV9PSaVZiNdNvJQDfBvj3aiyOp/qFo7C011mclhlsKvP6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl2jEpmoaztlhkLMj3/VbT8W/wVJR5U58U7mH82YCpTa5oDZCIo12W9yrdZZh32PpI5LYNkLUxVKj1AkNDUSaoRT</Encrypted>]]>
    </text>
  </script>

</dir>