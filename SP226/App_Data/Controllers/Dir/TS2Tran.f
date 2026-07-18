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

  <!ENTITY Controller "TS2Tran">
  <!ENTITY PrimaryField "ma_dc">
  <!ENTITY PrimaryTable "dmccdc">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3FQiwH7HV7sWBcWt6KgyC5DknOBbTWBibCpEZChTtzvnv1yjCnqECOhVAhNQDTHJSEb3zYy64k1Wo1Ewk0gMsrM=FastBusiness.Encryption.End">
  <!ENTITY Post "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnByUx+uWpYuPzW44cpD+luN3dRN5TEQKCEhcVy+TZbybQUTCaJ9p7vx6qRtwN/vii9w==FastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$4mIqdtLT4t97p5s2zjGjoX7ovCuDDyNpFlT5nJIo7t//C3DLKkJw9zXPkATPhqRtDdV35DAyqZXnRtxtWAPqLA==FastBusiness.Encryption.End">
  

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;


  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.TS2Tran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

]>

<dir table="dmccdc" code="stt_rec" order="ngay_ct, so_ct" id="CC2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin công cụ dụng cụ" e="Tool &#38; Supply Information"></title>
  <partition table="dmccdc" prime="dmccdc" inquiry="idmdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="&PrimaryField;" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã công cụ" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dc" allowNulls="false">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="loai_dc" allowNulls="false">
      <header v="Loại công cụ" e="TS Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmplcc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ld_tang" allowNulls="false">
      <header v="Mã tăng cc" e="Acquisition Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_ld%l" key="loai_tg_ts=1 and status = '1'" check="loai_tg_ts=1" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
    </field>
    <field name="ten_ld%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="ngay_pb0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tính phân bổ" e="Depr. Start Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4na3+5X+jC4R2tJQYH8Ld0iMnUOT49vetPqzUf39DufqL28FuVN+lMIUKu+LEHhgk=</Encrypted>]]></clientScript>
    </field>
    <field name="kieu_pb" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu phân bổ" e="Allocation Method"></header>
      <footer v="0 - Theo thời gian, 1 - Phân bổ 2 lần" e="0 - Straight-line, 1 - Two-time"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4FYuX5ub5Rh0GZ6ryfWV3qPP13lU6ZwZexqMmeUqZLEnuaRtQYY1EyuO4E94I+SQg=</Encrypted>]]></clientScript>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="###0" clientDefault="0">
      <header v="Số kỳ phân bổ" e="Allocation Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7K6cyOrLdwkj337ZLUYUZVhPSKBLCvevqd+Oihy+DZdvR6DPw22rbz7IORX6/Gnys=</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_pb_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left" filterSource="Optional">
      <header v="Ngày kết thúc pb" e="Alloc. End Date"></header>
    </field>

    <field name="dvt" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
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

    <field name="tk_dc" allowNulls="false">
      <header v="Tk công cụ" e="TS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dc%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dc%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_pb" allowNulls="false">
      <header v="Tk chờ phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dcc" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="187" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="TS2Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="acc" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="187" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Phụ tùng kèm theo" e="Spare Parts"></label >
      <items style="Grid" controller="TS2Attached" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ten_dc2" categoryIndex="4">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ts_kt" categoryIndex="4">
      <header v="Thông số kt" e="Parameter"></header>
    </field>
    <field name="ly_do_dc" categoryIndex="4">
      <header v="Lý do đình chỉ" e="Susp. Reason"></header>
    </field>

    <field name="nh_dc1" categoryIndex="4">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_pn_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_pn_1%l" readOnly="true" hidden="true" external="true" defaultValue="''" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc2" categoryIndex="4">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_pn_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_pn_2%l" readOnly="true" hidden="true" external="true" defaultValue="''" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc3" categoryIndex="4">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_pn_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmnhcc.ten_nh%l"/>
    </field>
    <field name="ten_pn_3%l" readOnly="true" hidden="true" external="true" defaultValue="''" categoryIndex="4">
      <header v="" e=""></header>
    </field>

    <field name="so_hieu_dc"  dataFormatString="@upperCaseFormat" categoryIndex="4">
      <header v="Số hiệu công cụ" e="TS Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_sd" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="4">
      <header v="Ngày sử dụng" e="Using Date"></header>
    </field>
    <field name="ngay_dc" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="4">
      <header v="Ngày đình chỉ" e="Suspending Date"></header>
    </field>
    <field name="nuoc_sx" categoryIndex="4">
      <header v="Nước sx" e="Made in"></header>
    </field>
    <field name="nam_sx" type="Decimal" dataFormatString="###0" categoryIndex="4">
      <header v="Năm sản xuất" e="MFG Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ghi_chu" categoryIndex="4">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Gt đã phân bổ" e="Accu. Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="Gt phân bổ kỳ" e="Alloc. per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
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
      <item value="110--------100111: [&PrimaryField;].Label, [&PrimaryField;], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1100000000-10011: [ten_dc].Label, [ten_dc], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="1101000000-1101: [loai_dc].Label, [loai_dc], [ten_loai%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101000000-10101: [ma_ld_tang].Label, [ma_ld_tang], [ten_ld%l], [tk_dc].Label, [tk_dc], [ten_tk_dc%l]"/>
      <item value="110---1-1--10101: [ngay_tang].Label, [ngay_tang], [ngay_pb0].Label, [ngay_pb0], [tk_pb].Label, [tk_pb], [ten_tk_pb%l]"/>
      <item value="1110000000-1-101: [kieu_pb].Label, [kieu_pb], [kieu_pb].Description, [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110---1-1-------1: [so_ky_pb].Label, [so_ky_pb], [ngay_pb_kt].Label, [ngay_pb_kt], [status]"/>
      <item value="110: [dvt].Label, [dvt]"/>

      <item value="1: [dcc]"/>
      <item value="1: [acc]"/>

      &ListView;
      &PostView;

      <item value="11000000-1111: [ten_dc2].Label, [ten_dc2], [so_hieu_dc].Label, [so_hieu_dc], [ma_dvcs], [cookie]"/>
      <item value="11000000-11--: [ts_kt].Label, [ts_kt], [ngay_sd].Label, [ngay_sd]"/>
      <item value="11000000-11--: [ly_do_dc].Label, [ly_do_dc], [ngay_dc].Label, [ngay_dc]"/>
      <item value="11000000-11--: [ghi_chu].Label, [ghi_chu], [nuoc_sx].Label, [nuoc_sx]"/>
      <item value="1111011-11111: [nh_dc1].Label, [nh_dc1], [nh_dc2].Label, [nh_dc2], [nh_dc3].Label, [nh_dc3], [ten_pn_1%l], [nam_sx].Label, [nam_sx], [ten_pn_2%l], [ten_pn_3%l]"/>

      <item value="1110-----------: [t_nguyen_gia_nt].Label, [t_nguyen_gia_nt], [t_nguyen_gia]"/>
      <item value="1110-----------: [t_gt_da_pb_nt].Label, [t_gt_da_pb_nt], [t_gt_da_pb]"/>
      <item value="1110-----------: [t_gt_cl_nt].Label, [t_gt_cl_nt], [t_gt_cl]"/>
      <item value="1110-----------: [t_gt_pb_ky_nt].Label, [t_gt_pb_ky_nt], [t_gt_pb_ky]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Phụ tùng kèm theo" e="Spare Parts"/>
        </category>
        <category index="4" columns="100, 100, 69, 60, 40, 68, 100, 0, 8, 108, 100, 0, 0" anchor="8" split="8">
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
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/58GPw3rQNglQeEIQNv6M7xmDH/7PaV8vfdD0wnp+ofD74LyQPq5GrD+oIY/dIwYl8ugx/4kRRvtNpoWIjOklHVcQKz43KeDxQ/tGtO4e2d3QFJbmkEDAJo4DECb1DDN+45+6cg2yafz/swugaxmeIqfdztrWd+ABExpnpxYuSY7I4FVqhdhw2DmO63TlnVSImJUdLSa0Clz7aPx3Dub+w=</Encrypted>]]>&TS2Tran.Nested.Message.v;<![CDATA[<Encrypted>&SLAMJlFu+s7I4QT1Y/vVHQkNrcB3gcufBTemtESYmLMiMK0D7ZfoQvCKzMGnMCZMW8/bHidgvPov+AISJlCZvMJcKaCGo5eQ1WpUo6zCU0O/h2VwUM3wKzhci4ecqvoQunqabFXITc36V/DIcJ9fEQ==</Encrypted>]]>&TS2Tran.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2XvHjfEz+0pV5z/oWlMrcoZ2o9MESUtYsSgEYjlCqNesgFANhz2gU0Tdu5TDXzvwRyKNDM1t0ZDrhKtbH4cwzi8D076DSX/hOufw7SALTyLgElb8U3tCrQ0rQd8oUWiwUzX9e6yjlInWvSK4z7K++Sq0l5ABk2Ql6yne82s6vGOGz9dUkF6ooWlXIK6SvHuvJF/sQOaFXu3PzNshYQkYzIAmydWkKxnprr39TqU7L7okv4dljUU7OxrZAAenuwQbtw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgazyyYN9jpGDsJnXX+h47Ppic6wbUdFdguFm31dPpP2vnQ==</Encrypted>]]>&TS2Tran.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRXuJdFpDbu/vwGR2REb/aRo/5Mjmbjbzx/xj3Xj+8yA</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ/Hd5kqhAK2VeXjuL+8b8J5pfmAqLIY6iDtxM6rWmAVBkHt6hE4OBAw5N7T+klFIAt6JpHmx+8+7i4FiVRDCdL8=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+PR3AMjFkEG+EdKEHcRpLGe/+tzdDy2dNomOKO/Aky0oZ1b0KRGoXgNJn84px6ixzEwg3KJgESKtwmbCdVUZIUf5oN78CxxFugMUzmgB1jdkQVRr4jsioCwIea4CD6O4Z6IzoW66U/VHU3QIW0E2p8R6zleJ/ycYpWmNAPlYhYBazw4xxfSQTjunn8PqP8BPA==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&jKsR1K6LgXp9ry/dhXHRpYcoUb+V/niODWBi1tcQCsU9PTMwgX+to8AAe9XV3bvJMFq4Xh7bFNe6hBsr3DkPP2ZdWOVCMa6z0xwwmm19EcpKJmjMFawYKBgl9+d2oQn1gFDk4SSHbOqr8fifH0urikx8+d7U9Sp9gZ+lfV3Qp0g=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcpUYMaTJgWnE9uSP5h00PCiMmTvw3fopa/aFviTIUFpjSWm26a8ZHk/X6hMjeCyao8re9yyt8wEOE+oBlLjxmkA=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNG89RMUKjHNN6ATb7Y04YkawB2rNxH7dTMeT9H1aGLD5ssez2ycAfi820tbJ4iqsQ==</Encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkGL/qz1V5uq0aEHJ1TqcUd6THUk6J3l/Lgqq+jK147niipcWStPNTzhs56lOBP2mc=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5CwwRPXNAQBymzZVcee4K1jrRf2I2LbkmSS7kBxq36z/+qxzG8lyREfTTiOx5bb8GZe6fxq0JROMyOF+XHX8kCk=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&9bBXgmS4IUqbn/cYhF1UTPXXl86xz8ask7cdy7EcLLi+1HQJsGLiVyAFNRIUga1an5DtjTXXVp5lr6TWRH6BFQ==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHmzWwfrUfZRELIlPB8VRpQM2dfYOMLDAeQp0mnG3Z3CemvAaFzbWWinb0dJoVJNWVQ==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ/Hd5kqhAK2VeXjuL+8b8J7tjN6SlanTZzDKMOBnUO7GlkNH9Pn3+2jE0Nlacf/QTipxzvWFfBfKYznWNzyQALsURMWssmrwuWtGV7fuqXLCo4XHu0HDmYhWnyi3qr7q7r5z2tc7j/E1FOoJ8rznRiic5LRzNpMA5y/reO+8hHwJ</Encrypted>]]>&TS2Tran.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVCCotLz349ResxIJ1f5OsrrQ5KmSYJRc6yBh5UJB2t2oay5DKYJFTWBLcRy00sDu4w==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ/Hd5kqhAK2VeXjuL+8b8J5pfmAqLIY6iDtxM6rWmAVBkHt6hE4OBAw5N7T+klFIAt6JpHmx+8+7i4FiVRDCdL8=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+PR3AMjFkEG+EdKEHcRpLHVg2t24IGDpvYDIOH76pdveSo3ybBnrK34E2jtfHoYBQ==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZJft3Z9ulFIgQeM6nXkJYtolewaCCSy89j12ur6ApiYm5Zt6qxTTwAMsI44sW0QDSksfSAIPZYIbMtjtPLSSNzCEOl+LyRjBV3pA6g6IGG0YRi9TWSCGS+jbFN+MPI5hA==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNHPTwAobiaFbVuAzf9k6uqgIjFNXn6MHo6VvrZxsE0aMQVIRWoeuQ5X4NbzMdz8vdrlvGacUpNH7MQfrTyJdiRiyAc8YBTaMHnM3noQG1MkO</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&jKsR1K6LgXp9ry/dhXHRpYcoUb+V/niODWBi1tcQCsUby8qEsFPSTqnV70il7Hmyu93L8AbhDpz7OdLxbVfLdwziaSybLpG1GG5DF5VEAvGNxoAEzoeTSG1UxAA9F+cJWSoAM+Oa983Ok9CjW9TW1YL3Ru26V2cCxWtW5xCOTnF8djiERCburnwlQ9nzikhLRSqfN0rQCIelHKF20hjHscJfox7ejdZY+TtTeehU4tE=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNHPTwAobiaFbVuAzf9k6uqgIjFNXn6MHo6VvrZxsE0aMNLQsgHLdKkSb7++0oGoWzsu8bjWt8Wr1IJBgQn2JQT8=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcpUYMaTJgWnE9uSP5h00PCiMmTvw3fopa/aFviTIUFpjirheVrrJvaTSrbjK6xuKaqDKH597tV0eViSJvsKqBgjTfntqtmjTnT0OAqQluOF+P8r36jJuIhnJ2JNMlE4USw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eBNuWm6yfC1KKm7U0pi/urFTja25V4nTXMnZ0T1JtiOimnRsY0B9myCGO2AF0rHfS5PbzGjb04NTViVBcz0CVKQyoq7aa/67NH3NQmq7Fa3nlB41GdsfYer90r8CLl9Q9V/41o2oLib0CNa0QYF4d05138gn09T89BvgjYdYw9ws6Obzvv/Ku4o76C2yx7au+b1ryHILKQXXeRxQor3T1i/sVcsZKMpMZs15//siwn3</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkGL/qz1V5uq0aEHJ1TqcUdxldsT5JwAuAdSZ2Rg2po7P45VPyfJB5/2MRFPN+hx//sj+kdKjNQre2KMLUboULF</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5CwwRPXNAQBymzZVcee4K1g6CL5N+eBXxFhAIhBlNLTRQuVUBoDEsK7PPDbBE2kNFIRCRF2Yuxx+cEzriZdltM8=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHmzWwfrUfZRELIlPB8VRpQPkIQR6jTdQDvnOoBbdDphh97iPo2VNzIJBl+WVUo/QQpp3F5/ZhY9ICn+YXiQJ8ahmgyyjsUWu5wnQYaAukxZvfiaX7hujP4ZBUvAn1Ot2T3ckFZI3oP9TDW7ElWUJoOlSV7WyM187LV4xPi4/QlNKeQutiM399qKLOqBsn4ElCCQDQ6cOGzxfZ1DdCAc1uADk1+iZX0MSBMmfTRHWTf6C</Encrypted>]]>
        &Delete;
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGTa8jTOWTWqwQgCxgO/x0Vick1SrqI8Griq1aVd8N2n+eABTF51I2R+aaeB2drd2GtBYVPg96WlVhp8JzLmom0ppCyp4IMlv9XKLkzjF/9lWQDRaLffwMQqxKzbW4e5qhC9QT9k+By2ZaID8Lrq71sXcLRRvgfCm6fGrVV0BJzgkAU3D6EFXT8GLS4++/Eosx4DUjXLzoABvUEfe5RUACSZAWZ6z1XGcfMTiUR5vTTteUrRQdM+gYHHY+/y0OdXgzfFVNjo8RgZaWObBv+g6tjMbdghkG3uJA3cpjypUMd5FqwMiDOkqk1FQkpW2PAlX9Gfu/sWUGNUxP1bYa6MVqBajJCxXpKjd4hoBSxikqynGXZgIQ7/IOi52wypNDjQd2o9lRHQkGaqZMMeGAnB0VoTmBYE6/0O8IuCqeTgGs/cCLRzQTVZWRfDo/O6VGiiPFD9dmSzRZQHION0L1gLAkEErOFmDJhs4zDqQbRnP6zJ6ZNfgBhcC54k1VNzKBw/gk+1Dr9Jcl6RCRm0fif2+Xcm7jMUk1beZ3CRz45ZsH0L56hkbKE841ermyLh3H9Oxa2i8juaEQ144UCzLnyPoqKrdyzNFifPkil/9nN4lrM8qnTS8h+uI2LXXFxnHc1xagLEXoOsG2T/RQqaO3+DmCuQr06quga1OmySFH+7yGHf7O5ziO1Aqq4yPHx1BuR8XJ0n+bVJzYINiDJ7sPfvd0DKLxvEyWrOoLWOc2ndYapoii7JYUJ4SyoLSSa3/X9EaQ==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqmOY3hzBV/7Gr/mSJVerJQ/g8aZja3jsfNzXrKCjRcfrw==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZtVBjsJG80bJVLq+fx9tX+YpHxNfibEElfsbXphl+Fwhc8JVejod5WsTi/UnBkqGw==</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&PrimaryTable;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6ega8zeVan1YuImk+5uPc2lnmTmXk5ZErGDjFlNqM/pE7UbjYJy2PKe1RzyCQsrkOjy8FJ2yOR2D+SnokiC7nq0AAU/CaKbnaEzLl4ZSSyklmiWCmKP5Mwqz52z7KUTuIWkeywOvKol8X1eau4JkiuZd4=</Encrypted>]]>&PrimaryField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egbXlcnVjycHTEGj8dEB9BdO0+ILSpea8MmydomFVQqU8cVLf/AYYpeQv0Ne3Wef7YgtOBQ5hpKgbXdh5usYCQnQ=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q4kqqmDtqloCaBmCcPI5GItV3+LHrj3WJwpt5GbmiOEU89HlB+6ZoIryw4kwsDR20hacPUp6MTwmdScrpIHYKmrJ73Wmd6m7oNlh0Z/XXXFygerZnrN3dEvCfXW7nQi4g==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTt9EESOauat0Y4BNLa0wwHtwtyePNONWZ3njiijbxFXzReKCOGtciWdQReHT0snB9Q</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezV1bmJut2Cv5gAuG+3wf8DlAILhCuC7jqlhbmQML9oVuRjkUOzPWvQRw6DbahLvKGr0Qx3AGHkarakWeAdS/x2kAzMtYxv5Yy2CZOMWQDtRJZy31pttguw8eU5zJWZrzY6xYTF2olmBT7i8J50LQKhZ8GEvDAIe8eG1F4iCmyxKQUpcwfD1g/9rBsRCOAknLtVdXPDh8BV5F8JqeAtP4axg==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwxM0HmueXuUjKRfPfQofDQjfCJ7ZsTY+y4wVhIYq40SFuyWmsQXXK3xWYu1EkRiuYxzYOudu3/5yiEUTwGPaePEMt2H5jgdS/b4SbUYC9C799IcwzVWuZEEYb4QGPtZ65Mvo2rYUrHtZ8w0qcCNg0oW3mWmdt/PzPqFoCROJzo7AltPEANRURyd6pJz6UXROyrLYT8FnW8/ueTlhOligi/VNlmZ5MCTTXcseqjhI/LcoeT2iqkOnPetIHAfDU2CCc=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7ABukuY6DvlfxNt4KZIZGHTh1Xb+LkkVdIJQwyOS+y41XIVQaB7MJfhiEV1PtyUg3gEK8KXROOAUGqxgNupPNqa2vtad/OjWMzKOQASOUg5NQ/dvdIIIftiE8q/yJzQ74cuZABninbcTp3kMqGUpoEMrP10FWbcTM0J9qCVPI67Jp/y3ERNzW2ArkL5FrIInrvEhMq6uVeAYuX0y7rLYGTVcWgahN/0bmJw8RYjcKiwJ083mcgK5TgwYweQWKdPL7tWt+2DdlNZUFPftnuoVRm3n1JPJCTb3ctG2srtCip9CbgX0CYFuD3n5a0VEtdCLbpnkjJPgnis1v9inajmjwhKdXlqVnF4aIywsb9HlFsPIxxBn2wpvVdTD1EHH0VF9Nyr2alJQM5C3NjGjmXHeA355QP9nnpq6gk2F0MnuUxwq3nDazk/LhVDWni9MI/KW4XvrQ0JEclAr2idEgblV7iKDNHD6p0AX8F3+6q7vKPZvQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WbYDiTy2Z9/evnhJfcpncQ1+FQ8R9rEEhyl9VBElnk8GXm8/fEqC+blAItt1STM5QC76I9dcuwe5mK79aTZQ3kBxxk7s/sJ85BP2QwAxeiUshOwuXk45CB/aJMBC7FyweGMxOpFUszNliVa+8EGDlDXcOC68xMUSexLz8cOTi7rj2Wwr2HPgHkgY++DFhdLlZ</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/788qDWXSe3nRGkHfUySHiFdD/Umt2z4pd6kOg4EDu7TKdkX5cVb2lMXY7LNKPWqfOBw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOqzvOxB/3zsmdCGHSDm/i33AfssaUkg6RVelNIjBxr24sqNuBXBgtgC+y8wGpvFhAdcdHJlRswUKP8YUEr+5QvwP+AP7QfMxVKhlg75Mtb7iAdPvADe9JmwTP7WWRJNxkMWgwAjf7beczUU1uQsEhMXoHHfh4q0hwcnUjtulvVWvoYMC0XAG3dcPA26J/q0JeqRwbWVdoajmCoTrsAG9yc1VvKJgpbQ9dRriQ5Mz0Z8RxYTEcSOMMBFpAuPS+9sS0jilfIt4jeVpre8N+5iA7nD7Br6ZpPRHiRcCEQWZTqlVxYzBHtwSotywZ56Q0kw/DY3npvi5QXu0WxdgtU+1yIKHb484ZWPlCQ3Dbfc193WZWn9fr37+FHgiIKC3zQQMEdbKBaHTlN3D26F8ExrnsbEXXJjxhb1XNrfx3SxpCngRpzuNR1FERPLakBzqnszlnlsVy0+WgE9pditYgdUr9LtRLgzOR1C8rs6ode5c96pRGqfLp2tJ12bTnoHhEU9kulSOGorSKJfdNuFTwHDj5LQhwnaIT52xDTAPBwJ0rPEHcrymb4ES5L+xftuJ71ih0H8dCm3rDtZ6ZoOseANa506n0D3/Q/v1D9Xl0ZFszXRg4S0a+u/FS8395tCkza3pl7KRYC6NRk4mlDQkL3RQO+pSE81LHqFzlTI0NqSAmSHSXj5Qv5zjCJpx4FOUlSsV8=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b2z+pkwZO02SBp7OVwDNfWMHaX0HLWz0vKYuUHyn/pLXM4QtjYR43JVpzSddFqla8LuktZ95ir9Bx1kMEpMtEuT4YyOyARRh2ULw0OZe6HCXaWXA+vO6fYNeMObU1YKQuDdePthP4qygQwXWQlWC3I/q0+56TCtA6F/lpluNhkCOQ/76D76/3I0ZBUMq6jQ3UKs1yBpDU+YfFOeqiOlgvqYdnOANBtqbH2Q8o2RJZ8oDLYRmoFCvm4kIEi16XIRKpdZQHqz3Kz4vMJCeW7/KKctxUkRsE6VaDiB9pmFqW9kQzseiPZU5/xmYCFHPquXIpAso6k6UK3HAp5S1IynBgMWXmLTBVm0nLSbSuq6ETdtKgCpBQQ4xw+736jTO+guolLScCqtdqEMtPdgaIa4OZruH1mQI3N5QfzccuqH7AL8ukCMH+oB21hY9fE5m1MFVNCttB4YvnYrnCISl5EK1VXnQHF+CEGxUu2zlUQBWjPddJwU63XBnSIa0tLMK7T8CRiaxibuSFz+bR1MWjFpMd2pgS4d93G5aax4paVapNZtz3y8GJL7rXYJ6LeBFVTMkwgUbzrMrHT0KfN7XbeAbrS4/noWgLKqMcuXOibaA9XGDKeSj+qoqdyffYo7jDdJBSeZUGB+cjytau9DGnOb26iyZbI+sqB5RJkGD4vyfoukDquf5i9s9xcKI3vNRhTJBfVsjvo7YI7Gqqgm6/4flr68v2OSJX33A87WUZa64g8yKf8BRcILb1LLJPiY+KP8Y6Dz8qJjtsvEqNwnCoOIUo8xlc8SaRyBG9vJqTiigaKARoRiXt61oZlleJikynF86qBCJkjNxYEM8mK7J8cqwugUAdq7v0X7/a7b+m+8mNjIhy04qyACKnV/aTV7LbRvHQ==</Encrypted>]]>
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