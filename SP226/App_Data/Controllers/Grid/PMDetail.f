<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PMGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY AutoLotForm "PMLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "1">
  <!ENTITY EnvironmentTaxTag "72">
  <!ENTITY DetailResponseItem ",
    ['he_so_mt', result[15].Value, null, false],
    ['muc_thue', result[16].Value, null, false],
    ['tl_chiu_thue', result[17].Value, null, false],
    ['tk_thue_mt', result[18].Value, null, true]
">
  <!ENTITY DetailResponseUOM ",
    ['he_so_mt', result[1].Value, '', false],
    ['muc_thue', result[2].Value, null, false],
    ['tl_chiu_thue', result[3].Value, null, false]
">
  <!ENTITY DetailResponseValid "g.validExpression(o, [g.$a.mt, g.$a.mt_tg, g.$a.thue_nt, g.$a.thue], [g.$a.t_thue_mt, g.$a.t_thue_mt_nt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeField "g.validExpression(o, [g.$a.mt_tg, g.$a.thue_nt, g.$a.thue], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeFieldFC "g.validExpression(o, [g.$a.thue_nt], [g.$a.t_thue_mt_nt], [g.$a.t_tt_nt]);">

  <!ENTITY % BaseCurrency SYSTEM "..\Include\BaseCurrency.ent">
  %BaseCurrency;
  <!ENTITY FileName.ext "PMDetail">

  <!ENTITY TransferID "PMTran">
  <!ENTITY Code "PNB">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenBWC+1mwEVXgYGVa9x+U9OlsLVGrDhekg4ciaiK9ZCzi6jQF1+IILafgQWkh3a6Ox0fsYxO5cDFgvnuPCGvrLbFastBusiness.Encryption.End&FileName.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Tf7nXqfgg9rbRV4lIhLKP5IfJrelRlHu1gSz03lNsL4/1s3Ar2jRHU70ek6YlQwhT2VcWo3CZ/f9pKPeFSwJhT3JHw6yXuk7Ahz7ixlvOEwlXDpMxHfYLUw4GOVlvpp+pZO87TIVSIrmJyyzg4URizoD9tONWM5EjXmjEnZ/af4FastBusiness.Encryption.End&FileName.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Tf7nXqfgg9rbRV4lIhLKP7O56u5ScodzWiMCbmET/wHYR7ELmzhxjrcdols++3lmxMpevhKLrd7da5vdsCUAHM=FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaWj9jnBStznXsgs/ifjDSZ8aH0Qhck+XIlZqWZhej37PQ==FastBusiness.Encryption.End&FileName.Compact.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Compact.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y7m8X9vL5lGs3bc+FYcuQFcO3O6KpAgkHa/X/D4PGSj5hZDfU1S8UEYGraxWBdIHlpL5apIkw+VjGsSSbA+NJFOu8sTMDKM7dPdUPmdaN+JFastBusiness.Encryption.End&FileName.Location.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Location.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y7m8X9vL5lGs3bc+FYcuQF6MNm+jrekIM53r+mwhf422hRjLSxs4idFD7Uy3Fv+1H4/eE6V7jMurjYyn7ML1If/LAOYEJxG3Q9AGywlyaG/FastBusiness.Encryption.End&FileName.Lot.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.Lot.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y7m8X9vL5lGs3bc+FYcuQFrv/O0HkmDVzTcjX1aFIi1orUom1fP1wM7G+woAaxYaUvQ0pzVb+crcKxJsjqjO6hnf9jUUmj0/Q10Sh03F2UrFastBusiness.Encryption.End&FileName.v.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3Y8C5/bcvVcp0vdssmz6oxQ=FastBusiness.Encryption.End&FileName.e.ext;FastBusiness.Encryption.Begin$rDv0vttZjAuzMv0027Om3fwrYe40v/3GmDsg/uBc5TixlcPyaOqxe6MVZ9ekWMKOhb+m7b4fPZpZNqQh3TjB441e0pfgjUmrTPpJ/zP9nCXZ3ZLEy+acN+wSIats4/IeFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;
]>

