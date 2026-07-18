<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\NoneVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\NoneVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3NHpQYfYehOrVUBRX6x6ZHxLkUE+rZ6CR+Syn3leNYaOaEutas7LDLSxt0OS12zkyQ==FastBusiness.Encryption.End">
  

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;


  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.FATran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

]>

<dir table="dmts" code="stt_rec" order="ngay_ct, so_ct" id="TS1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài sản cố định" e="Fixed Asset"></title>
  <partition table="dmts" prime="dmts" inquiry="its" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_the_ts" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Số thẻ tài sản" e="FA Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ts" allowNulls="false">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="loai_ts" clientDefault="Default" allowNulls="false">
      <header v="Loại tài sản" e="FA Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmplts.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" allowNulls="false" clientDefault="Default">
      <header v="Mã tăng ts" e="Acquisition Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts=1 and status = '1'" check="loai_tg_ts=1" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="###0" clientDefault="0">
      <header v="Số kỳ kh" e="Depr. Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5UZ5fLHCOhgXRmbtYv+W51bmgGZKSCORTC4iCyifk4WEtY/MlyCSLcEz3kCiv0Vak=</Encrypted>]]></clientScript>
    </field>

    <field name="kieu_kh" allowNulls="false" clientDefault="0">
      <header v="Kiểu kh" e="Depr. Method"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Đường thẳng" e="0 - Straight-line"/>
        </item>
        <item value="1">
          <text v="1 - Sản lượng" e="1 - Units-of-production"/>
        </item>
        <item value="2">
          <text v="2 - Số dư giảm dần có điều chỉnh" e="2 - Declinning-balance with Adjustment"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb713fH22z3fzyYqmRj8T3fw/UZI1KHaSqiiiDrVIrDcWQ5fQBpKVjRdDLYeBw4LO4tWQeKxIAwfvWukhoZTQ7F/HqR7Ibdq0WP1/gwp/IW14GpMaPvelvP45nwoS5Jm97g=</Encrypted>]]></clientScript>
    </field>

    <field name="ky_kh00" type="Decimal" dataFormatString="###0">
      <header v="Số kỳ kh đầu kỳ" e="Depreciation Periods at Begin of Period"></header>
      <footer v="Số kỳ kh đầu kỳ" e="&lt;span title=&quot;Depreciation periods at begin of period&quot;&gt;Depreciation...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tong_sl" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tổng sản lượng" e="Total Production"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tính kh" e="Depr. Start Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5VnZlJhAQIvt8tafLPdmyhCicNFAman1+AL/C2mmGM14E/Ym/8yomnAos0p9g11hQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_kh_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc kh" e="Depr. End Date"></header>
    </field>
    <field name="tl_kh00" type="Decimal" dataFormatString="#00.00" defaultValue="0">
      <header v="Tỷ lệ kh nhanh" e="Depr. Rate"></header>
      <items style="Numeric"/>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" allowNulls="false" clientDefault="Default" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_ts" allowNulls="false">
      <header v="Tk tài sản" e="Asset Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ts%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_kh" allowNulls="false">
      <header v="Tk khấu hao" e="Depr. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kh%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dts" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="185" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="FADetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ats" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="185" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Phụ tùng kèm theo" e="Spare Parts"></label>
      <items style="Grid" controller="FAAttached" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right" categoryIndex="18">
      <header v="Giá trị làm tròn" e="Difference Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5sS0G9xXIiumJggOw/QHjlTL0LXCMxwUlUdslEwCQ13g==</Encrypted>]]></clientScript>
    </field>
    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Giá trị đã kh" e="Accumulated Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Giá trị còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Giá trị kh một kỳ" e="Depr. per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="18">
      <header v="Giá trị làm tròn" e="Difference Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ten_ts2" categoryIndex="9">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ts_kt" categoryIndex="9">
      <header v="Thông số kt" e="Parameter"></header>
    </field>
    <field name="ly_do_dc" categoryIndex="9">
      <header v="Lý do đình chỉ" e="Susp. Reason"></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="nh_ts1" categoryIndex="9">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_1%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2" categoryIndex="9">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_2%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3" categoryIndex="9">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_3%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ky_kh_qd" type="Decimal" dataFormatString="###0" categoryIndex="9">
      <header v="Số kỳ kh quy định" e="Regulation Depreciation Periods"></header>
      <footer v="Số kỳ kh q.định" e="&lt;span title=&quot;Regulation depreciation periods&quot;&gt;Regulation Depr...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5JgGnSXAmqw46yN88uixa7mRp6zhU5+PXNQo45FDdiAmNlbNwLXvhw2aeCr31tFsM=</Encrypted>]]></clientScript>
    </field>
    <field name="ty_le_kh_vm" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="9">
      <header v="Tỷ lệ kh vượt mức (%)" e="Exceeding Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_hieu_ts"  dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Số hiệu tài sản" e="FA Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_dvsd" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="9">
      <header v="Ngày sử dụng" e="Using Date"></header>
    </field>
    <field name="ngay_dc" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="9">
      <header v="Ngày đình chỉ" e="Suspending Date"></header>
    </field>
    <field name="nuoc_sx" categoryIndex="9">
      <header v="Nước sx" e="Made in"></header>
    </field>
    <field name="nam_sx" type="Decimal" dataFormatString="###0" categoryIndex="9">
      <header v="Năm sản xuất" e="MFG Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="hs_vm" type="Decimal" dataFormatString="##0.00" align="right" clientDefault="1" categoryIndex="9">
      <header v="Hs cho vượt mức" e="Permissible Exceeding Ratio"></header>
      <footer v="Hs cho vượt mức" e="&lt;span title=&quot;Permissible exceeding ratio&quot;&gt;Permissible Ex...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia_vm_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="9">
      <header v="Ng. giá vượt mức" e="Exceeding Original Cost"></header>
      <footer v="Ng. giá vượt mức" e="&lt;span title=&quot;Exceeding Original Cost&quot;&gt;Exceeding Org...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb622dlX8jtlHI+d1vSL1xUMglJFxzUMkMguyLmN+cdPcuZfEu7wKMGxBHTuIuTmc3U=</Encrypted>]]></clientScript>
    </field>
    <field name="nguyen_gia_vm" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="9">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ky_kh_cl" type="Decimal" dataFormatString="###0" clientDefault="0" categoryIndex="9">
      <header v="Số kỳ kh còn lại" e="Depr. Periods Remain"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" hidden="true" defaultValue="1" clientDefault="1" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="245" anchor="9" split="9">
      <item value="100, 100, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11--------100111: [so_the_ts].Label, [so_the_ts], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="110000000-10011: [ten_ts].Label, [ten_ts], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="111000000-1101: [loai_ts].Label, [loai_ts], [ten_loai%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="111000000-10011-: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l], [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11---1-1--10011-: [ngay_mua].Label, [ngay_mua], [ngay_kh0].Label, [ngay_kh0], [tk_ts].Label, [tk_ts], [ten_tk_ts%l]"/>
      <item value="11---1-1--10011-: [so_ky_kh].Label, [so_ky_kh], [ngay_kh_kt].Label, [ngay_kh_kt], [tk_kh].Label, [tk_kh], [ten_tk_kh%l]"/>
      <item value="1100-1-1--10011-: [kieu_kh].Label, [kieu_kh], [tong_sl].Label, [tong_sl], [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="11---1-1--100111: [tl_kh00].Label, [tl_kh00], [ky_kh00].Description, [ky_kh00], [ma_phi].Label, [ma_phi], [ten_phi%l], [status]"/>

      <item value="1: [dts]"/>
      <item value="1: [ats]"/>

      &ListView;
      &PostView;

      <item value="1110-----------: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl]"/>
      <item value="1110-----------: [t_nguyen_gia_nt].Label, [t_nguyen_gia_nt], [t_nguyen_gia]"/>
      <item value="1110-----------: [t_gt_da_kh_nt].Label, [t_gt_da_kh_nt], [t_gt_da_kh]"/>
      <item value="1110-----------: [t_gt_cl_nt].Label, [t_gt_cl_nt], [t_gt_cl]"/>
      <item value="1110-----------: [t_gt_kh_ky_nt].Label, [t_gt_kh_ky_nt], [t_gt_kh_ky]"/>

      <item value="110000000-11--: [ten_ts2].Label, [ten_ts2], [so_hieu_ts].Label, [so_hieu_ts]"/>
      <item value="110000000-11--: [ts_kt].Label, [ts_kt], [ngay_dvsd].Label, [ngay_dvsd]"/>
      <item value="110000000-11--: [ly_do_dc].Label, [ly_do_dc], [ngay_dc].Label, [ngay_dc]"/>
      <item value="110000000-11--: [ghi_chu].Label, [ghi_chu], [nuoc_sx].Label, [nuoc_sx]"/>
      <item value="11110011-11111: [nh_ts1].Label, [nh_ts1], [nh_ts2].Label, [nh_ts2], [nh_ts3].Label, [nh_ts3], [ten_nh_1%l], [nam_sx].Label, [nam_sx], [ten_nh_2%l], [ten_nh_3%l]"/>
      <item value="11-10001----11: [so_ky_kh_qd].Description, [so_ky_kh_qd], [ty_le_kh_vm].Label, [ty_le_kh_vm], [ma_dvcs], [cookie]"/>
      <item value="11-10001------: [hs_vm].Description, [hs_vm], [so_ky_kh_cl].Label, [so_ky_kh_cl]"/>
      <item value="1110----------: [nguyen_gia_vm_nt].Description, [nguyen_gia_vm_nt], [nguyen_gia_vm]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Phụ tùng kèm theo" e="Spare Parts"/>
        </category>
        <category index="9" columns="100, 100, 69, 31, 29, 40, 68, 100, 0, 8, 108, 100, 0, 0" anchor="9" split="9">
          <header v="Thông tin chung" e="General"/>
        </category>

        &ListCategory;
        &PostCategory;
        <category index="18" columns="100, 100, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="5" split="9">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &ListShowing;

    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7DMapEo3LpkorPMeelVmhj5JW626B5ysPvrnoxyCoqBuzZo2R0T5/RYlkGbHZK1GQrVbZ0jra/uVDlquAFiuoxfQ6fo2sppwQWzHomspRUS6Og0d90xweNmUCyDr+jAXpqlZZd0tt+u3SU7/nGTqo+swYQDOZHv6qfqJC70C9H6n7udfwdikMDskoCwimgz7JCi3SnuLuo8Jclwstn/ps0BGZwZFA0ouyghz3xWrAa9I8pP3uzvrvSrFqS0G4axrw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZjwm+4MV0VE5N7eRrtJ3YzS8GYMfzIucsIRAaAvxwC5I+bgG7O5wD2EQAfIbMd0evC737mkdZ3ubpM7vXKWqfjIahYwEaFYZukDusVf9CMrP9Gzn7Zxu7iAL8VzzU3pU=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafePwxclakrjiD5NCPySpmhcm04LQHcICQblWTyda66oUJF+3MrXW1Z61X2XwR43Zzyv3vjBTSzbt+z7XibVUmF8=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/58GPw3rQNglQeEIQNv6M7xmDH/7PaV8vfdD0wnp+ofD74LyQPq5GrD+oIY/dIwYl8ugx/4kRRvtNpoWIjOklHVcQKz43KeDxQ/tGtO4e2d2pJdxBYGx3yzTCMZXYHfhV1qhtdIFwU2S5LnieZq8GJP4dezz20kGggKXx1dWOVc8Y9V7Zna3L+CGgNYbSZrJV4PzOyMxChH+x+zVGJ1E1o=</Encrypted>]]>&FATran.Nested.Message.v;<![CDATA[<Encrypted>&SLAMJlFu+s7I4QT1Y/vVHQkNrcB3gcufBTemtESYmLMiMK0D7ZfoQvCKzMGnMCZMW8/bHidgvPov+AISJlCZvMJcKaCGo5eQ1WpUo6zCU0O/h2VwUM3wKzhci4ecqvoQunqabFXITc36V/DIcJ9fEQ==</Encrypted>]]>&FATran.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2V2jkJcgm1IdusrpAkTzpO1U6gJ56m5YYf0DgCvI+U7NSzRArxjs5se8PiBi3X9HNCSZIJRBoqRtDV6frR5Qq+TMkyS97OpLS4TO1KPA1MD67l9UxZ3UQXQZpSyWsf3AHwrFO/044kgR+2fOFlYTAm8ArVrattlkAb9jlkWGNpDLd4W1FB3qPTKjf8Ckti77BMTNzm29RAPgl6XWwXBkp35X6pHKoBbFsXH+JPZpvd12tJkC7gpwk0F6vajhuTkvuQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9Hgaz1OC6oxCY4+L5bRiBagg/Mh4HDjGRco3UynEemh2ztPw==</Encrypted>]]>&FATran.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLcmpkFqiXjOe8ZYh6GMdl38JzzC8QV+X3eWlDF4C5sToVg3AByVUEa/w1lY76PAyrYTZgLOKaOxFmiwjerrX2nwnawcIyXMiRaDENGqGAg98ejDO1XsqKvf64JpB+3SVqtviFTCrDt5eHVQby8zU7Gs0485ITsbuutCS3b8hSUbu/9g2M0WTLsl76PPndazVkyGPL1XhDIPof1LVTlHqOhgWvu+ainuXOM9diP6FBbQSq2A1pgJFWyEk+oAbwCjaWkLodHFGLuuV+QGQoFakgWvs+0zPhgNAVTm5zLWP6dKupQ5LYHU1fQy1MledyOYdMyg8lsl12aCqbrcjMV5mZGilpEuBlkx/dIiMVa0GuL9uFYSL97znagVp1LoiZjRIumDgAXB6d0CWwTZ5/N3vvPM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJU7HPbmUkNZIe13P2vymX6FxlxdIUpk9WziFu/6XjjBa8UKy44mqdb6aYnZ8K7rFPm2sr2VKWILUSfezMkFh8w=</Encrypted>]]>&AfterUpdate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkGL/qz1V5uq0aEHJ1TqcUd6THUk6J3l/Lgqq+jK147nlcaMzd5TWWCN/1b5r7E5roNoJtTPUtCebnLm7xoZAu3WwJ71Z+Qyg0Mjj+epRtP58AH3K3hHcLM9lA19GBW83uSPSjRo001UVqqE10pTti+sWL/GnJidvX046qi+AkB+9lFfEiDD8Vaz1FArjr8g/E9CiaO6FpGCUHUe2S16veajL7bXOB3JKoEuZytkxMnH9WDEc1kkz5ud7PVGlWJjhm76ZZfatsEv7CqQei6QXoMZRakipf5ixNCSHvG7NI+Ew==</Encrypted>]]>&FATran.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVCCotLz349ResxIJ1f5OsrraCnsKVIiTje/TFpb9YT3yegtbg5Q0vXPiWFWsPu0ecs0aix1kmKMriOz9uXaMDEXpui3bPDBFmGlILlIkjHXL6/ORWDyOzKHwoSHvlnx9dXvvPuruG+b9Ap0qkQAJIOU0qHhRup5hgBEsf+v3Mp3C</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z4Y7V/zPfxr2Jko67y7VU6K4SomrtyBm5+4raL79xly0srLNjHi0R/y3Exurz8kbakD5C7+2Bs6BId/SUtn4s9rwsT003W+uP6haIz39/bZFPf8CMFUhlwEviGVAov/nBQg7599/fbcdY3UMZiEhz1PmyZ/O4l8ZpWxA8+dm9iOHsYYhtoZBOM99QypX+H2Ugk+1C0nyUT9R9ojUnu8IID1kfqdYB2hc6wmN9qr1J1BIjFHfSauIDlN1CUPjH8n5H8jOc8Z6aVGWI9R4Os0cdpLhWzVeEQRwy+f2BOVmfltAicEjEcbEvbf1SJyala+ebbS+24kXTj0zKiXZj6nYgtQXb7vRCL5P0x+DIchuw5G</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YWxNaAIFuUjmqiIbtTAX2gGeevlUvUTYUCjkOJNWYHC+2sxvJjWW4TIqS0Oddlq007q7tsh7aWl1PPhm3GMqNQVPYEj58TilqU8O7zAl+eRiBTMyhP/3PHqyvA4kKEvBluZP4giDJmrVK75MGOhDS9gjtPRe8sRK76mHaEORyGFvWvgR3u4AK57gn/iMhPzrC6fMCW6cZjnqvHlGrx3pFvzjLvc3dOIuguZfBi89z+C</Encrypted>]]>
        &AfterUpdate;
        &EndUpdatedVoucherNumber;
        &AfterUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvk8umAAme83LBlcTXtir0ZvtzqnCL3qIKG6PcAQKzTUZRnTY4LQr2+iqB8s3GSsBZyvk2agWj9eW19SmoyzOJz/YF6a1yosS4Wp4V2N0BBRmlNpAIxOQwuwTmEVTsVTCCBKl9JtS/LBfYeO6E5XgC9Rfm8O22iEvIEKHxzNc1ZXXgnEG/9wnFeGvccK0VINmSEAb0osUAA1NKvFS2FwBFkS3i8TlrXA+1dsc3OGYTinagPFcVaEYTSch9uGBqWnCC9ri3XRXyv5Ykbp6T8Vanu7</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTIrJvPNwgFE6y+2QjCXXs5EQ2L2dFpx812ixlV2GRk30pYWVcAaCWmnS/fHPibIWMb3++atp0LpJLN5FI0YBC0rdpaQElg3inU6MtcnUyyn92dT6Y03qGN2sz0AwjTj0izxf5rCViAIQgceC7PBGuoJpy/tE8XKZh8i82Cdz2FU8p8vf4xvf6KMymcWEIrhPHVo4JBsqTGX2MQ76RJQBawirelmIRYw5U6VhX49QTiT5mjYFXmxPRHmya2vOP9cIlWVemVPRK9Ak+naunEw6mw7VOZV5CLX02LbBsIGR6ogGBoKOSo7iayOC/isEgcDCwqkEklna72YG6ZzL9aXF9Y33exjk8GO/XTPZhR1t8YdWkx5FB2+4mfZM0I7r1i2D3f2HXcnpRrSIO7jINryNE0gxA+9Me8XQ4U93GrJ8E57fGmAs/PeWqwXCP14iHx5980UNo77s9nJie7/A3d6ZSt1GoaR0dsB1wL1N+dFZ1LA8D8nofRSl4RKVsn9W/BYPY6kiTYriuxJuFrxc5k2pdqqEfko7a2K2RtP5hGaQSIPgcLURb85NtL9cAx5vT2Infz8ACYYGn7b1qZ6zt+QcHSpr6aeExCw8ibdRDo+bXjehDnyneg+bvYIsQJUNxu3XBL+r5krtATsKIHjIgkz7FvKlfWjyVUZBOrWpX6EUeDLcYcjejpBObwSszMYg+9sf+GoPnJ+lwBvdtVDSmuzBjgjze1PftO834ziiZJ0w9AEe2kxByCHwWS9ByXB3Y88ERjtZn/O2GGcE125KsqC8FOw=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqmOY3hzBV/7Gr/mSJVerJQ/g8aZja3jsfNzXrKCjRcfrw==</Encrypted>]]>&ScriptActiveVoucher;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZtVBjsJG80bJVLq+fx9tX+YpHxNfibEElfsbXphl+FwcrjXqp+avsS4ztB16NemeMflL8+qaojvSezHxarb7/o476eViVyfSeaqK6fngys4JX1FktYXTmWBMyYR3nBdhGbn+N+s1Y+F2AcqEi10VMtiMKyKhVpetRoxdGo1y5Ayzj2TM1uWAQWwQvW3ChIP+I6v8fQtVdaiirJ8KkInAAep2YVS1rRDPaRNPzMYbftFSgrTABQu0iljY3u1L/9pa54QmwEraaWbqiDqHlfXIMU=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT5dE68RGWi7zKBxYnBfZC4DVNqaCjUssI8qBK93gysrogo4+Ixf02vlT96K7R6SFtQnLoeEe8wWrdbHoGxaOxsW1fgddfrWKtFH9DsteqBP6RReeC1tTMvTe9rAhh2s8+g==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WUdrEx4Ddkm0kC3THp0yucjoKl+zl3xIusVXi7S95sRy/fLLdHYXInJzYq5Sc1JqMpbybERLUSCcUbL2xkZnUHdUFDwja0SHusGZWDAfuwOgruU7HqMuB8tg1gdKDjaNuM6/6SYDsU563/PSCWWQEosol/n+xY2ukyzjZPMnTy0b3QpibKgPmeK6nZRsl7cjJwkBry2chP/7IEPNkKGwepZLe63/CUoRwT66FYypMh9</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezQ+oGZDB8Wx7mq3yy0NXqi86QoRaCQCjoSZwNpn10N07r/MX11i8LPhxNv6m80Z3jFhTbtT2t0lliXQOui8nJb6g0fnZj6Tf+b/SuRL4M/IQMigAK0BM2cAxvfvPnFyMorHU2lVXEcYPzCuN++87umL2KEF5UTX1fNMipkuuHlyHlMqZQVH/WimqAJjB2h+M/6MGPXw6wcbiMZCkwgJ/Jzg==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwxM0HmueXuUjKRfPfQofDQjfCJ7ZsTY+y4wVhIYq40SFuyWmsQXXK3xWYu1EkRiuYxzYOudu3/5yiEUTwGPaePEMt2H5jgdS/b4SbUYC9C799IcwzVWuZEEYb4QGPtZ65Mvo2rYUrHtZ8w0qcCNg0oW3mWmdt/PzPqFoCROJzo7AltPEANRURyd6pJz6UXROyrLYT8FnW8/ueTlhOligi/VNlmZ5MCTTXcseqjhI/LcoeT2iqkOnPetIHAfDU2CCc=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DP7SAgkrRGW4usM7HMSoStME4W+r2fX+rIlkJKCuZlg2CvzvYtbBvJ0MTl47i4vCxBOp2XAW8WMx2SpJ0DqWq3evNuhu/nh2XhXvsmm/n4e8nvIv6/sVQWo0roDks0yeFHQUCUhjkXRZLtKAjyvG3GtUimmkiqihkfAD3tqQ55V6ZZFZuGYrcprLgKfHkWQhonCJzyK6Uv0wE0yGYmGB7RGT6o8+yuNflejOf7fanxpxFGBJcwe82S+07JuxycQBPfmTldjGuZ7CWpcLho0CrFWwEOjqBkdXpzhIHlpqETKO4wK6f/PzH2gRJFexaH4BgUK2ZFPAeOjTgSKayOHdcoSJ0cbfJ/HxK+inxBrgbePTieUiw5BuSRXfp511Pjo1JUKSFUJJTgVJKvaL0h7u0miMrbU02WA1aMurWLBKtm/dRbl3Kv/sFvEQembpfnCWt5ptjztGB8NDhZKgxyHXl1Ctr6WmuImreOrbIw5WHP4gRl1X+YaulbrpMi8whB6eGNlrRrXrwGifN696R3j2xWQL9FWmiBwt7If7DFqVPWwBCQVXkevvl4Mgc64Ke+ooqxIzsP4j5a/j0wlZmOW/xnm2Y9Didl0gyi8SrzT1AX8bYCTVdLJ7NJHYpp3llmpOICacLt7BD6JIyoBAs7p1HTx263ZPN5uUVyb92TcSisn0uDlUBEoqrh/TeoF2ot4PhkyWmuCOBNa/SYhRIMB2p0kl3KJhrmWzgiuu/pZEyjetjmnolJL0qBzANAmmDEnWqEVvW1xLQaeczXWhz86TEXdjLeF9MH9a6qjFqm2UtODt3wg2ikNp0m8f+XFFx4NCEIZMvbTGFaa+vvygADrpJzTCFrxar24xV0KiZMxPVy/5fUAQMl7EA/4Rmvaw1CwJFvms+v3nfrXF4r50cDYSxGZGKixZL59Gc35572QeoAXRm5nMnMj2qQoaUtruf0i5KSc59TLXxixtW/Kc1+CsDnjs3ZF/lNcrRW9N9fezUJqA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&SgLXOpw/239eYA+8mqZosyg41awUDFO7pcAl7bZzCaIzd9D/hgY9+q3P8QHBLPr6</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8Zh0pCMFwN0HSzZYw36JMcEwRPTcFUGVKCejuqCTsxCaNJvg/pKtt9aFz/Z17b+Oxcf0fZTXi/YvLAuBX2KlV6/Z6T35fxUOtal8Q/p3E2Myd1HlcsCK0t80OD+EXGtiMghvV1xNFcoeTif+RRuAfnhuPTQE0yP7O9CejwoJ2Yyc0XTvIgxRnQRmFdLr4gI69ucpxe1e0BsF5VjcG4+Mc7lPgGqe6mq8920DQxKoKWn8M9IgSwjX9+40hiiSL5B+hp0CGWfVE2KNNG1avALCZxXjcU4M0eD7+nrgrX9md5s8zQog5ntD9sU4ciV5GPh92ZJmltUl1BcmcBfxAg+++FJltKXlkGjBY8SQ9q5JaYs+NwDSOT90aJWrbA5JEMvBXeUjmmHbDB28/wopIif4UWrQwwkBrqJuW08OGSzdWV8Cq8A2LCYL4Q7naFXVDMK2ULfBLQPpm12TwcORm3rPaTJ8/OIJN97QxHP+pOQpP3mLUEJrxp6XAQVZ8LpHoax8aIb5kBvsA79ZjjoeX8syRwQ7JQPF23EUbJdLwOmMuVLUOHPZFEIEpD3pFdEDZCCZPvPXzytmhYi4ZgVEvhGjCYaWwwvok20t5LPWMMBRkAnlu513gejq/EyTzhul3ubxAzXbSn/NdHb16VBSh28A786vryLG10f8xNLxJmC0c24dmJ7FhV5r59+IbOMqDHD40K2kMt6s3ccVi4sJ+IjthpY6HBZ3xwTU5r3X7PMWZhnijYvngaPZxd5LDcwHMgd+hFdnbCa4uPUZKaXuUC4tvVxVDj2FKz0Ax8UAXF47CPWBkOdjl6ewVZB2ZSHIJ7Gb4RiAYW4rwBE6iQYdliJ83Bu</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b2z+pkwZO02SBp7OVwDNfWMHaX0HLWz0vKYuUHyn/pLXM4QtjYR43JVpzSddFqla8LuktZ95ir9Bx1kMEpMtEuT4YyOyARRh2ULw0OZe6HCXaWXA+vO6fYNeMObU1YKQvzFaxQ4h5qhuGGju5hJHRGqgWeGWuXxbcasMDhR1KxVmyq21H7OfW46fB2yDJBTj0uK5Ax+5Ai2/ydKTVYanjwH4rhOgHnyu1eppeNHRIIarUHUQPvNrlcoQBZN9hYo/iJlBulvbUTvo6m5CLw1s2i35iJ+YY28MbjprBGUaYbr2lCCCgJBeZvs5N68s3BpvSZ1nD62NXjHD8cuCVTG33VO/GB3NQTyw2+BlVk+AdJH8VG9xCevZxvbpW02VN18xIHFKqL3zeMgkcPWdhQYCTO1cRqe+KS7A37MU1NXamRNjPZi7JAkx0B8MAoiVGU7ySwQg3JT39/ky3ZZmY60UI+VNf1KlbT6C6wXWPRI5NIV/07fTs1mMXSijqqWR5pOb7vfg/ZdqVp2Zj8fSU5YlR9051BKHfLdnn3+/rsgRFkHyIWNwERG/m+sMBoDQrrUiq0WPl0pAZwHaYULnmTs1MFmy0eLf3sJHi9QDJEqCYtu/u7Rho8OsLlsOB4Ja/6oz1eIo3m9HtvYVdzTD+tPE/7i3QLDPc1+g7Xb2n+5AwqrDpORCoKPXkeQkRNqido4AqpPt2QC8jbKAgEil7eixCGR0fVMqFlqcjwLLldA38/H5z35/2h6v1vJrx7kI7RlRTnESFZc+TeJKYabJLw/0xH6pGqD/EcGlL0llPGm2nT10G5Ms0ID9IUuKgKKTRea8QVEBSbTFuuejMvxEJRTUnOKX3gWLBoAVk05JD++mPenIGGjGbaVLhDa5B6FOwSpW62xRexl4xJynDJm+aNEWZYlS3P/tmtB8KxPD7iqQ/9atmYJRAkIv3zZy40iboLzXvJKkfnFbjxgj5fiyRZ0v9NZcKpSaJcS4bV6BkBh246ZCFQP87DJtJMsioF5TInI7ES54nXsxpu6UlpnMqP3VgmCUdrmkS7710+1t+4iOINoHbIlyY4t9Zv2n6dM28BlQrqG+L9rp7OImAa/R1gjUon74808i37rhWR5wNoN0VSOuRCflcWioIIQdzRgg4pp2r6eMwceNbbHmAV/PqHhtBY=</Encrypted>]]>
      &OutlineEntry;
      &ScriptSuggestion;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLSuggestion;
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  &OutlineCss;
</dir>