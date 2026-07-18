<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmycct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H10" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrrmycct" prime="hrrmycct" inquiry="hrirmyc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_vtr" allowNulls="false" width="100" aliasName="a">
      <header v="Mã vị trí" e="Position Code"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" width="150" readOnly="true" aliasName="b">
      <header v="Tên vị trí công việc" e="Position Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ##0" allowNulls="false" clientDefault="0" width="80" aliasName="a">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dot" type="Decimal" dataFormatString="### ##0" readOnly="true" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky_nang_yc" width="300" aliasName="a">
      <header v="Kỹ năng yêu cầu" e="Required Skills"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false" aliasName="a">
      <header v="Yêu cầu từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false" aliasName="a">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
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
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="so_luong"/>
      <field name="sl_dot"/>
      <field name="ky_nang_yc"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ghi_chu"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlh6HCyoOBhYFDOqacC/XVKYT/76Z9eh564XLyO4GeNScYL4Vyqba3jn76TkecT43hUUKh9mLvGmX5cDYPZnGKBTMSf7EgXp5dCKf+6b+/pW+PKz8/82WFDgtudQIcO+ImLiAhGKru3fGUwL37/gaFf6aRI1WT13gFnLe5HIH+bzDc2CUCsHcOTO6JkamDrFQgvumGyThWzvuX2r5S0GO4wkOfA20ZYo+y5qRGy+V4MI8Wkx8HX2N/85clbTCUknD29DA1C+elzbLzgsAh5lMvFQufpjpdcFNmXrrh6PZFoJVLt2aLXJvYwXPc+lus3gRXHVcnDA1Xywt7b7CUKjxLvaf4EkNGakRGX8OQQSHqfNWvVnDEjROmOG1r3NcEuzq3AE6dwcWxkD5femqBPGxLMx2R2U9GDjwib6pD8DraMkmqt6mWg6n/rawpnyL6S+fiEw1e/1orIKT1LIjXtQ5zoievcWPeSpoJvpR8uSqA1EEbzmyPvWOqzg7Hl3iwAl110C7E9yn8Dqrs8GRoHaq6jnbuugS7iN6alNRUccSkwHjFkxMfWOqLYOrvhrMelUwZNpN/JvEgvcz3s+jU5PcmvSmmDFXlQV0KmPOMwr/LJXQ1wGhXAyAA7wpsfW9Scvzy/8F6O1lY/ap3PJTNm09lT</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFozfeWafqyJn3jhromSxH/sFyYSaFpY3nkUP07vH2PGZ5x16YixEIQyKogTKT/pWiwPo0LPxV7Q2f9HeEOfYNISV4oLtu+H6E0wqZ424wNcgr</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>