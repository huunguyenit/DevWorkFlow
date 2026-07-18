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
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableSPTran.txt">
  <!ENTITY EICheckDetailFieldName "d25">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxSPTran SYSTEM "..\Include\XML\DetailTaxSPTran.ent">
  %DetailTaxSPTran;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY DetailVariable "@d25">
  <!ENTITY StockType "2">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2hH+w7xM0our+okbLQHBUpTjcxCqO1j3ssxO2pHPGQmosJifwaU4eY9sAAKRN/2MaAQ1ezNpxXwfk+i5nZgA5buA==FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCfidVRIsEOptQznkOJNnW0i9jIeUV+K01XU3rJcTG42ixyggiRg8c0CUbCvRboH39aLfLdVZsm5iktRD9Seii8n2PBmbAE0GceC4oMYuZDGz/mjxTzLnaYFjvtpm+SY0JdYarNQIwD9KrxICuvGusfG4QUFbYk2wBO14k850BL3FPtm5FC4/wzlZipQ1icuJLeFbxKCw6ZdFcVcjyTXalj2udrMP1VD/IfUQ3F3LgZqcLjQI/kndCY//ezeVDkFDRlhvoziTn3QWyIm9HLXgc8UajyPERfgjv23jAo5qVel0J5VW9oa7YVswHVtDyivF1FastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5UHuUCcPvqt4/eWyRuSOiUEnud0CzQdcZrrxJUu76mg1gcrPfZM9ZdQDm4Z1uPb3I3QDxOyeh+2+sy9UF2YYTsncVyErO+BuLt35OJHxmqBGPetplzRxU1j4JZTMjGD7aEScGEAGl2k/9bx1Fq6Um/odYW61xaWidqtjb0JmIgtmeMyW6dVuIxkbDQviMPpTueetRePRpJbOm+edKyKGzaZaAzBlvCmHqPV7VirA6zXDLwAUMTpnchaRg76AnLYHVlx9M9d+rMNYsaY1uYrFG7k=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2vWle/5uf7BOHOvrbadBROHRjrljkNq0GcsiBCHd36bVFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$a3ZxZDp8MeuhFrXoqr5r7uyClgVobwb3dBUU7pajC0pJgCJvXM8Vk5kXxG1jbo0qtpJhYiVXYbJbKluWuldpZ/NDraQW5kfWk1xobFjUFQX42+wE6veTndxiE5VLoIl9tMppa1T4ofI3i0WrvZllTg==FastBusiness.Encryption.End&DetailTaxAfterUpdateMaster;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliR3VyD/V6yMM01AeVXsLlwnxsFfdIdxoLzr38xxdBhotCg32z4Wdyav0BqijKiDyxlsBbx6EFbVicSNvfFrWuwLJzLv7SLyJUUMjtj8oi66s4G0IKRiMe5kwOi4uSYdsfklUZjKFTbbVyB6nZfhobu+XYLXFbJ8vkPmkL50rCdKAg41RIGVHZMofj6ogH5lhy4k0TuFA7wqiIvw6wronaom7hihFMvbhOQP+Rw1zF3RGS1Nm1UsxFnDPZZ85fBk2zlvZDQWSB7eakaFL7UDzXt0wNU4676OAbmxe7ThEigxqEAMcznJQVbaaT111lQSKsMDBatECLmOugU2HxC30v4ujJEX2oenm8CNYoT7GHG1nUxdhvMTbrw70nFqSFJAIXMfZEhjk/X9w9EthKOWRt+IOuK/FXqir1CwDndcgEKixHP4hfgWB8TcPImZU8M4XXxFastBusiness.Encryption.End&DetailTaxPostInventoryUpdateField;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR71/P/l7bzXrmvPc5cwB0L6hnChK1OPY3t614fRJwyvMfFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiV5zbjJuDIQPEwssKPtPvNpllWJJWShO+8oc1xzW7C9tZcGSML2HjJih8ovSKc5xo2P2wlIf/24jHWhNoF1Ycq4zbVJtXojmu0eBsYwdRRtvkh8Hs7A1qxJ3TOsLBS1AFae27hhD+TZPeGDd/bfRWl7gFgSD+vo1W0hRAD+fsk5OWgLlRjwC4u5PN1o5YCFadEKRTxnNam6XnxMRftZx+186hOeYwsPUcg2jCWzMH2FAZCa2Rz4DNylQVSz+C2e+yZ+EdAS5yaKsY/aPE6TN4r5/WatcsmIkXz7sXV53oY20P7vNmAwR+NKWJH2ko4tMTGszwEtXEdBEXRC89j8SXVghPBhIg5+jxhzzFzNdy4dNvYOT9+n3soVa64UJyzq9vKmGmzRUp7ByjYR4Iq/z3urXT7Z3xqbLbNZkVOwSL0PG39in7Fg/UrZX8pXFmzddRPIxRLFYZuy+fb2LECkKMSM0tUKozv/TcfJA1nmnIRnwFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQsVDDtdvkSw+uDRyhEw7KDxwOd1afx3XZqmM9pDlGovd+betK4yCB0MuioCzMSkDy791ifYDw+JwQUxbspVEbSwl7fWnHZRWK+fjHa8xrVBaCr/OzDv50LWP9SbKVZOif/EjHEQaGrTJL9MZZfKNjuR9P018rKWXr98FvY2SEDj7zzrWsSsckHjTjMXAzcFETtIVbjahR9tTAdobyOU4bXDYzYWtNoqcZXQS/NtR7wqT2p3Dx2Ysn0SpTI/EpX/qRXkfMU4XdmzEIKUfn5Ky4OPebD1AnJfG84Wvno4/D/zWIhrZ7YxCAnVa2rtFDocfPiq/pA0djMpJCoMx5o8VK1cAiVq93psfmcXWdGNELzLx/oa/NxEI+xh2iW0hKMo3wIgxG26uNVoLz6aq/mTJWbhePbHo0Fi832JjqhXGGv4j3Mt7Lrrw/0DWKQqlRjb5ZS6O+h6Kmez0eNED4uHxkAajQKaqH4ALkpklpZw3Gpj6mTwO6FYSYSKNWggDLJJBQ=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXyBrC4KVBiLQiky0R3GgmIVbg+UTXRmfcKHrCJcRjq3vCz0vbJgOs3P/rvEnXZizemQwsPsSOfDlVpAddxylbMg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUgsaaljcrmbRRWUIROPbd07btCHKfw/D7ti1ncIlX15poQi4iZcjcM95YiOX5VbieY=FastBusiness.Encryption.End">
  

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
  %Extender.Include.SPTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m25$000000" code="a.stt_rec" order="ngay_ct, so_ct" id="HD4" type="Voucher" uniKey="true" replication="3" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c25$000000" prime="m25$" inquiry="i25$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
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

    <field name="d25" external="true" clientDefault="0" defaultValue="0" rows="144" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SPDetail" row="1">
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
    <field name="ghi_chuthue" clientDefault="Default" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>


    <field name="ma_thue" categoryIndex="-1" allowNulls="false">
      <header v="Mã thuế" e="Tax Code"></header>
      <footer v="Mã th&lt;u&gt;u&lt;/u&gt;ế" e="&lt;u&gt;T&lt;/u&gt;ax Code"></footer>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7a3GQkVRqHv7wGuR9MIrGCPYkpzPJsbrsLjxLrUDZvfA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue_no" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <footer v="T&lt;u&gt;k&lt;/u&gt; đối ứng thuế" e="Co&lt;u&gt;r&lt;/u&gt;r. Tax Account"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" clientDefault="Default" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6GY1C3pnCCmrtN16UexKCvgh4bCLk3luR6gcyHKeXAzg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" external="true" clientDefault="Default" defaultValue="0" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="thue_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" clientDefault="Default" categoryIndex="-1" inactivate="true" filterSource="Optional">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
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
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4zJUBMNX3AEb9nmrG5Zx2Q5ZX5dLza+wGcEJmtfjHPTQMiXpHOkyDK8kQbACRaDpk=</Encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7NNTM/AsgPyK8R77+aAtd3S1/pcs1Hs5nWXufwgf6YzdikxbA+5XaqCReQJmcBt4E=</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
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

      <item value="1: [d25]"/>

      &EIViews;

      <item value="1101000000--: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1100000000--: [ten_khthue].Label, [ten_khthue]"/>
      <item value="1100000000--: [dia_chithue].Label, [dia_chithue]"/>
      <item value="1100000000--: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1100000000----1--: [ten_vtthue].Label, [ten_vtthue], [ma_dvcs]"/>
      <item value="1100000000----1-: [ghi_chuthue].Label, [ghi_chuthue], [cookie]"/>

      &ListView;
      &PostView;

      <item value="1101-----1110-1 : [ma_thue].Footer, [ma_thue], [thue_suat], [t_tien2].Label, [ten_thue%l], [t_tien_nt2], [t_tien2]"/>
      <item value="1101011--1-10-1: &DetailTaxFormViewAccountLine;, [ten_tk_thue_no%l], [ten_tk_thue%l], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11011----1-10-1: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [thue_cn], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

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
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzx3U5dzP2Nu6raSnT8YRuE0z6RBIYzsswkmjyVwBPoWau66UYcMFZ2MwUkpgqTACPiRm8/9rOr8b8aAEoHXdILjOXQ8qOzN0ZghIfZHCov0rst8AeXw/lemdqiKfc+KQ08chLeC2/LyqmrdwaXtJdO1HaePoE7NrgZqJy40m2/RhH2xeI1GcdFpxcP0qxQ2A0Fz+ZJyDIwMf4zScuBD4bniAeaDLNOS+5UNMFcpPagbiWmOlqWSL5bsdGq3ed40/koUlrTZhvEGU591K9tw3VABPjTCujheaQ96oW9GFhZYuVYEawPsnEUWzkHArt6QX8w29Frt1ivDlxSdG1Lx5v8LqI2gcvjSA/BBw8zMywW83b4WexrLtSiKMUxFgn1CbqyFneQU8LT2WE4kjMFetQ/6GFt1m9A+cZB7olMghgnYf0kTAZHm6YUfYRz0+tBadC08QXuToNJdeEC5vjKFVsxRAwjxujptoBxqMy3H5Qi/AcOoGABjikoXuLA3hqdMZg==</Encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IIN9NHpqFyfDalh8R+f49igDX61jPHd5cloUQkOXL/VagkqSBvKfV0RP4Z0QWgR9EsXiyGxlytrjceznNfqha9N</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcSuauURHWxntFbDY7fkuMGMxjAYrux0CZ00PgkHWandOwFX0CeNLnB6FsvDk9x247BIStoJFR6+g8BgHJkl+ORHM5U3KJfKsCdGac807OFdMOTU3sxIvIh35X5yuNdoFI=</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHOdC9Wwdon1n9pLwnB/xAtTqteWbmaTsYsY/FFh9GmC+z659yupBEUFbmiO5/vXaLMFagLxSWqZiouQJWunJF4/aCimCT1SlbygRmQqi2CpbWi+B1BDYH+f1aF6N/R14UxfvH8ZUxs0BKXEjNTXle1aTmc/geo4ctAUfIBAwAWjZSj0wXuLOVRhj/l76ThOGw==</Encrypted>]]>
        &EIInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8geKADiMakiKMHs1Tp3BPgO5UpwnR1b0f7M0JXhp9u793c=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbUyK7JBB5YjmusnQ0zmrNEAkGviZE+QU+cBm0tZNKQXCnCQgP3NhDfnOk105UXmQaYmPrk3fLC9/zG4AcCckoDdftNsz51N+P+SzyyEAJj2TlFmnu+D+FKLQKLu4lgh88+Gio1mgIMe69zzfcM1e2LypoDPinQN4lC6omKZV820u6dSmb5hwhDOkRTZhsQ7QT1oZE6TQsEas6aus2aOSRPFcWRb/P3nYpjAAyT77465l+EFWw3IydXmanEHlbz3Gz2tdYjIfvHqqFKcuI8cBuJn+uJiVgClMruk+2IC2SDkSXCub8foaR4jzO4HXepE1L</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsklcrQCmoiYdYlJVni4SSp6usQ5rcBlJu6uj7QY1yVxw2WSLm6wW9f18fZVZoaXCDN1/2jEhe/hnbHGQX3Uv7Qj</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSLOxuE5xjNyWKuMXw3qIKxazOHS1f4kT+fpCDUyJL9TxKsgfpp4/n9s2K6u653lWyEYzIu+yyImrmIkyAbKAhWRnEBFac5R/c58YgmVdJb6E8IqdwxRJPD9+QN2LZih+2Q=</Encrypted>]]>
        &EIPostInsert;
        &AfterUpdate;
        &DeclarePost;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNRN81IcV/QH39h4gEcVG96Ev4S7KbGIa0p4PfZ/fmWoDA9L8WUMtt0Gd3BxErGSjJtteZqiurKA2cAHvVKnwrabwfPDhdmHFDjyRPTJvDgCQbnBh8l00Mpy7iJpML3DkUzFhTI98vNprxYx9oNykfwjAUP+jNiGEhmBmH3WTY5n+as4soK7Eb6+C0+hQaiG/DpF5ni+G4Ll4eA7PJg9p34=</Encrypted>]]>&EIWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku3dyLsdaNf28k54o3Bmz4JAuOcQOwxP1qKycnjLVt5vwSbcrG/ONsjFH5oIqNegwlhdGa87YCtRszFCyFQ4PYBWeKQa+RWB+H1koeUBYk9Z1lb7Z1YxGLayeCEOVCQwbb69RFmKCcf4w7TkISk3s4eCzvIQ2p7lDePIrm0YTjBk2XJ4XJDdoruP8PQGJqDLIUqfqE8bxpyeVOlkzdy4kxvc=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cr01Ul6id4Bo59abv9Iyvoa0yYkc2+rRNQyhWDbUJ6dEANXy752eV+18S3Av77oviMjRkN8+Xi9/KjfZiFFRjt084ReeWa8ngvkzmIJTXbXLOvVjXXCxiGe3rFjV3C98UfZVy9Io/y0N2HIAES668tO39b9uOm8VJpqq4URuEVl8rMJZ9koGSedMVLuz09qbjmWxwhKNpVFjaDjsRZj42bq2lz3SzFAx51/tZgaqsTuy8kX7geZ665ILAkzEpDQ+idtoevLHJU75+5/nwex8lXf1fhFqOgQGINKCnkaYPJMW4Dk/mdEBk6SSerox5CnPg==</Encrypted>]]>
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &DeclarePost;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR+vnopIgIJ9XmPmuRaK0fuf+GZc7aLoNSXjNKbgs8HPBnlKL/C5LYV6XrE9M6t0hhHBjBRNrlLjooC+JkkjyrgE=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblNpnN9y9Grc3kMOCoU+lYAjqxwCVc2WuKf5E4m3qwd5uVUjS3dZbjF6s6l1GCG0KRvHSPC3Wv5USVMWH79URW/WINWxatAOEJJsPFhFjbySA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+bZx9/lWkrX1lOPYsUgpGvxg9j+AZ9LtHbEeBhy2I9+o9ZTeG/wylvrFPDDeXL4ioOyD57eqHhFlYvcMSE+A08=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4Ydz0iO2W+7aN69C5YtogF/yKxhWS+y5uGSikYjmdIawY2aXqW+9g8EV4wvqDPpcFdL8qtVZmefXtTgcXpAsJRyn0vOgJK24zWKVfzvaqyq5tJYpgtUQnD1zx9amoihlOqB0+G7dCoD0CQ9fzBaROlzhTNFGtRos8Sk5gZ3os4Ci8lqdKWPq5BIVjyQ5/3v4lo5OvLz4iUP4jJ75tlFdMDvL/6ikT7q8cxKU1e0ailqEqKiaG20NQ01LSwmL478pUmAfxVJScbS3Ox7Xn9KO922TxWkGRIz4Pb+/IpbCYBOZutRB9cSOygRJSFqGfXWjXrqO7/+mSi+IZHPiWPcfgHl/YtepsTtld8HLplKwFCe/zW9P8vuzNGJWBOEn9b22zBC9YP6/Ui01bzsJ2pvGTuh7Jp8Y5r6AJ19RxWl9g+p2jmGk6BN3KUMbwrFRHblVYNR0kO9+kbpbl5anF4WFnWI+lHLs0Gp9x7M+GWpZqT5hS6umt95HGP7SM94yjkBDy9LJF62/J0fZfGon+hROwKRZeMBxYTjfI8rgaMsUIOJzqvMEa0x5MfEGnQMDGEu9xZPVxMFw58LgwtRIUYT1/28=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
        &EISetAuthentication;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormDetailTax;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+Wnkm+cM5ndaXGz2udIkr7N0s/sF3w0VqMqnIbuw5EvSw==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;&LoadFormDetailTax;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVvb6s8qbyPV7Ap16kJMcoDU</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezev7AtmSTllMXHPO8JsHr02Cz8ZEQtftRkGOMZJLDlvC8dWCW4fheGiAWrBKNm7P6sPdhIIccHdsSio7zAAnyDGJLkPSJrbX7XZiuo5LacjjXQoxKRbyPHgZjfsIbSj7uvhKn1ObExOke396TqvZYUHcD6nlXFQ8MQxUW7A39tN3xTcinFTLllQw7pqQ4LMLqtSMGFk9+7drctmcmRcxMoQxRvhbLXpO78qULUAJqKhYbUUc13jV+T1/dy37G19fB</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lC9iE98/3QbOfTZ+GFpE3DCN51m95eVV8Q/omNj/553FiCe9+1HLSALht1HokZjdrS5Rr8wWvMvcUgjNdb2HreEW+M/353dWGz4w21BFf4AmZEqAS610hCB+XeejJB+Ta7+ojIUfsXmHbrXMi+OXefxvp00joSTLTcqILaY/i3Mhq0vqrfWhLRcAksgXz7yjQIVnRQencDi55FPSBAJJl17nX6uKaxfIBt9mfPJDxleXVPPHOF1C4ePfOi4uSxu5kkhigHCdWgdY7BRf4EkFWJXHd3d+X+yD//nxh8q2SC1uTZOnIpbTGa/O5nywtq0yAJed91tpiGt6XlgqOGnWcVPyW5g6393IJDUL1dnIMizA=</Encrypted>]]>&DetailTaxCurrencyCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fCWaFgC/vY2QDikSkCHXizpgD9X2/18Pok63APBoNdYExybmdNjHYuWjTwZpSwAKmwlGSru9gk35f6DrNU7znbp6TcUqJLIRld/gmBsFY/ipJmz+7AVPWu0uMqoS242hw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOpC63l7+O54hLlTPHtTWRAVPGmu0sjkF3rQiFQ05nh/Zw==</Encrypted>]]>&DetailTaxFormTabFocus;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQfyNYgKYhyTTLHU5A37d+bRncXRWejj5bAQ0/qMjYn8PCY/egnpvAkGONelGB6IB4fxn42Z2S3Tlw3jb3z6XKqpdJzonwudb6LNYAW49g6znhzzQilae6Uy0F+KqKHTl1Rw==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3dzrdXRzaCk6sVUWm7IvnDNaKMJg2Wn+k3/Q7mrxqJ76aTDSVl2LiVpuW1ryCQt8ZjgOvDomGkvsTxGwbV5I7Ro=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V3XjWCQZPGbZtdeJoZXocVbe0WsOh/Qsqk0Fvm4DOFpSUX19pRHcunjJgLzd0lSJSfSqqjWzzqSqgKBglSgDITLxje6JoS6aNF6KyJdBicPjMFIMiDt9HpzHwdLrMpOgPog369v9mD5/jh8VfmOUXcuUDikrP77CEF+yRxM2R8G+2y8uvhj2RXbF34WnfHsQMtHjkqz4jAvAUF6esozOSf+teQ3T8aIN+QMC8JbD5ai3cmWFCwRU0t52/2nwLkldWkNyPrv+OE4SPNk8gHOWbW9KZfjNJIqQIuqZmgsSdSGaoSzxBh/39t8DKrHcsqNnikxo0jd/3I/LIJYFoyskjm3kuQvbxzcHagmU0H/S7CKLEy1DQXPPn+AZH3OHzwoovYUVdn1a2XvZ/29rxTi4rb79G3HZl8pwODYK6iZSz1vLIWqpxwYIiWU1dqOpWKGyJOG0kuFPb0ZbnjE42qers5qPnQnmo6yp83QWAWhIy3o</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy46BIuXZ/X5GoGm4MDWhY3iw==</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEUW7+LS3QPgTOv3/8fiN3vqh6iw50CNgWjmucTEF2kn9BbVl3CPVr8i5VzFazALE8X8/8wsL1jNdEkGegRSthsbiAX7xHySIif35zbJ1BH9zNBzEyKs69kTNzZCFcfkGcywSZG5ezmBXmYXo095zDM8GQZwOLntyHbg6bwQDnfZRJkNtUkVq3xGGhbdk1jCirfqZuJTgoUKS+Ug4x1j+Aer5jjqq5s8/ZjD2ch0zU7sYz6BRhTF8vK4VaAKphfZ4djWoGORR+bstVC+UbKiUnxUzP0ET+xL5DNOrfYquFQRvKvRvuefd3rHEnvcdcdVKFuE6zBiUvINLVZQTVdfASjnXcidfjCdPjGNFCyXM4wE5xhVjkjUHzhtkFN71KhkdP</Encrypted>]]>&DetailTaxResponseCompleteTransaction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Qx3YDwEwu38w7oW8a1npsxEgW8eYPWVu6YRBfmrvxU5MojPH7EBwFCWVdOr4uOQYlsFUL1WnFeIHq+y+HMQl1qR3MMdRPDSTF595futqJ+aR+wpg5cuRy/dNVTkVgyA6w==</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4F/smwXxx11D0fRBVufP9+44FIGoHlH/TJipdeifgTG6JPsvhlzLBFBsJutyBvbOeryDSb11ZiKWmXvcZ53kmBsAonBMIq41YgLZErHcd0tEcRf1UqF3pfy8P052sADwH1PjjtmqmaYX16cs5A8STlvG9u2B4b8/x9At8zJuqBhhaxkjqW1XHtzGDOy02pBh1jymR9AQ2jblJU+6MvBzO3HiPRipZ0OzYVbm16yXSm+FEC6nyILlswqkaD1yA4BhpU9LpJ70K0pQD2cspYW58BYhtD4y04L9dJgR6HGdLSdHDW+TkSeGtz90XP6c7+ijwZey7R7V5NaaYXuxW57374fKyMy2VNAlQABFtmK+54J5</Encrypted>]]>&DetailTaxFormDefaultValue;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RRW+fQBAGCGqXzQPxGQ7Gdy0qGAG7HK32dohhOC2H5gFTjH6ok9Sk2kcDk6/YNO5Ro31yFqup3ES/txSUpoKvPNfZaLKCnjmqiivRSWr4jL3z+RW3x6Beq3HInQcCzuIm9B0had+JP83573jV8dAzJse3xbcM291Egn4FaaMKecpAuzXeFCroY/XuC8VH5b12r3EIFCyzMLm5joM6XCZO1IkrntCcVkypnnFirGIQ15H2vteppwDaEphEgMwNH7QVV41EFiE3d9mlNau5GbC0Id6LOzXYz+xEsSvdmTvhOrZlrJ6wHjW3LLzt24n45NxsvRDtugBSxzIb07Bqly7gQ=</Encrypted>]]>&DetailTaxVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8vPhS5lLt7k6XT2IoXdCWeJ37Qbt42J+K4NzaaEIgwgQ==</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4anGmzLKQnuNqtSxOBqkpbpl2ErVOwttbA0Y5nr/YXrnx7esI+QUC5Y0OPGMaquC8tph/WdSshi9Q70kFe+II3AYKXpcKUMiZKg603NC827bhkDOKcqAnKENHVtI/zeqX3bgfx5Hldaaza1ocfwQIqg/3IT65TRJxMnzoucIzb6/</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Rl6rnBdXhs/O4KhrfS0vekNrZjHqubvjrt97/i55Id9s1Z43JvGF8FvLnQBXNvuMsLLZLx8gkUv4jRO54cGR37J6mYu6IvdRu1fXktxm7VaNbkQCf74pDlxZfgnoglOttSsom+U9+/95qGSPWvgyus=</Encrypted>]]>
      </text>
    </action>

    <action id="DebitAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTxzFygLBjuVkDfVn7wIxz3sGcSjzh8S3crd0maZFYO2Og==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+QfQ/fy4s7yttKr59gJj//VGdly8i7DdNwIsiVhJcb27hqScXKTyJSgK1QIQIXjBXtmuWS+JzOdwKExVw0QcZrE0vJ+I89jGr1mhVI9RKLJ69gnRrjDSJGjw/IDBZ43A49HEWWQuXYBXR2shTYjgbE=</Encrypted>]]>&DetailTaxFlag;<![CDATA[<Encrypted>&kF5JEuwtJfmtB14kre5wRbt9Bm7cDzDTw52fXaEL/eP7gahSdVtYy9UfjUBI8wIBjJl5YDgRMl+wTnDYlyGmMFrWK6A0TSO3KIYKbgm99WFnjN8FO1XHiECvQ6rERguwNb32Az9ZfwE4OD37DrxV9ZixDsEYuxlRI9lagmeBaa9/mJzhts8Ui98HrLqqrEhEc3SfVnRBwiT3GcKntgpliOybskEXoFnXXvwcFB7vJdrAlsWgmNiiYb+xFr9Dwz5VyzUsU+ojZ+LduZJ0rLWJzbQGxuR0IfJGCy3nZ831TrjGmQ0hrMQJJ/EA4y4f1dT6</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF8bziLPO6KVNl+SdlqbgfUrJGjZGLIQdamc7Us5oQRg1GOGmsChs+E5xw1nGjghfsaFaUT6LKRZkO6vVZ3K9Bfd3jY0bl+jARCdDQgJVzcZ9YtR0z75aBveYPc4Dh3yuh2enECWsNXEJarbUtxDNYodRLI3Kr0rBSbAi43Q77a9+dDlMO3+xft96tWoV7BC6NA==</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>

</dir>