<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
]>
<grid table="hrdtctnl" code="a.stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="H08" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdtctnl" prime="hrdtctnl" inquiry="hridtkh" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_nl" allowNulls="false" width="100" aliasName="a">
      <header v="Mã nguồn lực" e="Resource Code"></header>
      <items style="AutoComplete" controller="hrTMResource" reference="ten_nl%l" key="status='1'" check="1=1" information="ma_nl$hrdmnldt.ten_nl%l"/>
    </field>
    <field name="ten_nl%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nguồn lực" e="Resource Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nl"/>
      <field name="ten_nl%l"/>
      <field name="so_luong"/>
      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752CmBzyWz03Q1JxFVvBFHEDg41X8aMHT6K759ctQAPSlLatvfBOIkw6yrEMCDhJx/LBB8/5aFR1+5BNAtu72TBU=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IhxTAfrrxYHc7hZ63WXdEQ9kTlPtq1pvscxsSFV1CfXZcPBTaK9ZUg+UQirrXeW59Y=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ77pXhzrVHN6LFJKgdWqrDOzUiuKNqE7Fqrrc+W3dPFhnvCVApSP1oVa85AFQINCnw9FQBfcER74gUaXGDkfdDLY69n4KtfIM2qHH16FgkWQoxhmeFGqC2451/ChCVsUGIA3tC7sUv1uQTiziwnbCyqclubE1xTzQQXZ71Yy80iTxTHlkjfYd+vg5Ig9Ug5c2yKi1vrOMUoH0OfVkhNEsk/brv0/4PboJTrTYsxSNB4DdG1VY4TWQD6tjzqzv54/2+XYVmRRpdr/RSM62JWCqv3Ng/+FTyiXMmY/MLrokS/pg==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSL+rYA4qhVul6DFPw/aHx4ngxSGe04obrgvriEg/ISurIx0MfF9fW+DAPwyq5JYA/Z/PPDYxE+l9CfLT++UjzxztR1z9Z4ByjxApZaJCJMtM</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>