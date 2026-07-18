<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PKGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d98$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD3" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c98$000000" prime="d98$" inquiry="i98$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá tính thuế nk nt" e="FC Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá tính thuế nk" e="Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền tính thuế nk nt" e="FC Import Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền tính thuế nk" e="Import Taxed Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue_nk" width="80" aliasName="a">
      <header v="Mã thuế nk" e="Import Tax Code"></header>
      <items style="AutoComplete" controller="ImportTax" reference="ten_thue_nk%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuenk.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpsvi8FUj2aF0imC5x3IuSy1l9efmYAb1QpwwrNPyJcGewmulCr7YWDWb7g6/ImJHU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_nk%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_nk" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất nk" e="Import Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nk nt" e="Import FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế nk" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue_ttdb" width="80" aliasName="a">
      <header v="Mã thuế tiêu thụ đặc biệt" e="Excise Tax Code"></header>
      <items style="AutoComplete" controller="ExciseTax" reference="ten_thue_ttdb%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuettdb.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpss+Oa4ADZt98r83zIawi1I67oz3smi6kzNGoT4FkHSUpKs7S4JWUq6O5VwVroWtw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_ttdb%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_ttdb" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất tiêu thụ đặc biệt" e="Excise Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Thuế tiêu thụ đặc biệt nt" e="Excise FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế tiêu thụ đặc biệt" e="Excise Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế giá trị gia tăng" e="VAT Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue_gtgt%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_gtgt%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="@exchangeRateInputFormat" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất giá trị gia tăng" e="VAT Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế giá trị gia tăng nt" e="FC VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế giá trị gia tăng" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="Chi phí vận chuyển nt" e="FC Trans Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true" readOnly="true">
      <header v="Chi phí vận chuyển" e="Trans Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="Chi phí bảo hiểm nt" e="FC Save Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true" readOnly="true">
      <header v="Chi phí bảo hiểm" e="Save Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true" readOnly="true">
      <header v="Chi phí khác" e="Other Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="Chi phí nt" e="FC Charge"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true" readOnly="true">
      <header v="Chi phí" e="Charge"></header>
      <items style="Numeric"/>
    </field>

    <field name="volume" type="Int32" width="0" hidden="true">
      <header v="Thể tích" e="Volume"></header>
    </field>
    <field name="weight" type="Int32" width="0" hidden="true">
      <header v="Khối lượng" e="Weight"></header>
    </field>


    <field name="ma_vt0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="Mã hàng của ncc" e="Supplier Item Code"></header>
      <items style="Mask"/>
    </field>
    <field name="dh_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="so_luong"/>

      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_thue_nk"/>
      <field name="ten_thue_nk%l"/>
      <field name="thue_suat_nk"/>
      <field name="nk_nt"/>

      <field name="ma_thue_ttdb"/>
      <field name="ten_thue_ttdb%l"/>
      <field name="thue_suat_ttdb"/>
      <field name="ttdb_nt"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="nk"/>
      <field name="ttdb"/>
      <field name="thue"/>

      <field name="ma_vt0"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="cp_vc_nt"/>
      <field name="cp_bh_nt"/>
      <field name="cp_khac_nt"/>
      <field name="cp_nt"/>

      <field name="cp_vc"/>
      <field name="cp_bh"/>
      <field name="cp_khac"/>
      <field name="cp"/>

      <field name="volume"/>
      <field name="weight"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+qxOCpxMHiL7WxbDMOndhKoWobE0P7Gr9r/s22BIMutqqSpvacl5KqHx5SupZ0u6ZVANJfDVjOhSBfHXAU0aKiN44uPlepqzxaZLH1i7UwOm6qIHAoJjQRU4cHS2OebcuMWAYKQGITKc9xm+N6qOZLKjHBtH+YKEhueCtuMqOD9c1Np897mMyiPqv9uoorMjjD09rXixl/yzPQH79IGTEI7flFdPNNvbfSNl8+WqxNeEbCsCkd4DDWVRuld62eKvrQRwWn9AggXYp6dX88p2V0=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCOrDD9kOHJY6WWflw5LBHjCRXQ4GOtVObK3XAj2YHsUPvUMkFP4/CiUDAtZ4zUpU6k0eKkiI1c/lQm6QA8T3vKRwxXZKj7IpuFJrcNrom+hjYJ5dmRVuOfWQVOhlpdRp2H0sAH4PhK0ESFSQx6ukPmVBUlsvNbMU+DD9ShUxVdCNyHQw3PpXx9CTXjBKtwKb5TaQaarZ1j+rHLb0yN+dCqQpLSdw2VyCxP5D2Dkntycwz5+IMG39TKVCOezZo7jMtn/9anVads6P12AnJQHzNFsXC03vOO5mjnabxRy32bolDvwi1dODQu57jadCxusjG9kO/YGXPz/xXjXC5nxdy6TJ2RNqv314uqpav1DOOqvtQYc65Y26m3L7cuBukkXtV8PImBs/6RKhPPFPripUVS2TvgqM1vBTXbHTqKfoJ4U3xi5k0asXj0uW6aDbpXE7Qdvl6CH0w2HM6x6SZcAMd+hMbV0DMTDUUeT6QjqmfqGdd81b9HRFAwbRKvBTW4mfRBxcH9yTOd85+UimpbOsVsUyks72Lz1M9PmWm8/rJqy5DXWUbB+ZpyqKR56UQxKlDCx7gBfda3RogI6etOMQb0HC71Ct0JIZXq/60F18+fNvKsnTE/iHB1iIz4IxLcKJHYLcytNcrgu88OmgflPKyyTYr83I6fQhcNIF5uZqC2aAgKBiGeT3ZKRlvvsSOncb4bCDgoFQZnwmN439254Ub1dYB9tpOsE7fDXOQjM7EwtteykezidkhE0kZIjY0tdLY6ognK65vfN3OC5xGTx35onYolG3vv9PP0tecaX19q3Rdp1bEN/dQ4PVcUDd80H7SDuAqh4zMYr1Ug0ZRDZzQK4g8MIQqABnTXEyggF58SV8GFej5cQPB7BpYRZTvovC4qQX0NO76hPAX29VICdZnQgozSMHeOCXDWH/qlJug8d6sXCgqxMwhoZNRHY4UtuZLZz6Ce3GtUHwJ54AUWlrawnJrSB/MibU/dp7poBy28W+ZosGLElm8hUDha1SLTEQaKe2uwpBlG6pr2DzisaFIJbm3GdWr5WNriNCjCQXOa6lkyytrT0iSFqu69lz55MypWaKYixpCn3FIQCl9BllB47aH15gnEkWVCAD1SyloID5xypx7MrG0/m4CmTFvxdy6cgkQ88kWlPvtAbZmRh2UjGxhblmhPoz1L+UrV6OMkAEEyoXQsvyipougfly1hkWBnS4eEEPMD2jwbmpDfyPcwIlkOIh8qU8jHzZiCi8zBIY2wksujRWgivr0JpSmGOn6pKkQlBHMRzLprw9/zayy6hqQ3cB3Rf91eM9Ee2G0ov5tmY0+Mm5xE2TyRM8DthwWGjgKHt/zOpWfU8nJ0pPXDgE7+NBmVl9kbnw2uTnVtgS3T/oCQxBFjxcPUBsXJslpqo4INXEFDaM1c1qV100c0GktpZJ9hCg4LFOfHOLsXvfKpaxQ9T7xjDfkmcFWuYmvVh/Odb36mrlHBtdqWoD4yyp4O3qrDop/Ryo49i4ZrDS1E+r9FNjLmDRC7RavSZNspMTMfh7s7KyLYGzOQp/SR3G2xVlY1NtcJrMEGnHavZpqKZuICcDK5EVTOLf/DsHs21vNiynaNix3fjxEen8E9AQjWSvju5ADUtPVeSyvwWs54FHla9uL/ElG6qjw2y/NlQIB+M7Xj5EWW9bmpU2H58i5fJsY0A2v+jGqdpPocimbwCao44kAjdqlGoNkYU63meYoYmWZjfKzofKsKfYiO</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cvTSg5jxkx0U4D0tnq6WhgQCPAio5tHHbdPXoBEjuyrRCojReJv/tf86Ow7MU/wm+b4heu0hblCM4ZsmdlunZDW0OO5aSeNcoJD81UrI9lsIsbzBBmezEq1imoIpwokEXDRckne+6mG1/M6/DxkFLKyc7WyA0J+MUz2+Yn03+dcvxi9YFYCHd7rI6eNaHrc9NGvwr+VgTlJ3lL6m/s4YgJLwJALj2ZVun8w5qn8elU2+x2eHR54l5tgKdwvmE0ChlVl1R9puRGOdgCjIwO/ThYndr6fCCzSBMDGcCMcNDljkenQfSZG8nIEZp4MNqWvmVnjQ6Ef7lGe6/Na0U7HaB2Eomcrvp2dlxlVL5Wx8k4MdAF7Z8fnE6Ox5NbYCFP866i20gGBbMiQP0rVaXMTrMbnVN737WBQqraWrKlB7kZ/PEj9gRyareGS7ZjxRIzzKPDpe3X9zn7ongrMORS1+GsNGlwa9TjF11IJUBpIPdW/nNPRCpHZt23Y+5s0gg69VnWfKoFk+jqlDOQXHIMwd+lDNTzmN3tnk0fWEkfA9ROdmLtsRXY9IhIVGA0gcXrH2/RFvoLntacS3Ey1W4ZDn0OpRb/Xntjr5xaUZZSLWbH471j7b3Qod0quyC1+PJcu7mUuOrvPrM8k7qI+a7YF1zgfdzF+IvKWz8wC6JMQ6GcVPPWETBAsAHHl94vionTw3iQxY3uLRmPyDZmmraLqoldxUb8YbP6SLCkehy9/+OTBhZeGbDR9O3NwQ1yBlutrMx67pEzfjCB/qV5hnHSHTaJHvYg/1SiULZMhTs27/65OrA2Prc8CH6Ur9IAywzVrjwQSMFAU8DvJ9P2etEwq1p0YWeu27OWjbPhH8oB+cRlRRt/lrr6r1YGXD/vb62EbD9AdKHQB6keuDfPR4z+75o+aX5WXS6i7wV+hNtTq3bmAI5pFUEFX87umTOCD4hqKYaJFk+GHLtPuoOBnfQ+I7rU15VkncKTLUAuiI3/yZqoSGnFyMaBlv6789BIqTuT/v1sD0NAwmxosbaNft0etcFBGwLr21L1jvO2tqktXgaf4lWQ/IcXe2ne5yggyv+LB5MgNXuUsTPb7aq3MTmqBvmUSKXOrlSyqCe/K47A8+4IG1AR0bFOpJfe6ocyaHBeS/Q==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JkMTVy61D3xehAR7/Q3j5SDO4krQk9PiTGjVatG2SjvVDWYo6a899EsA3nIHdp/O+vdPAKPS0pcfPxIFGyU8/dQ==</Encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tBqHX+c32IJZ9XaQWvopXalc20SnriqMaTD5zCesXoi27DKqmpo6fvU0hK5vKGb2YXZa+vfeKgOITH/aqNo5nYMZSWpTM2V9Tmjm7nxyky8vNuGShGa9th9HNCAb2u/M4a/ERLVm6wtYXX2aK25gMJ9</Encrypted>]]>
      </text>
    </action>

    <action id="ImportTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4f1WyjAWyOYyF9NJfJwSA++vM9VmpoVBKpSadY7cxFUy6BnfTR2xvx8LPOoM0++PfN+rMtvRxmNtI5GmBFV/3sjMNcMn+UrRYjTroNKNQ2Tn7UYCT95V692+Pn+cdsV/pAAaSuyRYju/vAG6z+FMJ8</Encrypted>]]>
      </text>
    </action>

    <action id="ExciseTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4o90wAzuvFP8EEKg4KoOMDL4S6GRQ3EFe0wMAWuKLUZO29glt5boE6BcgRLtkZGbh2n0IiiKLw04ZWWA6bdZoghTneUlUUu98EAG0n4Dt8LsPVFfvy5V/Pz/h5K1jGtj+5JMCoFA2HSLs1GZMEqilI</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ đơn hàng nhập khẩu$$90" e="Extract Data from Import Purchase Order$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>