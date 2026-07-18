<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % CheckSerialNumber SYSTEM "..\Include\CheckSerialNumber.ent">
  %CheckSerialNumber;

  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckSerialNumber.txt">
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
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableVATran.txt">
  <!ENTITY EICheckDetailFieldName "d42">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2hZ1CFitAVIu9owGWkZ8Phq/MTNyKBMB7SS8kH1Bu8G4pOnQgOZBaIiTd55c8Xoy1weqD8Enr5TjQ0anwPwFd+59D305aqi7PNryUgI8N6INc=FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GGwTOJ9VCeMUWcp0tJc1n+hKCiiv5WtKsb4DBVwrfD1ndasalc2xdpqNqOAf5dR6SLNlEXpvZO24E87bSCxawvxDR/hCxyF2yOcslddcktBeFastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRUrGtEO5gRQksDG6Qr2zbn2Pq9nyDaCo4CrA8OT+tGjRlAUKuKlVM80LXHD+ytGB2jjV7xGTQUESH8/JMd8MEcDRcv5dVU+h9aXjN9UgCpXEShKrJQSoG4ZSDq0jrkIpK7CGyPGwmFELlGFEKTiD0fA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKzka9UFN3tzIwJwDvMSNuyIy3tcIvlsH9Y9Wb0XrMfJRE/8ZsJuGvFcdh5jcA8BHUdrVRY0RjAj2ngyOy5kVE+xyZCQk6BeejujuSEBWwvrmhMTziTHcrB7gUm/UINnRoqXWbcQV+F9bIVQbxXTV/xCa9HPh/pL7PNVdNzWyf0GO5/B9IT2HUNIjjjjyh+ImuqR7Hzf6faLVoIHa9qxzWFp9up13jklo+2ebMqZqkEbFMBtFkQCToXPswogqA9PJqKZfvQbzYhh9pSNOEX77msgVBxsu/RUpdlLriFFzMRIK2LImAaPZrvIyOvG4en6tZbAmL9JWtEvG7smUmpCx/hO18F6+NTw9/a+eFD56A16ZqbSHb/19IG4nrGkALOJkiyOwq52pelicE++BkgNlopmJjy/ZH6j7ZTsAppnq1OlaUDZGbDWzrhKHLCWLIyPeIg=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXJ/UdJafklGWFI7vbXICXEzR9a6XyFfgHzL1SgMqqn35czf3UC/XXtOu+4i0n9Rsg4WY4u+l6X1vaT4MARH3mHF3wZtQSmOzxxHm4fNMsMq9ZSD4Y+/AouB73utPLz6BDKbyCJAVrz7erGO54kbFQOQmbA+gLg8DMVfAQySr1Gh0I+yxlkNZJbNuzv4YZZ+Gk=FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "@$ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@$ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.VATran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m42$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD6" type="Voucher" uniKey="true" replication="3" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="m42$000000" prime="m42$" inquiry="i42$" field="ngay_ct" expression="'000000'" increase="{0}" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người mua" e="Buyer"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="tk" allowNulls="false">
      <header v="Tk công nợ" e="AR-AP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5YY8x8nj+VPSBWZl5VU0MqAtjYlrQnM+K2orqWBPqy4nMR5Ji5T20Sn7ludWMuH8U=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
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

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d42" external="true" clientDefault="0" defaultValue="0" rows="144" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="VADetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &EIFields;

    <field name="ma_nvbh" categoryIndex="18">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    <field name="ten_khthue" external="true" defaultValue="''" categoryIndex="18" maxLength="-106" allowContain="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chithue" external="true" defaultValue="''" categoryIndex="18" maxLength="-107" allowContain="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" external="true" defaultValue="''" categoryIndex="18" maxLength="-108" dataFormatString="@upperCaseFormat" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_vtthue" categoryIndex="18">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chuthue" clientDefault="Default" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk đối ứng thuế" e="Corr.Tax Account"></header>
      <footer v="&lt;u&gt;T&lt;/u&gt;k đối ứng thuế" e="Corr. &lt;u&gt;T&lt;/u&gt;ax Account"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="204" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0"/>
      <item value="110100000011011: [ma_kh].Label, [ma_kh], [ten_kh%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--------101-: [ong_ba].Label, [ong_ba], [so_seri].Label, [so_seri]"/>
      <item value="1101000000-101-: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000000-101-: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1101000000-111-: [ma_tt].Label, [ma_tt], [ten_tt%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1100000000-1101: [dien_giai].Label, [dien_giai], [status].Label, [status], [loai_ct]"/>

      <item value="1: [d42]"/>

      &EIViews;

      <item value="1101000000--: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1100000000--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="1100000000--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="1100000000--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1100000000----1--: [ten_vtthue].Label, [ten_vtthue], [ma_dvcs]"/>
      <item value="1100000000----1-: [ghi_chuthue].Label, [ghi_chuthue], [cookie]"/>

      &ListView;
      &PostView;

      <item value="------1-10-1-: [t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="---11-1-10-11: [tk_thue_no].Footer, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="------1-10-1-: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 9, 120,	100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="2">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmS7r3TUtKesc3VsMI1KRQsZD0AKy8Df4k8e58cmQPkYdkvEK7oDOLTt7B6qJIHQuqjknA7RT+ZEHicddLf+cCtGcYKbcD2qmXS/MWsTP8Su/M0uP6UGe/TwuC6JOzCssY=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSLs0bO1HJIAvHofjlKwNLCF2pCFgbC6lVkVhtwzOutcXBZMx7RxPyDGu6bdMQEbTH9M2yXpz6e5gZ3/YgF3N+LCUTet8l6Joj8oQW0KG5TO</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &ESWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &ESWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IK8KtwtC/XnV7Uxx7iHgvzDxfNtboTAXnrmm0jwYVfW1u37u2HrxC9SuRIBlvPeftvQg2/rWwZ8od1cRYaCfKkqz37Dg313PkBiOg4916hx3XVmyOyOknLkdKPtpla7EqA=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcP7eWQJ6/lNP4V3ts6qudRENi/6i5b4tXvDYs4B7TDwqcb0zQP5PCq69r9z57/lb1mmsYBl5NQGvS3VOcU+/fX</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKhX6H40aaW9NkOV2bjNilvNDH8228NWneUK7T+o9a5Brs3MXYoqiYHEkVGH0MbiZC8JyZe59q7kYS7cqWbJSIbzfeqvt6PWz4AP2jn/zx5ydCYLbqyfHVONM8CdDYgGTaUp9x0FXwrqdR6IXITOyM57n8c4Wl9iAwX6c/hiNeywbhmwDDZpeL/8jGMtiosno6Lx1zPc+XHttCfYOF6fVYG9GSKrfX0oxZbDF99lnfr739ig+JWVDldp/kDfW6gSszUWxzp6vWyxEyhAWxeKD5wArt93Jt6XQ9hE597zyHlYGQO1D2k51NwIlIR1PMAnbGTKuTcT0xLOd/7AzpQHSAofIDMVdOWStN0ItyL3PYrt07uDo4t0NWfRTEKPFZ0N+0fdfq6CaVj2Lk380jQCTRiP0iDgRZhmgCHPNdRdfNrvTq3dlfKPbNt5QLSCwpQybw==</Encrypted>]]>
        &ESInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbHPT5TRnv/dJl7GxWRULG7Vef07ohx50idqkCtNA6KiWyqdpQwrCTCvOSKlWJlFk+J4OklzxNAl2W0+aszG5mjiNm8imnIT0miaPAzxpxevuQqyCeZHZvUG/uzHT6OgkzUtkjaHr9Z/CPubcsNp50kYBp9Nkb7gYgQfx93U3nSQ+KHHiVCGjOJ0StfbQIMDdj5m8yGD0dParp5dEYLS3XA0Lo0KrBd96Tkde+6lzoHqykyl16flwNkk0cK66uYmH7q10oQfByW4f6uIDpa6C1x+BjhDNmkDfHbBc9J/rS6hIaK1nnTY6sCCp8dOlcC8tu</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1omhPX4xEMFd2MeqGWa8bobqYghP0v2tyc/aoX8BYYiek9wKmTJw4u2iK3BwR/0Jy9ERjajGym4vYw56lh52CZGw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSLOxuE5xjNyWKuMXw3qIKxazOHS1f4kT+fpCDUyJL9TxCBJMLOi62Bumwd0M2t/ut3vjnrw9v0lq27/Nrf7gyhV62l8MJMpZeYtwhRKBRG+PQ==</Encrypted>]]>
        &ESPostInsert;
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &ESWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNRN81IcV/QH39h4gEcVG96Ev4S7KbGIa0p4PfZ/fmWoDA9L8WUMtt0Gd3BxErGSjJtteZqiurKA2cAHvVKnwrabwfPDhdmHFDjyRPTJvDgCQbnBh8l00Mpy7iJpML3DkUzFhTI98vNprxYx9oNykfwjAUP+jNiGEhmBmH3WTY5n+as4soK7Eb6+C0+hQaiG/DpF5ni+G4Ll4eA7PJg9p34=</Encrypted>]]>&EIWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDn4cktUL2HbIpCFRYqr48np3D3r4wtc++gMu3p/eDKo6z0shqHpUekq6X/5Km6eY0AwIcAZMmlu40ug7gQF/xfQUD2+Sd76O1IxwyycmK8nEpp4jBhMy2iDlVW3/j6kKG6gK/0JkxuSzCDCT4c679c3Jfd3HdydUPFNkOuLNXbfGntJcIh9NOyibcLqR8MaE+eMwy38ZSbSMypcfm+AGzWL7lifGvRXYedTriy6CzruQQ==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QRj3CioM0ISyWP9UqA6TlDaD+WyZSVgPXunXzKh44SGRGWIoxXVUUgLMN0HxjiTMgBq7DGVm8md+KgD8qCtTUy3535o/Z8E5PrB5rmJRMD4iq52DreKpFCllq30y57GbJa2aKdEv3wOm52ohSHmrsXyA4xsEmniF1rG7rwHZpDHqEsLtREn2+bqwectr5+S/OcX0YvPOXC3yfO50cz3c1hM1nII7ksq34nMD65UQ6SSAnX0ivtOGQknZTuwLPj2IExfZ4f+gwsjst0SkYLDlCmSrMOiePd5xp9NX/ptTAOm</Encrypted>]]>
        &ESPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
        &AfterUpdateCurrentCustomerBalance;
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
        &ESWhenBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4aj983I4Vskvj16hpvOd1aEFqVQRGIx1Ox6kouHXPh26MWikzBWInUOSo2WOBoiEwFOryaMotwR9Vsg+MGXohKvwYQBwvF68gd72uvoqeh/GlkZY7FHkVvCT7XyN8a0PQrcxBlGUR+7jwqiIKKU3Y/bx1Z9bs0NTEkYWAuSb4P+I/RTdi8cXkRgJAjcHSeBWyxLCuDUJ2194YQE6y288Ct3Iug518RZdiC+ewtg4KUIEblp6LocOWgyLORZos7fI9h/9d8fMseerTfO3RweyxA8wswN8R5XDutMDOFpxJmORi5XHjJ3lbM4+a/XOFCeuQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblJQedj1RzaFKs8VA34X//DiLU8qQB9waSSwRrkxLh6UHfcl3N85TD9pnY0CZPtgVo=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw5Ne5uGbXs9AFL0LrpnzxpDgXHWs29zxn/ffxhUILOMbulHvQ0CIes4DzzpiNTnqQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &ESPostDelete;
        &PrintPostDelete;
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4YK2d0CoXIf775oxDKp7mUpy49ZIlRYyJvGFprx9yjwMK8tQHBQvohFJpdJEArsduyl94YRHwarzRXwVNY6Y6j5D5JzYFWYCFt3Fzy9f2fbPxGUUEVfOcWshlJ+b09dvxamGRifFvYoOfrGNKm0u6UzkxWaIyuuHwrpNelE0NNwJdA1aRpDCuLgf9VN+z44xLBOFbmllX/qU6Nehb1nMPlBxCSZxyNtkW2sYpeC5fxR4avbLcx9Sy1Tq0aWoDYaCMuu/oGzOvakJIxg5ZeOEQH6pVIJh5pNKQ061I7UQpOnnl8In7n5Nxq1MFt7j9tKA06jY8+Fr1igc1R7HXkF/XsAeBnxlA0oKptxb/rVhzpPCPdJczkEldP8SKBeHG0p1b6Xhlq9ebjMAIGbDukiIHjMlt1BZHZYD2RPMh0NQPqGtKlOQmN4yhUxUijJY0+QeMXxm54ds2d30EvkkJELd42JiQ7DYqksMcdATp6r0sV1YSBKIPH3V+ZUMgPk18mp2cJ3iE7omqp9IBcV3zj1cE3qYYoadRW60qRezl6cj52f7/W57jNE17xdMcCLZ6L3GH6eZfmv/rTZYG51mkDOyTwo=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
        &EISetAuthentication;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V1X8YL7ryOuCCuIppKF8gqoDjGUw39cWJhJ5Rqs6OEKKQlHIFSKVq4gDeM+nX2GXqodRbPfpV64NKrwkaGa7IRvIniAfLtl9gYRWov9+1l65FHItmw+85mOSUJQRLibJtgSluKXmjabJEbEl4/nlysItw7wi4SXjy4fTTNGMyhhoPUgXaxV13qnlfaRAd5c7g==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkcaCcsvJu22Pi+AZMfxkPyG91JBm7hCuI6IG6QkHwgaiLhqds0c6pO/6aKs5/vS504l++uAoslmv2li68a8Hlmk=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtbOOLTN9gU4XF4U78terV0N1UhQtWmt0lhR3DQg05rEDf0+vXtL2bdNy02VIm7RqKRV9SgqnfbDXaT9Obz83tlQ==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezBPlGF083Gl7RnbhgS6iGWiKHmTzaYNaU3bNY4EL1/NeJUtMPeTGSmIyQeclUACQrXeTioXhppYsHAFlNX+vc7sKAjGdT9vADaz0hLMsFuMZL7C0wJT09+7BbL/T+iuR6GuDf3f6UlzZ0EkcyECyLrDlRmnWmR+lMq112xePre4mZqJmQc86RWuJD+yokAg23</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lo5t3iDB4bMX6F8Ztaf6n9XnSl770kQxHIW0w37wI/cfL8uXRcM3PGXMpDYZVE/U+/LfmWpcaHvUZGxAYQbSLIKDTmniQyZAsJ816sKEV2xQvHLihGSDj807Oi3l+WcYATcL6v1Q68tQwY9sSf+9Gvp4gm8E05vwlG7qYLCHpjxiMzPxF4ToA2Kn/e+zbAsBmP0BgfRvUg34x0+a9C4yvneN8ZlZaABYYk+XJNajGPyBmHUryplcSQXNrnaZmodGF/HGX7PJMgDamU9KENOHW9pcMtzFj6WGlDAcydpS2E8o8acnjpPZMktAynnd5RYfhKsO1EyfnzTMIkMTs2gXKPp8Zen5hk0OQ3wfVyljCs2sZkwIwtjM2t1ITOR6Q6cbLml8B1uyNcFZ+MTTRhBILy9plUS3LYjmBt8opJDVey+dvAQ9zUbDgNE5urXEk60qONLtvP1PQGN41Krsh0mcWW/IfSm6j3kPWGyt3lQOAKjI=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIadI8W8s1kqWsO/NpBKA87EBIrRktpaB+Tf/ly9SlVcK9PlNLkUWkLUD4p0c77w4/GuPKA/Q6BG9ENKoUQfyZMY1VG5aJXpgvzulosWCyTk3S</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxa/BpRUQRMLeU/60rDzmYaIUh7TyueyzS0RHi3e75xOxa+Weu7QrxPiDfYg2RIlciZIUS5vpEhKDN1+rdS/6UfQ==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V3XjWCQZPGbZtdeJoZXocVbe0WsOh/Qsqk0Fvm4DOFpSUX19pRHcunjJgLzd0lSJSfSqqjWzzqSqgKBglSgDITLxje6JoS6aNF6KyJdBicPjMFIMiDt9HpzHwdLrMpOgPog369v9mD5/jh8VfmOUXcuUDikrP77CEF+yRxM2R8G+2y8uvhj2RXbF34WnfHsQMtHjkqz4jAvAUF6esozOSf+teQ3T8aIN+QMC8JbD5aiO683RJvnkXE2CWWDvMzIqZqkvT9aoePkHRfFeWIn2aU6ToDQ2V3apyIBdy/BsZD4GP+G+DOZsWRHMleNUL+3A+1cIv5TwM/emCyu/Mi8kCAhDo2IxtgKLtTfDKY+3Ko5gly1D7VHBwNYP2ChpdFzH1Yo74ziXGUZGInXW1/bihue3e++Wx8Jqi73ynhSDeE3LvVsE+jq73sevIj3eg6WM/5csRzn71mx2GF35tPUJnY=</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEx+TDVopALGLH7qZO/fXJsbsxW0cVhtjTCfEzt2ewspjvzlgP7oSeV6t+eSofeEyVOoegeBCLgIDUiphLg+LLuaOzIZdOyyn15G3yYoBPZtAiziNd2jNVt9FviCoQkKaFRlBWzj8M57xuYdxp2YWhLg66FUb/ggQ+3aY9s58Cr983Ijew/MiwmJu9J3CnhRiAuwXRQr4mj3caAcSqSqsIGQ==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmF3umZO5+JnDuaS+LO6LgTaFwSwFj//tRZXxAq0MrzfdcO75FMJ0zHH4nzdfo/hpp1MiFbuAjNFJkPwkhuqPg3hBumoyUkq2nI3nQ2ce5latpLmLPpA8WmnALTuPqA/JzIdaIjCT9CqkewfR2FZ92lMAhRV+eXd1kIzJr450yWsKibB1ZaMHnFhI6L3xG/Lgf/ryI4ewrYp9BEW1h+1vCUzYqlMT/SpsTzSAPKQ41p/ReNI20DxcBT91WEi0/iFs4Ky11i8cdZFN7D7lA53mmSYylosYAFhvlwWqv/VEJHF4E/1Qn70hXVudR1DxDAvn+QWzIvUpWu9tP8rMCWCSZqiPKuMkUS9RvNdcFW/xTT/sbs4UcN3owxLJubc94qonpLNiQbs+Q0y4EFH2ScBHAfaRkg13ePXQdhVelVXW96WbSaOtN9oiySFVu3QDzs+hncAeSoa47FQOyHZwYc0ZflBKmdH1/0doma5J1uFMdNPZ4mf1ENBQh8ZBTz9n8CLsHw0OJdrfixMb+EJy1Qv0v5hR0/gHvbcquNXS2J4RaiTSDEiDfrpInexpVlL9lQiw9/okoAC26N0/x0gu9ovL3szYYuXwBwnxq209OCW5+l/lG/I08o/9pan3sZv8sTmdgJar6v3Hbz3Edc8dBe0Upl9gnPazhhxvP1zsRNkZvXR9iqqfYo+JZGWfx6aCCapFoeQWIVOISfYS/qqNxMY6Ngg==</Encrypted>]]>
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

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8vPhS5lLt7k6XT2IoXdCWeJ37Qbt42J+K4NzaaEIgwgQ==</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4anGmzLKQnuNqtSxOBqkpbpl2ErVOwttbA0Y5nr/YXrnx7esI+QUC5Y0OPGMaquC8tph/WdSshi9Q70kFe+II3AYKXpcKUMiZKg603NC827bhkDOKcqAnKENHVtI/zeqX3bgfx5Hldaaza1ocfwQIqg/3IT65TRJxMnzoucIzb6/</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Rl6rnBdXhs/O4KhrfS0vekNrZjHqubvjrt97/i55Id9s1Z43JvGF8FvLnQBXNvuMsLLZLx8gkUv4jRO54cGR37J6mYu6IvdRu1fXktxm7VaNbkQCf74pDlxZfgnoglOttSsom+U9+/95qGSPWvgyus=</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgoxo5lCpK3g3DCcRF84m6ggzocyC4SDGn+3Hmp/BazwpMt78HppONwRfu0GKyjvTRybeQO2NJPDhBSAEsZUKK5w==</Encrypted>]]>
      </text>
    </action>

    <action id="DebitAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>