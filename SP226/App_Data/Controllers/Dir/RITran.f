<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % CheckSerialNumber SYSTEM "..\Include\CheckSerialNumber.ent">
  %CheckSerialNumber;

  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableRITran.txt">
  <!ENTITY EICheckDetailFieldName "dtt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY DetailTableSource "
#IF $dtt.NewValue = $dtt.OldValue #THEN
  cthdtt where stt_rec = @stt_rec
#ELSE
  @dtt
#END
">

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3X8wS7N7VrggqVvtQB6GSxeikamye5aWNaaFC9U98B4+1sjSdDesqZAZjgN3UUKIdAoXwAa4HNV7HHNQZ9zOrbFJYVRkzP2km4Mfp5fELV+d7RUXGbws2xIT6f17QuysU02VwEG02l9PbexzGajAzRUawHGikxEci5HNaG2a++a3oTtTkV/+Nv/Xko5tHLik8Q2DvtpauHesUi85rRf18Wk=FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3KMtuwrWghVOYAEY1MFIeiVb1tuiVlomJSAIw8p51ZPX4MJoHBQciXzPTeJuyhQ2+Q==FastBusiness.Encryption.End">
  <!ENTITY CommandCheckTaxBeforeEdit "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu2FeOdYCTIPD3vZSpTeOfF98jlHsf/OtL4lZ1W/lQkAi46OYJ+TcVu+3L2c2mCaDNeJS0C0nC9TfoAAAZQKmS6RKBiGAA9MlL7b66Ij2veXKozqKEwA3KTkyB+5bxZfIEeXFykyrcNDAyNVmzAWg1+R5plDbVYQ5/dvdI85x0Q5E3Ut+J3vRrdKeEQUpIPxgVJXzXE+badYyDXaf20qwlhW+Q5HG7KSnAmTvcWqpyBIkPnj9xeLkF7so6VN+BJcOZ3qP2Y5bcSXnthFHWobhmrvUkKy3HNWYAVc9/3jQna/G1CyPs6K6KwLzkQ3aUgpoOQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8uVHwK/aKXBi9GpFKIREPXtkcTWbEFQM1/wRRAUYgGKu+kUxZAN9axa7sCrz70WOCAMVJWh6tSl1j+8S1GWuGs4=FastBusiness.Encryption.End&DetailTableSource;FastBusiness.Encryption.Begin$ka8U/mw9Wn8ehB76/CRQ0pXv8vW/7O3t/9udJHYx93ePKOF4Qn78gj/+8uBwBd96N0rBWs0TEcjtVll8hUcm36sLOyUtrUH4ybJazEipMcXpXDouR+J9ym9ekXQroWRQw1m4uf+MXIAtbyrGg38xdBp/+PUqhhEDo1mpWWySunqRnTVHwSQ0GGobO3krfuLjY13PP81QgeVDAISMSQmr7Q==FastBusiness.Encryption.End&DetailTableSource;FastBusiness.Encryption.Begin$YARH0qdfPiWP620v9FAeSJBETGwosWEtlcBglR81k+Lb1hKN8JQwDxICD9FoGEGCda6W67Lsb8aHGtj+/5ckhxdIeUtlzDEnWIIgUbaHYoHvoXFHuOan1ijhr9FzxzqLrc8o60HwVIomtcZTH1vMog==FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$HgOqq6WUehePoBLPCUT4kX4ZASzy7AyBzhMmM4fauzmYA7Mb+7RETryZn73ccrKx2GrmFazoXApHwvsv3C6Ch8SnZNCPrvVPxllvuH3Z+aHGIgIcwq4iN9Qk5UpSIPX+1bDLc1b6YUVkSsWcrJ1fPsmjcpod4yAfYppsSOIFvJ4=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$J5OoQ7YxqApt6uVkso6kIaVRzEjstvD26wvN5XvvSEochd5UkZbciUS3PscKRHa4S1OZwgXR82JslnLqHz99UAGqE/9xAzzG6Cplf/WcmHuVkSjGrHqSHRS8zWRdNq01i6n9Hw6t8e3QR2pSvZ5srMZo2W9CcDvFXgEtYDZwRP0=FastBusiness.Encryption.End&DetailTableSource;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ULY/wXr2EtJlEbjfW8TWOu0xkdpMhEjWqjc0ZRXFTJnUnOfCg/WYCvl9PHqIUOZ6O0KiAgD08ct5PZn6CoiKY+F+O3snP48HXA9HgjpHZ3yQZddkIIfG2/2iCBnqLCeJA==FastBusiness.Encryption.End&DetailTableSource;FastBusiness.Encryption.Begin$zmGcBpqsBJJII2QfJGnfhOfbSREHnpRhlrvtur8hiUnw94aMDPEcOS90XwRTw2W6HTsprsnMiZbByYliNonowQUs0c7vzAOQt6RRuv14JvdijtAdNTe5vGMobvh09N2nBcaciWq1wQxpmZOj2DAG96WNpjwDHxWaB4b9vg/ap60dNsFATr8rBoEEMVhnK8kMBmLjcKqfo9lKwv1mNFdCnA==FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.RITran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hdtt" code="stt_rec" order="ngay_ct, so_ct" id="HD7" type="Voucher" uniKey="true" replication="3" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn thay thế" e="Replacement Invoice"></title>
  <partition table="hdtt" prime="hdtt" inquiry="ihdtt" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
          <text v="1. Thay thế" e="1. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="dtt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="RIDetail" row="1">
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

    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" inactivate="true" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" inactivate="true" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7tIvoVm3Va2utV7P/MajdU9XBuJbY+2A1qugWGGXUhQw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &EIFields;

    <field name="ten_khthue" categoryIndex="18">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chithue" categoryIndex="18">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" categoryIndex="18">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ghi_chuthue" categoryIndex="18">
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

    <field name="stt_rec_hd" hidden="true" inactivate="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct_hd" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh_hd" hidden="true" inactivate="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct_hd" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" external="true" defaultValue="''" filterSource="Ignore" inactivate="true">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri_hd" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" filterSource="Ignore" inactivate="true">
      <header v="Ký hiệu hóa đơn" e="Invoice Serial No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct_hd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" external="true" defaultValue="''" filterSource="Ignore" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="so_hd_goc" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" external="true" defaultValue="''" filterSource="Ignore" inactivate="true" categoryIndex="5">
      <header v="Số tham chiếu" e="Reference Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hd_goc" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" external="true" defaultValue="''" filterSource="Ignore" inactivate="true" categoryIndex="5">
      <header v="Mẫu số" e="Form"></header>
      <items style="Mask"/>
    </field>
    <field name="ky_hieu_hd_goc" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" external="true" defaultValue="''" filterSource="Ignore" inactivate="true" categoryIndex="5">
      <header v="Ký hiệu" e="Serial"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_hd_goc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" external="true" defaultValue="''" filterSource="Ignore" inactivate="true" categoryIndex="5">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ly_do_dc" allowNulls="false" external="true" defaultValue="''" maxLength="512" allowContain="true" categoryIndex="5">
      <header v="Lý do điều chỉnh, thay thế" e="Reason of Adjustment, Replacement"></header>
      <footer v="Lý do" e="Reason"></footer>
    </field>
    <field name="ngay_bb" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" categoryIndex="5" external="true" defaultValue="''" allowContain="true">
      <header v="Ngày biên bản điều chỉnh, thay thế" e="Date of Adjustment, Replacement Minute"></header>
      <footer v="Ngày biên bản" e="Date of Minute"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_bb" dataFormatString="@upperCaseFormat" allowNulls="false" external="true" defaultValue="''" maxLength="32" allowContain="true" align="right" categoryIndex="5">
      <header v="Số biên bản điều chỉnh, thay thế" e="Number of Adjustment, Replacement Minute"></header>
      <footer v="Số biên bản" e="Number of Minute"></footer>
      <items style="Mask"></items>
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

      <item value="1: [dtt]"/>

      <item value="110-----------: [so_hd_goc].Label, [so_hd_goc]"/>
      <item value="110-----------: [mau_hd_goc].Label, [mau_hd_goc]"/>
      <item value="110-----------: [ky_hieu_hd_goc].Label, [ky_hieu_hd_goc]"/>
      <item value="110-----------: [so_bb].Description, [so_bb]"/>
      <item value="110-----------: [ngay_bb].Description, [ngay_bb]"/>
      <item value="110000000-----: [ly_do_dc].Description, [ly_do_dc]"/>

      &EIViews;
      &ListView;
      &PostView;

      <item value="110000000-----: [ten_khthue].Label, [ten_khthue]"/>
      <item value="110000000------: [dia_chithue].Label, [dia_chithue]"/>
      <item value="110000000------: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110000000------: [ghi_chuthue].Label, [ghi_chuthue]"/>

      <item value="1110000-1-10-1--: [ma_tt].Description, [ma_tt], [ten_tt%l],[t_tien2].Label, [t_tien_nt2], [t_tien2]"/>
      <item value="--------1-10-1--: [t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="--------1-10-1--: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="--------1-10-1--: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="5" columns="100, 30, 70, 35, 52, 50, 100, 100, 0, 8, 58, 42, 8, 100, 0, 0" anchor="9" split="10">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 70, 35, 52, 50, 100, 100, 0, 8, 58, 42, 8, 100, 0, 0" anchor="9" split="10">
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IK8KtwtC/XnV7Uxx7iHgvzDd9ecK9V6Q1AePs4/6joZ4eGA9yMwKdV1vTJBI0CbooaLc1IJmlKe+kbAu/15ue0YiWITj13Ivb4zfV8jO15k8hv4g8ejU8ILQdjNBSwncoMNGQ0XE6LJz4QshPPc4UwCZhpNbi5+94IStIkewQ7+HpIsEACiK2bJy8znSq2PYye/BwKu1RENbTpYOFX5TkODmQAY9+FUUCzjFL9FCr0cLg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWdmsIc00dMhmcU6NUq9+4icypScVTyHC8itYt31/yDchs6CAcCEu0v9lJ4nQ5FaRK4lvk6SFZhihesARhR7zVCoL1nHC26J18na6ShbIICQBg==</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcL5WJRi/H7GVOujXd3cLJMj9YM6/oA68ilybDJPAWenCoEPpXXEDOqBVRMBP5LhGVIywGYsVXg8oyqmEBAp8PXHYN966bcOOvOhA2C7ftgS2KljspvYUBA2tSm8/+5yEDLXFKM6b3V/Nlbf/2nG+y8dwKZBOmQVUOPPrUe3uN6XAaM2VDga3K6wuRxNkjv4ydwJ6++8b210tXWYJDtpU0DlAcEfEIPs7vuFR/w6uwTEvUjCIulSr5lid/eEhlsL4mUlcy0JHgcSvwwMa/nneFoCZAO8WVjMCU2g8UzIqRds0UssjV+8+IgyAZ6v/jqxFUH0sXBkR91XDmwqKAMGGEVqYP4Gq6QfzIkp7KpnNFeh1agT77b05BENmMkH6H8pJWSNO8p/UaGWDHjEAIyen3PXnTrYM0WNwTvp83l+bysF6yGFMo0zp3hhYzkbvF9aL5IitrF6q9fSHCV9oHfr/R9Ki2455VakeADm7MJKPR9e4giWXghN2mQRyHDhWFnOYfQAVg55z5pVaD4ke5/x00F/yL4EXWjpR8uDU7iK2/0MDokK+h/hgDaEE+A7rZMiGvOdNYb/zWVLjoE7PiBjLOEJiUWirkrhZ3UswWLrGS7249Rgn7pxnvSmR996PFJC7uEb9Xx3wggd5hssb374oU4LQKqXJj8vINChtbT/B7UabUdSHQuORQdaQCffJGkuo11hzXmTeVORq73KuNnCIAl+liyLNbGS/uzd51EfIJ6csh29eW336msfBzu2EKo0TqSLPyiECuE2+VsEjFSDo0F94hjfEHHhzXs4yjsp+Irc7McbcPUUaWIfrPUXFpNelsJCInu8npKJ+wii/0+H60qCESgQuGdc/6qblXeMZTlLPRqFMGkG51g/zCeQCPp2yHQ==</Encrypted>]]>
        &ESInitExternalFieldsSet;
        &CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSAVhNGf7MGZQxZeX1rsW5QrmxVP49H/HCF6YgGuUfDFVN+zcJoRsSUi4cukXBtF9I1NXUCboPhF/zVfdBhhE+wh</Encrypted>]]>
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
        &CommandCheckTaxBeforeEdit;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AskFmrwMql1JMWnlFQqkEGmObIdNPG8Q/rUmVJhuzhoCOPXFI5+/fu02kHwyTN4pfZzy/gGBKt5AVXGaPBtBTNaQ</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPR6B6Qq3gzydDFZOisqtADGYX4yOHBGp2OnMH2zTT2elPDW84khfQ874Vw/bJKeh6wxRagVbsjaVYc7dsnP3ef9SJea5PI+Plhl94BJ7GoZXf1ERqVuCeHUpg5Xwrr451R8GouSrswDahQoYvLCbgfd81VzLPzYr6wEfYA399vO</Encrypted>]]>
        &ESPostInsert;
        &AfterUpdate;
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
        &CommandCheckTaxBeforeEdit;
        &EIWhenBeforeUpdateLog;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bVAwU++CkE7hVN9JjaByShh15bujCPxki2S9Pe4aNYZcK5DwRaE5xknbe7CKqU77smDBi/UquGXCsujOvJNLwWgOXcmJqRh5cEDaAAAbIIzG/igvV02b7wSgbm+DMogC8OENtA992vhKs8Pka+yK6uC3snlpO1zeWMx9egL0j4MplyQPKDtYpA2KdG8qC0oPA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bVAwU++CkE7hVN9JjaByShRgQCF9DeRsnQfQVaWLd1G5B5Kw4Ni7q79Ie6NB6eHzNH/ITSWjczYMyWWH6cktitGvL/spuyUdddq6HDPYNlKulVitZAD7QdhfC9S034/tVJx5YR+MwpvbF2yk2dr6uhP/PUYF+LiLYsK/0qcGJqDanR5RQDeTWhbUwkyOEbyFTbMdWo51uzqMaBTgMSdGur7rYCS3xxHAS79gii/3PffZkbfSbSwTEGyHdQbzUgM6nUmJBPQROp1xNQhSDl+jGo4GW2/9kvGcrViUUMqo8+M3Hyg+TxusS3iqvRC/UIvx5Lro8iu4s5h9vhzPhfZd/4=</Encrypted>]]>
        &ESPostUpdate;
        &PrintAdjustUpdate;
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
        &ESWhenBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQYHJXEiPyWbZ8pkwYtCEFA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzqkL83olgN8bo2oFNmPAr39igF8DFu9ngISNGyXtWjgsm/5/AMkYb1F6EoyaOgsGQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/1iYEkbNNcZXoh1IIa54PPsZt/5mM5Wc5faTNovOSrd3GYMYFt6dOYKSmpjkG0+ew==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &ESPostDelete;
        &PrintAdjustDelete;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByF5dTWdSP172RcUg6ofga0ZB36eQil2kzID+l1wO8jlz/wwYl6Iz7MO/qGOckKeo8GsERccYZ3CWqisAYiAwH7xPkiAvxHJhtsbGtfc1hAWVQJgZyhSEQQdbj9vfEa8LkTrx9ZVZHr+uC1zXHZQ0V5IWXFSmduW1HaGuyqwYk2qEPnA34oQxn+YSTx02oHB5mYL7fiIlli8wJATB/u1fHUTD+QHnufAeilwe1i29cdFdk+L21F9OxQBkSKn/fHQpu2eMO1fVo6vphAr9PnETkIbP8fjvVLbjb/T/892I/QyRLJ4j9+ayob3+ChaMoD6tlQrZe8GuS1IUTfED3y5VHElQBIophUOYNdcLfC/6qBu+Xbwu3u3tNLcRcSPh0EgRf4xpWrtGoxGSKPt0CerJgAVAm0ZxAqukmVfC/SF9VRi/S/HzRoKlCQUdYHKC97zbH</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9BtfjNJYTGTBW71Y7QfdQGZIZTDSORJiIw+BYy5Po+G9JJaNDYcYPmZVskJvyC3ZjFSltqhcULMkLjNBVo4HJOQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxd+oRTrM4GbHldzXTxwSKs8</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ejDuUfIQkpT8MHdAbNBAvlR0Z+UjvICT2LQowvRE+GgYxEt2X+xLlmP/heupCnnVXQvIYJzoC1cChNlCTLVvS5jbitWQubIyLIe2tOStn8z</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ejDuUfIQkpT8MHdAbNBAvlR0Z+UjvICT2LQowvRE+GgYxEt2X+xLlmP/heupCnnVXQvIYJzoC1cChNlCTLVvS5AMqT43rj8/cugpq6wrCVsSPl/fbcu24OOSkN87GAlOMzmpz+mPK4W3GdrN/wOYpM=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezY/iFwI4Z7NWPoGCF4VSmddBdV+T65KTB/qlJnOQOR6PoBSTiYFDr2fa6F5aAMZSmYEqDY2DDINXDmjoZ5pVET2g5wWsGTQcdrPC/IG4P5KmGhs+fbpmF5E/rVt/YTkBnvsfNs0bRxsT9yP9QwrL+dVwMRW1PNKRO+duOWHgf0nkq2M1G25sDySrsVYpI6HUL</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>&ScriptVoucherNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYd8aKupUTiLhpZduEHQ8Dug==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DP7SAgkrRGW4usM7HMSoStSngGBqVSR2lKEnkj2l49oXDfWUGr3TcNapJCfQkxaf/Uv9RNhtTfG2LlMQ5EL/4VKOsaFJhUh7VzKFSPp+TQ1+pO6yfVM5rGHoy5v1iR3lMrFiC+5Q457u8WhdvBY3KRRGT7X3wqPC7bmpHFDGuy+RNIP2c/6P7yBi8D30lEmiOu+zNCLjs3rvqLWAnmryUrMkRjsGf4/SbTzcZs7PwwdblUslZvQnWJ18bqF6eOoWyuwmusbsGDcI35Xy2CGozKpvekHryRG69c63k5ffNWtlvy6cgFlsDbeRQDnDHOWkPNtqhid7hUCDnSkgMwS9BbrxOE7RGA1FVaX9v5acZ2bSEk2xVSrC/aJeVd13bJKE2Ah4EsOAOo7V8YIQUUeUA85uR0mb3xt3sJnvagwshshpbtv/wH6LOhWDiX6um2kgadSyAMP+SbPtTPie7GH3x4BNbE5Yjvj8aShFdhovD+s/Ga/AwGHpUTGjUR6HlmL04=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaUw6c6aMmlCUCmnUOLL4JTHjxT2NKSE0UjtdCYU2InQkanhUX0SnmyuQ83/L6/IuV6L2ibabswxVhq+AOM3Srts=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YrITJ21kHJGLbHogWurFyVwYriYMn0H/WAbOQvmeNOtepshR+m2MmeznnbZzyinZNu6kXoFuc2BYQ80QewtDMuwE3kthD+Yxm4qV8Jh5rXlrGhxcQaI1HqQ+OlbZlGrnjBVwnVcIwdN5NYPZm4FDurSgDZ41HIH/vDxeVD+HAkRsA==</Encrypted>]]>&VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm0wg7pcUSTi8ymZ33IV0RntPXLPVxMGjtPmz64a23yAw==</Encrypted>]]>&VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUQMVMJIJ1YMhPAoY+GxRn5pWnaXRLI5Vug2mNr42eyYIQkJHprBx+Sazi36S7Istr7wII/0FHv2wUPX4UfUhheMOySmB7lKD+N7DPB5hkZAo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJha9mlAnke8nfA2kDDc8gAuc52bqe0/da5ZXm3l5sfYeKNn4bzDvNGB3zBv2y5nWypw</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCre3EHcKAkmxXqBoXUhJwD+5RpOoIRVLI42/VSdtxp8aC9wD30F8SE5Eiy/8rRfBvpl</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEoabugGisqudPo4uSHdVprA==</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmEphKpRa0WUxaijYYpe7wb+p/hj6BqXaZYgwtRMEf8+Yj4QvvsrKsYsIKpKfrydGepJ/BZ/PKNe7fwNhiINjYHMx26DiD3EjeU8mh5YX01gWwcsw4nPk75bVNaQk+zhQcmAs5zOSkZjSLM4tPt4EjGMDNGY41hIsuwNs/uw8lbm2grI7auFnnNJiXaO5QzEAzQJFyLnNZJ2/wz/Cw0NWj1sWDBx4pkWDpm+7RXOQtbx0WQhZkW2WyfMYl2Eg6pz+l/1sGZLYBjUbTM8oGNlbYLYIrgiyrTQdDx1HLKG+ykrvvw+r6N3wD0c+7QQQ0Cd9d</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbYQYWwmeqqf/qy2AIf9geCDuyaIngRpg5tFMUFCvDkbS6T4svgtpN8AbKj/VLn17YnNOF3VqGL74pVxKz0ucYRl9n/5gU1VOJ1xoDaQtFynU=</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U+qAd8gO4wvvAG+qT02v10OGZUQib1vGOK5hRJMlWV+5NyQdbcM4Rq24jIRYRaRyYo5coFLUhiUoe9c2jZ04D7xXwMjStfzRI1Ndq4a6g4ktvvrFzfwJUO4NCMBUEGzy2LnXDfOh2iDDSZpnB2po6JrqTC7NNd7uCnGIBtsUHN+ld1ha9A9dROxlWSXCbZxjilNecAt0guVgB15hfcNddTfsE2Kqd+HokQx5O16is0LIK7kO7r3uilIW8rS6BS5OUqPluCdQgGOlDtC/rKhstaS0cjp83TTeyFD2fNRMRnSjfc+0ZqDik6IrGaM42raytbF2sCs4au/Uxc4lRryhGT0axN/BaADMicjkn8T8XmZJloGvq1XPc6v97rl9z4x85OZlCrIe9okui2NhAaUC1ddQv1XP/5JKWXgO8P6jfHyOAevBM+VSpIBaWqpmht7/tfnqqhFLw46I2P+APpD3+H1OtKvKLsq5+LtuWgtnFn8qpGiJpN+UtQj4jPVCF63Og==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqa+ujzyTYkv+4oKDKj0hrvptlzlKyjYpHD74sNTCeGuHsyRNWNyrrPueGNMb+1j5Zx</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cf75e4Cytmh7hFtz/OtG93zeRmx6Mt/SJbRmbVdo2mPk7bDVHTmKE8GhSvMbO8OEjthjQdZ4vNJJ/8LZfKTNotQUq1/ym2aKkvoPVE4xmgt1ickWMEspxVAMl30tk6BwQ==</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J5wuhqABM/cURsND5kjzniXui12+cUGtacPgHd0hnBAsLJvKJMTWU9fr01wwCZaPwMfD6qaVBS6cmEWLBOZtZE=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>