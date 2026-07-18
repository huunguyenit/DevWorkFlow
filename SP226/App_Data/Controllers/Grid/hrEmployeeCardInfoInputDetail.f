<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttchamcong" code="stt_rec, stt_rec0, so_the" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H02" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttchamcong" prime="hrttchamcong" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="so_the" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowNulls="false">
      <header v="Số thẻ" e="Card Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ca" width="100">
      <header v="Ca ngầm định" e="Default Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b">
      <header v="Tên ca" e="Shift Name"></header>
    </field>
    <field name="cong" width="100">
      <header v="Công ngầm định" e="Default Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="c">
      <header v="Tên công" e="Workday Name"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" width="120" clientDefault="0">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
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
      <field name="so_the"/>
      <field name="ca"/>
      <field name="ten_ca%l"/>
      <field name="cong"/>
      <field name="ten_cong%l"/>
      <field name="so_gio"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiF9PytaniaXIjIGKSeOFuMaq2R/dSsL2z91S42vHdFD5731+KYUH0A8/n8pmjAKi81CCtI/iNWKU4Zf2YQP1Guo=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUHwutoQq7HkKXVcT7kygPW0Lcc0fz1a0Gkvc4aW9MWr2z+WCeK2batD416JE93rVN8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlh6HCyoOBhYFDOqacC/XVK1xTJV8Rm/a/uwMfSXLj020VtrxM3Cic1nQKE9piE+rSdt9aNf9xUjIVePTzT24T/k706bzoYYfcjcGiug73678994sr0/1fXHEQb08MWaWz/ZxN0CgsG8R6v0q9uETc60+Ltx8DlmHq3D5sPE/kLQUo1bVoZqtdh/d0z9PYAGzeOLc63VgB0q0nUdTGRjIx4+GS0yW3Wt5a+mK07P7z+EMX8bNTT4sb5Tu4IVpZPESp4ARoqi9gesNobxjtARqmscODDVSxfeAqGNWIjQ9hyGAz6i7JPY7BZrwf6Pu3JYnMEx6YTEijDX802bNymRNKabUlcBTkAVVI4Kijv3bT3XbpPhucBq1DOV8RfOv7vB3iv0AKCV5yY2izFVbdQJplXdXdjNpVY/RSwX3t8IdAwJ50RHHb2QLYmmXJjXsmRZYFHNQhHmYo1nDhyc6gTDET0aiHUARdmyCiyoAPd3kzuwipthsnfel5oChSnMLnbaX0=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFoxDw03FHEYPMkaSXazFNYMtZx2u7nmoHO8kAQ+N3opxkKOUW2rwnKYnDhaD8GxNAKkTMCC8E7BuUNwinxUMeT7q7AMbb9oHLKImaEez7wTrEUPVLefBRDuUhbhRzmodkng==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>