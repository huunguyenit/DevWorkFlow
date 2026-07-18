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

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3NUA7CYsEqI9pGkhUC0mCD7Ou2mPv5V5NzX4FwuIiRdpuqpPbbIW9UtNXycS/OX/TQ==FastBusiness.Encryption.End">
  

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.TSTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

]>

<dir table="dmcc" code="stt_rec" order="ngay_ct, so_ct" id="CC1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="công cụ, dụng cụ" e="Tool &#38; Supply"></title>
  <partition table="dmcc" prime="dmcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_the_ts" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã công cụ" e="TS Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ts" allowNulls="false">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="loai_ts" clientDefault="Default" allowNulls="false">
      <header v="Loại công cụ" e="TS Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmplcc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" allowNulls="false" clientDefault="Default">
      <header v="Mã tăng cc" e="Acquisition Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts=1 and status = '1'" check="loai_tg_ts=1" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="kieu_kh" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu phân bổ" e="Allocation Method"></header>
      <footer v="0 - Theo thời gian, 1 - Phân bổ 2 lần" e="0 - Straight-line, 1 - Two-time"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4FYuX5ub5Rh0GZ6ryfWV3qPP13lU6ZwZexqMmeUqZLEnuaRtQYY1EyuO4E94I+SQg=</Encrypted>]]></clientScript>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="###0" clientDefault="0">
      <header v="Số kỳ phân bổ" e="Allocation Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7K6cyOrLdwkj337ZLUYUZVhPSKBLCvevqd+Oihy+DZdvR6DPw22rbz7IORX6/Gnys=</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tính pb" e="Alloc. Start Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4na3+5X+jC4R2tJQYH8Ld0iMnUOT49vetPqzUf39DufqL28FuVN+lMIUKu+LEHhgk=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_kh_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left" filterSource="Optional">
      <header v="Ngày kết thúc pb" e="Alloc. End Date"></header>
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
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_ts" allowNulls="false">
      <header v="Tk công cụ" e="T&#38;S Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ts%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_kh" allowNulls="false">
      <header v="Tk chờ phân bổ" e="Allocation Account"></header>
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

    <field name="dcc" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="187" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="TSDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="acc" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="187" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Phụ tùng kèm theo" e="Spare Parts"></label >
      <items style="Grid" controller="TSAttached" row="1">
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
      <header v="Gt đã phân bổ" e="Accu. Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Gt phân bổ kỳ" e="Alloc. per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="18">
      <header v="Gt làm tròn" e="Difference Amount"></header>
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
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_nh_1%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2" categoryIndex="9">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_nh_2%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3" categoryIndex="9">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_nh_3%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_hieu_ts"  dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Số hiệu công cụ" e="TS Number"></header>
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
    <view id="Dir" height="247" anchor="10" split="10">
      <item value="100, 30, 70, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="110--------100111: [so_the_ts].Label, [so_the_ts], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1100000000-10011: [ten_ts].Label, [ten_ts], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="1101000000-1101: [loai_ts].Label, [loai_ts], [ten_loai%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101000000-10011-: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l], [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110---1-1--10011-: [ngay_mua].Label, [ngay_mua], [ngay_kh0].Label, [ngay_kh0], [tk_ts].Label, [tk_ts], [ten_tk_ts%l]"/>
      <item value="111000-----10011-: [kieu_kh].Label, [kieu_kh], [kieu_kh].Description, [tk_kh].Label, [tk_kh], [ten_tk_kh%l]"/>
      <item value="110---1-1--10011-: [so_ky_kh].Label, [so_ky_kh], [ngay_kh_kt].Label, [ngay_kh_kt], [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="110--------100111: [so_luong].Label, [so_luong], [ma_phi].Label, [ma_phi], [ten_phi%l], [status]"/>

      <item value="1: [dcc]"/>
      <item value="1: [acc]"/>

      &ListView;
      &PostView;

      <item value="110-1-----------: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl]"/>
      <item value="110-1-----------: [t_nguyen_gia_nt].Label, [t_nguyen_gia_nt], [t_nguyen_gia]"/>
      <item value="110-1-----------: [t_gt_da_kh_nt].Label, [t_gt_da_kh_nt], [t_gt_da_kh]"/>
      <item value="110-1-----------: [t_gt_cl_nt].Label, [t_gt_cl_nt], [t_gt_cl]"/>
      <item value="110-1-----------: [t_gt_kh_ky_nt].Label, [t_gt_kh_ky_nt], [t_gt_kh_ky]"/>

      <item value="11000000-1111: [ten_ts2].Label, [ten_ts2], [so_hieu_ts].Label, [so_hieu_ts], [ma_dvcs], [cookie]"/>
      <item value="11000000-11--: [ts_kt].Label, [ts_kt], [ngay_dvsd].Label, [ngay_dvsd]"/>
      <item value="11000000-11--: [ly_do_dc].Label, [ly_do_dc], [ngay_dc].Label, [ngay_dc]"/>
      <item value="11000000-11--: [ghi_chu].Label, [ghi_chu], [nuoc_sx].Label, [nuoc_sx]"/>
      <item value="1111011-11111: [nh_ts1].Label, [nh_ts1], [nh_ts2].Label, [nh_ts2], [nh_ts3].Label, [nh_ts3], [ten_nh_1%l], [nam_sx].Label, [nam_sx], [ten_nh_2%l], [ten_nh_3%l]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Phụ tùng kèm theo" e="Spare Parts"/>
        </category>
        <category index="9" columns="100, 100, 69, 60, 40, 68, 100, 0, 8, 108, 100, 0, 0" anchor="8" split="8">
          <header v="Thông tin chung" e="General"/>
        </category>

        &ListCategory;
        &PostCategory;
        <category index="18" columns="100, 30, 70, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="6" split="10">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZjwm+4MV0VE5N7eRrtJ3YzS8GYMfzIucsIRAaAvxwC5I+bgG7O5wD2EQAfIbMd0evC737mkdZ3ubpM7vXKWqfa0GJ7VQjvERaExOL5lgu08s0LpB3swtZR73FDHCjoe0=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafePwxclakrjiD5NCPySpmhcm04LQHcICQblWTyda66oUJF+3MrXW1Z61X2XwR43Zzyv3vjBTSzbt+z7XibVUmF8=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/58GPw3rQNglQeEIQNv6M7xmDH/7PaV8vfdD0wnp+ofD74LyQPq5GrD+oIY/dIwYl8ugx/4kRRvtNpoWIjOklHVcQKz43KeDxQ/tGtO4e2d3QFJbmkEDAJo4DECb1DDN+45+6cg2yafz/swugaxmeIqfdztrWd+ABExpnpxYuSY7I4FVqhdhw2DmO63TlnVSImJUdLSa0Clz7aPx3Dub+w=</Encrypted>]]>&TSTran.Nested.Message.v;<![CDATA[<Encrypted>&SLAMJlFu+s7I4QT1Y/vVHQkNrcB3gcufBTemtESYmLMiMK0D7ZfoQvCKzMGnMCZMW8/bHidgvPov+AISJlCZvMJcKaCGo5eQ1WpUo6zCU0O/h2VwUM3wKzhci4ecqvoQunqabFXITc36V/DIcJ9fEQ==</Encrypted>]]>&TSTran.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2XvHjfEz+0pV5z/oWlMrcoZ2o9MESUtYsSgEYjlCqNesgFANhz2gU0Tdu5TDXzvwRyKNDM1t0ZDrhKtbH4cwzi8D076DSX/hOufw7SALTyLgElb8U3tCrQ0rQd8oUWiwUzX9e6yjlInWvSK4z7K++Sq0l5ABk2Ql6yne82s6vGOGz9dUkF6ooWlXIK6SvHuvJF/sQOaFXu3PzNshYQkYzIAmydWkKxnprr39TqU7L7okv4dljUU7OxrZAAenuwQbtw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9Hgazawdd2KwcZhDVhd7V0NMZPUxMCcXQ1pd0EadRAMBIflQ==</Encrypted>]]>&TSTran.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLcmpkFqiXjOe8ZYh6GMdl38JzzC8QV+X3eWlDF4C5sToVg3AByVUEa/w1lY76PAyrYTZgLOKaOxFmiwjerrX2nwnawcIyXMiRaDENGqGAg98ejDO1XsqKvf64JpB+3SVqtviFTCrDt5eHVQby8zU7Gs0485ITsbuutCS3b8hSUbu/9g2M0WTLsl76PPndazVkyGPL1XhDIPof1LVTlHqOhgWvu+ainuXOM9diP6FBbQSripQJEMmailVQcrMHBck31VralHDQ3V1spW2kv4TmkA6hmlBbm56QvnRMtIH+oPkjZA+uazc0FhVnWnodb3l5VFPGKGbMvasDHfpDCpwaLh7wR5Z1H9OwT67Xb/JM9d+kdgRjYELN7P97r52zTfMG2/iU4YGOl03uILs+bjySjU=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIhoHembG/ycLHlPaRNcnbtPujGdf0QilvjW+Dmp8os+/3X3s5UDSXLG1lL4et0zTDOXnjywt3+DD1uWZ3Klviw=</Encrypted>]]>&AfterUpdate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkGL/qz1V5uq0aEHJ1TqcUd6THUk6J3l/Lgqq+jK147nlcaMzd5TWWCN/1b5r7E5rohCkWSh5EbHPPOslhEnTDqOMLvx7Q/9cvMcc9+CLm6C55DB+8IbKdhx4b0YNxmKjVy5TJZw5vRmpiNU89oHoQI59rMcEDLi66syJ0VD80sihaiJP0Hl7l/y7+2sOstyMgtV4axZVlPVtYMcbo8NC+rmaf3oETRmD8lO4VB3dUL+SvKpIwEa6QPGGLRt+y2ChqOoozZlEhTBPFpUnOAP1nSKRP7lWQCNeWjizjkzcb/Fg==</Encrypted>]]>&TSTran.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVCCotLz349ResxIJ1f5OsrraCnsKVIiTje/TFpb9YT3yegtbg5Q0vXPiWFWsPu0ecs0aix1kmKMriOz9uXaMDEXpui3bPDBFmGlILlIkjHXL6/ORWDyOzKHwoSHvlnx9dXvvPuruG+b9Ap0qkQAJIOU0qHhRup5hgBEsf+v3Mp3C</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZJft3Z9ulFIgQeM6nXkJYtolewaCCSy89j12ur6ApiYQmrXFvXJOOurow53GbEaK7Ab/vYa19QkdZZfFF7vk0PQ4IyCEn3Rv9MVlMm7lhaJxRlOrcWRiPQU6cytDB4QSmRL3ZOQzQ1p7CceHjipFPO9/Wk3fhTWGp3HLjKY7OJAopC/HWLIyNQsRvPEPnTb7EUL2b7uBRiIzbx7uuZkN8j17eXxTmcdkqBXHE7CdwHG17fAInTlm8OWz1dYKBX5w0o0E5zJ8FoINWvezfEz4/VZL89jLNtjGx+RpDXn29EdFIsL2MIir9KDI4A+TNTaLmKARbiOUEJix41W+HgmP+OylRRUIqLwD1mz3vVnT6FE</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eBNuWm6yfC1KKm7U0pi/urFTja25V4nTXMnZ0T1JtiO5OLW+f4goNjnP6ZHIsfE+hJYENshzjhdHIkrfzEO0EiGJWQE1p+JfXQKYPNmiA8vIqOunfMfm/xl3TUSCpi4Gr1nMYR4+NWqX61P6MefEA41Bguoa/IbVF1yR83o/Gp8nTRTRBpaALseVQtBwFLlQMNkBXHZ/UPBGJIdFOrsDPk/t9AJFN/rzD3sQ5ZiGMa8</Encrypted>]]>
        &AfterUpdate;
        &EndUpdatedVoucherNumber;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvk8umAAme83LBlcTXtir0ZvtzqnCL3qIKG6PcAQKzTUZVQltBGX1oFVxIUfzxT/xAvaP8+znX0/Zoz56YIQQIJ9l7CKhfix5X/O91S7/tiLsAveJeOQSC4ZPJGiGdGgn+WPzbgYdbbS82gDeOPfgeu+gV8elzX29s/Z0yrLyP9hOep1HM2MwgSXeijN3cDYL3QaC1W4Vet5trSWNLNcymciHH7RXIumHdutc7ZXSotwuxSSmFo/FHntVomqJVLb9D++ndmjHhz8VLgwUQyTk1aq</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTIrJvPNwgFE6y+2QjCXXs5EQ2L2dFpx812ixlV2GRk30pYWVcAaCWmnS/fHPibIWMb3++atp0LpJLN5FI0YBC0rdpaQElg3inU6MtcnUyyn92dT6Y03qGN2sz0AwjTj0izxf5rCViAIQgceC7PBGuoJpy/tE8XKZh8i82Cdz2FU8p8vf4xvf6KMymcWEIrhPHVo4JBsqTGX2MQ76RJQBawirelmIRYw5U6VhX49QTiT5mjYFXmxPRHmya2vOP9cIlWVemVPRK9Ak+naunEw6mw6XFAIV6Rx59J9mOg3N0Qjl3xphK7kqMETlhY0Tx4cm8eFTyWOFHzhfQP9ZR/Ulri6ipFy+1KiqHbybm3THYXd5uPh0fP13ZTXxgrEioKWgS8om+PkTuqEOBDvtQL/9v50Up502JVeVdaVNvHBtS/2i9NvP3CWNvD3m3GaMM2gTUmkHrqJOmlT0uIpGwOZ8KxMwlr0kDU2ce3+Tp0QVfgIOMqngWTnzA6R4pEiKBat6tre6ATvlVZusVQ0UNbwZUajsuUnpO+F0J5vGoG5nXDI4kYbGS1gwBKaDU3AMflltl239DZl7V2Pbjyu0oD6cPmMtnBfZRBTdjKH0hccP/LyyWJx/jcWq/In+ggyfpdPbQuvHR2BYqlp0yV6nW/qnk8xn+6myBh+A15tcf1gRUhoFiqJjOzZeVPcTigwBJEBOsGTFHKOY2NxhhLUOLAKhBNmXRNV7CnRXA3RWBy8XbRM5bDpcNWOwH8ciup0qQ8WL1i1IlKYtaTNepO9Zt7OnFgs=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqmOY3hzBV/7Gr/mSJVerJQ/g8aZja3jsfNzXrKCjRcfrw==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZtVBjsJG80bJVLq+fx9tX+YpHxNfibEElfsbXphl+FwImZblEl8crFPAq3bjzMxIql16bEcVDn9kAEIjwzuHzf8+qZsQ74WHyAtznbFEetvx/whotj4ZAXfDaEbon/VwS2EHVo2Jvmf3Jnva1pZAeWhINMsNIhYbd+iTq6HL3B/aLtKlGUyHrhNIRm3qUcqYMkH22/V1obs1HhhfO60d6Q=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT5dE68RGWi7zKBxYnBfZC4A2BNYV3UYmIt0nnh58mu5K0nSHvWU1XbmZEaCqBhQLnt5rAVz5hIVZ/7D9VkMXJolkXywszYKNggOEZNRpNeRKmXZFEbi3K3/sZZzwY4cWoA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTt9EESOauat0Y4BNLa0wwHtwtyePNONWZ3njiijbxFXzReKCOGtciWdQReHT0snB9Q</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezV1bmJut2Cv5gAuG+3wf8DlAILhCuC7jqlhbmQML9oVuRjkUOzPWvQRw6DbahLvKGr0Qx3AGHkarakWeAdS/x2kAzMtYxv5Yy2CZOMWQDtRJZy31pttguw8eU5zJWZrzY6xYTF2olmBT7i8J50LQKhZ8GEvDAIe8eG1F4iCmyxKQUpcwfD1g/9rBsRCOAknLtVdXPDh8BV5F8JqeAtP4axg==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwxM0HmueXuUjKRfPfQofDQjfCJ7ZsTY+y4wVhIYq40SFuyWmsQXXK3xWYu1EkRiuYxzYOudu3/5yiEUTwGPaePEMt2H5jgdS/b4SbUYC9C799IcwzVWuZEEYb4QGPtZ65Mvo2rYUrHtZ8w0qcCNg0oW3mWmdt/PzPqFoCROJzo7AltPEANRURyd6pJz6UXROyrLYT8FnW8/ueTlhOligi/VNlmZ5MCTTXcseqjhI/LcoeT2iqkOnPetIHAfDU2CCc=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7ABukuY6DvlfxNt4KZIZGHTh1Xb+LkkVdIJQwyOS+y41XIVQaB7MJfhiEV1PtyUg3gEK8KXROOAUGqxgNupPNqa2vtad/OjWMzKOQASOUg5NQ/dvdIIIftiE8q/yJzQ74cuZABninbcTp3kMqGUpoEMrP10FWbcTM0J9qCVPI67Jp/y3ERNzW2ArkL5FrIInrvEhMq6uVeAYuX0y7rLYGTVcWgahN/0bmJw8RYjcKiwJ083mcgK5TgwYweQWKdPL7tWt+2DdlNZUFPftnuoVRm3oY0f8r2XOEhGIHNBQ9QFRZGrHWSER37rQEI3CQI+rvU+SixPZg6VsuPvdT9UbbhnnRZFZ6YSeFNlHtuMMUeMDWW1bzmWhYkn308U3mPUe9p3s8V8hBSEIe2Qax5y4A6BtvcZfXtnMUgepYNaXWzGz7GlLAFcjjql9kelzrOH5q+dfX6DR/JfmQmdVCNXva/28GFOm4KlMYHDhMpFnM/yyBnSHGSwLZIulmoKXG1rrkPS6nQ2+ZbiAAoyBb/F5BAHRQoy5EnENeICGsW1chCrag==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WbYDiTy2Z9/evnhJfcpncQ1+FQ8R9rEEhyl9VBElnk8FW4ZhVNcBXXWrkGbZtJ7OYgfvivntdNEFiRisIpvUs6sJU3nt2bDEmzref7mjN+XsVc0VQANuZHtmuS+I9Gu+P84+0BgBh1rZwCwXa23ALi1VuU0kLbrORsYEqcdwobcMHwA9RX1YNXwCHO8Jf03kAG2sHsFDV5ezDqeoo+HXYzw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78+UXr9J+5N+U9WLGLYWKcP1PUwUulxDPRT62Yh5/k81C9/+7RqckRAC0N2WXUzSJkg==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOqzvOxB/3zsmdCGHSDm/i33AfssaUkg6RVelNIjBxr24sqNuBXBgtgC+y8wGpvFhA5+M5ObxgiwvzQhgsr0VkIExWV+SkgkacZBeXboHaWlmsxmbcMQot6PvzSLr2iTQw5sd7UKCI2EIMyOmy4rVrMvafz9ibQhG0bcm4DITZ2AolUZhdJOekrrOreeRkaioVWbzjm8E/eDSOR30Z0eKSZaaYkn+TfwNJQZaVCl2ghIRvqEsOg4XPMS/vB+mlda6pPk5m9V6hY7lSOt5bstHbnmh7t6xEdf/8OnUhRkBE7yioAZiVQhOcXuFnxR/zGdqq2GSkRNZ7p2bAc0VE4pEvDlEqPyhCwZbYUFjjrXPbd5jl1FiViApZgMoZZZh+yIYF7YaNzHWZWrZai1u44qIEO03/eeN+suBM8QsXM54Ai2Wbbkio6mFmGIiF1RHk4Srd87n86VE/IoxsE7gT6HNTye41GGszvAFf6RL9f6j5tKP1g1XiQetCiOd/XNmhzoCjkGBOpvOmKGnp+TlsrrJC140Xhgc2v8mLjeIIEm16hkkxVFPHtC9Z47wXP07Pt9OPwZGB8NzSBTiJoAuJ2qoTmRt/HwCKOmQ7w4T1aPkDBMa0zrkTPiSivvKuDENhTNydIta5WqYGqXhh7ZJJ+vXHm</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b2z+pkwZO02SBp7OVwDNfWMHaX0HLWz0vKYuUHyn/pLXM4QtjYR43JVpzSddFqla8LuktZ95ir9Bx1kMEpMtEuT4YyOyARRh2ULw0OZe6HCXaWXA+vO6fYNeMObU1YKQuDdePthP4qygQwXWQlWC3I/q0+56TCtA6F/lpluNhkCOQ/76D76/3I0ZBUMq6jQ3UKs1yBpDU+YfFOeqiOlgvqYdnOANBtqbH2Q8o2RJZ8oDLYRmoFCvm4kIEi16XIRKpdZQHqz3Kz4vMJCeW7/KKctxUkRsE6VaDiB9pmFqW9kQzseiPZU5/xmYCFHPquXIpAso6k6UK3HAp5S1IynBgMWXmLTBVm0nLSbSuq6ETdteNgLBX6uFgTH6TEo9UfY8GSq5qTtTFVBwhUbWFSlwvbRmaR6eZxT2dcImxhZ8tJVHoru7IFxpkGEsS0I+Wz5O4eStyBehnmrDvPR81+EvJDOgoT4tFPwvHr7jcOuNvhFevPgb7L9GzjnWyZPCWifQQGvJmUPPYon5gvi1VvebUKRZDGPpZ3IdSH9Un0a9SY1yz+/RhgSfjwaeD8rarcHlkMGe6SNaGJJvLdg2UtUztd9odrU98hkqP5BkIxAa3GYoXMOAjHwc0Tqs/6J323dmEbyj6L21tNQMOVmfUS3hD2ZYoQro/81b1si7Qb2FibPgtUHt9rUr2Lym2NM+Uw8NnAGpBIXHJGTLw7nmxmNaloTeCY5P4PN1NRfWwsox1vVpEoqKl4/8xMzvnRw0YI57C+MUfRNQWjW08t+5/Iat/97710RVJ9Uf1q1hqj9VC6NUEBwfG7TuVu/xxnusQT7ZHHYNUFmrjnIQ7GCiwZgVixtUIpUH3ayRiVEELqYbJtMp5eVmFB6586w6AuoUSgvYQ==</Encrypted>]]>
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
</dir>