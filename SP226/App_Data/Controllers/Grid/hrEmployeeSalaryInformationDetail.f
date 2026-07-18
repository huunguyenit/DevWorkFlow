<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttctluong" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttctluong" prime="hrttctluong" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_ngach" width="100" aliasName="b">
      <header v="Ngạch lương" e="Pay Grade"></header>
      <items style="AutoComplete" controller="hrPayGradeList" reference="ten_ngach%l" key="status = '1'" check="1=1" information="ma_ngach$hrdmnl.ten_ngach%l"></items>
    </field>
    <field name="ten_ngach%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" width="100" aliasName="c">
      <header v="Bậc lương" e="Rank of Salary"></header>
      <items style="AutoComplete" controller="hrPayrollLevel" reference="ten_bac%l" key="status = '1'" check="1=1" information="ma_bac$hrdmbl.ten_bac%l"></items>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
    <field name="he_so_luong" type="Decimal" dataFormatString="##0.00" width="80" clientDefault="Default">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so_dc" type="Decimal" inactivate="true" hidden="true" dataFormatString="##0.00" width="80" clientDefault="Default">
      <header v="Hệ số điều chỉnh" e="Adjusted Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_khoan" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="Default" width="100" allowContain="true">
      <header v="Tiền khoán" e="Piece Rate Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
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
      <field name="ma_ngach"/>
      <field name="ten_ngach%l"/>
      <field name="ma_bac"/>
      <field name="ten_bac%l"/>
      <field name="he_so_luong"/>
      <field name="he_so_dc"/>
      <field name="tien_khoan"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEsj65rpjrdsc3hcZBdTQMUKZBo9rSjD1dJMF3RUbKg13NK2WzBxaf1rgqoIVgBLXdvBoezcpPqnETPEviJBPmlspvjYS13hBScZUfuu9RZK</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNGGbgpt/sYYDycpkPWOJe2fHEIVuRW9l6YGolGqU4jAVeUyzV4gQgAdMtWFqOdCw5hd3iEZpqbPMy5cv2s+8SmJYx9IPsSrrpf1lYfxpkO1</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkdndtcpbwC4znrZNaIYGv8PBWGhEYJftoTQygnU3vY/pXE3ZXbCxxqL1Q5W8U7MWGhFi1772tVH5EWrsi4BJJjX3Ld/nYME2hDe8xTUZKs6LYUmHf7s2GgWdUiEvo0GlJpdkfIpg/qfu1TgTK9Y6Bp7lw7DhNk0imXTYz7c6MKZEhHBoUnv3fQ9Uipnv69sxUgMgePUJOz1ZY0k4nUOYqP+JDwI4KuG+52VKyXesitL4dPTtN1qjn6Fwxart/EbIMG79o3C1BDwZmtW2vSW6L5460jeRYcp75aGRcdNEyUyfFP9tklhdJR55QZMhqkUMp3S7pWEZsM8ohRt8CW0L5pySgz/yLqXDxDNP6f0AD/IBVQQ5g/cbvvDUDtGbZsVrDdkJlJtF1MnJkm8prHWK8ii0xSzZz+Ra7ybRg5yc3ExekOkwpX3BuRxRs+bKVjDFmj9l6DFBA7AmtUQZ0qD4RON5j1TJneoNAVnu5eYuFYLLDmBF5z0NMleKSWsmCiNJXctsbOV8PFOV7DG6pmluwn</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFo3O+iLo2Sc5YKDlP9inKRo1a+VZMRv3tS0fKGtGiNv85V+w+NPD8Vb4q3jY9o2i0i0MR691gRZzizGbI0Q+TOopLqhFxfYEbvXAB2G3j/p4hzeLeTxVQDQnzeo+yM9ER2Q==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>