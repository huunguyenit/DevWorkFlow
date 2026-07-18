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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableAITran.txt">
  <!ENTITY EICheckDetailFieldName "ddc">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxAITran SYSTEM "..\Include\XML\DetailTaxAITran.ent">
  %DetailTaxAITran;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY DefaultReportForm "3">

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2hH+w7xM0our+okbLQHBUpTrYgpH+bMMBHAArBV/mSkIcrs8EzLGfnmK4Pw88COahB9jY+rL9T7TELmC3ISKvJ3052WyC8qTQxIknF/yH/QlP0kOTVuTD1M0bwkhd85khu89ySiMzNN9iK/H5Ai+tZxQ==FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GOwxftOCwZ+3S6DEWe5WJaaeO8RUHxho7tSzN4duQ8sL2beNV28fODwxrQxQ3chANmrdmFxks7eDRIs2ZsL38O2UFgeTgc1TtHd8EaMzFTng27Jv2D5FJfZGx79vuQjKzrhoWzOHUvDH6IIx7b+v3gPt2rlNMnSMO9FyC/zpupK8AF1GWAIc2p7xZ7/i8wEs12YbZGGvwGzABmcVktZglTCxnPJmY5LMp7HT+i0NMAfrzNSnZw5LRUKyNz3DYlM1QAX+sVg6QHLjkxrQYOBtpYc=FastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5UHuUCcPvqt4/eWyRuSOiUEnud0CzQdcZrrxJUu76mg1gcrPfZM9ZdQDm4Z1uPb3I4Zo7W4s166sBBZhasMddawyVP4XNIg58kQLheIK4jR3ukF0t7s9MCMWh8mKTWyiTvhUXs0YQYwMITCszuvQKP1LzynwUTcT4ROKAoX5SKi8A2XrFNbFdcmdHZytFz0LaC0rPa7Q6c39Fh3T9kZsh88JmDeByAdTyo2CqVthLNLpyCKO2+IYwkNpNK4Ru+YeLw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2vWle/5uf7BOHOvrbadBROHRjrljkNq0GcsiBCHd36bVFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$a3ZxZDp8MeuhFrXoqr5r7peXt+5Kzlx9fmIXr2uLF74X41mtJKWRn1+MfDcN80F9PtgEtfAUPKVvav1MBj2xHyeNZyEflxj6YJ7l/pJH7QrnWU6vejj/XMXl5wcf7g41FastBusiness.Encryption.End&DetailTaxAfterUpdateMaster;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyTAmWuCWB4INidmGYvYmu5ihteEk1FWnmut8FEIQ09bRnn4NC/DBcOQmU++OhbPsLtFJesfpOezfw0WtdgwOALUhr1rI46Yt5rFgOjiceOFlqS0YZ94zHtHl+7RCOrkbRc3Dy7P/VWhdjX3Cy0mOEiD0kBKtWD+ioiVsYhdD7fxkQ=FastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcHVTVyMhZnlht0ej9o1SO+TS3F0U+mSCmWUriBg7i/G5wLZ4jyVds+m1bGJZDRsUFYoligAyrWtoFtOYOvMFyg5A5fMi/T0tlpbFrR1N51KholVLrRN6QAjnCjNVdHw9kQLGiDaO8/eUN3Dcol3lNpXL8q67PmqkRzcPsHE8bT36J4/fmqXnsAYMqb3I0wpuYEVbFbjO7nma4equSQ2bDl2Zd6+EU+/cJqGi6+vxIBEtFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3nfkoCEJNSYNM8dLPmDfa8TXdiCX7NsNkJwtZzZNVVjyxVbYIwBCG/+WBM141Wl4MvNyXI8AE/oO6zOWzCBQXpyZqHIbXYch7mSO1G1Gfg9Plu4Edyeo5OdsZVLONyJnLH2u9mvjlYaxTvb6MXLBAcb1/nUgqG3jIKBmMRQgdp5gIsA3ygi+VEPZqBZHXyEPw==FastBusiness.Encryption.End">
  

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
  %Extender.Include.AITran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hddc" code="stt_rec" order="ngay_ct, so_ct" id="HD5" type="Voucher" uniKey="true" replication="8" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn điều chỉnh" e="Adjustment Invoice"></title>
  <partition table="hddc" prime="hddc" inquiry="ihddc" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
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

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7QxxipynEKp/u+Cjj8pZ5Q+sqSSJZjKM6T55JVypyCZg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true" readOnly="true">
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
    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Điều chỉnh" e="1. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ddc" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="AIDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="dinv" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Hóa đơn" e="Invoice"></label >
      <items style="Grid" controller="AIInvoice" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <footer v="Mã &lt;u&gt;t&lt;/u&gt;hanh toán" e="Credit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" categoryIndex="-1">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7a3GQkVRqHv7wGuR9MIrGCPYkpzPJsbrsLjxLrUDZvfA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" external="true" clientDefault="Default" defaultValue="0" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_thue_no" categoryIndex="-1">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <footer v="T&lt;u&gt;k&lt;/u&gt; đối ứng thuế" e="Co&lt;u&gt;r&lt;/u&gt;r. Tax Account"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue_co" clientDefault="Default" categoryIndex="-1">
      <header v="Tk thuế có" e="Credit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_co%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" clientDefault="Default" categoryIndex="-1" inactivate="true" filterSource="Optional">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" inactivate="true" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" inactivate="true" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &EIFields;

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
    <field name="ghi_chuthue" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="loai_bk" dataFormatString="1, 2, 9" clientDefault="1" align="right" categoryIndex="18">
      <header v="Loại thuế" e="Tax Type"></header>
      <footer v="1 - Đầu ra, 2 - Đầu vào, 9 - Khác" e="1 - Output, 2 - Input, 9 - Other"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5ILxeq3ZPAxPL9gnrMQJoIFS4RUnUKbZTd3rrXw1ysTnYhB1Su6Uj/EiUp7gYOLvc=</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="loai_sl" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="18">
      <header v="Kiểu" e="Posting Type"></header>
      <footer v="1 - Ghi dương, 2 - Ghi âm" e="1 - Positive, 2 - Negative"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" defaultValue="&DefaultReportForm;" clientDefault="&DefaultReportForm;" categoryIndex="18" filterSource="Optional">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" key="status = '1'" check="1=1" information="mau_bc$dmmaubc3.ten_bc%l"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" clientDefault="Default" categoryIndex="18" filterSource="Optional">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1=1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_hd" hidden="true" inactivate="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct_hd" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh_hd" hidden="true" inactivate="true" external="true" defaultValue="''">
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
  </fields>

  <views>
    <view id="Dir" height="204" anchor="9" split="10">
      <item value="100, 30, 70, 9, 120, 100, 8, 100, 0, 0, 8, 58, 42, 8, 100, 0"/>
      <item value="1101000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110------1-10011: [ong_ba].Label, [ong_ba], [ma_ct_hd], [so_seri].Label, [so_seri], [stt_rec]"/>
      <item value="110--1-1-1-10011: [so_ct_hd].Label, [so_ct_hd], [so_seri_hd].Label, [so_seri_hd], [stt_rec_hd], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="110------1-11011: [ngay_ct_hd].Label, [ngay_ct_hd], [ma_kh_hd], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="1100000000-11001: [dien_giai].Label, [dien_giai], [status].Label, [status], [cookie]"/>

      <item value="1: [ddc]"/>
      <item value="1: [dinv]"/>

      <item value="1110000-1-10-1--: [ma_tt].Description, [ma_tt], [ten_tt%l],[t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="11-----11-10-1-1: &DetailTaxFormViewDiscountLine;, [thue_suat], [t_ck_nt].Label, [t_ck_nt], [t_ck], [ten_thue%l]"/>
      <item value="111----11-10-1-1: &DetailTaxFormViewTaxLine;, [ten_tk_thue_no%l], [t_thue_nt].Label, [t_thue_nt], [t_thue], [ten_tk_thue_co%l]"/>
      <item value="11-1----1-10-1--: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      &EIViews;
      &ListView;
      &PostView;

      <item value="111000000-10011: [loai_bk].Label, [loai_bk], [loai_bk].Description, [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="111000000-10011: [loai_sl].Label, [loai_sl], [loai_sl].Description, [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="110000000------: [ten_khthue].Label, [ten_khthue]"/>
      <item value="110000000------: [dia_chithue].Label, [dia_chithue]"/>
      <item value="110000000------: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110000000------: [ten_vtthue].Label, [ten_vtthue]"/>
      <item value="110000000------: [ghi_chuthue].Label, [ghi_chuthue]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Hóa đơn" e="Invoice"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 79, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0, 0, 0, 0, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 100, 29, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="4" split="7">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandGetTaxRate;
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

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVivBZGMhPkTk1tewhhLhhQAGZSwN9ALRnwHdi3YRPFmOTosBe0WeGbDMvigT2MMlzDdZ2YkePabiGBHUniOFg2plqP0WvbaSWtszCtOERwNs+g3ah+mfJsqzOmTa7fokJ8U=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IK8KtwtC/XnV7Uxx7iHgvzDd9ecK9V6Q1AePs4/6joZ4bXCLTC1dSgTuRjjo2rwKrlHrd0xq6cn8LSQ2ryOSfMg8N5xTAAdHqg/h6Jk9gXf5K59J2/k+Tl9IZUNyBplCjLaBPCuUKfbnD4f4qyH7npgYU7XxAvpWVAaCLmhnN/F3A==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcSuauURHWxntFbDY7fkuMGIWVlGOas6pjwI/H08DEHC2aQX+LBvb3uf05wOSOF3taoVKA2YbBZ5qwK/vjMNVRuwYk1DZTDuJ2SIhxBKrkO1LSi3zaMWG3jQ6MshLBUIEXtxvZHw4Y6M0p+6IoDCUCu</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDItZk1BNI9I7SBJGWS/HJZMFNQYGAWUuxZ1HhpV4VZzuqA3mbVf+zRCt0k/s5neS38txlfT6Yh93KAtFVnNksbYhXDWf+GXQ5wwkbGiP+ONGdC+spGMssegKGfm9XYesNnQwv1CzXKBiqov15COco6yoC7azDy22+W8FFXZmOTCd4sR71qBTRGvHLTZb6favjy3LOHlyw74EnGp9PjtHnPuCCvuV63RbJhJ+RnjNWGYW9uO6M4QF+tuYGj/YBgsUs/0Pahxw6CrlzdPKa5s8Gug8H5cVot10PNmMwzx1lt4HunVeAXu36URARMGEzYFlIt55QCeBcWdt6yHudD1iD6/umfCodP9XntJkL5wAOeyR8qRguNBBLkqy3kQCTT4P56bnCSJBJJ8uT9WKQG5Kv3QMAahI+axau2hmsWcZ9sni5uoxGLnZblD0MwnXDLpHc3cq+cIKubY/7n8EthtCVqC9VrmBqa5vdQu2H7P1BNteIbVM5VYDzmAzeqV64DItHyjdG2wuY5wdWMWt+TWI9OBgltzLRKMtFsqDf4ZZFDBmfSK//JRTjRHTXgFYo1feEVEb65QZvHukswweTsOBsrqUvzuTH1LhtjV1RPs34fQA/rY+jzf5sjuHh5ps30MNq5YUy30dW2v7b85kIBSM6nRwJGS1DJG4DH9tQnmjG9CyWRWlJkqfx25VXNZDE9O4g==</Encrypted>]]>
        &ESInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslpRkhw5TNo5OswyyGqni52FT0x3TWIMOfmg1I1uhknUuHdQYxoBTWyF98LdubiYPWTejZaGBZswJdcRbWzPDqK</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSJVlweGwWUPWg5Rzl2dSm0sufZvXygXJJhOsenho1ucoDTffyX77XzBigp6wzG3jCFkn1Yp1LI36KlEX1p4sNTbd+nkYcenm5QJNI9Q+OaBtQ==</Encrypted>]]>
        &ESPostInsert;
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &ESWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &EIWhenBeforeUpdateLog;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f6sn2xZTdLLUa3r2kXouuPghEByEmE2l+jzxqyxGfNluT/rp+4r1IsZ9ERGEVhQuoGIvcgd0RLMstHPis0NtUJr2blXSe31H9dvqXMfe4Kdv1AjG8d8RpZ7bRjVh0Hphv++5W97WWnzP9w5qjA1vix2oOdTpEc95BMgrc+WUTrmNvmQ5iS5UfR4fLqvuwGpKw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f6sn2xZTdLLUa3r2kXouuMxoFlQiogoFtV+Sgippla1gg2kp+0x9HCjVeCiyOEF7TvsPtqZxt6j9Dp5kIdHCtRMiAzglLQVu/PWprpj/1c4Q+bF0al+/AawhZqbc3WlsabtDZ0tT4DAsOqN4wkGoIfRiqf67kyrQ9warVmXzDMe4D3f53bZXrONhoYAf/vNvKFxGgwWskBM8HwNDL6oaxX5gg7gq2E5K+FTnElZrsgf9h6HVbKOscFyprWVp/IV3gbrGOQiS8yoRlHCiIoi7ytjIGPLz4xxX7fRdt01eEeRf5URqMyNpeROHGDWDzqhZFME2ht84r38EaYkYxK8wV+j4LIx8PX2tXRnk6gY8TL4xdC5o13p0N6OCw3/9wX9smtKBjoq3KUiTOTTVUE9W20=</Encrypted>]]>
        &ESPostUpdate;
        &PrintAdjustUpdate;
        &AfterUpdate;
        &Delete;
        &Post;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu32MRCyktf47g+phqcP0KGCNSz9RMyndek/qyrQHxU5cCevJWrQmr1rtEvAQ0exrdg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQYHJXEiPyWbZ8pkwYtCEFA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux5eesvvLjPyuTay2mPMvcCNKlXJwecfuhEbsGajK3izxk+SsbPhzRz06amjygiVug==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &ESPostDelete;
        &PrintAdjustDelete;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByF5dTWdSP172RcUg6ofga0ZB36eQil2kzID+l1wO8jlz/wwYl6Iz7MO/qGOckKeo8GsERccYZ3CWqisAYiAwH7xPkiAvxHJhtsbGtfc1hAWVQJgZyhSEQQdbj9vfEa8Lkje00ZyDSk996wISlrA+bOitSujDoU8oBe8xMErLWT0lKSNBVlR6Bg9p9JjWLEit18TE/7uSEfOEWl7SiDLI5uyudXo8vjoJvy8KTuARst1a33pwaTGTMDw7BsyDy+9e7iMruvDYcMlM7kRhAZq96laM82ULuTVKDkIlLPRw1UJAU0snfr8hLm43aglHCYhNW8pl7H+rfxGglMpCx2r9IZ751xvlYJ6PhTZDuo4mNdS4UMhK8iAaJzoLmv2l+esw2Fv2TP91CsrJuE2G+QxIhJ/8QWlPLZerCEUrx13dswNny1xs5PXasL+3sf0tCcWQX</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9BtfjNJYTGTBW71Y7QfdQGdJLwXKhYq+ZvfBRIxv7S/YmRWiPCuBPHVvSS0ScEK2v</Encrypted>]]>&InitFormDetailTaxEdit;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxeOSCUiGuLyZrndtOdGjWqsIVxpJsOg58Zbq+FMhfAG3lokgsg2uh/kTyQyAmNfiKzIUnF1yxthfhUZpkQzRT9e</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;&LoadFormDetailTax;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4btXzG00c5aWmpYfnDs8E1LqFnlGvPnScPvUSEm1PrsZVtT9ckoqBfu1kEgtjYZcDjr6O4OZfXCXbAJiQcgoguWbxR5+gVdsQfiCXa3m3T/2</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez9o1miq7odXmVgkzSto8EMc7LsoQSm9spAq+1WSG6zTfX3dGqv2uoXDXFaigh4iLJ6Bbr8j2vs2YGjPD6Mj3fLEfZIG8cqSYclCHpdodzSjOMTYc1qAzyx1YKmj6Nxhpr0vvlfVTrT1rIikzVhv8LBYxo7LX415FjvyauH4RVAqvEfWsp6sXcOXLNXhLb2e1l</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vyjRPqE/I7736X9g6ZeB3/5/RlfSnLVu2tmx4bMteKLHA==</Encrypted>]]>&ScriptVoucherNumber;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VTlHOq922ZwpcilYyXOUNxAGafLp665xPqvuQmrNgSTz9ZZzM+PfmZdPhh5DJ3r5vJ2TBbG9wl9wORCXtqhNc8=</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7ABukuY6DvlfxNt4KZIZGHT/HMcnVfcPpnWthj/BM/bBG5ymjcQhouAE5fnH1tSsUaxDyEvrIoeOEliRaphclSLpclqItROtD84q8E75XnCrjse7p5Nk4t+/+94GqmTENV5f4/Bvqr51D9UKIrNpNu5T7t3CL8ls4j4ZDzW1gOeAD5V6qH4Vormqas6GB44mF2gwijEPdCI2baGfldJswBglLCXjbMMAUwt5ojtbP8UuNS4K5p3alD8alZsHE7oQozvKIQYWkr+QuAepTtwefN0Aq+m+u9Ch8oOLdXp0DKEZX2Zh884nFfEjDIfa9mDLHit/GRD0/GTbtI5hVlArw+g/b1Rdd/oedalzcO6aZFWyhxciCyjtX6Ie0pNyyGGyHBfxmTZZMyo+GXNzEFLZQjmVoSuRctMmsGAkQ1Bgu4Njw==</Encrypted>]]>&DetailTaxCurrencyCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T9bJrEI4hlLJWnRtN1W0t1uLSRjcNQmuzDtYu8ia/bvwKSlUB9607TGaV/KnSDY1D4QQTCroBB760TdCLpbKi3UOSXRpsnWXxSIX7oDSmcyYruipkqUS4cOMS6+nxinZw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaaUdhcjuArxhyVDeS+SFYh7r95GFuRFddOH7dRPaERJFym9jZNfCXXeOGNOqSVVu/kITd5TY5YTv5hSs/39lSYAIQL5Gqa/jlJJ1Yfnrk/6D</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxa/BpRUQRMLeU/60rDzmYaMIAieBOu6RKgJjDbIdJrhpZl0PTieDdZfsUdqcNpN/6VDIx9qHj+YBPFET5zicQnnI/5C/1hGeY+08btwYomTI=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZPBhygNJME5sUgZpavGT5WaioLZVDe6vOAkeR94rfgAe02ZesC3xQnTA2zYG7mTE1REryWcV867y+4fmvQeNok57HERRajt+u3myxxQMc+RzWEb8zJLLFfjQdtEBt/xstAnwLxDjlRMbF2f7QYNtDh6WvkLjqdjdn+Nn1Lo8kZif4V3RQ483g1+cZwnhWog6NFlgd60Rnw2piDq0w8K56bDHDHlZygnlGAGUSZ7stfBOXrkxm2Y/Wj6v1VAbRKzM5BL1Kojh5/QGFb1aUd53WI/uDST1QAGiEtXdhU8hgkQYISz2p+bak1LHkzkQK/oBqoTTBs4DckZgfK6kA479/eYvi4gFtH8a2cczE58mgjjQvVN6yXU/c+u7GyQjLzvngN126icUUhLEr7m8zERoOZJY552RkEsn1Bwu8LM/WioxBZgPP3k9UnIFDIv0SKQ0hm85e+Rck2qaXkqG5ZNOW3EugyXFWe+UK8R0dbR+cxfvxRFDtCPX6NscXIlC8d/LCAHp6aESgPDkkt8ndwTsqxAypQXgMY2VLECga968YamGDHfWMtpMxmULRuV9O4Hslt70EyCqGY3z9qBgt/st1FC+IhkuWfg24Q7fp8P82Xl</Encrypted>]]><![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr/OazpHZc81PsWntYlRNW8b1ujPZGpO0087EjmjKMHkqw==</Encrypted>]]>&VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE8a6IZqBhCZfnzM9W1MyarHgeIIkgeafzOTBjUPmMVhZ</Encrypted>]]>&VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy49vwyT8QKOU2pBOvD5qtCGw==</Encrypted>]]>&VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUQMVMJIJ1YMhPAoY+GxRn5pWnaXRLI5Vug2mNr42eyYIQkJHprBx+Sazi36S7Istr7wII/0FHv2wUPX4UfUhheMOySmB7lKD+N7DPB5hkZAo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJha9mlAnke8nfA2kDDc8gAuc52bqe0/da5ZXm3l5sfYeKNn4bzDvNGB3zBv2y5nWypw</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCre3EHcKAkmxXqBoXUhJwD+5RpOoIRVLI42/VSdtxp8aC9wD30F8SE5Eiy/8rRfBvpl</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXE0cM2TPaYFUckw5Xx5UkwLq7F0DpmOaFEC/Fl9Ud4N2HAh+43FHQEf5Ab9dSl54e+TYsWhmvljedaGjM4YVlGmfs5K9r7wiywEjJxpQHFWMknY+Us4ZWX0k56gXPem8Qy3AE3Fu1GgziufO60b8Aq1TSfVMSJ0X6pmgqHMNsqdbQMvT9MOaUN03KTxZEndMHSpfVnX4Z0LuTbItlCo820/p50Set7vPGXyJnE4iGHg9wralxOoJHsjDYY6rqj2BvK0KAB3/lhHInWH1Mk+ofSiUfS6EFf77LtW6Q8Xpv3Gk4=</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWQifBzijL5l/kd4WLJjGoB8ezwSwm+w64AO74FVpj2wt</Encrypted>]]>&DetailTaxFormDefaultValue;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGMm23oHRb5IkRaxN5nDwV8XUODTfIAlk8wBd3oPEVsxABk4AsAF73Wm/QFr5c+OUJEZjxdsxxlLlO2SBpe4wpg6uh6gFna6w1wb/djlOceKhSuAQgH/XF7Oih3ROn9Kq78DXZSsil4LaH2dhVchXznMPE94AG17zzp/bIw21wKyqEnLCmDIeA4jgqCJY4BX2CoOAry4FVARBlxyAUxqenaUpHGLMZDeocuO0P5j12eSHQ==</Encrypted>]]>&DefaultReportForm;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6LHuNZGQDwvpPDNZ5asFY/sAY2FlZ/O4iCxWWdESRee6AXlPVn4lWeX6lwh42G+T1PenpcrteLxExXhCkHfJAdXmkllsKbxULePRjed4/lA00+IyOP4rE5Ezl0lsNu6+29WIw4/3VpmdGiw7iRCUtEe9GtAj5eNNgfBlGbDd97yGqN02lZisOLhdb7glbbPYNcIbNJOVavoid4y0ULoCHySsThKN9u4+97tRmr/lPDRzAC9rzy4NUCNU2hBwiJBaM0nOPhdVyf9Ojtr8sSCH84VEhhNAG3XE5DfUT1Bsev63kY3KGWxrVrvgei1Bej6Ab5npau8kfnmjm4CFt09Kc3AxvzNvOkTNRac9LQpgCNs44bUgRQ2mN19W5SiF6PH+C+maEWlFhWhJ6unTc5y5aQFYHTNn/MGEZEkY7XGsadXEExqRiGhdkXJr9U1SxvoGJz4aWqiFOqPj8FxrtOZi5kCQ2dGS7QrNjk3u1MGXiBiK6TXK6FtmJiTH7Q5tXy+y2XStkvUO1hTMmSOdmexaXuuDtkr9Mhf8OFGf+DSj5S5Z</Encrypted>]]>&DetailTaxVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
      &DetailTaxScript;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqa+ujzyTYkv+4oKDKj0hrvptlzlKyjYpHD74sNTCeGuHsyRNWNyrrPueGNMb+1j5Zx</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cf75e4Cytmh7hFtz/OtG93zeRmx6Mt/SJbRmbVdo2mPk7bDVHTmKE8GhSvMbO8OEjthjQdZ4vNJJ/8LZfKTNotQUq1/ym2aKkvoPVE4xmgt1ickWMEspxVAMl30tk6BwQ==</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNtonA0Ng9sTxbgRc97NUwbKgccJZUV1VGPMEAjj+ptbQtNtIPMhsUMLh3jEsV4DkB8XNrkHCSpkBHbowpC2eU=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;
    &ListTicket;
  </response>

</dir>