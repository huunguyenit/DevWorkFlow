<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SRGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptWhenTransactionEmptyField SYSTEM "..\Include\Javascript\WhenTransactionEmptyField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY VisibleFieldController "SRDetail">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % DetailTaxSRTran SYSTEM "..\Include\XML\DetailTaxSRTran.ent">
  %DetailTaxSRTran;
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "2">
  <!ENTITY EnvironmentTaxTag "76">
  <!ENTITY DetailResponseItem ",
    ['he_so_mt', result[20].Value, null, false],
    ['muc_thue', result[21].Value, null, false],
    ['tl_chiu_thue', result[22].Value, null, false],
    ['tk_thue_mt', result[23].Value, null, true]
">
  <!ENTITY DetailResponseUOM ",
    ['he_so_mt', result[1].Value, '', false],
    ['muc_thue', result[2].Value, null, false],
    ['tl_chiu_thue', result[3].Value, null, false]
">
  <!ENTITY DetailResponseValid "g.validExpression(o, [g.$a.mt, g.$a.mt_tg], [g.$a.t_thue_mt_nt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY ChangeQuatityValidExpressionTotal "f.executeExpression([g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeField "g.validExpression(o, [g.$a.mt_tg], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">
  <!ENTITY EnvironmentTaxChangeFieldFC "g.validExpression(o, null, [g.$a.t_thue_mt_nt], [g.$a.t_tt_nt]);">

  <!ENTITY AmountFormulaRate "tien2_tg">
  <!ENTITY AmountFormulaQuantity "tien2">
  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;
]>

<grid table="d76$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDF" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c76$000000" prime="d76$" inquiry="i76$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="dvt" width="50" aliasName="a" allowNulls="false">
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
      <header v="Tk trả lại" e="Sales Return Account"></header>
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

    <field name="pn_gia_tb" type="Boolean" width="50">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100"  when="true">
      <header v="Giá vốn nt" e="FC Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] != 1" field="pn_gia_tb"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" when="true">
      <header v="Tiền vốn nt" e="FC COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] != 1" field="pn_gia_tb"/>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk kho" e="Inventory Account"></header>
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
      <header v="Tk chi phí khuyến mãi" e="Promotion Account"></header>
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
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true"  when="true">
      <header v="Giá vốn" e="Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] == 0" field="pn_gia_tb"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" when="true">
      <header v="Tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[pn_gia_tb] == 0" field="pn_gia_tb"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice Number"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
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
    &XMLWHReferenceFields;
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
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[lo_yn = 1]" field="ma_vt"/>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" width="0" hidden="true" allowContain="true">
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

      <field name="pn_gia_tb"/>
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

      &DetailTaxViewBC;

      <field name="gia"/>
      <field name="tien"/>

      &EnvironmentTaxDetailView;

      <field name="hd_so"/>
      <field name="hd_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>

      &XMLWHReferenceView;
      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        &VisibleFieldGridDetailShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/EahnzGYvvNTqUk1gyEjdGADFdGI7zEy5wKGKeWBrQcLi88o/TfxqdMjnHoGffOkZW7ixgeCsIE1rux8tUa14vFQeGOnhm2xomxYr1u0Gpy3Ohh78yW+kGj5WsPTap1RQ==</Encrypted>]]>&AmountFormula;<![CDATA[<Encrypted>&ANHEiKqthwbsi+Na3F+vkpgaVPUoFEx+EMnecxuCia1/C/GFoQeZS9c6zbpvNmio</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lhzSeLpRBw8lMiWX/N3jP3bO94DAV3JmdBlxB4txEN6Kb76T4qH9qD8q0ZslFfdwzlCk86mE5VUtspZCGGbUG9xgCVNVnYoUCJNYMcKTO3LmMNouN32oNdA3kYa7kJ7feSvOHE+9v/Kiv4JCcCoKIob7w8ISSMUgtjHZ3y/JsaccCWHGztASoYqSj5N2dyc4ujbEilhUXzOUSU/LBiJoLnyZp4bnISkwo3KDXVBgFHAuy8pRdQv1kzJReD+FXNSwQDll6frzCB8fvvpkxkQTbcYmptklvVcRK/8f6D3vdutV+k5GEu12X0yK1eHzKj+ZTUcudAW3ZEaZTwNX1kJDG+i</Encrypted>]]>&DetailTaxFomula;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QayFEUHi17PD4FWh/ukqpik1OubV2heBNcfZelgMdygwij/98mQ3+35HgZgxpcIpXZOyYitIh1LDdGBgoyF3r+3btccQ9vFirZI+5kTutKYMSBduagvFSZPgIlNr7eTdKa/6VmC/3BfYZiE4CQpItRV0/YpoDZVGpBYyy+QEnqLno9KeoaS4YaOLAq3cap9ZfMoyK5KtC61NbDZ2wHsxmSZqjv6loHrvcPCDAkhAeGKGiwdFULZeMny9aw+8oyAEMw1X4rsBSgK+zmFFTVLENMcHy8HppbpITRR1cJZUc09wD6hnbnM3JruibMUwqaESQ==</Encrypted>]]>&EnvironmentTaxDetailArray;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RiPc8aVA33QBdokXta/qA2QTnWv3ThOPZRBejj07wF2+2Cr0klLfFbtmUuyDCRgObsiA67oLJwPwzhWAzHs9jmiUor6DGbeB4xYe3iwE28GQOaPot97OrZAcZL3f9757BxghtwX1XsFvpG991fRP921POLKqCAib1R3RjAL1rVcjryhy1Q4/RWDIqaTN8tGKTvmaZwNSiiTHbD9R/rbPKwnXJ07zNK9Z3P4xcTiUG+I+frO2be+KRDAU/ixCN1Iwu64KOgU9ap/AE8xRLzD5GtWUkbO6qdvbEUqdmNoyTdeM2u5eNft525Jjglf+29WY4TAhm3n81AU6z4LeAXPWR5J+FctRVg2uN6odlOAypUsnL5AWdTvsGO53Vu9T7Hm+OpU77btdG5KIYB4L+r8o7p2bWo4pjzP4U98mtgsyD/tYek+3p+PYGjAbVIaHhW9uWWCWAWTRs1xY8VqWT6QPRmbDWCLUnR2wFFdcTtSJP051zlJnWyxl0aRV2j+5jKcemrt7+cEOfTnOEtmmQet+vaoeNmxLoIANj/8vaRZDNmABc1x4MCs9Ur4vO4WDE/ZTZnRsyNCXrfP+mkHXf5WBJ1l7AsPdVPkNR+vTgLTMbN8NO8nB2mQL5rvxVpoey0kURZXC0W+ZXPHUELvsmdvqFDxGpj0y0g36S8LWlPEwJIycqeoS1mWcL4gNcsmCRku7Q==</Encrypted>]]>&DetailTaxPromotionValidConditional;<![CDATA[<Encrypted>&z9ZH1cYG110SnyzJqZfehvTr/aAYs6ZergULzc0rSxK2bJXIUkbo8Epi2XFT5uMm/+jrEftVbWFGqEpK+Q0YAkoVYE2Qlbj5xeCkOTqSJ4AcUK/P2lTU+kFptmXRsxCFRZtZJRqjT39/E4Nww+jf5f7+PKrgWmimu5F23KT5Umtl6DuzpdLJmHTbx9J+jM/giP8eQE04hl5n+XIn+G0HSRmAy8ygOtx1HOZUtYgCji78e0SJL74pUYGCxPvWhsSQ4/XK0xaXhJiTNMLeLDVKMdBFuduNDw+kaVUbTuua0gCbJdTbEB4dOXIKpPsx1L10</Encrypted>]]>&DetailTaxPromotionValid;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPDlstVFhzJQlJuIDnwsaw7J/pwCAoMOszbd7Ml6Y+OM0oyLcB2HRIHXNjHB6ZLORwt+XOJGhs4UroFJXhPJ+V10VnoO3Y8uvotePhIHJLhEpZQghXK94JsJAyh5TRut2YIEcr761LR6ZRpwWT5xX8TvPxNpJIEyzm54mEame7IXVk3j+oiUGq9Fg0KcxwlnI5HQzCerQJqf9B8zZ9xk185yQViUvCI5O/EQroG0IDtB7viUFRbUX74pyhq3nI//DAKF/YdJ5aH9f0PlV4n3InCrfYFM5bWYIUR4lHuKZTFBfT0ugI+frL6OicSbj0w3wXSasGixpyyd8SilXbiUAqt6gQyL7tAR6df+RewkbYVb/V5hhDWJZNotycMRsIfANpxvEiLpUmWHOOXmb0BmmWirjuuxR30Xb5qfoQkcTueZLUnvGGVUwPwSdylK9Tmit5l5gEoM6KUE6TnmA9rK6qgzjoWQCbV4B751BUKop9fFQ5V1qyR1w0iJwv2UFLwntKIwxxWFjkNZrTnyKilw/1c</Encrypted>]]>&EnvironmentTaxDetailChangeQuatity;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYlemPUN8S/UppMkhHJBpzrY+SJfZxiBDVb3oI/2Mcnqx5tJTlguwZiwDJJI3RT3FIw==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotal;<![CDATA[<Encrypted>&zX9xiikEu/obuEo+jHcHYjttZgs8ZPm7AgCEjfOupwe/tg60j+lLvqZbjX6f915E2dOUmnqEY/V3Ciaxz5tbufchQlsMeyDvo9r/F3AljL5A/NmYWDXChHUetScWu8o2b1mZo1Kn2+pKBsm7Tl89FmuS3bNhIU/KHxvs4F63h+j6mc4uDzB0ujwnTvDNQXTzIUzZZAfR5XlO8IZVNtKpRX31U3OGgv1FGnyRRsUYmXkz4QNPdaPwPDyX1WbqPvTTPcv0UJwBKrWuK2NSd0vRrzqGSf/K47LGUDioQp3tQdTmg7lUV1xOg6qFuGaamG3FqGM9R5AJg0Rxo2HzsCOeqA==</Encrypted>]]>&DetailTaxValidSalesPrice;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4a6Qr/64mTKl+bHk93z213QFMbCEhBNISDKWBOnaZbVRoYQtVCXSb0lGS8onNm/XFew0zBwoPZib+RK7cGPOT4kBbhx+cPa9KAsHqxjx1TIrdVDCA6PQuQ4mDwhv+uVqxc7Op3bLTVNE3cZknoTekfjFTAnqPfVR/rbGRGo/cRX0lyL0rKbSM1AmWQfzOokUVs69jaV524oj/t+b8+hPUaElkAA51kiJlgng19WuHPw08NcUxGU+umBR7j3mwwJay/HURQH03WXtcgCsOA13Tq8=</Encrypted>]]>&DetailTaxValidSalesAmount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TrwuXw+ruH7uKrCiyKNbbUyA6pBW0eKrAZ8G6kvel0qExOkXfLE/OVwz43bumIGEuiYWQg2qOvoMHjZfMAUwTzXIMZ5z1vf40tp31x88JXYYtYjfBjD0m4O+s0SOYtHc5jyxxC7Df6FSEnqmcwSuWuVwkP/2JX/prm8zPn4ojfdGGWwqtg4wFVM9ZXwWhKMkUSx1x2eSi6jwua+UxjB2V4B0AX7/2sDgOu5Z4jeh4Cy</Encrypted>]]>&DetailTaxValidDiscount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YaFtf18AH5zRCFWc6J1jlpiT08RCD2iuaQ++RBtr3REiJIQBqxZqV/0o0t5Rn18nJcoInMaFSSmCd59ucndWvvGY37+K+Q4yy/s/T+mh3hsuc98IdMF/TPqI7DHBG9SMPU+CfNh09XTrw+3bZHbsyiQMeblQ7fZcDliLWAfbcKRhbEq+eMuSwULZ3JOhqcdnfl82epXHIKZSLnYaRaO7eV+zWepZLiibWq28tDG0nvb</Encrypted>]]>&DetailTaxOnchange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&EnvironmentTaxDetailChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKs8Oufgihk3xbh23lGyltrh3HtxY5FatyTjOiNO1a8OUCs/GZbkCnJa/act9tenTi9jj8Lf+dS3MsqWZgRsttgLwA/E9o7dFXgsoyddUfnCOUVFii0Y+h4HjtfES71LFHv0AyDnMnUGk15DLLm3lv8sZP+XrkAAp6pEuvR+m4kAZBJ835OoknsHydaib0z9oFvPLel1UUJsgK9pgEN4Ik1G6pA5TQOq30m0UIZYwI3DW</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNdCcYL21nBdZGoeqDzfE1WZWFBpx0i/2bRv1WQkUvZ8/g==</Encrypted>]]>&DetailTaxGridAfterInsertRow;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKPZ5xWuze8ptVn0CDjmp1HdP0dOWOrmlXrYwfkTEIvI7Cu7U7FLQKHtZusyHDZlxMJKLpW9qlhvQaVHyNE1YhN/03iD4lVlquHwqdnJVuDmXBscEbIFBoDQPs+YDbOm46a5BfN+A24m4I4/h+9/mw1KBnbd5ZKZNjvfqkwPlSw0z0m0ItMMg5iBk3WvEzjlf+PgT+XspSyB3Al5ULMLlbpZxgPWWfGMYbpDTPlKrpWKen1HOehkop8YJXzmbg2uPR9r2AW1UGYqjTrSiZX5aB671Y1tsc85od58eIEFrErCAYS9y3HwPEYKkC3omwn0sjIiRbsGp6gf0D3riZALY/HdBB5vW+UC1lQje9FhUPe4GR9OkDpANiNJn7Xkz2uJlGbGHXid3/ZY8T1nvFd3/bQbZVL/GeXbDyahi6WRL6ohjiX3+Q3QN33spxuMP5z5A==</Encrypted>]]>&EnvironmentTaxCheckPromotion;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&EnvironmentTaxCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&DetailTaxExecuteCommandCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4R4WpvLbvChssB89t0nmVq+Vl/DSK9GYA5ZGXr/YMN6Erlh4FxMDj7MuhzfVK08p+RXzJD/Z5IlaEufXn0qHEftok7cC20HDO+mCvPfzd5z7EOBZ9dVDsOLcU7+cHL7xrBK7aeRtkCYJvb6+ApNUVVk=</Encrypted>]]>&ScriptGridShowFlowSRDetail;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cIaU7dRvyieuec8+3snDTAwuDMbmI1L2Wb+dtrm4x90etd8B0RzJYuFRRYs8dc+ZyVMdj5+N5OIx0Btt5Pe0rBrPZUN4rTVxO1ZSZ0poKrGqREgaUW4FWUda8E5a/AERh9k3h0u3V8ZoLY5U53/KCk=</Encrypted>]]>&ScriptWhenTransactionEmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b3aHjpvGaum3Q85M5YULkPzGnfWdswAw1UYfIoVKnjz227k3Moqk5bAtu0UJ7vOg+4WXWnQIZBg7emFdjW+8IwWI9IKG+4BUYpb1msMzVdDFNRcubvDynq1zVWcaUBDsX8PDhdOH0bVHvL6PVvQGKfquWRd7/QHGqQSB0imnkHT2F0/KNK12PsvHGTVrZfF1lhxoA1ADA16cSMq1hZZGnA6jR/tX1FdLh29vT50O3AOq3iDTYsyi/oTydnsG9M49iXg1BH26xM/mfV+liXbM1ZWiP0yVV6hA/djAbKs5jOEMy/Yy197E7GpcKCuiOdK2g6miXIsO22gXmLWa7jl0g7v7JxsJPQIQKN12FL4IClq+KK/q34eWkec5sA6k3BNPRb2iaaVr6iwsNu35iwFNB9rXPQsQJbKLN8zxxZnNjujUvnlCh3EhM4CKYXGtzfJtPoEdWrPKRnvtDwZe6fhIIoaU68v0vUjyRjuIzZ/hs1YRLkmJ6+yfBkv15siOlyV5iTBWv9fsXDCkMiSbpAcwDlmsSrxjraVICQx10WQwUa2Q64dnr7E/i0ddKT0DlUHxBHb1/A1R2+xjc1YllvwA8cjQCTQ3cZqZQm4JaPCkL3PG2/bXzKNeFVCIe/r2eg/TkQ8o4q0Zd5FGsabcB0h0o9lvzKDqxNAAy/FveU0lbBzIJ84kGCdThKnnw4z4SUdy4bOVDyWugkgQe3fukZhioQZc0uOylliKYJxc6Q4vd7cVseoLxB958jE686eGxbo9a1EL/fpxEHsGUd76IwTIgh5VUk6kvdzpvdrWQ6xHK6WoYKRjOOxmNEPxnj3s+UnZA==</Encrypted>]]>&EnvironmentTaxDetailResponseItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4epfG8cBv8G2Y1pDNi31NAcA04iUXOttbGiHtL/khaFK3iULrL4A65kd7+tb3u5uWhXMsJQ0+qrAiFIKFiXNpbk=</Encrypted>]]>&DetailTaxResponseCompleteItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fgDxCHzH3OSnM9D1L1zA4Eev9iKjYExGzkb+H7uwtUYfVRIZFK+SY4mgoOat4WBEoHYkredpkcuM16sp4KitVA=</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZmF7n3ikVoG0TXeczNChEh8q4ktvRPnPgb0t/OTsuKrIQpEezK2FnysGazOec5XgMsCRXKZzei66Bp9je4CrV8lgkdoXpQpa+rYuUOQivNGbHD8Qui5LBjyKOK1bo+ZCIPa7GREIKoe7QJItmo2b/M=</Encrypted>]]>&EnvironmentTaxDetailResponseUOM;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&EnvironmentTaxDetailResponseValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bVTV+yh10j4wrRBlBTyGvOnApFkvz7vlyHPGWCkcOp96K2gWRy3+JZykvamqnCKmLSb6MxTuebH6lccYTSMkYjN0oITXJOj4zOENt1Xo5ZBPwMZv6Mm/7Mp0j7h0aXv01fjLoxfuN379EzWlpOYf2p2evajN/1yhgBj7b84wmrZkaunfaYSL6LC/rfVyqLIZS13BTFnf0nsHxQjg29pm6ObbqDFjgrDMVYhidOqyG6CBUiuV02H/yhg5S3zOZH9sKDSrBToh32VbvivoByiKkZkZcH+RftZXs93//oG3RO9hLqCFJ8De31MMxqRPT87F5jtHtV5KDmwI3wqBScYFWAvi5WhgYj5rM3wYn+ErwFMsVIZnVDzcaJhVhZpvtvorcUK3t8ma+t2V4DaKMJMM91EBNtaPFPfmBgrBK+2yVIfT0atXwgNunRHLeAdchQcPSLfRuxlk6MsZ+5vWrGR/iLQyZQFPoF30Im3x+B7dOW4/9Xl9IqDU/7rhAdVo670+KJFAkyP1IBOGEQgO4+CbmhPUFWp9DpxuE5xTtwVxzvk</Encrypted>]]>&DetailTaxPromotionValidResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&DetailTaxPromotionValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZqZpGrTdfHSgnfwyDhfcjT3WYQSntdl1CLJxFbptp6qY/C+/JOn3oZijTNsPoMIYQQ6g4k1JtLR6ZWSYK9ojyfIlGHe9aIjC1M5yra/W6LcDST6iGd+L2ZZ1JiWSbZvrUE4/lwIzprBEnmRBxtsGVPXHM+zLeeHRcjc4sdhYZ/VlNIxwRcri4LmItl3xZ52iX6M54rp+bWzm/G4MGkLnkJIi839dF2jwtzNlbzD44KF3FAdDqA0MRjGXeoL05dyrA==</Encrypted>]]>&DetailTaxResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKjuQIg+K/RJo6yIvqktOQZVnZkj3I66HMg8VWD9+VhfvjUO8og5+AGxfIDB0fE4/Ug==</Encrypted>]]>&DetailTaxValidRowChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfU55a8DwqlmSdC5Gb9G8YosHyRsuLERv15iwbRyc5/Huk/g7zYulzrqw3XfyL8SGgSJLkwQQK9mWUD9JwC0y3Air6JXFCFsTMCLKk7IeLN/y6qbTOF31hU1w5/L+0A9sZjGYpaNhAhy748X0xHsaBt9X00pDm8oQnicjc/Y7PXgXMkJu8FmLejKCl5svCrA6lpGV9xRPAGHQVCmzQRxRJrk</Encrypted>]]>&DetailTaxValidTaxChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfVEqcjm441KqUyB7Xlq6f8OT6NM7B3YzVn6tjbNhoFqgh7jOaLQpDWYfjeKTPksD1CwRzkRDvwJNyGfncKAf+q/</Encrypted>]]>&DetailTaxValidPromotionChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp0777IwW8Jmmt9hh02s3SMuiJRG5pwnGpfQjRN8uzEo94z4Jx3Ao5/TiVagPRu5wTARULXnDjCS4P9Q7ib/WhsbhadREM763Wmtsskr9C/5lITZKbtPSvpwbeU0eq/wDm0rxIg+FfeSJvZPq7pJu/XldBrYtuujF8oezjsSxoXE/xhexFccGZnCPQFcTKHrVtkuA++GdZPcWDmjviw2GNmUXd0mNT7AKFeYiEuKYI8vk5sblzkg3p1V/CkxfeOGiK8f</Encrypted>]]>&DetailTaxFlag;&EnvironmentTaxParameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cJoDG9zD0J3ousr3/VxQmYm</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&9bBXgmS4IUqbn/cYhF1UTAVsc+089zXERUTisJ9E9zadmD66kACGb+YjYH87BVx2FZmrFyUsQvlaE94wLYqBsmsyqKYjIyPcoDBIP75h6mc3MiqFWjRfOEJ/SZvBZC3wACDGQkGISdeQ/KKFeiUJ+w==</Encrypted>]]>
      </text>
    </action>

    <action id="Promotion">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXG+1s/GqhG0EkQPLAev88EwVJJ8lZ6LlBX3n/9D5FiLY6CQArB7hNw0P0Hvw6QtQ3gbHP4Bt1Ux1vpJXDz2MU0s1/ItmDAMx+Et19OJFYkFgPiN9z5sHrJ5O4uk7e7fjVK4El7EA83cPtvXfBBXx3HFgpVXz5gmpJ605EaSBCVXQ5dPcjppeqkgX9vKTMqVHaxlQ/x9cYV3nozHPV+ol4pnCings/deTU1pYEk3qtNXar0tT1bZPKZ62PWJtpYFNGAPJ5nTLzu0hERX3KBxW3urtRo7K+nqI3H7dqs34N3wYQ8pDGq2KWsOjJ5+qnogPdjXvgQ6dvZfX66BnAKZ8z25ivtVJzjf9lJ+LpoHtp/tCrF/SrzYOhK/VrTEfhT3PIQ==</Encrypted>]]>
      </text>
    </action>

    <action id="Discount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXGcXHLXi9VTDtvUl0pttm1SJFxDFc4A1WLyib80pTCvSel57cMautPO+hepSQw0s0n+E921xQwQkAsXWDjG9cl6dJo4gSSJ/gCBqsE5oEe6tkaw0bUiLs8NAgL+NLIyLdNiiTr8VTAaIspQtR6SD3qAUR6Kwyo6jFE2zp+9yY9nlFdJ92JJiPmhaCZ+O+1/wYw==</Encrypted>]]>
      </text>
    </action>

    &DetailTaxGetTaxRate;
    &DetailTaxGetTaxAccount;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4S2ltsAMFmhH/QIFzzL8vJn4hHzpWM394vWL+AeOYMIBQ==</Encrypted>]]>&GridDetailQueryLoadingJoin;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNLeWL1tFO9gIOfVQTfzRLMk4eylVj8iq6U6X12CXu3PfPVOSBt7kOFsG7o5L3/JvmA==</Encrypted>]]>
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

    &XMLGridToolbarSRDetail;

    <button command="Separate">
      <title v="-" e="-"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>