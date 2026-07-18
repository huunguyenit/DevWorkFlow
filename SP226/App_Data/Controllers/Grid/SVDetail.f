<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SVGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">
  <!ENTITY XMLGridStockResponse SYSTEM "..\Include\XML\GridStockResponse.txt">
  <!ENTITY ScriptGridStockRequest SYSTEM "..\Include\Javascript\GridStockRequest.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY VisibleFieldController "SVDetail">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % DetailTaxSVTran SYSTEM "..\Include\XML\DetailTaxSVTran.ent">
  %DetailTaxSVTran;
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;


  <!ENTITY Type "2">
  <!ENTITY Tag "">
  <!ENTITY Ext "70">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "2">
  <!ENTITY EnvironmentTaxTag "81">
  <!ENTITY DetailResponseItem ",
    ['he_so_mt', result[25].Value, null, false],
    ['muc_thue', result[26].Value, null, false],
    ['tl_chiu_thue', result[27].Value, null, false],
    ['tk_thue_mt', result[28].Value, null, true]
">
  <!ENTITY DetailResponseUOM ",
    ['he_so_mt', result[5].Value, '', false],
    ['muc_thue', result[6].Value, null, false],
    ['tl_chiu_thue', result[7].Value, null, false]
">
  <!ENTITY DetailResponseValid "g.validExpression(o, [g.$a.mt, g.$a.mt_tg], [g.$a.t_thue_mt_nt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY ChangeQuatityValidExpressionTotal "f.executeExpression([g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeField "g.validExpression(o, [g.$a.mt_tg], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeFieldFC "g.validExpression(o, null, [g.$a.t_thue_mt_nt], [g.$a.t_tt_nt]);">

  <!ENTITY AmountFormulaRate "tien2_tg">
  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;

  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
]>

<grid table="d81$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDA" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c81$000000" prime="d81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="km_yn" type="Decimal" width="50" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Khuyến mãi" e="Promotion"></header>
      <items style="Mask"></items>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpmgf7hXqhIecWGlnfkL7l4VwaWkGMcXUMb1BLIknf5iNFNy3zf4Tw063BcLuPdE7w=</Encrypted>]]></clientScript>
    </field>
    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true">
      <header v="Giá chuẩn nt" e="FC Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50">
      <header v="Tỷ lệ chiết khấu (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    &DetailTaxPromotionFields;

    <field name="tk_dt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_ck" width="80" aliasName="a">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ck_nt] != 0" field="ck_nt"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="px_gia_dd" type="Boolean" width="50">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá vốn nt" e="FC Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền vốn nt" e="FC COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk kho" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="80" allowNulls="false" aliasName="a">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" width="80" aliasName="a">
      <header v="Tk chi phí khuyến mãi" e="Promotion Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpbh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="([km_yn] != 0)" field="km_yn"/>
    </field>
    <field name="ten_tk_cpbh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true" allowContain="true">
      <header v="Giá chuẩn" e="Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá vốn" e="Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="dh_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Đơn hàng" e="Order Number"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="px_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Phiếu xuất" e="Pick Number"></header>
    </field>
    <field name="px_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &EnvironmentTaxDetailFields;

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="km_yn"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="tl_ck"/>
      <field name="ck_nt"/>

      <field name="tk_dt"/>
      <field name="ten_tk_dt%l"/>
      <field name="tk_ck"/>
      <field name="ten_tk_ck%l"/>

      &DetailTaxPromotionViewFC;

      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      &EnvironmentTaxDetailViews;

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tk_gv"/>
      <field name="ten_tk_gv%l"/>
      <field name="tk_cpbh"/>
      <field name="ten_tk_cpbh%l"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="gia"/>
      <field name="tien"/>

      &DetailTaxViewBC;

      &EnvironmentTaxDetailView;

      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        &VisibleFieldGridDetailShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4b0rGa8vBKURt7mg7V/CooKmKJyj+Su7OZDOfLn8aSCW12Z0TfgvCi2v7wp24W3tHgVlR862zptgfiA0cvVcwv11UKQmPL+plT5V47t6BWeE0x+ZuXLnLJZXcvBABUOUxvE/ltuo4iKmdMmgptXYHFYYexmFKX2e2iih77HO/LiZh6DrVQgQynGGwaSgBDbaA=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+xQY4Ac7ybHaSG+Lx5+tnMA/v1zen1uTZXHUMiTbUD+4bVd8Fx4PPMYaEy6eF5WGFy/EnYvTpX27FhjjP6GH7eF+FUOTY6NfFWUY7SzlK9AbWPLnKaw9KbnIqu/AycEjEGQSrhVjjfqDzHJrNkw5D5GVl/Ls/HLkLYD1p58zYQGydLYudz1ggCT1VxgkEFm6i+5T4P1u22exbsMZSt7C++I+oDzEfQa3o/njG8YnXVVMJsvDi4YFvCEM1tuvhs2Routpyv2jNRtsOeUHhARFdr0=</Encrypted>]]>&AmountFormula;<![CDATA[<Encrypted>&ANHEiKqthwbsi+Na3F+vkpgaVPUoFEx+EMnecxuCia1/C/GFoQeZS9c6zbpvNmio</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&DetailTaxGridScattering;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lhzSeLpRBw8lMiWX/N3jP3bO94DAV3JmdBlxB4txEN6Kb76T4qH9qD8q0ZslFfdwzlCk86mE5VUtspZCGGbUG9xgCVNVnYoUCJNYMcKTO3LmMNouN32oNdA3kYa7kJ7feSvOHE+9v/Kiv4JCcCoKIob7w8ISSMUgtjHZ3y/JsaccKycK0nSXN61IWI4Ofi5bqPDnxwkuZtVDQYDsJB/6jAnH5bnPqVIPNHcKBWnkGcM8zegEFs6NK5/lWIb4KNGenqM8WYCyjPSQNl1VkewqkAF9euUyUVQxN43xtpKNT+OYDcoBLwGooQWZGnP1nQ8/ydbrsG0S1jAEfsu+5l0D1kz</Encrypted>]]>&DetailTaxFomula;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QayFEUHi17PD4FWh/ukqpik1OubV2heBNcfZelgMdygwij/98mQ3+35HgZgxpcIpXZOyYitIh1LDdGBgoyF3r+3btccQ9vFirZI+5kTutKYlNELNi/5fjUz+o4zKV5Pgu1YYVwg1TQiAJD+uRhnbIUqf/ucGhmg/2c/B6pHo0DAfCveJcjnGU2V73BMaVu8mnLoJm+eLkfR2ZkQzo1v1LTPs5GjPI93NdiX5Q0ORdtdDGymkcKeNJSbQHtC15IgmQ==</Encrypted>]]>&EnvironmentTaxDetailArray;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RiPc8aVA33QBdokXta/qA2QTnWv3ThOPZRBejj07wF2+2Cr0klLfFbtmUuyDCRgOZFMFMmudB3EcIeVUjjQyJQM2maza4YWyhiQ2LgUQsCKXa8molyfui6ZN6ajPW72FEBFFScbbdkO9qwohO0XSd8gMCeEgLxiSeFLo2EUcZIWEboHTFWUd80eWv7iXFQV3lowmKFyncdke/YcU1vtaT8Q7tKc4c2wbySHuCiE9wcX8uqM/1GogRCjJPIdNpFzYKaSsKshpjIY1rxpoFMU3XyVFYmfCTllnyEA9I4XGWdrG4r64E5jMCCOZ+pJXuSW5HfSO0Bu7HwK+xsVyj9Bz//4cv75o7YegYiNxhcT3sZBJcgpowfYsgJ9PFIwi+QXI9/+IoFmBYfL2WeWQX5edhp+t4tPCzXTUVxphCqSGOE1yKI4E9uqv7mDmtzgnvgm7de+X33u72e0kMkary0sVDKkDOYjHpZXxqcye3O5Ri8QSVwSM4Uc5Cr9GKwaLQtNjATtuWqpnJpFnvJAKZSC3QnCfOFd3t2IS7rCcAeGMahj3sKVpmzf8EAYsy6EhKHbQMdd32f5HYHV+gWztNO8W2gm253N6hHP/Y3degaMT1Hv0RYpwEpNaMuVEyAEFbW2oiV2mam/HEY9be3DCki1ikqsjl3gKi2ACHLVyRkhwPgX2yIDfIofeg20qIWbwI/Ac65eNPf+VM8Q//vuxInUwK3gbY8kbTyv34VN1Z1d5+6bm3HrKTUF5eXAEREDNO/hvuKf0ACb8yt6QgGbUMQIWvKnh26DFqgKAblWW9wfknKW1YFSnNROc92NrxcBQk/oODbdBZrVZtkXato/N809HNhgFqsWBJxdhdWPXsEcwF3qHs7VwuPIQHV7vcbbN0laCA==</Encrypted>]]>&DetailTaxPromotionValidConditional;<![CDATA[<Encrypted>&z9ZH1cYG110SnyzJqZfehvTr/aAYs6ZergULzc0rSxK2bJXIUkbo8Epi2XFT5uMm/+jrEftVbWFGqEpK+Q0YAkoVYE2Qlbj5xeCkOTqSJ4AcUK/P2lTU+kFptmXRsxCFRZtZJRqjT39/E4Nww+jf5f7+PKrgWmimu5F23KT5Umtl6DuzpdLJmHTbx9J+jM/giP8eQE04hl5n+XIn+G0HSRmAy8ygOtx1HOZUtYgCji78e0SJL74pUYGCxPvWhsSQ4/XK0xaXhJiTNMLeLDVKMdBFuduNDw+kaVUbTuua0gCbJdTbEB4dOXIKpPsx1L10</Encrypted>]]>&DetailTaxPromotionValid;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPDlstVFhzJQlJuIDnwsaw7hSq04gr/1wANCrXPXngC7WHG3LIlSEGapCzWxkxq1mXIAmtfFwnRn4Qymg95zFACk2ksmimNrmCPW19R02b/LulvIlQqAM2AbS9+zvkh4Rh/ADfloE9+ObjUsaIajJgwMW1mk/H6XJKWDJj2uDEvKWkuPDkNXULhBWwy2oO1IfoQC6nhVxjj01DvAlCqXO6tpG1MV/m7Qk+LY2grxmc3ZQgYOe+oTrqllGeK3p4vMWaU4l8LNGReQyeq0WmbAeDRFMmFCX/oLQXK0/PvO0ooGR9GiFR4bf0jBQleIJSiV5y8iwUHCcYiffJvAnHzloeA/ghBSRhAOB6rQnBNAk1XrO0AJzDlb2SlTcB3qoU2FK1PwOUY/QNb8cqUjgcHGiFNIrEhT00HbazbBAjQ5ifD5eY2gsiZu2CmT8+VV6Ei4btGkhh42dZvKH/snIweVxMx3K281uCcl3d+gSpT7bfqHNOHZxmLoPy3Z7fOu3jEaLxyuScQDWVmZxEBaxi3XZnOsFqOdmZ+qqs3F5JpMvQ7ZOzPWyQfIJ/romTFoc+XaT4zxOkaJU6zEnQlzabZLJjfQjcYPy5I+ukP8GcQc9uIMtNgEpSV5RX2+hArzNHHRO+ZDVD7saSkNlSVBi60xGl9ETK1pv4hJaA2XdQ7dpDAHUu0fvy+USFS8g1MOXNXwWo=</Encrypted>]]>&DetailTaxValidSalesPrice;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4a6Qr/64mTKl+bHk93z213QFMbCEhBNISDKWBOnaZbVRoYQtVCXSb0lGS8onNm/XFew0zBwoPZib+RK7cGPOT4kBbhx+cPa9KAsHqxjx1TIrdVDCA6PQuQ4mDwhv+uVqxc7Op3bLTVNE3cZknoTekfjFTAnqPfVR/rbGRGo/cRX0lyL0rKbSM1AmWQfzOokUVs69jaV524oj/t+b8+hPUaElkAA51kiJlgng19WuHPw08NcUxGU+umBR7j3mwwJay/HURQH03WXtcgCsOA13Tq8=</Encrypted>]]>&DetailTaxValidSalesAmount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TrwuXw+ruH7uKrCiyKNbbUyA6pBW0eKrAZ8G6kvel0qExOkXfLE/OVwz43bumIGEuiYWQg2qOvoMHjZfMAUwTzXIMZ5z1vf40tp31x88JXYYtYjfBjD0m4O+s0SOYtHc5jyxxC7Df6FSEnqmcwSuWuVwkP/2JX/prm8zPn4ojfdGGWwqtg4wFVM9ZXwWhKMkUSx1x2eSi6jwua+UxjB2V4B0AX7/2sDgOu5Z4jeh4Cy</Encrypted>]]>&DetailTaxValidDiscount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YaFtf18AH5zRCFWc6J1jlpiT08RCD2iuaQ++RBtr3REiJIQBqxZqV/0o0t5Rn18nF1GbS3exPwm6UUa6jyhFgpZJBO2RzEu/CHsUEqG4jJVJsQoVJ/aSuKDcg8BnlrT3ARMz0gPyHWYPDCoKYMzYa4aKnq7TFVyE4105L8dBx7Dd+xms/QATF9nDt71Tt7VezbtnotWRoEujr3L1krqljGfDvTMBiK3Oawq3LcYXSCN</Encrypted>]]>&DetailTaxOnchange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&EnvironmentTaxDetailChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKs8Oufgihk3xbh23lGyltrh3HtxY5FatyTjOiNO1a8OUCs/GZbkCnJa/act9tenTi9jj8Lf+dS3MsqWZgRsttgK2AIcs7Ua78cl6xRfl+lHYwS5cQQgxb79JqGE5D1iMDq39sj1jSN/Yh5FHTvTezqI=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNdCcYL21nBdZGoeqDzfE1WZWFBpx0i/2bRv1WQkUvZ8/g==</Encrypted>]]>&DetailTaxGridAfterInsertRow;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKPZ5xWuze8ptVn0CDjmp1HdP0dOWOrmlXrYwfkTEIvI7Cu7U7FLQKHtZusyHDZlxMJKLpW9qlhvQaVHyNE1YhN/03iD4lVlquHwqdnJVuDmXBscEbIFBoDQPs+YDbOm46a5BfN+A24m4I4/h+9/myvmF0PK71KOPVKL1ivjdXXZHt0IKfNGFrnB2FQWwfjnTS5vReKtBpLcSaqKCaL64q5tv2Hq0nYTf1mogK9yYcoj8vk0StiUbfZVsr4Y+Dy+NJywN5T1CnOy3LZOf6x8lJJVYEkjWjSzZSSWXl2w4OuuVM+WM/TXbwov9BX/cFJmA/CzNtapHD7w5psnYvqVacFWTm+Y7Ie5N7QUoPjpFd8gSfmWLPygVxpjzzhFUdGLGAF3gtK1UiqrqQR1rCunIY=</Encrypted>]]>&EnvironmentTaxCheckPromotion;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&EnvironmentTaxCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&DetailTaxExecuteCommandCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4e1BOoKLxW7DxQQ43SzA70eLL2ZFBN0IVMNaO94mGB3tjVNrdPcwlZDQdGmXUtLj2QDZriYV+DTnCv8oSsqlHjcdzNwlxnSOZU88wle0YWSBcyCYylfGyM0NVNo28q40AogZ3inIPyJDF/2slSVaRT8TsX3Yyxl8LiiatjnGjdkdgzXadbkmTE5MqDc/nUJ3aYbGkhVHkpt4QOxme+Uf5LyVReer8TXlJrqJ5eb9/aimVMOMWGg4O0gxnnuZjBc/tw2gQk6xaFfqABcfK3e1Ysd2qwQjxvRUXhFW6tmcFWmtobMi/oJ6GoYsFW8j0c+9O/Hvq3jwUsU0FP8NvbIdGZxNBxwpiRqyh6FsS9Wr90kXPUTAyhF/cpQiqrCexlukmMKUhfBtcFw62XYUgWWOn6ht7Tk+i5P8XJY660TpPUn/0Z9T6/Fq/Ju3jRFRMN8yPYH2D4e7Fdg/TOXwb4BJd1WQZBHIxgKsE/4wq754aOSreXwA0YhZSA3kjTHVJrHHUELq/KMgh6XETtPxZx5Alg0UYhwGqIiLZN8yupAtYlx0jkKvQV5S1pvtPhj0tQczXqQDNW6FPWjTEBxqAYLCfygwMXOjaiAWGrkDYGbw3etOfqnsysE06kbvcmg0A/MSE/mxRZDq/OtyezCpho6ml/gSWmdelcQAgbtSvMceVyOWk4ffyHoqZ9Ov0cW3wbkc8MnoKp0djgb59RPS4K+zveeqTO4TymfTr69WbIThQ67qlRIK9S2TVwhKJ/kR7OpZva0f0aJyD3vgIJq3lxHMEoz37Ct6ieHCWtSTokM8xHyaln6kXRbhtp6E/7mgCReregIum+nvsClO4r9pPlk+dnaCx12AS1g9wcYPRChNdY9btMhtLat15Wnp3mcZcQVH3RXxYzUNe1i3lufVpPDJcH/n1eVx6yZWa/T2EXQa6VOqMOKdJGQHWlPg/+z6BWgw0co5YQPTqix+ixqbZm5ute++X2RADmfOAEQ0iP+45tZ04OYcLDpRj0VR9RbD+DbEyPYJOBIlsnEA41w/bkeD7b89nn9iR2YRHC6gNza12dsRKXoq9UEx7nzD75Gg+v/8b9irQWCN6j/JxN25J1fkfCh1nqaPLIsBiQsk7/uQnR+0lCLT1/aLL06Q1lO34+yTNKpyNF4UUGMiVc2JB6umTXv5oPfujfkKHF2ZOGgp3pFleijw9/a9k+rz33T950D3HCC+8XIvQz0M/b7uWpJGv5fTUlZsNFzxb6/eS86b09EJdy2+CvOzj6u6RT8rIYjje4gQdeyyy5IyDyTcZmyuq4Pm1UnCk0LARBAnAQHvo7w1I4tl0YEWZAC4AzpMGHa4FfXjty+FZjxRn8FE7cZUVF23KW/vdOPl8A99Z0nMaiZ3vCMjeHUlLdFldNgFa70QbuHmJU9ycmlYb2fKTpvO+9nFtfrpnpGucKpYtY8AjiLRWZf4Hrum8YuX/a1RuzYiNMGn0Glhvp2Cv2nsUhNk95f4uLlM5nJGxMPCReTPPZgBRq4+bFk5VbYtUlTBsMl/64gt9TEnlwcnDNmVd2l/QG0=</Encrypted>]]>&EnvironmentTaxDetailResponseItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zbcqs0nMHL7tbiBDeq6XxsucWf4H0TCf+0N4iEUoJiE</Encrypted>]]>&DetailTaxResponseCompleteItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fgDxCHzH3OSnM9D1L1zA4Eev9iKjYExGzkb+H7uwtUYBsTIYBDVMrfegEqEMy4fRvrK7MQCnl9GO6g3GXZi6m2fWseXF3JagVFJVYh3DuAxYzEr9OE0uvz1IYly8k1gW5/OPF8wcnvUJYo8CYMjIULW8Kbjf4JTxJt6iCitaItT</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZmF7n3ikVoG0TXeczNChEh8q4ktvRPnPgb0t/OTsuKrThY/AWrxItM1GyA+yeK0y3WXiljarTST/Rdq1cNEYc60de3lH5y8tFfWv6Ue2uQWhMm0N10a6bvgtKRK6XE16f6enR31AwsFx4InnlnUNlFvDD/kptVmHGLuDCLE6HSqKk6L/72P1Rpq0woNDSCDDN4+xZryiR+t92Jm0Mum1GI=</Encrypted>]]>&EnvironmentTaxDetailResponseUOM;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bVTV+yh10j4wrRBlBTyGvP/0qahAdq3EpOw3lZZAft+DRJX3B79NvEztlrb3qPqjg==</Encrypted>]]>&EIEditReferenceSiteResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VCw4G59C8IhHLqlqZp1Mmjq75gprmP2tVS4YE2nPOs9XvqDFAtvYXgpYpL0ZhlxmG1RT+0YhzMAVQd6/4WCPpz9jB3yjQo+FLsmvlwZp602+VdGSOaVpCBXjVwqu0k8dgFQ8ADibkPgJzFZ3iJpdkiQREt7s8UIaVUJz5M5Bkye2PjqmmXtz2cwCV6K9cePQ/AGXwDiqFv2DoJZpvOijqHKO6EZwi8/9KIUlZOt01dgMAo+oulZUGtwnKVIn+RDNq2o9FYtPRkrfC8nS3vGy2PQrfdW0dfxqYyzhvOeSrHHgsvIuJkOuM+NZUBz3PDZSYaqaIxB0tQAH4N9ruifgH4=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatity;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYlemPUN8S/UppMkhHJBpzrY+SJfZxiBDVb3oI/2Mcnqx5tJTlguwZiwDJJI3RT3FIw==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotal;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYjttZgs8ZPm7AgCEjfOupwceY9Nbeeg1rNzJO+R25o2r</Encrypted>]]>&EnvironmentTaxDetailResponseQuantity;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fgDxCHzH3OSnM9D1L1zA4EMs2mNuVf98mvQJWea2IEbYGhF625H4IC9vUR/05Xrq6/1wrMClTDg5HAucTCFpSKLeAgrLdpoHjukxF4auprV2JuNswP7xCCG5sMJ+gvNEuw3BCJyJUNGxKJEPqkunYcGabFf+OQoASYPnmyMvS95a9UrVium+a5TeKgamcDKpBAWvb1SDs8Dw3DOmLUKwIVdxFR6B0l6qARxcwtctEJwwAuCblZ/3VVWD7mMpiRf0iSNb1OFDd707IjxCEVssaKaQJvVILQqyeLl4l7V9mjMLe6EgK0ZzzUFrNJSgOqIV+/0yeuQYO+Yhx16Y9U+S69iF70gkYlEPi9ztrzsP8GqVKE/O/z8JzbKxBHMCxiWSgla2T9qc9lw1qgl4LNZerc4MR0nHyRBNEK4gOgbJp0D4un+JzC3tp0NLK+fKf9L3/Y2ZIPkfnvx3fsmG2IVuGHjhzlffDrWIjVmPb8Qh7dxO8L/Y0FgOeOXzv5brbAUSVeaGzl7I8fa1CFiC16aj5yZ8kjemKRkjV1H532MGbT4</Encrypted>]]>&DetailTaxPromotionValidResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&DetailTaxPromotionValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZqZpGrTdfHSgnfwyDhfcjT3WYQSntdl1CLJxFbptp6qY/C+/JOn3oZijTNsPoMIYQQ6g4k1JtLR6ZWSYK9ojyfIlGHe9aIjC1M5yra/W6LcDST6iGd+L2ZZ1JiWSbZvrUE4/lwIzprBEnmRBxtsGVPXHM+zLeeHRcjc4sdhYZ/VlNIxwRcri4LmItl3xZ52iX6M54rp+bWzm/G4MGkLnkJIi839dF2jwtzNlbzD44KF3FAdDqA0MRjGXeoL05dyrA==</Encrypted>]]>&DetailTaxResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKvq6hkBWJ1F+8Ra8boVuKwcPAJ3WiRQaDQUGeBmCFtl7AL0jWTeaIrQqj5CRoblXoqwqqUEGFMmmNY/QQ6fFaNGAEc363se4KBqs82px+zzE11fB9rkSM61gUkatC1SstHo0vKdQg0HkixfMBoHDu2V09fhLoS99BIB5G9I9MsDRO4O+rVltk6fj9t5r+Jp2Zj9iNshPSSdCikvkdOh6wT81M+ry/8T1zqhlHTMA3zSOOSI6yEI1UMG0MfkMlczwjm0OWqcfcBxPsB2ofBvzkEyt2iaffSmIWX3zm20Dz9nf1hgvJFPdLmxIs1fnst1UJznT2AXjY4Xgw8w0zK8PiGWZCa51TUT+rZGaZQXvJOJ1RL5lyc5JakVSdgGvcOSECAz0v7SFPfjEL12ZpPtl1jXlgIwvMREmTjgue34ZnT1x3O3bB1UinPCT9ojQzd5ILg==</Encrypted>]]>&DetailTaxValidRowChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfU55a8DwqlmSdC5Gb9G8YosHyRsuLERv15iwbRyc5/Huk/g7zYulzrqw3XfyL8SGgSJLkwQQK9mWUD9JwC0y3Air6JXFCFsTMCLKk7IeLN/y3wi7dOg/WwEpjOL8aSPOW0K2qfyJy1z0CU7D3TnXXh3lBNBIOVrABSZo/aQIR7FaZTiT93ouSA9zPeCNy/xgnY=</Encrypted>]]>&DetailTaxValidTaxChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfVEqcjm441KqUyB7Xlq6f8OT6NM7B3YzVn6tjbNhoFqgh7jOaLQpDWYfjeKTPksD1CwRzkRDvwJNyGfncKAf+q/</Encrypted>]]>&DetailTaxValidPromotionChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ScriptGridStockRequest;
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2Hw0TCFc7dzbzyQJ623pCjpx+cwL6ELFQ7FV8sHOTBPklkIlBDed/SyQH1TQVV3MQjvAv5l837ivXX7JhUuDEwrUWONuHLUL5+D5WjDlqdR/6KuhugrnEKkLyT35Nb2SWvyx1NnxfTm4WxRgzSqK1VtyCINQARRqt8jnDUbePFQhsZI6wmN7mO2ASvdY1POgFsqwXEAdVYPM8auWuuUBCltKo5ezTr/V/KQgIvYkaZ2C5Q==</Encrypted>]]>&DetailTaxFlag;&EnvironmentTaxParameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        &EnvironmentTaxGetUOMConversion;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4BNbn3EphSGawguvqW+UToFfEkbXxKa8dSj4XyqxFe2udVN6Q/3/v3r7rwqI1KYnVMocS+5uOLjcww+NWWpKCIAmkltAIah2DieQQ65hplLe0YA+8pFEV2xr4k5ekDpwnGaTe7Q1TegODltP61DsY3enmKYSjiLCHbRMtq7biBJxKu1ZOKEpz5jh6d1r+SZ2HYaEGo67A3f7fbrbNmc+8rVbvZEVhmdEnVFBRr8Y84EjOT8lcgA8fhm+KQZ5fLggXK1MDcLvKX3zaeuidomSxg26yoqoQZKaegTocJ1dQtAQFvTDVQ+rQffc1XKdeBkzwBh+4PWRRkrJomAGbnGQMyNJb4DjFJwl/EVedlzuQ3yJ4he8VXe+RLet1u4pXB0BiEsZcjiK2n3HAhwaA3ki+cXZ6+sCHztPHEVVsmj0RUrw==</Encrypted>]]>&EnvironmentTaxValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUCHYmW5xFibYHzPKvwuOnUx0txOcAAifNVGAzA5BkEYyVyUZRRKO1XC5iOiN1T5AXM=</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e7PzRebm8TcXrldjKa34mlcc1OkOZChRy34A9X9uxMwAMFDuMP5Gcdrf8Oz4VJQ/T5i9vOEnQ14lBustyg4i74yQIdHlubfFAULxYI9c21hHt9yCVvq5ZZxD7SV52DXfITOZ+l4IawZNP8c6tv3hdQABqPLVxjWfV2XIYdQSJzpz1S2sVLjdVZyA/JrWjZDhpS4WsSalsve8MhkFQ7vihkbUFaNAPdBFqKM7cQlypGJAZwr4krbvXe6/ZIC7l1zok8=</Encrypted>]]>
      </text>
    </action>
    <action id="Quantity">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysazj3IZX2OjrjWxHG3/JOE/lcGYOLBf1CQicZ+Vr9bPrPMOApE/kazencEns4t00VNk13sfPAJs0R62M1xOlmiUQp1SkrbZh/D0UBRzFq++XqASS4RgSbITx2yRzYehxzqbwjJOgDas3fRolcAVH7uiQXE7fb89D6Du6EBLhdLfdiQC+lA9fTOqinEWUMrOvVYc=</Encrypted>]]>
      </text>
    </action>

    <action id="Promotion">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXG+1s/GqhG0EkQPLAev88EwVJJ8lZ6LlBX3n/9D5FiLY6CQArB7hNw0P0Hvw6QtQ3gbHP4Bt1Ux1vpJXDz2MU0s1/ItmDAMx+Et19OJFYkFg/mpifaOvaIsSGY3hTgAxTn5VaCbX/4ZCBHpXagwdugxodSh+UABpE4KAj/RuggQHJTVsUVWzV42GKRyctVVmW8sKsTiSKdfS57HasVnMww09mJhU/fLVlP+s15nbq9e5UgliK2tOB1K/eeFGgIxTiQiXzV5WAg8EfpQaA1e4Lh6D+O5JFeLLjy67obOAIrObc8E+Q3xh1gNiowwfRcj8qTs2aE/zEv7VWjDoenjrTrDyqEiLoy1Gy2/sY9ORCpTXvc2sqOClVLo+cd7P/1W62A==</Encrypted>]]>
      </text>
    </action>

    <action id="Discount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXGcXHLXi9VTDtvUl0pttm1SJFxDFc4A1WLyib80pTCvSel57cMautPO+hepSQw0s0n+E921xQwQkAsXWDjG9cl6dJo4gSSJ/gCBqsE5oEe6tkaw0bUiLs8NAgL+NLIyLdNiiTr8VTAaIspQtR6SD3qAUR6Kwyo6jFE2zp+9yY9nlFdJ92JJiPmhaCZ+O+1/wYw==</Encrypted>]]>
      </text>
    </action>

    &XMLGridStockResponse;
    &DetailTaxGetTaxRate;
    &DetailTaxGetTaxAccount;
  </response>

  <queries>
    &DetailTaxGridDetailQueryLoading;
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu//cyzhq+IV8rNamwNWMrlTSU3zHZCUSXits3s0qaeIG8XvOOpkHtKJ6eWuAnQHbSDDfZpafcC+myAl9FxjAn7y3hS6wdVpQlLe1atGihLYK1s6jo8aMocy2Dv0OWID9BGaXO3X1tO9+GDjnoKI1OXH6aTucqBddmX78wwRcdMg5WZyovSdz+VDOcvc45qfBoA==</Encrypted>]]>
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

    <button command="Lookup">
      <title v="Xem phiếu nhập$$120" e="Lookup$"></title>
    </button>

    &SVDetailRetrieve;

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