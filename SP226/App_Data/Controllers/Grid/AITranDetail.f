<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="cthddc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD5" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cthddc" prime="cthddc" inquiry="ihddc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="dien_giai" width="300" allowNulls="false">
      <header v="Tên hàng hóa, dịch vụ" e="Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
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
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      <field name="gia"/>
      <field name="tien2"/>
      <field name="ck"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1BKdk23Bd2xZZLXh5DiUqpHmhbTJ3KboVlQTNjN2cvi2yDQhymmWFYT4UES5qgANcpPjbY4PG2yHoyDotyZdOPOA8Xi00v6y4hoLvlRL/ZGw9S0yjhX18jlwji6Tv/SKg==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlh6HCyoOBhYFDOqacC/XVKYT/76Z9eh564XLyO4GeNScYL4Vyqba3jn76TkecT43gQXbKgbcDVl/i8hHquK/QZCtoe0WZXz6A1WQU2QU7n69G8RUTsNIYUfd06YUGhnqQ06QhoEoISkzZb0JGAWN9fky5dgSbUQqgZDAPUi9UqsHd1VJeV/mdgQ1PSKMbeKF3yEYEHv1ydPB2HFoiS3k0/q4I/vayIBceaB67o6Y++gH84wjOFbYjoPF0O6SGkZYpWXN53LG9fnVk7YqbFFWP4Dhp2I2qbV0jMyV8rdaA7DWUi67jHIJTHvba/2jgjuR7afdpijojtrYhG5HN1Dl1OsCjhHHCUX6Rw0EsQt7ldgWkLnqq+aLYe7TPXVDePzF9O9ZI3/E7vnpMh+lXGdmt1RfA+/bqGZ4TBPwREWtZ9wE9ZS9xMzOHknkVVTLpTIfGp+Z8loiQe83S+VuuXuNKvyF7L+ocFTI+1Rm7Y7mgNwxyJGpQ8uQDEHnpg7XCjYm4tTloAKQLDc/WqybKl0NTUjg3ABlgQkj907Uhkzcn5IcAtxsPm7HkZ6PLz4VegC2se/JVSQ9K6TXfYC89+cmkzMGkRrI/mRe4hYDyZFtTdFzGlpDyaokahLVl2dUA6tNsRtKwngL0YDexV4wEuepnvRErllu5wCZ0x3ZU/ooiCiGeNnSHRx8EDCHnKO2DPDEOKFbB++v17wBmZFoY7eR6DgYlkH2wk85E1IT3dDqAJPfgL4LL6zH8maCfL2sOK2ttry/XO9AqFzF1VRjrKavBgw9sf4GPS6XM6EFrL4YA106I9JkvL+iucBKmFmmmAT4jMISuEXCZ4Di6DGdROPKAvBp16Kpgmp1bLyPduxtEY9+CPPru8+GgBy67sNS+mquOgfI7hHo8bBC3EJiZ6YAqeUgfmriojVmIHlIYGN+kKI5Mjyc1uot/cWYzJBnuH5AH/KJm4v53tz3CgTQpWms0vqpijn2+4uY1CkcLeSMNrm3UTHW2HnTUJCbo//+msCDmkX8C6MdCrWXnhkVJf0NOAEcUseQr01kVVlUEs2vxkz+H3PzoLkBe/jdC4CbqLgxlQfzu5sPMrJpPuy/ba1956hjMQJhYu3Gn0taKTdhHZwsEiRS3ZV6uFKhhLyfcgMYC0nbXbgxzKf9GYbma6wYFw</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45KtMQKVAl23YCRn3FDf2XzYHBNBp+Q98re38wcfZcyb4a7IQqnx4Fp2COOs8PC4MLZddL0nAyJ3OigNzibE8aKFA==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>