<grid table="d72$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNB" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c72$000000" prime="d72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
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
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt3" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá tính thuế nk nt" e="FC Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia3" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá tính thuế nk" e="Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền tính thuế nk nt" e="FC Import Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
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
    <field name="tk_thue_nk" width="80" aliasName="a">
      <header v="Tk thuế nk" e="Import Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_nk%l" key="loai_tk=1 and status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_nk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
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
    <field name="tk_thue_ttdb" width="80" aliasName="a">
      <header v="Tk thuế tiêu thụ đặc biệt" e="Excise Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_ttdb%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_ttdb%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Thuế tiêu thụ đặc biệt nt" e="Excise FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế tiêu thụ đặc biệt" e="Excise Tax"></header>
      <items style="Numeric"/>
    </field>

    &EnvironmentTaxDetailFields;

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
    <field name="tk_thue" width="80" aliasName="a">
      <header v="Tk thuế giá trị gia tăng" e="VAT Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gtgt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gtgt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế giá trị gia tăng nt" e="FC VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế giá trị gia tăng" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Phiếu nhập mua" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="dh_so" align="right" readOnly="false" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="false" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Tờ khai" e="Customer Declaration Sheet"></header>
    </field>
    <field name="tk_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLIRReferenceFields;
    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="thue_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="c.tk_cn">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_tk" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0tk" readOnly="true" hidden="true" allowContain="true">
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

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>

      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="gia_nt3"/>
      <field name="tien_nt3"/>

      <field name="ma_thue_nk"/>
      <field name="ten_thue_nk%l"/>
      <field name="thue_suat_nk"/>
      <field name="tk_thue_nk"/>
      <field name="nk_nt"/>

      <field name="ma_thue_ttdb"/>
      <field name="ten_thue_ttdb%l"/>
      <field name="thue_suat_ttdb"/>
      <field name="tk_thue_ttdb"/>
      <field name="ttdb_nt"/>

      &EnvironmentTaxDetailViews;

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_gtgt%l"/>
      <field name="thue_nt"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="gia3"/>
      <field name="tien3"/>
      <field name="nk"/>
      <field name="ttdb"/>

      &EnvironmentTaxDetailView;

      <field name="thue"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

      <field name="tk_so"/>
      <field name="tk_ln"/>

      &XMLIRReferenceView;
      &XMLUserDefinedViews;

      <field name="ten_tk_thue_nk%l"/>
      <field name="ten_tk_thue_ttdb%l"/>
      <field name="ten_thue_gtgt%l"/>
      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="thue_cn"/>
      <field name="tao_lo"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="stt_rec_tk"/>
      <field name="stt_rec0tk"/>

      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+qxOCpxMHiL7WxbDMOndhKoWobE0P7Gr9r/s22BIMutqqSpvacl5KqHx5SupZ0u6ZVANJfDVjOhSBfHXAU0aKiN44uPlepqzxaZLH1i7UwOm6qIHAoJjQRU4cHS2OebcuMWAYKQGITKc9xm+N6qOZLKjHBtH+YKEhueCtuMqOD9c1Np897mMyiPqv9uoorMjtvw41gnoAYm5+NBOVrT5maLn8CjqjGeUMSq/IHdZj3mvKQdUebmhxvptvJySyY6ZddlC7+vBlZtoomHbUEddmfSp9Q8j7pT5HqsYKN9E+fq</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lgYPJCT2P8Qa7sDIVr/CKq88jgVKznhadmMLhO8fLFyAh/3XLhyzW+78rK1ChNgdwLP7aAu3a5VH8tVJ+7/4w8WBUBqeuaaszMag9iV7dokLAuEcbZx0L/f6y7afQIiHQMVCi/apKvGnN4rJW7t71eVx1qDQeJcnQ6o6ast/O/a2IhBgn9vvRpSLTx7GrCr5elcKUfE45mLlZ3kNsLYcS+djMVvcz8VXwmBJeILAH84P5gHOI2aKe8pFQKcypdR0jysYZIVhzUYeuVWksbS48IPyFfuu534M7DP1apHHC2wC8gHvsmEGIcSXfbdjy3AB0x9yAVqnwyxCt9DvkyAlm8AYTw3zZk8stcH+sH4nkEhBFsId08BAlmA8Cui0KzpMUy4B1Ma7HXugpavPKkL0vCU</Encrypted>]]>&EnvironmentTaxDetailArray;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4abUoB0zNz2zbz3wkpINTWxtMAA0RwMnq2U+OXu0hDtyvFj1X2CvBbOH8d4BoKVQcNOrhVuaGOomsAB2WA7xgvg=</Encrypted>]]>&EnvironmentTaxDetailExecuteExpressionFC;<![CDATA[<Encrypted>&atvZ0F3vf1uQeV4FoMJkFldvyD2k0RyNtJHtVB3k8AtugvcW7+MIMDEJyabszwBISetJAHDrqOsPpS7TAnPGkgg2xAjnItArEYasz3qlPy4=</Encrypted>]]>&EnvironmentTaxDetailExecuteExpression;<![CDATA[<Encrypted>&atvZ0F3vf1uQeV4FoMJkFldvyD2k0RyNtJHtVB3k8Asc1GuR7LctRlI2xMhPMK88hf59cZkjtkVEOJse438eh/jJVC1nxwPQTf3t6CxKZERWX7KyVwLhGtyalSBd3BLdBu0j77dc7X1FZuebyp93VTPsUiXfSx/BtW1wv3yvOScmSDyzzAy/nbr7RlKqk4Hp6O+wiSv/QYq1R4l0MUeLDa5J9r41uFOzTd/FBR2MsFiqEXKg8AD6Pou1LsSth0dWSERVKB9Kf0cvz9aOJWths0IWgSbMDTE4DmMvdJs7SPw=</Encrypted>]]>&EnvironmentTaxExecuteExpressionFC;<![CDATA[<Encrypted>&SspgEkGY+riiwyNEJyqsXWMY+m/ga31qxAfoM4XvOwWrtWjnJkAyeft19g4zH+j3naNJhqvBLwHoV3QayRWtmGUbqITmTR4TalqdA+9v7g4=</Encrypted>]]>&EnvironmentTaxExecuteExpression;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR74DQ1iZe52Wfo854Ev3x2YFl8CXg90BvVidYmU2JEWXvmMNIf6C43kUb9SzfZyoFpikMFmhA7XL9CItLC7MWq5VU0Vnr9t/OZiERe4kOrJzr/bAE35waF0fmbmSX1PssBzTRXgd5xmudwy449M5QsdIsbug/o4jdkXE9U2RlMd/HxP91YuIg4EseUJG1cwFBXBkuycU3ASIdplNZ4S89abgrz9/M0DcL00Lj2NTK0Y0Pf2K68jJguc8a9sbYJF76LYfDCj6DZ1WByN4ojbTS3wZA6eb0WWmqZVnF6Un1kpl58/ktHw2bsBq9mtDLcrFOLVFEz677SmkFe3CkbaMGK32KTW/PdgzAGvAU6Cmx+qAoV3wnKBiN3zi2MHn5bHwVLn6armixFad8Ar5QwwqY/BZ2mf7OMdkAP6W1Eg63pwi74JJAGGUp6yIy+QHbaupwGkdLQbcjDKQAkioRef4vSfk7n20JANKseAr34Jwm7Cscgew5hTGrZJ2XHnTeuv5ApJb6gxoukF1wE+zHrttAgo5RstGpwRXrLS7Mifix1Sl1RHB6JU7VLzjh0osGGPQ+DEiB6fZKDfjusKWwkcW0aj/oBgvEVM0sqYZlOvBN1ZHWv0nz84NqSpFj0Tx8JcD4EoKYgMhJ9xEa8XI0Fo2RY2M/5pWSqDnjIGtCSxxtfqQfK212Tb09pIK8vVUbzsVwa+XhQDDr/ux7gPc4zode8N/uAICoa1SN86K+wnKDlfnPvB7kKLzNy0OV/NzgoHtE+0CbUVl5w91pUtChb7YGvuLnpbKVI/wbeU+RnPp1EwLu3hCrPXEldIelfZEjcxuQ0EcacDVwNjWmaU58CEcgkM5Q4Dl+rjXmy9qe7dui6Uajemcw7Ibgma3off+EdDClE2Y8eYK7GzDE5aJHRV3AKQ4=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatity;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYlemPUN8S/UppMkhHJBpzrapb83DHVq0GhDZADm5O/EIf8+t82pdje0ApvkJMGrvpA//MHdXXHG8D9dkFxfrswg=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotal;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYo5tv9gKJMTXFwLgYHQXyNQaRAjEr+0VzEDdN8rBB48mjR8QnR3IgZ/xowIwmB2wiYhfe3xSnXBcPAb7mZJDFKQQZaV63x7Aj/exTOB++kFoloCalTxzLXVRYcjGNkEQLfEzxaQ8KqnnjD+url7hNmh9qmaHBDMFdedHAn0FAxvR+3hw4u8exsayao5scwTL5/FLzMZtXFvHWmJD0apGHvot1bSA/acxxkZ9VEXmE9iqEKN05YC01ZD4ZwpyhtR/K8GwPKfeMLMYPWZuHqJoL6qaB1dxy0cmS52sBVYsz8pV1/x8vnOA8FD/gsolPjBz+6yS6cPOolPmk3LtgZ7PAZFgExxsxyo+0eiAEwwEqKyQal7AzYNjsaJag8t0odoIQtwg22KHsybfRXU+CDykt4LBIQHumQKAEnH5zjDZUnwCOw7OvPtxmYwEaIqej6ezpiIFI4qtq5A5w2KwaJcPPWs=</Encrypted>]]>&EnvironmentTaxDetailChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WeYttcqcPc/aUMu5I+qeiwvCWrveqRkesKi0uORd113w8fXD7NqaSKcrNb4B93CVQsf8sKBb0GbHNOSuywcuue+/dwlUlddz0Z+4j3lZDTvrMsKRpp9Zc5kshr/O1+ojECyNPy2texozHTwYAqMefJhI8plto5Yrv0dTN+IZgjJ/G/eXkvISZz+aQ/hccvcBB/shP3/MuFuzV0u4H9z9cfN9fTULgEFBTsSIdP6lTBPMsBK/Ih1TW1YL09Z5Ez1ofr1cHs06eRSqNQMmgQHNgf1FXfbxQktEPo7YoZzmm3NtCh76FWTTAr93wSZ1y+z/Y62vRKydGiIXKQ/oU+HfCmp5wzVMfCk492meBc5+nmmytFSORsQxoelU7Tnl7jFuZ7WVs4PaejMAXo9tG1vSn8=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGqUvlpitbvGX1b6GVejIs6rsHAHI7H3ZTEBhjvZlwTB6gnENt3QnPXlnifXwBS4BiH+79tz6Z2ssd/BTMCo4E64y3ogNL8t6EISqyQIuoDma/fwAiJ9vXVnFNsrdI7KSLsQvhcErfWSyL+wT1U5LHnI9IBdXt5ZLUpOsZlLj3F1wgfEz/aM2QMNw/6Q0kAfR7BRhdG46YgHJQhkOvdFubCFBTnj1rXMbSfQ92aMEPObmi01DqxyY05J9Rl9+FERcCsOB6okhIY3IaOCAwbyZj5k+/7IvIn8sOTJKO1Cdw948/D05J2yz1V2t3HDmyYZgFX</Encrypted>]]>&EnvironmentTaxCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4R4WpvLbvChssB89t0nmVq+Vl/DSK9GYA5ZGXr/YMN6Erlh4FxMDj7MuhzfVK08p+RXzJD/Z5IlaEufXn0qHEftok7cC20HDO+mCvPfzd5z7y6W8QuE6g5UIAg9XLumyCTxxM9xZXFFCr+OLVBXiu/1IWvSLDAc/KE4P4MPwKsk0Dyp87r62gzRu1p5fU9GrVBYWSjsYXQrBTaxSs423qGUrWi5aqWMbj7UB2NGVwn/Og9Eyi637DFJTqnzAyHI6EDH1nG6DZuBUsU/QHAvjcBgsf+RRcSNw446n0RS5qdhqZA36uluWmoJqpVuOv+xeOHVSBUGWrDAjTJUJevHefWDJT/wP8u1PY7Y3Fh04RYLpeP5UuHqmR0Tt3EpTr4fpcY384VeFSii06yB7DxDh9rXaMXJA0/SUEKY5JElCuqYrJNND10KKvHZ8J+EX0KmQFm9bWwOfvhpywSUoS4OhIUAmBS0lqbnkxt30RD/upwj3</Encrypted>]]>&AutoLotGrid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UU5A60twOY8v5qI/Z3blpMbNla9HTHypDvXskX+sb0vFLNwyUmFz73/cAtmMH4UKSmHUve7mnSIzoEGdotzDWvTuDm9W1QSrdipXvM2z637iJs0TxtGV3E1ZM1T50MhvUf/RXso86UOG/HbtbIRLFcrMUdeBz+UobZzaXrmmRwaarJiuSXh6u1Nl2wuvQ+zg2bXwqjQ5ok2MGyvyijNIJahscg5kL9P9qIjOjt0O2QKbNlFL/Ywxxf5hBz7ygu2PHTHp+7y0Wp5r8XeD9VVNoguzwTm0rY1wpk6AOd9TtAfpDbHJE3nuJ5oseH3C6rSF7DPeOWXbkZkMtTWUluydd4geJLd7HyzjXUE+GVKgPuTqDFLAxYDWHcSLehqUNBZ7quRqLbhUPnhKjTRMYF9rLgJnaLBza0xoI+5WEBjpexEmYsmLYzfN+8Cum0YpPdqyuAIVpx+mCsCAVPlwDk3LNyICuvy/7YJCWWgLOo05B3cQnE2uRLa8+xEc037JUF76Q+CtqrIJqCC4aY2rgK8zffziF1rraE4dy7l2/7eX1tGFIfl3k71foRNVWCglJ8xDdHZ3gNxp6AnY/VyJVjC7tEkjLRtKGsPIiP4ZywHcjYSwYhjDHBV8LcElzZqVVgGXmy2hMMPNipR+xWGrXTFP9BRMXtlgl4uMMfNL+rWVXXKuuVvAbzRnIcJ9gyWSLNsmxXhczru4zfm1SKLZ5K2vgDlRpsLZYYGOi+7ocjipYVU</Encrypted>]]>&EnvironmentTaxDetailResponseItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UAamzWoFANS/85RJaQMUt9tLj5Nttpyo70ulfVB8bSKatqRYCE7PHmTtlzy9+YacM6yYodK4tnH6utnzJP5Rx1cSDiBFo/zPtGpmkpMtEHs5SP6KSquoSpdAbhwkis8grDoJvBqwL9ZC+fTv43+/Vx3zHG37W0PKNmY2TNQbcMe</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZmF7n3ikVoG0TXeczNChEh8q4ktvRPnPgb0t/OTsuKrIQpEezK2FnysGazOec5XgMsCRXKZzei66Bp9je4CrV8lgkdoXpQpa+rYuUOQivNGbHD8Qui5LBjyKOK1bo+ZCIPa7GREIKoe7QJItmo2b/M=</Encrypted>]]>&EnvironmentTaxDetailResponseUOM;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP163bfEaQoAmGrK6qmW0Eq4=</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bVTV+yh10j4wrRBlBTyGvOnApFkvz7vlyHPGWCkcOp9J+aclPbTO6YNIhi3JGUrBAdQ1iVY/YgsICX9BsECLQPoNQ1syXZurZAgE5dWQLg9dJjiIpakNiSPZOO+BFUEPt8U6RsqDMrmoLUPN8PBBHg0r2M3pWDye3YhCXk2fuElCGeeRWRWI1swMe9w5Z/IChK4wFK4cchjkGSGmmAVMUlJTiHThh7Hi3OcnMN7brLVxXZReKfGWqSI/KuuIxXBv2hgJ4P1jy6I9McASmCfpUYyP8D/JEKo8YB9Miip+7/UoLqCjpUsVcF/Opx+U2LDW/fnRJlq9Bn+78yiX+0FZqLwKDO01YVw5MryORiX3+CJw+DE40VnqVMr2w7c0R4oITOizMicbGRDCJ+X2nJ3CtpbJqwc/mvLScY3Gk4C5r5Q087LxTzmR//rU6708Ed3g3LxvwEUcX8/rJeafvqq99DbR2RtKphgwoqqOztF0VsyQr0mZrNK5Fltd6GIIrNK9JqhUV+x8kf5fpiCsINTqK8tPyL67JOqhPTvRdu3DaBmX0rFkc9CPk/iJ1m9aCPoaZxQkDGLH+WJzv2Wysuhv3OWdfEU9v3G4uXrMlZHytZ/</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="UOM">
      <text>
        &EnvironmentTaxGetUOMConversion;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0D82jUeZxaMtyqicDeohsG0vOgQvexEyu8dnVMNsILa5v1mPkw2Ph4/1CtgXm+3WMD37gIH5gm3sxkAXlLtjXISN9l+loa2eN5aleijNdj4gOWe8CUiqeGEdoTHXI/QTgIZ5QuXg3kGwL4J8A6zV1IMJqCYbekKU8VARE317QjDBwbN63GdKg+HXHv259OavA==</Encrypted>]]>&EnvironmentTaxUOMReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JdU1STYtOv9EjgbjrqMkuR7McdaWmH8H31/jCMRHCu9jD1+xme3al+5VyPAReB9YjnaGkZOYPjl6tB7KsYnFN8Q==</Encrypted>]]>&EnvironmentTaxParameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cLk1tzjI10xZsjnkvcez8b3</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e5g3wJw1x6BZ7s16MkJ7684oSnwgJ/gElVGb/q/FHcvQSayiA9zU/k6Fmzkezn8UTW+aBExJ9n2584pyBKjb8G0dt99rLOWPwcUazJzvj+bHA==</Encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tBqHX+c32IJZ9XaQWvopXalAaCYeQ/kdHtzQzEkw9YP1VizgSeBTclm7Eoo+Tn9nKmzN5Fga4dbTzlaSC+IHcS7IkVPcgU8QNSd7+LA2zAe2tqF2SCjtmeDHzNwtxDE/BhuR2VukrPG3W3aAWVKvkwymiAkOYYRYENNNlsYkRz0Mw==</Encrypted>]]>
      </text>
    </action>

    <action id="ImportTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4f1WyjAWyOYyF9NJfJwSA++vM9VmpoVBKpSadY7cxFUy6BnfTR2xvx8LPOoM0++Pd0zsxvDSk2tG4zsgdDlxa0X6rmfexLKqbfI9hmrULd4quiUrlu4HtZFwshmDURPXKxUM29j6ubSv6udLH0wIlbbuuIhEii4NFjKdlAhiMikw==</Encrypted>]]>
      </text>
    </action>

    <action id="ExciseTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4o90wAzuvFP8EEKg4KoOMDL4S6GRQ3EFe0wMAWuKLUZO29glt5boE6BcgRLtkZGbgwSycPRkXIQYKWFw+/CYOyLr2vjBRxrM9V0YaiTOfYm8CBuzHHzphaAEJf6i2YNLRjfkqfNLOuuKlcrDaXSWswOlTIU6ORICTHoV8vOoA6KQ==</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTyDm1/Z8ImqMvDAOyNBeGY8ZCDoMzwIPZX18xp1tHBXGxiCsRB8WKxEWSxFMcTibwg=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4S8s/8EXCXT9ocwBIE1gAgciVlL1yMHbhvvMI8jUZCifog6ByLgOgg1wQFnF5zFZPz1fu7uhK10UG5HDGMyJrPStjj0y97kLiYJgzYce/aYMQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5w84LLWn3WEUrrdA4uoUyGVDzwSR5fmh1/LdbCSgy1H1SPqzclyzTZ8tKtzO5GDSLKI+BxWLCruZKPsIUCb41BT7C5mLPKMFDCLfvGV2e9TC0uB2pD8geXNi3cS/bZvwLWooZSLjZl5D1pjZm0KE3jw==</Encrypted>]]>
    </text>
  </css>

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

    &PMDetailRetrieve;

    <button command="Lot">
      <title v="Cập nhật lô$$90" e="Lot Maintenance$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
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