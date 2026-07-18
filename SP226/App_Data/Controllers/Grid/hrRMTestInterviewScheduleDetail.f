<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmlichct" code="ma_dot, stt_rec0" order="ma_dot, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_vong" width="100" allowNulls="false" aliasName="a">
      <header v="Mã vòng thi" e="Round Code"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1'" check="1 = 1" information="ma_vong$hrdmvongtd.ten_vong%l"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" width="100" allowNulls="false" aliasName="a">
      <header v="Mã vị trí" e="Position Code"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1' and ma_vtr in (select ma_vtr from hrrmdotct where ma_dot = '{[$ma_dot]}')" check="ma_vtr in (select ma_vtr from hrrmdotct where ma_dot = '{[$ma_dot]}')"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Tên vị trí" e="Position Name"></header>
    </field>

    <field name="nguoi_pv" width="150" aliasName="a">
      <header v="Người phỏng vấn" e="Interviewer"></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" clientDefault="Default" allowNulls="false" aliasName="a">
      <header v="Ngày phỏng vấn" e="Date of Interview"></header>
    </field>
    <field name="thoi_gian_pv" width="150" aliasName="a">
      <header v="Thời gian phỏng vấn" e="Time of Interview"></header>
    </field>
    <field name="dia_diem_pv" width="300" aliasName="a">
      <header v="Địa điểm phỏng vấn" e="Place of Interview"></header>
    </field>
    <field name="noi_dung_pv" width="300" aliasName="a">
      <header v="Nội dung phỏng vấn" e="Content"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ma_dot" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
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
      <field name="ma_vong"/>
      <field name="ten_vong%l"/>
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="nguoi_pv"/>
      <field name="ngay_pv"/>
      <field name="thoi_gian_pv"/>
      <field name="dia_diem_pv"/>
      <field name="noi_dung_pv"/>
      <field name="ghi_chu"/>

      <field name="ma_dot"/>
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
      <![CDATA[<encrypted>%gq2ZSuGLKVqs1RidX1LnI+rDTHAoyn9wk7rBtEWhX6Oe3YJsnaBONSw+da+IXY2cUCx6TQnWDQpHjuVbRLXV/pMibfYeDLybq56QT/AEJJQ4TPAeGMkLMNT1Ph7QkPzd2wgn8/W6Og4FKle57U9lqbmCLuDQXtL6gwE+X3HbZj3nJhCsLsxOVkH/kRfGKROPbUi8KP0M5DFvMYPSHzd8FBNCz9FxE0CF7ytFg/QuvrIv03CJbsVeMBqLV7i+FL76f4brLnQoJay7+0HZlX2Kcwnw/QfY3uNgbc71NUA7F6YPYehkM9oUtMzmktqFju4ehot+vCsYMF7PrTmaBkEa3befLu4Wlu6PBEIkXb+68fOfOoc1L4PVIpfjcFrQ3XYy</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoxjFqAhaw5xkjwwK86TV1VVVkpNEvwkNkroEN9D/juKzDGXhFiWWoLTIKCbKGkP7H71a8mKcSOhGKwah40RW0CgMMpDFOzOf5Jc/pEx1jyu6tC9SAX2mzLPPjRf2LQ3Yic8Ed149HnqjydoMxKLbI7</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>