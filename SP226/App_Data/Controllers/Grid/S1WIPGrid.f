<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "S1WIP">
  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY FlowGridTagField "chon">
]>

<grid table="dmvt" code="ma_vt" order="a.ma_vt" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
    </field>

    <field name="ma_vt" allowNulls="false" readOnly="true" width="100">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chon"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="nhieu_dvt"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="he_so"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RrOThwVTVRnH1mjYFRCTMpq57EXAXjqSKVgf+p4Wiws</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BIbK4BfDL09jEDHeDmUGGm+u4Tee7SBu8hFBoSWkUcVCHEx+5pIF9vDJucOaDd+PIc1zo90HfSYJW3u0MSCFWLFsCN9YEjdI029DtNLEH/Eifp7faNsfsQzGYFM5FgU+iUH76hfObz213ylsSUjxC2c=</Encrypted>]]>&FlowGridTagField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egTPSfYpNqRG7wkua2mM207iJXGfdxaLImA0izz7Ffl+fmujC6g32k3umIqX1Yw2CbAmS6oBRcYlKBe9A1gE6nP/c+vZrSKB5DNlw0U+n+1VHK7paFr3pcxUV4gENPq37I4Ko30t6gBXAELU+MlwYKH6APZZnSqWGL8X1K4tEb3RCzsjkl9Xyo1qNhtAwTe95uKDLNZFGhwhM2//8csxKZZcfRf7YsmA3l8auiklACiCzXOhKqneETmvDcPZiY3eJ03Ekxtvp5HSNog/iPbskO0E=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1l1PKE0vYemXWm4Ne/7R7+DCitGNZC8EbJ5noN/xsQ01TZb4b0jcGrfSAkqI4Q1aj33IE7S9ce1ZCCdFMjpl1/XLJXfv670iuJQba+2ayV3YYsttXi2BMrCpm2xUk/nqUputCsPnjCZDDuxP98sK+dbtRQT4sW5fFCXcntyTq9aqCbipVzq77anufEem27CJ+iqah0r8YwX8OOG3j578JWPoQE0Z6B0et3HKZSdU7dLs+NwFGcOa3FJ5T2Cxh/iK7DmAAbJF8xKr4b11H8RH/iUS4Q7UNkCbaQSajJYsSOT/U23kOE6H0UI9tFZmwc8VDmw+eG5hsihjNmS3xP1P9kYOsKZr6iP1wdX1udv3mqj7GmMEbKzVR9AMSKjX9+6/GV3AJRZPa7hW0F04daV4aOaFWsT2m7MH0u8BURCycnmmFzcwuoZ3zAWk0gX82+wyGrSdokTDo+byAWrzdDz0Sng6oLusuHwxkJK+sjhVwTlpqBOYF3i11xdkReHjI0P+sLZ56e2MbtlbTZlG+c0JUfrZ18xfduFDdmvGJUp2n0JV/GyXS9CVDOZVv/FC0xUsA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>