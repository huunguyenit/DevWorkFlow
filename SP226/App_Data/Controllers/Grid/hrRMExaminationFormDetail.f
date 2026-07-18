<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmhtttct" code="ma_ht, ma_vong" order="ma_ht, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_vong" isPrimaryKey="true" width="100" allowNulls="false" aliasName="a">
      <header v="Mã vòng thi" e="Round Code"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1'" check="1 = 1" information="ma_vong$hrdmvongtd.ten_vong%l"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên vòng thi" e="Description"></header>
    </field>
    <field name="noi_dung" width="300" aliasName="a">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="tt_dat" width="100" allowNulls="false" aliasName="a">
      <header v="Trạng thái đạt" e="Passed"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt_dat%l" key="status = '1'" check="1 = 1" information="ma_tt$hrdmtths.ten_tt%l"/>
    </field>
    <field name="ten_tt_dat%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_k_dat" width="100" allowNulls="false" aliasName="a">
      <header v="Trạng thái không đạt" e="Failed"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt_k_dat%l" key="status = '1'" check="1 = 1" information="ma_tt$hrdmtths.ten_tt%l"/>
    </field>
    <field name="ten_tt_k_dat%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ma_ht" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vong"/>
      <field name="ten_vong%l"/>
      <field name="noi_dung"/>
      <field name="tt_dat"/>
      <field name="ten_tt_dat%l"/>
      <field name="tt_k_dat"/>
      <field name="ten_tt_k_dat%l"/>
      <field name="ghi_chu"/>
      <field name="ma_ht"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoxjFqAhaw5xkjwwK86TV1VVVkpNEvwkNkroEN9D/juK7vohZBDwoxxi4vxyMwlzKTLL42Rsl8VdzQ6yslFee2g/ZG18B6ufCTVo4gQDN7RQAcYDrVSbdV6fagqYMiwkHvi4HMp4v2GMbsUlreYLLtV</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>