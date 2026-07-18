<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmhtktr" code="ma_ht, ma_vong" order="ma_ht, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_vong" isPrimaryKey="true" width="100" allowNulls="false" aliasName="a">
      <header v="Mã vòng thi" e="Round Code"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1' and ma_vong in (select ma_vong from hrrmhtttct where ma_ht = '{[$ma_ht]}')" check="ma_vong in (select ma_vong from hrrmhtttct where ma_ht = '{[$ma_ht]}')" information="ma_vong$hrdmvongtd.ten_vong%l"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên vòng thi" e="Description"></header>
    </field>
    <field name="ma_ktr" width="100" allowNulls="false" aliasName="a">
      <header v="Loại kiểm tra" e="Test Code"></header>
      <items style="AutoComplete" controller="hrRMTest" reference="ten_ktr%l" key="status = '1'" check="1 = 1" information="ma_ktr$hrdmktr.ten_ktr%l"/>
    </field>
    <field name="ten_ktr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Nội dung kiểm tra" e="Test Name"></header>
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
      <field name="ma_ktr"/>
      <field name="ten_ktr%l"/>
      <field name="ghi_chu"/>
      <field name="ma_ht"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmpDDD5aSOFvXVVYEBexQkhWNisRGqupJfa3f3ewQOR+o8vZLuSJUv3/4wwUuD1+gyrQvc0wW3pIxhZchpH5mcEnxUJE8ml+sPMNA27slPwkSx30uU5lqfR3YhwZDvdGW+2e1qrFyGw7jMUMeVCCJNPxWUdAJCbVTqzQb6jCLlnlqQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>