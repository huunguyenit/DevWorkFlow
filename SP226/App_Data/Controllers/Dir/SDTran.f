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
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
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
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableSDTran.txt">
  <!ENTITY EICheckDetailFieldName "d22">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2hZ1CFitAVIu9owGWkZ8Phq/MTNyKBMB7SS8kH1Bu8G4pOnQgOZBaIiTd55c8Xoy1weqD8Enr5TjQ0anwPwFd+59D305aqi7PNryUgI8N6INc=FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCUlwF27PSdEQPAZpGraAxLnbVniHkyrfkv1kdwnsZ1TOaT8cNfoimE0SFfs6ox21AEmyuYzxraQc/zmoZ9yla/y31ViYuYNlleAM+EKd+FLre0Tmb/M4dh8kJJ0kLwtD2WzWailB4tGOeg4lbZ/MVLA8CzwJRfv2bP/UAW2y03UapZPEeGCMU4JomtTTMTrvKg3FmmYWSECY32v/IaS+ud4XJWMfLf3LN86ZG85JiaWkMxLD1wv3YWywtOX2W18IvXsjP+eOAOias720USZuztMPooAx1is9EDpE32IOQBOPa0rEBYpLrtnjYypb0KDQ55Mu9W8P6lLnHN7KXBU8wmDy3AZoH33NJjZDmaiA8UWUgDVa/3HPL+JLWxjSiHjv4KLx26RdScjLuztrcZvvVHA==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyTAmWuCWB4INidmGYvYmu5igA1UWAVunyXARwbG0jjbf7dX6LtuJQwKaOBMmx0Iw3hFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKzka9UFN3tzIwJwDvMSNuyIy3tcIvlsH9Y9Wb0XrMfJRE/8ZsJuGvFcdh5jcA8BHUern5RPsOEq/3aAdO3i2mCtQlQgFQa+paPytclAs/DquFdcDpYSx2wAyMUjSJXZ3RzSd0ull8SOVRbHfxL6Zn+JJmhksxufMMklDLY+yxKN5eh2/ZOUsn2xP4S/bT5bb97W7jPCGkD+9k6VyL2i8EVitXalw5tnn8RDhWbXnPiEELAWVEzOMKd59cmrylO1uX3xgwY5W3Abzsl2aSMRUm8w5/qPEIAkRr9wHx4VQzqewrQuxcVD7JW6Z711Vu30K3IkDhLnEzFtGtUX5z5BR7x7fH7y8/RAxbY4yV1MMu5lAnKzQ37Ph7ZGReEClUT4gdm64jIJb+IV3MHcT29TDxSZIPmda/tmAc+jyQJgnN2ltuye5aAFBnI9CkRjLE94Hek=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXgKwCFc5484n6cXtYK9wzrWm4/7jLmuVKn+QtLIfMCPVWoQRq/U0C8vji6Kbpx7K7whERsIdVRsfA5423hJ5pIQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUgsaaljcrmbRRWUIROPbd07btCHKfw/D7ti1ncIlX15poQi4iZcjcM95YiOX5VbieY=FastBusiness.Encryption.End">
  

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
  %Extender.Include.SDTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m22$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD2" type="Voucher" uniKey="true" navigation="true" replication="8" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c22$000000" prime="m22$" inquiry="i22$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1  or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người mua" e="Buyer"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb67k+TwS2dOisllXXCwNXuWzo5tPV7xyV6kFJAFfSb7XDzFuaGtC9HKwMHG2uN2dMQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct_hd" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" disabled="true" filterSource="Ignore">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri_hd" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" disabled="true" filterSource="Ignore">
      <header v="Ký hiệu hóa đơn" e="Invoice Serial No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" disabled="true" filterSource="Ignore">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" allowNulls="false" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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

    <field name="status" inactivate="true" clientDefault="0">
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

    <field name="d22" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="122" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="dpb" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="122" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Hóa đơn" e="Allocation"></label >
      <items style="Grid" controller="SDAllocation" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="-1" inactivate="true">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
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
    <field name="dia_chithue" external="true" defaultValue="''" categoryIndex="18"  maxLength="-107" allowContain="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" external="true" defaultValue="''" categoryIndex="18"  maxLength="-108" dataFormatString="@upperCaseFormat" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_vtthue" categoryIndex="18">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chu" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
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
    <view id="Dir" height="182" anchor="10" split="10">
      <item value="25, 75, 100, 29, 71, 29, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101--------1001-1: [ong_ba].Label, [ong_ba], [so_seri].Label, [so_seri],[stt_rec_hd]"/>
      <item value="1011000000-1001--: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1011000000-1001--: [tk].Label, [tk], [ten_tk%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="101---1-1--1101--: [so_ct_hd].Label, [so_ct_hd], [so_seri_hd].Label, [so_seri_hd], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="101--------1100-1: [ngay_ct_hd].Label, [ngay_ct_hd], [status].Label, [status], [ma_dvcs]"/>
      <item value="1010000000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d22]" />
      <item value="1: [dpb]" />

      &EIViews;

      <item value="1110: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="110--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="110--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110-1: [ten_vtthue].Label, [ten_vtthue], [cookie]"/>
      <item value="110--: [ghi_chu].Label, [ghi_chu]"/>

      &ListView;
      &PostView;

      <item value="------1-10-1-: [t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="---11-1-10-11: [tk_thue_no].Footer, [tk_thue_no], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_no%l]"/>
      <item value="1110001-10-1-: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Hóa đơn" e="Allocation"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 100, 337, 216, 0" anchor="3">
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
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IK8KtwtC/XnV7Uxx7iHgvzDxfNtboTAXnrmm0jwYVfW1u37u2HrxC9SuRIBlvPeftvQg2/rWwZ8od1cRYaCfKkqz37Dg313PkBiOg4916hx3XVmyOyOknLkdKPtpla7EqA=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcP7eWQJ6/lNP4V3ts6qudRNhUTK9o0xA+EOGiLbeJrE7XbTkjwzJPXBU7XTLg/2+zQlcjL2wEbglaT+9uV2f1eczEaqci9FHFUBoKuDaOMGA==</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKhX6H40aaW9NkOV2bjNilvNDH8228NWneUK7T+o9a5Brs3MXYoqiYHEkVGH0MbiZC8JyZe59q7kYS7cqWbJSIbzfeqvt6PWz4AP2jn/zx5ydCYLbqyfHVONM8CdDYgGTaUp9x0FXwrqdR6IXITOyM57n8c4Wl9iAwX6c/hiNeywbhmwDDZpeL/8jGMtiosno6Lx1zPc+XHttCfYOF6fVYG9GSKrfX0oxZbDF99lnfr739ig+JWVDldp/kDfW6gSszUWxzp6vWyxEyhAWxeKD5wArt93Jt6XQ9hE597zyHlYGQO1D2k51NwIlIR1PMAnbGTKuTcT0xLOd/7AzpQHSAofIDMVdOWStN0ItyL3PYrt07uDo4t0NWfRTEKPFZ0N+0fdfq6CaVj2Lk380jQCTRiP0iDgRZhmgCHPNdRdfNrvTq3dlfKPbNt5QLSCwpQybw==</Encrypted>]]>
        &EIInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslIgwbLnW5cKFID5srurvzBTPs4Wwmv1Pgrltr9aQ7fO3TmGU52SdkCR73J2hfiefhXGVNqnNJVc2ulPAdI74rg1MW5mIBl2ox1JzOlaItqSA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSLOxuE5xjNyWKuMXw3qIKxazOHS1f4kT+fpCDUyJL9TxFNbEQJJIDNN3uI4AY8vrFcrY+3vA+FXndCxwgvw0x1l17u5RT9b1ZWgyHIfaItx1gIPpP1WS62EzIaCzjVTic4=</Encrypted>]]>
        &EIPostInsert;
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
        &EIWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFKTHs1Z7bY6Fyvqi1fEyutsqJ5PfxwcB4PRb4njCdBwT2UHG4AFw7aismGx4Buis2</Encrypted>]]>&EIWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuweLSAEr4uGEV14yqzh4p9gR0tNejtlfSi4HLFAgIyyzpSW1FlLpUkyT0EDm7avinthe9PxlwUlW7jqB7GgW84JYIwEIPqor1gL+QE+Sz+H0Ei8dcUtDJiCtljwrDQ8eIibLGHZqiMBPPNChXJLwHHSYgOZ40YMSYKc5NeAOEOUvoNj6c9Uzc7KeYYKoDyhUcVYBRPtQ/i7waMRWIUjGDMZRdbXROjOQNfTqgseq0EYsputw74tvs34jFXU38z+tgA==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fd4o2JmuVZFR8/oZI55xFjcsipe+hTgf6KWEQlpwFqa+ZmJP+J/328nWcSbx2k2jlZb5UGfozNdoBBrcdbssHmwlpddpp/EGsYqs2wTQhsqm4sirTKesjOSvKbfZ0YJMXlcfo2t3ltV98wqaPYpqWdfYywhx50D/px6HxEYDYgJ/d07t8fReqd9Gqc9MlsQdJZbSdFSfBmuOHfk7U7fR3j6nq6P6HnevcLQKoPIdqsMvRAAdwWSn5UIRtfSWlNADsrAjR1aN29Cvxh7B/zYv/AhqeyVBbHfC8E+PwTMY0xkIC+tJk0rm9w3i7MOXq8Z9DtWa5AdSRvJIPfZyMtpUnQ=</Encrypted>]]>
        &EIPostUpdate;
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
        &EIWhenBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR30+ASx1OchVBTzXiFuYubccem7zc9vWQI1UiaBlk9KOGOhZ0GS3bPvNLpSRgiMBRA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblNpnN9y9Grc3kMOCoU+lYAjqxwCVc2WuKf5E4m3qwd5uVUjS3dZbjF6s6l1GCG0KRvHSPC3Wv5USVMWH79URW/WINWxatAOEJJsPFhFjbySA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CwA2aig8im2EbgiRCHSDl+x2CCjQJ7vgZuRLoDmKD5YF+bku4r2VAxDjrB4vuMhke2yaIiDijl8Xd++y3bP8s=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwaftZ978pvezVN2mEO/7PCZdCOLK4ffGj8iqpACKeuL9CkIkJUIn5idnJLQZNf9jQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &EIPostDelete;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByt5P6WKvXiMtyStpItKI5aGqsXDtuh2JxnhvtCx2j1B3PGNLp1dg882e9/MKmq/gTZkgvHJHw6l8zJDEEFncuSjTOTqZg0oSHW7uGl0gB5ujFfb02fWNooLCuNWRBBDFIw4u/TTxXmBx9wDSzQ/SKl6bEzXcA8oqmWEGS1KAZbuDhqx1aRK78mpp/zjhRN9luNUGnMTqqJtNEGSzo8z03L5jQJVQ/foIZYDlsf5hYsu8NMvcFyxDDw3teWIazuLriFirt7Diln+gpfFBxDICRZLgIfLctfqirdN1veFLQhAS6YulgYvnmlxqOloLDk5aEfKopZevcU6GTfUeEB3eIqlagqdxzMP/WFLG1k3V4jkuuIWaOD7gBsaFpno0S0GuwiLOYPBdhCy5U4Xh4hbGp4J51TROQjFga8DiRA+b6dyHwWz80sWG1K6ebSOsto/Lmsm5eI50+GnvkY4Sy9zK4dbyXyGpU2LPCdhL441NkUwY=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
        &EISetAuthentication;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxcwvJojyiCnqZOV0nBAexsp+qk5qnvs8gJtDlTchN0EGw==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkcaCcsvJu22Pi+AZMfxkPyG91JBm7hCuI6IG6QkHwgailUFQBUh3S2nb4v56zADrnORM1Sjw1qQnTaW0kK3zmqs=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezdVo6uJHD0oWkWs0dA2BjAFDyzH6a0A4iTLUEr0CSr629qW/iC7qqa15EIUL0543RhRsnANUeFS996pznQHs27JdLp5VIuiKT012J+WlM+B20VAf9J9SoM6reErNUzz3wm4cyhQwo/x4bsb9HIn+Rquk5d4GBeEvR83YPEQHqvjNXD8D93mj8WdSHPsJp4XhW9+M1uzfqPnYF2iw74btTJQ==</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lFRpHV5pvtU0wgePveV4Yy8zCG6rBvfvSEJjUB/Yi8hy2JiPE1V2AldT2XmOXYEMbPXCdqytXI7HFoKjW1Dpq9vIzmFTdVYZEsO8qIkeWjmKbtl9WeElKUskOLPMMVe06RKmsSomgczoYZ24nQodrViu8Gt+MjcA0LMGeiMqqaGIdAs0Aba2d+gQy/R/OSR9o3THLk11YY1Z8H+7d7ebBPsLkrxUurxDc1Qs/yrFiARdzYPK8bxJYsk+UmFJES+tfgoOLtrsecuqESLo+AAAt5ui++/C53AwxzR0jqh9X49/xQ2C3j0rPBq+T0CihQCv6vMEBjDF7pVS21Lp+1ZFTVCnFujMqmi3oSWVLK3awkdccOYZM7957gqWtyY+1rEFNGuq6O/h3Ep8S34pIWWZXEfARiVZiDQzZLrmox0mOz1TncxWgz8BFzn9Lr0N+igJLp4+8SeIz0b3pQ8BjwtYUnTRGKEfw3x2deb123IrBAn4=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaZ7G8LenL8kObymL0STREZ7GAwIEW8BlIs3bVRTaVItsjvNI3/QG5p9hsrQGqW52dQRZnoIXm/HNDzm2Gi2gchVBVSkrHaxLmnH85G/sjODo</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxa/BpRUQRMLeU/60rDzmYaGf0xKldNJG+yTIATSy6jVTwq2Gl0D0qdvkXFMfMPzpgW9f4IaJm3KzxCyM2cA65WO71DfHBlGweYZojUIzrbrA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V3XjWCQZPGbZtdeJoZXocVbe0WsOh/Qsqk0Fvm4DOFpSUX19pRHcunjJgLzd0lSJSfSqqjWzzqSqgKBglSgDITLxje6JoS6aNF6KyJdBicPjMFIMiDt9HpzHwdLrMpOgPog369v9mD5/jh8VfmOUXcUqzF7BbuLXjeWGTVtVUaBr3dIXo/0vvuQkauPjvDWSCofS7k33yTtzrPHaVWJSeHVpihmGZK5gurApgx+47ll/+QdGwgXi+0YqWKy0qroH7ADaKzhSKUST/W0WyQegskcaHrLGLZXZY7wfx+j610/u+fX+767pY1hp+jNsmhi9SH7N5rV8iYp9PtpbqbLM0wq4W6HYMHX7TMSqdmbiEWvGb1Bsj8GRujKRxqiZ3EzOpuKQNDuRIwJE0F6wOAf3HMylFC1VISkOSgjJTD5pq8r</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEwiLqAW33fGydMCUSXpL6O+ihH2x1KwAOJ2BwQqf9BphwsKT6bTsRLJtooCxCFy8AvymlnlcKnQc0/ixX0gh3DJidRAnsJrc0cz56IJlryKXhYl1qz3rUA49uXg48DCI9Kj+OA14OSFcXTvd0eW0emqw9EjQ3+K3enRy1Dwtpxo8=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmF3umZO5+JnDuaS+LO6LgTaFwSwFj//tRZXxAq0MrzffRsMrXsL/E1kgrcWvkRJ0EVZs4OsKjWkmdxNlHbgJ1r8wCfOucP3hOe4vI+oFcp6nS6h/9MJVQv6PnWq1rJCmDA6GPWJuNpCud9gQ9ppDYahCILtuQRdw3Y7rMPqBNqswb/GglvVGPS9DRck1irU9KHJy+skceo6stqOEl93cg4QQaxivdubzcOSNlG5zryW1xzROk3BXXDhX1Ys/X6Wp7cx61aaBWDYwpKVjirjQGcqZDb/z+4mvBlcb8EpBkLvjzyNxQzVOGiCar178fDTgft7XXjsxklaPntFl6A62hTXBRAYatvw8rmOfJXHLSdy/Qvz8FK+VF5EhlkFUrSNkm</Encrypted>]]>
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

    <action id="CreditAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgCMwtbQhe6nd50EsXJrwXVUDT1+dWSnwNZyjFlAoreSUUi1AJ9OUMjRgUxxRpcDRIUWLOBZz0kQuMZlORUYxq9w==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>