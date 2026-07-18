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
  <!ENTITY CommandCheckUnderZeroStock SYSTEM "..\Include\Command\CheckUnderZeroStock.txt">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "2">
  <!ENTITY EnvironmentTaxTag "81">
  <!ENTITY EnvironmentTaxValidExpression "g.validExpression(o, [g.$a.mt_tg], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">

  <!ENTITY % DownPayment SYSTEM "..\Include\DownPayment.ent">
  %DownPayment;

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableSVTran.txt">
  <!ENTITY EICheckDetailFieldName "d81">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % Export SYSTEM "..\Include\Export.ent">
  %Export;

  <!ENTITY VisibleFieldController "SVTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxSVTran SYSTEM "..\Include\XML\DetailTaxSVTran.ent">
  %DetailTaxSVTran;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY DetailVariable "@d81">
  <!ENTITY DetailStockType "2">
  <!ENTITY DetailTable "d81$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = case when @loai_ct = '2' then 1 else 0 end">
  <!ENTITY DeclareStock4Delete "declare @stock tinyint
select @stock = case when loai_ct = '2' then 1 else 0 end from m81$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f "&ExportQueryFields;, rtrim(ten_kh) as ten_khthue, rtrim(dia_chi) as dia_chithue, rtrim(ma_so_thue) as ma_so_thue, @taxRate as thue_suat, @taxType as thue_cn, isnull(@documentNumber, 0) as so_ct_goc, isnull(@documentNote, '') as dien_giai_ct_goc, isnull(@listNo, '') as so_bk, @listDate as ngay_bk">
  <!ENTITY h1 "769">
  <!ENTITY h2 "144">
  <!ENTITY g "SVDownPayment">
  <!ENTITY c ", @statement = @statement + ' declare @$tien numeric(19, 2); update #in set @$tien = a.tien2 + b.cl, gia21 = case when sl_xuat = 0 then 0 else round((@$tien * he_so1)/sl_xuat, ' + rtrim(@b) + ') end, gia2 = case when sl_xuat = 0 then 0 else round(@$tien/sl_xuat, ' + rtrim(@b) + ') end, tien2 = @$tien from #in a join ' + @downPayment + ' b on a.stt_rec0 = b.stt_rec0;'">
  <!ENTITY k "'km_yn &lt;&gt; 1'">
  <!ENTITY v "'tien2'">
  <!ENTITY i "4">
  <!ENTITY Tag "81">

  
  <!ENTITY CommandCheckVoucherFlowBeginTag "FastBusiness.Encryption.Begin$dvPdPCqpe+GJ7E9smhqxCiYQ/7bhhUJnkQ/eV+G+jtqXxotD0I37E7HiB3BWi73O5znK2TePNzKv21U1DDZMUWC1VuLpbw+wpsa7x6a9JtamfYb3TNfhhnyA2hklo+qUFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2kH7z9TGNbonvoOsrNtgnl0=FastBusiness.Encryption.End">
  <!ENTITY CommandCheckVoucherFlowEndTag "FastBusiness.Encryption.Begin$3T8/SXFntesh8PkcPLSTP6vE9ruXvo9eFjcQEjQKQ0PSKMopo038Jfy8NYuN1J4JRIUvlIVP11h08bwxVLDf0Q==FastBusiness.Encryption.End">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZwIc8kLQM9MxxRnU3dTMzCQNdghV6hAOmTOMdQFNPOofpAcJ99g+lJ9zvV10KmF0mA==FastBusiness.Encryption.End&CommandCheckVoucherFlowBeginTag;FastBusiness.Encryption.Begin$fX4o0nK+AW8MIUygIYpQ70hexcZ4MleFQGQTHaxmmMFHDX9vT8GU92lK3XBwqfykFastBusiness.Encryption.End&CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZ6j3Rez4Aib04inrDZuSdr4=FastBusiness.Encryption.End&CommandCheckVoucherFlowBeginTag;FastBusiness.Encryption.Begin$fX4o0nK+AW8MIUygIYpQ74P2F3CIiruYqBpOf1OPq6I=FastBusiness.Encryption.End&CommandCheckVoucherFlowEndTag;">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/T9zP62/kTnciBmjyS4t1hVo9AuMu+qj6HhSP4rkrOw2rB22L6J/TlBEwYIESuQha0BUwT/sd/wALIfJwL/tpjSjVn+uR0kjrCD6Itj503Oi8=FastBusiness.Encryption.End&SVBeforeUpdatePara;">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dvBMwMNGpnApEdbnbdE91tzCawj6+KZdSGpY8KGl9wCP4iGIOVwCv7kq51K4Gr2wQsG876zV6eAq4Brx7GTLuHLDIG3wXMIKjf/hQ3yiA6UU=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCTHPn0YuvoopOD4aKEWNemWHI0U0dIZ6tDf7/aTD+1uNMWNOcM/649PAX90thcIy+MT9DH/1z5Ai14vUuRRk0mh7KW6nX2NMAFBbIl8ighS9CzBfASXPsQ0IFRiO16c+bFDBPFO65AcOnu4RVLwnB//qE5SfOYV58HrQZ9f3PxTPMgObkyQgHqiha47q8LeIk3REq39QfpCEP8edKABrKGAidVnAfMilripUNIE0QtcVAyDYM9cEpXEVlZJKHQ42UhU3zvTgiDNa4EwfAQ0luV/P3XZkgsABGWNZD5QGKbqKV5dmDf63Va8AMnv7l7JJuSPOzLAq2ABslKDThVFEbtGyVlHVC0DT9A8PmNSobME0=FastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5TEMvXjzKvOArV7Ai4C489jitW3p+EVoccvPP2EJrARaJr6ube2RdmGtl/L1WMYndt8T9GCzS8tZspOZ/1fH28kyjiHA5baPHhuhkFyHvEujb+TYyx1B2B5hVZoMl9x0rExCfBTpj4ORIzVnkccou6NYSRrEHR7wZujzCLjZjXvyNfVkz+tlvDx2pg4O+TzF++skYYV2/lPDEyQjokInEW03hXn8ruhWyIzKouocoPwlZuMV4iiPQd52kJoO6w0E3GnEklY7zYFQEkzEkk6+FVm4as+6NS69+IVa9jEAtd2KFastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5TyZsGdlEHkL/1vXB9uUWe6hOrMeA9j0z8Ac2ihyq49Eozz4KWIJgXkefT3xriHtgj4jAmAcOOgRtgKNH9gdBdlhNYxVPGP+PfZYOLGXxaT52e7vww0vl8znFMoTe2TbORSf1ecQr/ZC+q1cRZhJIbSF0lAQkYvA6mR/24EdHv6jWQcT3ur5E9VCut+fAbgpygdl7mj6x9MJZqiyEuHddNUGSrhabpJHEJzIBx+Bg1NIAqF2h6XLgE0FkCvzrTCs5e3rdxSDTPC+DYDstpyqocMS+PmIghpzFTMw5kV/i9p0CcmIdEn+NDjX+vzFM9ETgw==FastBusiness.Encryption.End&DetailTaxAfterUpdatePromotion;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNJt+kS2PPC1NX/DYw1NYFnHj56QbUfTfDDi8zycvIvuAflZM20k0lNF6JvkQMrZH/KUoAnk1Ub/6zLEUPv7CHZKRHwW0FV2hcOjOJRZTkMq+CL00r6rberv5zd4Fum2x2w==FastBusiness.Encryption.End&DetailTaxAfterUpdateMasterTax;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNHPTwAobiaFbVuAzf9k6uqiG2e37bpQoeNpDiFIbF7xaFastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliR+51Z+Y9nM5DOJuuTdONIktF7YUl/kOmS2EEKOKldF6Jlsjmh5vK/7UjR3h60HG4SVZk1K+91QgGdmiMMftQqwsjNsf22LTHfQPSzzGIf0MbNiJuIH89L2/ceqb6MvNIXTCnCYLH8iS3+Y4vmc4qgreNvtveS0fw2DJ8yQCnFa4cZC2CrMhGHsfoNi40Wij0idSkd/LYUVujv4CwGsZyugw2boG4DBwJBQp8tY1M7ittvbPM+bbumqQcwzMZgYXVGYrAY7nPoYGbn/c8Gi0BP1F4SDTLiHLZ+z5+uJ+5pFc6WiANp6rHA69s7RGpfy8+KV5TfV/+SL/LFhBLNdCSsthSGZveThnTllr+J3Rta+NA=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8gmesO6Xj76ga8TSSrGDf5jEu0SJhSpAXQFL+pEsKcqyhs5EpijyFkcISDbbk98oRrXYvXRVAKi/FqN3vJ/UBcSaNlwMgFnFxGubqfqitkhWhzcwmSMwzfxtM5mFauz4xcXWBVerEQKwPWqzZ7FevlM=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiQpCqWzJIGDoMnNFNAQOfosgPXRQJSnUXxGaY18XVj8MZI2O2wCjnLZ5ysyyiGVISjoXswaYj9bWcYb7qWz4ISIVub1X+9GRDCpyWJ28DypaQ62zKY53+WauaiGJGYLrhmyqdRCBnEwLgxPEdnZLDsqpLZIBMpZe4eLzkv7dD8FKFastBusiness.Encryption.End&DPCreateDifference;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ac9K31h4XjQKZ5G+SkgDUrJK2mw06LzyL4ylPLikeDqeKVWk90Fm+7yytJpx1NjmgMgPXWULTfmR9zOPhDGTD4zdAdZ0iutKbupMcALGqU56mfxBET5zamoFRz0JcdJ4ETBV0bmDZZjVMgCeeCmpM1B1+MT4l3BToB9wp1BHLVJzPPE8G3XX3lvKSLE58ChWI45gYro5w46vsixbRg8naMrD7x+cIe70Q3z6lG2rhfFPDJ7eS48CcbZZTizOGsK99oGVrynIRniyGDD/pq8U8GSt7OHIOgsbmuy4VsCCH0kA583HPP9B0P0qoCJe3dda05jNRGQdTaPbTmKV4FRf4A=FastBusiness.Encryption.End&DetailTaxPostInventoryUpdateField;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22XOCn266jOOPmiODk0nIEjkhQzR+E3lduyKPMmqg7cQemxzeMUzoIIPqadFqbg7rQLnhAI1JCF4gH2RhAJx6xXuOKpR4l4PpQ22btQK/RmIEPfjl8W1RX45BdRZECIR+VQZId6uy9JrRP3fuAFlxESdl+P75sUMxO0TjpCvVu5VvnpliWTdrUtWgwtAeMbZBrYLu2kgWLhP2ahMzQyMkT3rs3KUt0igYn++Eh2sr1Sk1viXKPeCOYRe92OHRl5TR/TKRGUZ9DOVl6lU/zgISSjpqk4yq7jyus24R/eQS+xjzOv/OmNiw4QXy30yNVhmM9Q==FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22cHzeMDIkgthRKmsQo0kpcQsVDDtdvkSw+uDRyhEw7KDxwOd1afx3XZqmM9pDlGovd+betK4yCB0MuioCzMSkDy791ifYDw+JwQUxbspVEbSwl7fWnHZRWK+fjHa8xrVBaCr/OzDv50LWP9SbKVZOif/EjHEQaGrTJL9MZZfKNjuR9P018rKWXr98FvY2SEDj7zzrWsSsckHjTjMXAzcFEQwbhaLNMDhVXTvDXdduA2TSNraOYD0qWMNyA1FL/RD1+nW3NeEl8QNiyc139xdMr9Jq7YdecDtq44o70rX6aOmO6IBNNYgxT5D9HkdcOvUCQ+DdEgOGf4621aN3i1wz2z7NAV1uOhiCw4FkXY1Ke+h3eDACPPDwttkA/NZhuzwafpxRcBCZRu0USmkQgxDYtot4vnsQkQHldDbywWeRU8j9ea8VHHkTHSdx+fX3nKRxMu+5etL3lbOMtmSZWVmu0I=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8iZU1ghRPCaDyQwgcCkCLcSSSfkrwNEfbFRoil3mgt2+IoAGuPbdam5IGtwg/6hwDQyjTBnKD6vC4bTsyRah1RPF6XzgE46F/vUSdbpKeFWLFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXTJ6SRpONcAoDg92xF8L3s5PldL9rgqKuDC9e1Ox4g4600bwSzCAs3QwEN77Jr2C6FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsRImomVT2hriNrratcT+tPWI2okEpwye7BNQdboStzaA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUiEb/vVtqspRD9lKzrhmktnw7vBF9/4JjC8dXt2snBGkYw52hKb26bYtYotpYjB1TYeg+I2GGZGi6+TW9T10TtBFastBusiness.Encryption.End">

  

  <!ENTITY CheckTaxCodeCondition "@$ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@$ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SVTran;
  %Extender.Ignore;
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDA" type="Voucher" uniKey="true" replication="4" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c81$000000" prime="m81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Tài khoản nợ" e="Debit Account"></header>
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

    <field name="d81" external="true" clientDefault="0" defaultValue="0" rows="&h2;" categoryIndex="1" allowNulls="false" filterSource="Tidy">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SVDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ExportFields;

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
    <field name="tk_thue_co" clientDefault="Default" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế có" e="Credit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6GY1C3pnCCmrtN16UexKCvgh4bCLk3luR6gcyHKeXAzg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue_co%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
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

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Amount"></header>
      <items style="Numeric"/>
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

    &EnvironmentTaxFields;
    &DPFields;
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

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng doanh thu" e="Revenue Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng khuyến mãi" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_km_ct_nt" type="Decimal" external="true" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="Tổng khuyến mãi ct" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km_ct" type="Decimal" external="true" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Thuế khuyến mãi" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Cộng khuyến mãi" e="Total Promotion"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct_goc" type="Int32" dataFormatString="##0" clientDefault="0" external="true" defaultValue="0" allowContain="true" categoryIndex="5">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" external="true" defaultValue="''" allowContain="true" maxLength="-110" categoryIndex="5">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>

    <field name="so_bk" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" allowContain="true" maxLength="32" categoryIndex="5">
      <header v="Số bảng kê" e="List Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_bk" type="DateTime" external="true" defaultValue="null" allowContain="true" dataFormatString="@datetimeFormat" categoryIndex="5">
      <header v="Ngày bảng kê" e="List Date"></header>
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

      <item value="1: [d81]"/>

      &ExportViews;

      <item value="1101----11110-1 : [ma_thue].Footer, [ma_thue], [thue_suat], [t_so_luong].Label, [t_so_luong], [ten_thue%l], [t_tien_nt2], [t_tien2]"/>
      <item value="1101011--1-10-1: &DetailTaxFormViewAccountLine;, [ten_tk_thue_no%l], [ten_tk_thue_co%l], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11011----1-10-1: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [thue_cn], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      &DPViews;
      &EIViews;

      &ListView;
      &PostView;


      <item value="110100000-1-10-1: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l], [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="110000000-1-10-1: [ten_khthue].Label, [ten_khthue], [t_tc_tien_nt2].Label, [t_tc_tien_nt2], [t_tc_tien2]"/>
      <item value="110000000-1-10-1: [dia_chithue].Label, [dia_chithue], [t_ck_nt].Label, [t_ck_nt], [t_ck]"/>
      <item value="110000000-1-10-111: [ma_so_thue].Label, [ma_so_thue], [t_km_nt].Label, [t_km_nt], [t_km], [t_km_ct_nt], [t_km_ct]"/>
      <item value="110000000-1-10-1: [ten_vtthue].Label, [ten_vtthue], [t_thue_km_nt].Label, [t_thue_km_nt], [t_thue_km]"/>
      <item value="110000000-1-10-111: [ghi_chuthue].Label, [ghi_chuthue], [t_tien_km_nt].Label, [t_tien_km_nt], [t_tien_km], [ma_dvcs], [cookie]"/>

      <item value="11---1001-: [so_ct_goc].Label, [so_ct_goc], [so_bk].Label, [so_bk]"/>
      <item value="1100-1001-: [dien_giai_ct_goc].Label, [dien_giai_ct_goc], [ngay_bk].Label, [ngay_bk]"/>

      <categories>
        <category index="1" columns="&h1;" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ExportCategory;
        &DPCategory;

        <category index="5" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 30, 70, 35, 65, 0, 0, 37, 92, 8, 108, 0, 58, 42, 8, 100, 0, 0" anchor="6" split="10">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvntDeaqKkLqxATg2LnSDDZECV0NVOjWbMaPTsrDInmQ5HQuGSySfs443OFmwahNCThT84e3ge8BA+wFmki3cWGZ</Encrypted>]]>&ExportLoading;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIGzyZwz0KhxdFricfLVUPUmUIF8nIVt3pVcxezXDrOjeE1gjBueMW6yg9HT8Ef4pSf7PaVdC3WeKDDjK+q24jenh9oHokZbVQpQ/9VYKdfC+YIu/BcXwvPlorGHW5vLnw==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafQ8PhjOSBZeYec8UK8ib1QvLdctw9IXGZa38vefY0HxoOoUri0bBBXhClHaVCzI3F9Yks0NJfTLhgvKUZHSi2j6DzPXcHkkjO9C+uWpslYUPXjyfuvf+rU4pcmS2YPvf8w==</Encrypted>]]>
        &CommandGetTaxRate;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        &DPLoading;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IIN9NHpqFyfDalh8R+f49igDX61jPHd5cloUQkOXL/VagkqSBvKfV0RP4Z0QWgR9EsXiyGxlytrjceznNfqha9N</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcSuauURHWxntFbDY7fkuMGsB6ovWvBor7SLftULfZ/r9Cu9j7kBJYTO05P7EARpCu+otDeDnT5bINw/6JlecdQ7h2rQHzzU7VnfKbu0JafG+mt17GI36P1FBYav3Sn4Q4=</Encrypted>]]>
        &CommandExternalFieldSet;
        &ExportInitExternalFields;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzx4/jYL2rU2zyz10P4QeoRobAdAl4FFyItyFHMv29hhEOidkELmuIrmmFkF06jWP1zmzJTk+bKKwK6MsLpJ6/5lWSplAqOkRmcM2QymjXnpVdPA4wx6ui2DU5mvTxB76HTU7ez1XYfZ7YNZmC1JXUnSI0Bd320D5f+GYcOcbxtsSK/8bKqYRyW2IrxFIk6Amo8GyqVMFqq3c1+Nl2VNzQnlc+y88Wd9UfkY1mf0XtIvhvMyfQ5gPu8vLfVn1DsPPaSMeKBjoO6HNNDd6JNjCb9O0235Wxgq0OQdLaKChdUAT/xZ5/7p20toqmQj6WvxcZGrC2X4S3zHECazOdz5M3D3FKOPuVZ4ibwWVCzsaeOXM=</Encrypted>]]>
        &EIInitExternalFieldsSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm41hXZtDtU3F53wv8d+v8ge5VRfRC8rO9m9QBvWqjVh2p3V0YPPR+7MeQLvYKe/1nk=</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbUyK7JBB5YjmusnQ0zmrNEAkGviZE+QU+cBm0tZNKQXCnCQgP3NhDfnOk105UXmQaYmPrk3fLC9/zG4AcCckoDdftNsz51N+P+SzyyEAJj2TlFmnu+D+FKLQKLu4lgh88+Gio1mgIMe69zzfcM1e2LypoDPinQN4lC6omKZV820u6dSmb5hwhDOkRTZhsQ7QT1oZE6TQsEas6aus2aOSRPFcWRb/P3nYpjAAyT77465l+EFWw3IydXmanEHlbz3Gz2tdYjIfvHqqFKcuI8cBuJn+uJiVgClMruk+2IC2SDkS9cBv+IC4fnjxJJLYv37vKHw8v6iiNA6e2LDS1KhlbznFbJpaqcEc5eCLTwYaV9hYGjImxm9Yoh4M3BztejRWQpO3cHFFyz5RRluGGUt8RtJ3IdBHJSxdnD0K6k7b+5ZtCLSt+Hdv0LBt4ixAOxGE/70nt0ep2mD3/tsgsRSokYw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckUnderZeroStock;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslV+AXx2vRmqgCg34SLx7edRiBDeBfs8QJhcj6a3Gmuz/gzNbSiK/k3+t7IKLxekCL628Dl0ZiG/wamLyBnQPGi</Encrypted>]]>
        &DPWhenBeforeInsert;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSJVlweGwWUPWg5Rzl2dSm0sGeoaa3mjnIrfX6qoshGqh8NG8EGVkapd5pTpBYmf4zURhtFz6fl60/b0c4pfg5i8RvtmGptb1L3ksfNHo9T8cJTvKYQVvmuH33KrsCUuR0fKJNJRd4wD22tTJzUCRPXFsoytvm/bPiDCXundiqUr5QesdYwlWvp8hOfzleunr48=</Encrypted>]]>
        &ExportInsert;
        &DPPostInsert;
        &EIPostInsert;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
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
        &CommandCheckUnderZeroStock;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6+gKVSHKTYLEnzobjFJwLlwklAhAgHwpAHDkx315UYnof0d7GkeMZ1ry1e+ZQwZhbDCq4izAzsCg+FxAjFr0zT9aQDuHNdMj3z2kzLZKmbHHoH64ZXaJeCXfTXFL/yS9Y=</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &EIWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDbzbh8Xv5Sanhd3ZLdfe0m798WER4VjCf6iYZjv+6TphH1jt/z3w5tHsbD0VrM5ogsXx3Pz2cqnQwcK2079XDQ57fm+arBogMHTX6gPK6gz5wFWr6T/MPAxDUZ9B4MLrT6raX2S1Ah86ophVuhsd6QCfwr3PYhMzGZxkkbJhpaZIv4B6wBVBUunBjAxOPyldX24q6oceQHHbNPZXPtTn0vg=</Encrypted>]]>
        &DPWhenBeforeUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9MFiKbaRXfhPXuXM6opLYjXpaA4v5Zm3cUR6BIg1dj0zlAL/pn+qIZybG6Jn2rkt2rsIMnB3Yo/DxtE+gK5pSBOMX0Q0Q1GtfN9arfuLs3ZBHPiZzqg79V8UMIhOAslyZ8qez2j/I+t17aDitaxO7V7PCVp6XYfGslB636hhVBub31mfkcoT9abwfC/CvxYW1yOvMWxurSRQtQ8rxmWB7qKBcbn/22uq4fKkMI62KHEzST3YILJuLGyH4E8JijphDldzQiyZPFTsg7Zl/raafE=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UkbzZA2BthUy8P6/UWXKZb/5YoHqJlzUvftZXrgfoVl6CV1EbheqiNjW7l8huR0HTJDBcFCx6DiM9lYB43HF21HOJT4floKsvGTxd1DjreZ9+ocXfLBwD4zPgmEBumEAiapsMCt/jEHMu5RD9gBTNWw6K8+3yAmGrrbe7Xh7GnTY554Q+Xf/kyXy5aLmYJHaiBLcG4oflWcZXEOtqn9TTzfB0Su6OevVRE9IWIFHKJoihCY0ARLERJi0Hn/qxva0Smcv30L8cJYO8JS23WbvJovKIpru/uDp011bgXJwcSib/nZUtf2iQoGa8GXm9Zr4RwzUQQn7WPltg3w93jN2ru2S3uwrOUGZHBBK+Jqms9dXZDp+ah+h2B7av9EkguWm2oicL5EWSpOGeADEiFqsiR9uHItM0c7MyrwabZdu3djkwCol31DvyTLY+kLnUx5mg3Ctw+ejB5MY9+cJ0GVn+ROqcl0KiwJ50UH/vfnl15E/LMS/zOEPf1ciTDVLJMY4qFh/IxiVgOtvxNO3Dwshq3CDBRbU0IKP/Yr76Cc9JK5</Encrypted>]]>
        &ExportUpdate;
        &DPPostUpdate;
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyHE/Z8IVyMrVQiwDKuQb4vuKcmKBHPh2uFJV+PlSkdDo4HPCA/fxYE98Pp2NdNoOlCCzgiehi3IMkCvD7GGJhYl</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
        &AfterVoucherUpdate;
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
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &EIWhenBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6+gKVSHKTYLEnzobjFJwLlwklAhAgHwpAHDkx315UYnsOgem/fX7147WxJnjBDFWDxHyF4FrtkHNnyZvO6CeggyreRLpwIJrJPmnYWdQrOXSQFQUo9nS9rAyuv6QQT5SE=</Encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu32MRCyktf47g+phqcP0KGCNSz9RMyndek/qyrQHxU5cCevJWrQmr1rtEvAQ0exrdg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0CE7nak2OvPS50roX1NfblJQedj1RzaFKs8VA34X//DUFkhMM3KuxMXbWKgT4T6YYGneCQVBQUqEo6oj9QP9zc1RBVR/wY/uNLcFzpBqI12</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzeo80iAPJAp+thfX/ieFLNp/GDc6tYZrtnA3aiGWBDCkxIaftp6FO+DWV664XOxe2X4hZy2UvGwuMTfziZYu/M=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxcL2ICQ5VtmpNrpmyf+nmKszjHg3UUYUV9+oOJ8xro862r5GHGambguQ/TJqZ98ng==</Encrypted>]]>
        &ExportDelete;
        &DPPostDelete;
        &EIPostDelete;
        &PrintPostDelete;
        &DeclareStock4Delete;
        &DeleteCurrentStock;
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKxvW5UYXguGRTwbWazQ33C0qhrwqMCmJKHSiQNsF6UXombDT4YDE4Xduu/lb1JpYc2OinJTvNsR7+GesjLj1yBQv2IIzXlqXbAJ4AgPTIdplWbrAXLf4GHRsjlMkzx0XqmqWtuRGpKMSNW80IDZsFVRGAbJ+CFINOCuQIv5jbz2/KmU1sET9tV1s9wKW4f+yW63KsAIdInL3BhoTvQRGa1kGbXyKKax2opESIVXzvMNP3AHNR6cM4KmjHAZQOH/mKxalbHZ7tJf+virx6bh+aEjlz4ggHkAFR4PfJVFJAf13nxjY89bk+X8Yq3O/egNXFOk9uICIJqgu3JEt7EtrRb/N9hbCKN7BByqWD8x0NbHdcsdHHcGqUlZfYCPnVcXUHXkR18LJvze50mBEFj5+JRoQ72Goq1nyOMdkjXJL0SYNYGLFqA2E6gffKu6DWmjLqM6Oad79mJE64nHjo110bNu7xj6WiWw4bPCPMC5XbsLZAkGngV9msOL9HVkcrrUatjm3LV4azxDj1b2f6Z+9+yuC4yXGRMigPdVgFFz0Cmslm1s5nxUKk4yJq45qHkCLJ3Lbv/im2/fkE4/Uoj+SzHDEAqg9iWKE6wLnOT+9CbIkpoeCCA6aoHaoP8aosqF611l1CEHc1L5H2+7jsPOub+vX81GTuiivmPe9TekAokVRiRcHicpiYGcubX1Aed6zSAAchqk/14P3oBN2jMTQ3Jyd4+CzDof5nZZfhU05J4ycguqEaRoFN2evaoKIO2z/emTjmfk+xa5ophZAtdLI8rbfKpSijngTfsoDx7jXTTWfT+FJ0EN6lZdAOfmaLk1h6KTi3iiV1AIck4fPhxlUKY0MOeeGITngz47cEJtGOhZU3KHQ6ik/iu2m0U/djtorEeeQ6ogywV4RPW09akEnyuER5QzMaldgeDRgi2BAZ+QXq4ak3UdzdrQh912uKMWdoRm8MuzPKKYijlNBXtVrpkGt4lNSJghqLmibYXtJJwAfA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
        &DPCheck;
        &EISetAuthentication;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;&InitFormDetailTax;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;&ExportActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+WSsrWTv8D523R+cPwWvE/pHANpt354elnhWJBvq4berupKhGmDfVYaJfZTmuwLeNg=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunK7pnavP1dtf6Ucf1UiCVptIL4FS2488MrmiXHf3zC71JHDntnHoYvoR/Gz0FCpVn060+IhIeB0abkFc1NLfbMgEx+1uATrU/SHNVFQJWeQYXgy8i9EjcILV0Y593r+NWuXN5y4EFACPKgE4g8n3RS1kQ7xXwOAmrcN+RHCk6QEnOUOMzngTTAM3Nj455YTXQQ==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;&LoadFormVisibleField;&LoadFormDetailTax;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&EnvironmentTaxAddRender;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUuinyyGCwpsFSe5/s8ihVhaGLymQeY1z4pUWl08v3Fnx</Encrypted>]]>
      &EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U0qjLJlGlJJEgaKQfS7mThjrM4LNwgRV5LRSNQwiV++dZLszdHmEpdlkbiAjQb9GGc4YJ00ySCLCslMplQ2LpE30F8x1n4TqrVYB+nXhzH2IQsZ60BQ7jfgvmrzTN2QurO1/dcY7XStp2fADINT4u8HurSb7CXgsUdd3kCX5UJpE8UI9Fcx7SOIgVIbKNYT1g==</Encrypted>]]>&EnvironmentTaxRemoveRender;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGaceze8wD2djZgXYHMEv4H6CwMmwitj1bwwECqrzAcewYiLcKzi5KLJma4EpiL+vU3d5iws970kR6DPa84QekYBjFxubHEUd4veTXx/yoxTZbvMSSSChpjytN4S0mWyyL2ltx16+zO1SjNRENkbTf54Yip3epf+OxPt0tfyiQrZOKbE+p1qKAQJ5RXLgfstRaa6DQ37wsNYVYxKYpPjGJF3jHlN0efg0Dx56upzaNseSY5QXvYOLYSv/87kPwv1n8ACu3jchDGYY2saS+wy/beRDnvZLEBS9jqOtupcxNV+6Lpvw=</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zx3OG5I+ZUm10Re3uGE7OsAT3i3T0oE4uMlEa4acAYzegZhkwpgxr5qdPdJ3bRJj1qujawr/j2psGITrRZO+W1ckv2j53XkjXPMR2ikLqnpllPnR7TyogTHAfsIUcYd1dPb5ZIlvutjJ+/QetIuaUlug==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHACK6X+pIZ0t4eOo2tQpe13/+Jp3XZIiSg9Wg1PvPCMUkr9dN779MvebHkGgsHSh/6ziEHpDj+BEGPlT3h6bVHvGobhnxRRtKp38EXHXauTySNzbxFbsFBFWw8rGn61gCM5KV2aE7WQfKU/GOLXHwH0iXnBdsyB45T71HQJ5W26uZt6zqeajeMmpgaGTC5pIdzNjElpeNrqPlPSS6YdZmAGMHHoXO6yFQizEHqznGjsGIvYYjZdGv7ZV12oNf8dOOpWajDKHg5QxGcUTFaN4SHffl04oHD777VY+0rmasE4vl703qoI2upIA3m4dOmr7yFC4q+z1QgoyXF6fgooU/R+qA7M7cYclY7YDxBVpIAw7YLwI9oJt9RsBl0iDgINRYEXqvTOpnNl7F+MdMAVLhdKUGhw0bbOROlflYgCu9pdsEB/2Y6CP7bytfad4tSdvYAjWeEGC6/n3L1no7tz/K83CQBGL1ZYH2gKvZxsRdqKzKYQYSlfNV3R3fYZslWsGbQL/jh+IW8hAWhAYUKHEIQwYcB2wZ/+tE+pvVziMaZLJw=</Encrypted>]]>&DetailTaxCurrencyCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fCWaFgC/vY2QDikSkCHXizpgD9X2/18Pok63APBoNdYExybmdNjHYuWjTwZpSwAKmwlGSru9gk35f6DrNU7znZNqV4WwTibxw0Nx9aCYp/rjrryUnMIIN84MTj9o5ucpg==</Encrypted>]]>&EnvironmentTaxGridFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bCbV013qAsGS952fSWRPoyvxzwp1hEiCaaUXqlSMSnMTosl6yfsWYBEFYY+Wckqf/UZKTNQRu29rVHxYHRERyZ8GN0JQkdSU+RHCAYlav5m</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukx9FFq0KMNTxWLB8AX0qnP04Qn9mY57mM1tfwSk783tcM=</Encrypted>]]>&DetailTaxFormTabFocus;<![CDATA[<Encrypted>&gVO9B2ANersx6awcX0G3r8/cweyJMJg+A2SsVRQ4KWW4OP82wnPNfstMXUA4dYVA1AHpMrEd0QFtW92DfauUeQ==</Encrypted>]]>&ExportFocusVoucherTab;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UZqpfc5fQD2KVG4MRowswM0biNzn7Lx4077THpKT4cRtVMoOfAMdrRPbqM+N1FjIAG8GjTuOT/Nf60gU8p3nLouThkujHhXVWCm332stvxUs/0z1BCkuA8+xypbZWjtV+iwf6xEghMBm54sg3klkVw=</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V3XjWCQZPGbZtdeJoZXocVbe0WsOh/Qsqk0Fvm4DOFpSUX19pRHcunjJgLzd0lSJSfSqqjWzzqSqgKBglSgDITLxje6JoS6aNF6KyJdBicPjMFIMiDt9HpzHwdLrMpOgPog369v9mD5/jh8VfmOUXcuUDikrP77CEF+yRxM2R8G+2y8uvhj2RXbF34WnfHsQMtHjkqz4jAvAUF6esozOSdHuvaQ12YzFS5nGT6dB8BbfoExDq+2dYwd7lybIJDg6JwUQdFf8ZBUjreVWIY+RUPlFniWeDIfCrz7vt+4lWx7j9VErm8NvyTmmaSLUggaVxLvefVaT0v7qv+2SvLGlT2i8MOaW3crnBhsAEY5DRLBvTRqQVWh1Ux6U+4hNsuGcwX8lBI5ikOlswNlTOhNWy5brbbMHGMOxDiFLDAZseM/j5qQYsNyl0l3X4X+OSsZcQjZMG1K5T+bEgD7MBL1oMrzfwq3ooCYYlGJG+VJOaYH</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &EnvironmentTaxCurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+0Qc7dz6Pyf4t3l4NvUh/aUAatTS0ZXgrYNCwEntIT/rjl4zut0mpIoGHvod5AfHo=</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHbA4YAJEqzrz9Hpu+T+EzaIpzHVGnm9rnq9+JkGfjc/KN5i3ZGJ72FUOleoxPLAfoHhz70F1gSGXTdDxJCDFgupvHB+PUWSWm6PA0o4aGSNg==</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEDcDukUN/hhijYpK0hqJham6DgHdAcwTU0Ba+ysbyKdE5OACRJifcesgHWxU1tEM4yuFSL/LEXjFtbxD/5jCYN</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreMtTC9+OTX6VS3jWqv8FM8ix+LI4lvkPdXJoIH2JREmKhwuLPexQoQAFsDWlE3kBC</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWB8QNOaevrqmZ18VPfdIEE95bAhQagVFmjCHwGkO32jgGBo0pGvk3ung8PxRzNHw5B</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyR2stLfIV4JzBhdcb3jrxTQ=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEUW7+LS3QPgTOv3/8fiN3vqh6iw50CNgWjmucTEF2kn9BbVl3CPVr8i5VzFazALE8X8/8wsL1jNdEkGegRSthsbiAX7xHySIif35zbJ1BH9wKowB+fUAheHHvd3V5KDAhzBwz2VxGMOZzWTpYXkYQ75y/6/wR/3j3vYwPfvMKDdrcN+tx6lCyg+b1aIMzo4sIbgYLgWlnHDOmHRtxQ7TR/GXQqSPBByGUkA8qPcL6R7t8v41zD/mjxuCbqwigM+MU4krOEXjGEYSVdHrMtB02XwXJyAdHP/Vo4MrPDJ40kets1scEp0CdX6z1GbS2lWUY8FuJu+5PODXSrISR154aeTDuXO7ewB1a8XmOOjH4YUg3K0BCjVpJIGtgCzHc1r2osVxbUedUPWg3PeZJ5iCF0UYdT1JBVFENCKPqKjfzyxoMJlqLvS479mEzPpDN3HmEWec1u6lxkqn+LDBpsBXK/g==</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWQifBzijL5l/kd4WLJjGoB8ezwSwm+w64AO74FVpj2wt</Encrypted>]]>&DetailTaxFormDefaultValue;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dFtBna0AqHVe3GzZMrIKhEW+/zVVEPM1PX5f/qu4NP7nFfHJe6HjqpZtlmYD+2d67lPnZoMwLe+xSYTan6NvvtjnyMuJauXKBI1Zhn2omvv</Encrypted>]]>&DetailTaxVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
      &EnvironmentTaxFunction;
      &DPScript;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcndSOCgUUP9TlYX+xi9MuIysPm5Eu4Jn57DhLH5rXrOCGl/yQBfaX8K83H6qVjWS6ffAY0uNZV21pGkos6JyIh+mbRg1c1HlbcQBCJCmR3y8=</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgTcplfHw7Av8Ks94WReEA2o/tbyHzmWCtz8B5AYMs2MT+qlYvpg3E4xqWeFvM2nruTbfglO2qkFaKhVOY4AwCUA==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;
    &ListTicket;
  </response>

</dir>