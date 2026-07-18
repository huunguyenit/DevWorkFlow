<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetDebitTaxRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetDebitTaxRate.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
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
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStockVoucherType.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStockVoucherType.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStockVoucherType.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "2">
  <!ENTITY EnvironmentTaxTag "76">
  <!ENTITY EnvironmentTaxValidExpression "g.validExpression(o, [g.$a.mt_tg], [g.$a.t_thue_mt_nt, g.$a.t_thue_mt], [g.$a.t_tt_nt, g.$a.t_tt]);">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY CheckGeneralInputVATCondition " and @invat_yn = 1">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct0', @verify$InputVAT$Invoice = @so_ct0, @verify$InputVAT$Date = @ngay_ct0, @verify$InputVAT$Code = @$ma_so_thue, @verify$InputVAT$Serial = @so_seri">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY VisibleFieldController "SRTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxSRTran SYSTEM "..\Include\XML\DetailTaxSRTran.ent">
  %DetailTaxSRTran;

  <!ENTITY % ResetCustInfo SYSTEM "..\Include\ResetCustInfo.ent">
  %ResetCustInfo;

  <!ENTITY DetailVariable "@d76">
  <!ENTITY DetailTable "d76$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int, @vCode varchar(32)
select @stock = case when @loai_ct = '6' then -1 else 0 end, @vCode = @@id + char(251) + @loai_ct + char(251) + @loai_ct">
  <!ENTITY DeclareStock4Delete "declare @stock int, @vCode varchar(32)
select @stock = case when loai_ct = '6' then -1 else 0 end, @vCode = ma_ct + char(251) + loai_ct + char(251) + loai_ct from m76$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updating "declare @oCode varchar(32)
select @oCode = loai_ct from m76$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updated "declare @stock int, @vCode varchar(32)
select @stock = case when @loai_ct = '6' then -1 else 0 end, @vCode = @@id + char(251) + @loai_ct + char(251) + @oCode">
  <!ENTITY DeclarePost "declare @post bit, @vat int
select @post = case when @status = 0 then 0 else 1 end
select @vat = case when @invat_yn = 0 then 1 else 2 end">

  
  <!ENTITY f "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3YtL+kwFi9rKn/AM0WfXdN0yatHzSjxbjyPAm7xphh2hH+w7xM0our+okbLQHBUpTjcxCqO1j3ssxO2pHPGQmotMg91rBrrPBP/oWBEkyJmJli5UtPHI+8WygzKaeffp+aVHxxX+wq0+ijXqqT8G4/+NSa887AFcb4+tRGx8ndcQw/YTsL0SWcyA2AChuTGVyw==FastBusiness.Encryption.End">
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPjJUL5wa9JGA9AYw0FAE38z6JfztQ2zo6ruHUkPYrViybEYdhZtN+mKhP0w/0qm+YaHRaQpy9olBVY1ZJqmVEU2u1weZ+1hqWontIBGfernxqzjSZ3JUQ9rbQNVANUnoLNy0VG3R6YlvtZEnIhEd0/+Eo3W+lLx6Tbxay8vjv/FbHeHeBQzfHRgu/XMOztMLaP/MvkwZJaWOjF6EFsb/cC31Blll97AP2R7Kw0dGF2pyE8mLBcs3+2Q3Uhxs/N11GUQw0dC4qhkaF+VWUo7JuyWFastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPjJUL5wa9JGA9AYw0FAE38z6JfztQ2zo6ruHUkPYrViybEYdhZtN+mKhP0w/0qm+YaHRaQpy9olBVY1ZJqmVEU2u1weZ+1hqWontIBGfernxhvt7mJjgAudyV9M6cnoeGHKsazujwP4XM8tiypyj80qeIHdJcfuAWodt551tECZauM109ojJhFWDmHLC5lhzxfgWEWYb8eXVOGCmRwr/v161eLyYqJNupaB+z4367FrPgZfxfD9hOFsSSPXaTqRfYwRMo1R68jhl157G2ocFC/IFastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCT8K9Zxp7CIq0TP+fEUm9HGsfDLBDBAcOipL2/4gooRCYEmYQVje5FyTLjMzDmKqXftzTiUfyNkkAAXh82bAyZ3ZDwRBW30U1yviUDZ6tXWf9ByePhWoXTP0tt8I9BLbHojn1qltqdxyUn7aiWSpOI+pGDEriCo/jp/Y2jOT/Mmeb55TjHv/UllQLxybydOJXEmUusKtaSy8VHpGe1i4TogP1CljYjQizYLGK2RBW0AM1LrCzuFheGLoga4vXUQeL0o6Dw7VXgU2/F13aYqoDY9n2kjALjR9NztfMmgeN1KEO8Rb5gNR5XVSnDs4Pj6uzIl9aR3b5cEBWGS5PQKHqcQ==FastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5TEMvXjzKvOArV7Ai4C489jitW3p+EVoccvPP2EJrARaJr6ube2RdmGtl/L1WMYndhsEuksxxuJFegu/m1qSjd5ZaVz3MH19UHov+xbz/C56egAie0bJKFtPTZ1GuMGGObha0izMTN3tuarQ2ialSbmG3x5b7Z9CiBBSr/Qz/dc63zsSSo76cCmIPhuBmSdqtBruDXcas8lSFFIesUo0e+Wa9JkJoAQNOBY0z02/u9PaYXLPuW191mq17vmBOinjSXZpIZ8hMQvEnYb0PdSNpo8rpUhmVEaJTQtsOySc/KSRFastBusiness.Encryption.End&DetailTaxFlag;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5TyZsGdlEHkL/1vXB9uUWe6hOrMeA9j0z8Ac2ihyq49Eozz4KWIJgXkefT3xriHtgj4jAmAcOOgRtgKNH9gdBdlhNYxVPGP+PfZYOLGXxaT52e7vww0vl8znFMoTe2TbORSf1ecQr/ZC+q1cRZhJIbQrEzQVKB9OuW/8dRjb6ui8KSaNMtd74fSHtMQVcDkk2jzzc26g1+Y6RHsnpjItj8hTGfu2AtfFUWT08T2pznofCsIIBO6rNFNk+hGq6XrFU63D4i8uHNYD9ljOEhfXUYI3IKcTsf4bqXLSo4fHCIr+mn1cd6bNYikEF9jvZSwO+w==FastBusiness.Encryption.End&DetailTaxAfterUpdatePromotion;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNJt+kS2PPC1NX/DYw1NYFnHvWQz2ItMvrCAi+kewSt7Eu8PcGnMi/V686uLNHRV2SQ==FastBusiness.Encryption.End&DetailTaxAfterUpdateMaster;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=FastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSCQNeuJkDt2V8k5zsbQ0+FhThn/t2BRx4FqDh9lDYvWMx+MDfRVi54GcCtZ72jsOdZ/SDXhlHTjSUUtcF7MFuxjxKpzxeQIdOnG9pVhAC9XZxDhkfVg7gPLjnddh0cMHDUv3tNhTifX9rztH98alGvf+VFPK2KxzvQMni6TKHe6MOOsp5Plk3WJOJCIoVniPKGBz5N53OQENy5Qvi4j3au9HITa8G3Yi+1fppFB1h3stiktijRX4eH/N6MAQe8Mh8FfvT7OILwI5GhW4XBXmuT+wstnbQ8jha/Y5YBP7cz8vcmrgLhuMdGwOZ0ddRq2JjuCLdkUv69LJF/jKZnYHJJIQE9c/TnFdet0eIXZeBw8g==FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcIjW4B9FgDSgsf8k+n0ZnXm+6Imh34V0E/4ZtlBNMA6KfQIIoyU9X6kTdo4JW9ArV3dIa+jw5tvF1AV7K5OGr3vBBSfcqj2XDy1QU6AsiD/Hlwq6DceBJjwmPaizgf2jgQ==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRVZ8LWr/idLKU3izk+OmfQwRu8cJN+lOSJyNJsG2YMiCeBUspIOSa2H/zWoQN0SI0P54VvV4bm2aIbQBz4hDspx/uYRgOgdeWxXAF+TU4SW8YlcyhY00xeIGqBlbzuF7OWbNFZ819cXRiFfemf6i8F1mENMKf4Mx+obqFMRRxIYch1r9kCtzpPRQUuhmcNEj0bRrYabvUt/Bq0xcbKGeCW4WBEr5Lq4/vCQ6MooIGcxROHS12M/Anc6FQ8Qiso5CfdjnKWrq1njc72XgrMCTS2O7svYBp39O1bp9zfbxstV3xy01q8v+vTJrUBBnL4wadRdNWb/NZ+tEYqRDiOhRIg3q0hVjc0dmyX8WVypdCxhv4dDf4DbT00KOdOriJFuY2ukKMdr1IThK47UoG9WOajaiPZflAugCTtNBVuOtbRrc=FastBusiness.Encryption.End&DetailTaxPostInventoryUpdateField;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22XIPqNY0AUf9jSS1b0q59dMxPa9B9th2O+3zJoedjFAvSlyBpHUlPCPy+HuzVU0+Yg==FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUmN0gBRDhTrXoVuGh98qeTfIMTleNHRvJAs3b46HXI5w=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XmmX8iHxKiftZ59+Ba+6M5ZTnuBfGdZHAZgJQXRLEvAFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8gDRVKsm6pcsjBzusKnpfecr2obuFrclrt43BXZvgfOWvd+7F9+Ni1w7Qv3fCKMvK4jtuXe75Y4EChiQchsbw2yV28cWt0inIlyyDSsFll8i0JnCiZztXwibTkFsT2lN9QxaiytaK7AVtRzjKATSpc2rTMfDuHQmI1ZCyOMOv2oOIVnSkrmDDkP5omWCX6QkVELXbLFPTxelZDTlmG6Xqx1zomgLTX4yxyIkgAj0G4WWzQxmSdH0iVGMy4HmU4s3rPb2I1NPS7geVgZ0U9pLdVhu3QoKVI2Do4m3+ryiAzTvcjZE5yT+MZhyr9R96pCbfHXqfVc6TR8HLXSmZ+60Kq8x7dUBBfof33UaqobctuXcECB2K/Yt4zf23ioJaLZdEEiyjjmCIpsC/QidP49ZqakC1S67mXIuqnE1vDFoYBUhy2RxkeN1BrEcQSHvxSRoK5uiZ20qyyjdq0kw27paa5FaYZD5t9sv4eQXo1eipUrZAYmEFGHDYmFfFXuMDvPmHeqPblC3g6p7RSLhJ4PVYK4=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXImNDW33DtwcF0Vv8d8qrKrFCJfhPZjVZmORSbn7mGzIXw8DEmzPs57DVDDXVrwWVTnAviZrVwrtiOQmtwsVRJ6TV7EyrWbgFB5vHH3r8x80=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUiqb/kgT85EjJCpymbfv7Z7OoRkc4fIvG1kN/vvEZIbUdqDa3dxv5kXOPB6ejuaU+RzBzvnMjEp5yz80HDMKNGrFastBusiness.Encryption.End">
  

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
  %Extender.Include.SRTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m76$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDF" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập hàng bán bị trả lại" e="Sales Return"></title>
  <partition table="c76$000000" prime="m76$" inquiry="i76$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb67k+TwS2dOisllXXCwNXuWzo5tPV7xyV6kFJAFfSb7XDzFuaGtC9HKwMHG2uN2dMQ=</Encrypted>]]></clientScript>
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

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ma_mau_ct" clientDefault="Default" inactivate="true">
      <header v="Mẫu hóa đơn" e="Invoice Form"></header>
      <items style="AutoComplete" controller="VoucherTemplate" reference="ten_mau_ct%l" key="status = '1'" check="1=1" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" allowNulls="false">
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
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d76" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="122" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
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
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6GY1C3pnCCmrtN16UexKCvgh4bCLk3luR6gcyHKeXAzg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue_co" clientDefault="Default" allowNulls="false" categoryIndex="-1">
      <header v="Tk thuế có" e="Credit Tax Account"></header>
      <footer v="T&lt;u&gt;k&lt;/u&gt; đối ứng thuế" e="Co&lt;u&gt;r&lt;/u&gt;r. Tax Account"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
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
      <header v="Tổng cộng" e="Total"></header>
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

    <field name="ma_nvbh" categoryIndex="6">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="6">
      <header v="" e=""></header>
    </field>

    <field name="ten_khthue" external="true" defaultValue="''" categoryIndex="6" maxLength="-106" allowContain="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chithue" external="true" defaultValue="''" categoryIndex="6"  maxLength="-107" allowContain="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" external="true" defaultValue="''" categoryIndex="6"  maxLength="-108" dataFormatString="@upperCaseFormat" allowContain="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_vtthue" categoryIndex="6">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chuthue" categoryIndex="6">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="invat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="6">
      <header v="" e=""></header>
      <footer v="Chuyển vào bảng kê thuế đầu vào" e="Post to Input VAT"></footer>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irZa+SBHlF2pGqXeFSpWrgMuRN51HCugmEp7C6061pJkA==</Encrypted>]]></clientScript>
    </field>
    <field name="tt_yn" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true" categoryIndex="18">
      <header v="&lt;div id=&quot;tt_yn_tieu_de&quot; &gt;Cập nhật đơn hàng&lt;/div&gt;" e="&lt;div id=&quot;tt_yn_tieu_de&quot; &gt;Update Sales Order Status&lt;/div&gt;"></header>
      <footer v="Cập nhật đơn hàng" e="Update Sales Order Status"></footer>
    </field>

    <field name="mau_bc" clientDefault="Default" defaultValue="3" categoryIndex="18" filterSource="Optional">
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

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng tiền vốn" e="Total COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tc_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng tiền hàng" e="Total Amount"></header>
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
    <field name="t_tien_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng khuyến mãi" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tien_km_ct_nt" type="Decimal" external="true" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
      <header v="Tổng khuyến mãi" e="Promotion Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_km_ct" type="Decimal" external="true" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true">
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
    <field name="t_km_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true" hidden="true">
      <header v="Cộng khuyến mãi" e="Total Promotion"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_km" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18" disabled="true" hidden="true">
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

    &EnvironmentTaxFields;
    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182" anchor="10" split="10">
      <item value="25, 75, 100, 29, 71, 29, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101--------1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1011000000-1001--: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1011000000-1101--: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="101---1-1--1100--: [so_ct0].Label, [so_ct0], [so_seri].Label, [so_seri], [status].Label, [status]"/>
      <item value="101---1-11------1: [ngay_ct0].Label, [ngay_ct0], [ma_mau_ct].Label, [ma_mau_ct], [ten_mau_ct%l], [ma_dvcs]"/>
      <item value="1010000000------1: [dien_giai].Label, [dien_giai], [cookie]"/>

      <item value="1: [d76]"/>

      <item value="1101----11110-1 : [ma_thue].Footer, [ma_thue], [thue_suat], [t_so_luong].Label, [t_so_luong], [ten_thue%l], [t_tien_nt2], [t_tien2]"/>
      <item value="1101011--1-10-1: &DetailTaxFormViewAccountLine;, [ten_tk_thue_no%l], [ten_tk_thue_co%l], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11011----1-10-1: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l], [thue_cn], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <item value="110100000: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110000000-10-10--1: [ten_khthue].Label, [ten_khthue], [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="110000000-10-10--1: [dia_chithue].Label, [dia_chithue], [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="110000000---------: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110000000---------: [ten_vtthue].Label, [ten_vtthue]"/>
      <item value="110000000---------: [ghi_chuthue].Label, [ghi_chuthue]"/>
      <item value="-11000000---------: [invat_yn], [invat_yn].Description"/>

      <item value="-11000000010-10-1-: [tt_yn], [tt_yn].Label, [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="----------10-10-11: [t_tc_tien_nt2].Label, [t_tc_tien_nt2], [t_tc_tien2], [t_km_nt]"/>
      <item value="----------10-10-11: [t_ck_nt].Label, [t_ck_nt], [t_ck], [t_km]"/>
      <item value="----------10-10-11: [t_tien_km_nt].Label, [t_tien_km_nt], [t_tien_km], [t_tien_km_ct_nt]"/>
      <item value="----------10-10-11: [t_thue_km_nt].Label, [t_thue_km_nt], [t_thue_km], [t_tien_km_ct]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="5" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>
        <category index="6" columns="100, 25, 75, 35, 65, 0, 0, 37, 92, 8, 25, 83, 0, 58, 42, 8, 100, 0, 0, 0" anchor="6" split="10">
          <header v="Thuế" e="Tax"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 25, 75, 35, 65, 0, 0, 37, 92, 8, 25, 83, 0, 58, 42, 8, 100, 0, 0, 0" anchor="6" split="10">
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

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i3Z2bB5RLfvZbOAsrqZxyGct89UmZdwr3z9Fbq8fwA4kK7HxdyRNsNwYx5bXHStBWaRV+rq+GOzW06GoQ/WskW7EG6GjXl9x5vhFFj0G2SOEiRJUjYxUHTJNY/u2sCtZFyUTgjR5pMgfHuupLCRdkHphin0NhSnMwuoD1K2Ql1UedLq8Wiuf2GbAQWuogHoZEDwbrFMTt1j/BAciFiHClv0M5ihnftpTRTeagLeLUUebfvzJVGAly6nkQ9jrKt6nNPrKhkmuCP/yn1KBJ6IsAgQ==</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnbxwoOS/qU7vMcMRF9zvVgLRDV4UWpwGB/RVJ8hUkRrUlcW0gzjBAP4uROFjzC410bOAinkd29gqBQorjkuK4uJGPUtILdvI+UmxIVg6+IVXs2f3tiWwn7GpxLvpSixu3JVvds8BED5ZBw8uevZVLCeePd0+G0Id3qT9aaAVjBBimvSBwmEGt4WmHa1g+59C1jsCHbRBbp6J0/0guioV7KJbLyOR3zHYLXtYaR2wl8pSMX/8Rq9EYUtMLpHgm9wVbVQTHDEbUoGnGKr+nwl3lfJu0F2qQUvEA3QZqipg6SA9Gy2WY8Q0heDBJqsrh0xCiP4tzln1TikxJkNU7flryM3ROf9j+a6XfsEdNZkVjafks7JZ39xFZ+ZwHPwmuGWA3z0WqTEcmJtSbL6E9c0moL</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafWNw8VS1/1SuoU1C/tHnIbfpNJN/wv0fvyTpP8KK89TF/9/ia+xMKsAW25BOXTQO8i19fPyvM/4uuqggAtXIOUvgXFwI4UUrnn4CKCWnMcsNCqgn9ek54O4YO2EKlwfhZAnpCPYpj9YV2+uzv7nyOzg18xG9z/dLz7vxeLdl3a2X6dbZcnSjXLwYGfi+KYPqFQ==</Encrypted>]]>
        &CommandGetTaxRate;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22c9sfopfi70E0GnmNt2J3F/c07MPiPJUhdorEdIC4g4U2xR47XsL4IOncyU3NRxqfA==</Encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IIN9NHpqFyfDalh8R+f49igDX61jPHd5cloUQkOXL/Vao4a53TDfijETRiXyj7p1RezZyzUsvIMtxG5WHR3dlzh03ITu3kuwGsxGZQpfYygdg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcSuauURHWxntFbDY7fkuMG66wURFgt/cJs4I6Z4RIaOfjQUFt3DVcGkhWY/zIseZVs7HnwFT6EcQvRC4TnH5WoCbdTWd2Vcz5jKSXLYsbxGr8GvlZ4pFuYeX6bJX0VlNo=</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHOdC9Wwdon1n9pLwnB/xAtTqteWbmaTsYsY/FFh9GmCvNNz5F5ZxxLPJ/VvhlruRhHcFFx9nPOpY/JmF7PKI+fcOcSwqMeruvzd863ITCj4dvJ6OFW4EYelaZA5jFQjWPXY7R9CpOlxPuQugN+bvlZNo7fb2oI+Qe887sQ+B/0cB4v5PGZnGORlmlPxzIPGzgDdgnGt82px9NS7lMsrub85VZrURQ3y0c4mQ5SjHVI3wahX5zL8d7h3y+bhayITEqJTKNFqBQpfBrz03qF6fan/p4MUfs2TMqeaPc6lDsMhf0B2DluDNxw4s/6yxmGq8g==</Encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5J2b7GTHk2/3HCNfXlIXpB0X8o3to6rrq+ToZiGRGjMQl6LhH2+6NonOIoBd2cpGRQ==</Encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckGeneralInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AskOWfL9osONYtQcivMlC26g9Ooxfojbg7dWdxM75lKIx0ppEAj2WSTkVQmPixqDsIQ8Tc7Kyapon17+RPYIQaXd</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIgFsRHhsiDwwtKZ5YNocdGDNskOGGz8mtQ4yFljYqFpAxFMo5lji+RwZplWOUDlmLVV/epHMf4COynmQdWPLSLOxuE5xjNyWKuMXw3qIKxazOHS1f4kT+fpCDUyJL9TxCQy30QCn04ZPlMlhotphwYVpv01+PvlZ6nGt1+eBSJ4ayPOYgBABPSlNyN1sNeAfeK/cdrBqltrbSY6CzOkrODeaDu/H7n5c78PoGyiT/aMytRgodNCRlPo20IL71L9nAKP+F7cahGbkFPrQ1lBo7OD00KOhWbl/K6I1yQA1dz2kunj4UEd+FZf6CqysL7Iy0pKp1YC0mQxXx1rY5FKEuO4aw2pVq91iBAkwEF1rPTi</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &CommandCheckGeneralInputVATInvoice;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFKTHs1Z7bY6Fyvqi1fEyutsqJ5PfxwcB4PRb4njCdBwT2UHG4AFw7aismGx4Buis2</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &DeclareStock4Updating;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDdOb/yqo6geDyZ+FpLbFqqOM0YTSaqyD+Rf/VzbpohAxCdfZhWJhztHJgnFIHw2QGjnxzSecBa0MshxMtPsmNt4L9JBTE41FIfAJz660anV8dU/dmaH+pCo8jqnrK7JoRzbT1eK/Q0n38JMOq/qKCzxBZFXRFCwZBnYn+6N8Vsq+5nupXA+MBO+fUWtWIFS7v8DDm0eJnezCt75PXKzbkJq8+dC3sU5PzelstoFGRxj7uTeooP7R0UN/imDlAilnMPsZDcyUxv2oebbZypOL97CdkkiFnihlPInLralqmB4zrOPaA7KzYwik8OvredFqDDczGCLEaHCoYk9/URkrzVU=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RWSuP+Bsc/Dz6V9190ucwncqzjO3xaRrIJAD3DA5vd+7J7I+w+yW8zxv9vNqB5eV5RcHB15RDuQT/R5V8wNcifwwq1IK5nCtqur7Qv1ZjJ2kfQJBlL2HBKiZpez2zR9vLGmis8ORnqCB+QsFuQ1Zi8+3l77zEZW2/ZYBN2Tt/jkX0Qs+8sVXQy+7nfuBibbEr5LNyhefWHZVCFy/3wbP8ndk0yAC0AwhEEMYT8jVFh/RNTwwAhIOndoamG9fMkHbkr/rC9vgAHx7ZfT5amhWdg187PsU7e8paohHeCMnUieh2JrE7IOsgssVgIqTPYgakYcxa8eiCHbJChzAhYP+JZBDVuMqzfd+0FYDWdhkkoWM8bKGbd5qiU23IlOCFY+/2wuBrpVdLVsEjWNa/u0Zr9zlbsz6KxXzx5aq2oVpZv0Gnbyl8i3RyM4+Jcn0uCATIX5nITjndpv7nxaDzXP6VPSAtSI8HltKBhCktJ/91Qs7nWzc85qByXeiYBKpDFtew==</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock4Updated;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyEjiY2hB1L9yMEevyzm9SjfSYJgdxUFA/Il4nMMNUZJ4rVPq7wGJ91TDh69EYLnnTHySralcK+bZ5gi2nwo2Dpr</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
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
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR30+ASx1OchVBTzXiFuYubfEQ97sw2yU7S6kHUwHwpQ0</Encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu32MRCyktf47g+phqcP0KGCNSz9RMyndek/qyrQHxU5cCevJWrQmr1rtEvAQ0exrdg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8XVRobnel2NUMtfMYfz4fvZ03PKaKa04Rec1bZrPf4YH+tvyRef2wauaWVHcI1IEj+GIFO0/v2luIdaEYEuK+A=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAYjjbCQqmLFMh7B9JOyKX52rd0XL8/Mvypo+MHtZIzwKipy0Vmzw2ze60TJZZHtK8vhou+7GBzx62hP+G219tAAULb0bISFc/CxdnmGxS39lFtLBk5TwurS18BvlP6uOxxmgKJd+GjnZT7FnIHH8CKpsvJGdiVeA9D+fYJj+P2keROmja68BTzyhtCZBf3sg2ngLf8l7o+zFppXOGGqzazRhBEAz5+GjcXN5Peg+ilN1OfIcOxkvqPD+e99Zca3s+/gkJcacfAkPGWe5SMBIDcX5iCJd/I2kCZuYEUhHpAhv8nFH4t+mu43O4vRHuq86dRCht8C0t8yLQWfbqGFWZcm0idgVQhiPC7qzTWO3DZL2lHWhbCt1ui0iojGv1Hmb2RU35bTp7c9A9cCLXVU5OLK2IIoHuMUXDKsaNvp19VzyNN20e1EL+uYxxbtxKsdqR+P8Q36sRLEfjZxpPQctsVhy0srVNO2W1JqQhS8NbtZvNXj8702Z8lGqq74U8/fnKKUZQ3Yq2wIbz9VVgAYsULc4wqyU2/VLk02qkofohcKBQlr7Ey8LUJWhftjm7QppSGvyWFOLClkMi6Qlr+cplg+oTJyY6iAFWQs4BisrREI8dsuOLavy/nTjgrGt6WuYSIvl2eXFHTfz7VMpFViJet0VrLk2SfwpXqxDwaA/4viyneNbeSzrBZrbt53iKRpQaYKE6N9dMf2hePs6xzIr/3HxiG5rh1gmZ9QpKUky5CN+6vPXwXuB2JdSkBy0nrRJd8wWcu8rPZ5D9iXJwZgBNCAy7bWJSe4p+0dsah5o+hQabDvNGMHLKv0jGEsuU3/N44YcsV2JvltsKTURUBcEY9HrxqRw946oNzdmx0YDFtMx6iE9CHJLpHQKlCPKESPSaO4Dt9RZnfELOLE2VozZ1FMHK0ufcUfYnS8dn9fFM2kh8DDqUvDsENmu4qqdf9nPmO44ker07nzDmXW35r6jM82KaXjXMvFBQB38asInj5Kn6D8eoHcdd+XwJhsOh1BVeaoMXhkPkPDChuxfA68JIfTmmBfM3HPOXjUNLr+YY2zXVn8Max6mnwd2Jw/YMcijh1FkE0CMF6qmUom4IFxpiQAPtSyegbLbWweqbugz/Jiw==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;&InitFormDetailTax;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+UV+gxx3lB4jcv7MYrLXXFXZYicX9kzX/fvPcK1pkOGhXamHieRcXm1pgGMnDFx9xYDUEassUiNFAvm0+nWHWJ6JazomtTEo2rf05xXSt5wHg==</Encrypted>]]>&LoadFormVisibleField;&LoadFormDetailTax;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&EnvironmentTaxAddRender;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVvb6s8qbyPV7Ap16kJMcoDU</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&EnvironmentTaxRemoveRender;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezymg33j3bVOCja8lovrAV39Cqt7XVFu7U47zAJDhoY32xscVK9HkXyZfU33bakq79tR+mGLFxZ4OCdjKm4DZFD7pHP5wW8pRwKjhitkN6tA6py6osDSvGw5RH1CJAXQga4Q8M+a2bQAHbhrAT9L7qQIztd4j/cOKTHnNrlIc2+gGKnCYF9XyXLMolyz+DjdeDlMvvTA0ukQL+saaUQa7jWi4/KEaC0TVtDYUhc/flMW87MLp8IZzH70Ap02qm5WFf</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxNmA4+4taJk8pi+9GdkGBm6frEPwOxeS2rSpf9WooNcfxc29G8XxYNsoGrguss6pLo+WgOmwrk7dnAZGX8UnV47exko7LM9OFWs+cSbL1eyV/smGriz2qdjkmECilPdY5qxWCSLgNI3jdA40OmNjysRvbv0xXwSsXE4qbP9bIaNMBxdxmgpVSVWOzGh9lQ2TZ</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbEyp/nTJwRevDu3Dembp1TNTNqx2q97j6sVX3RvLkDA7COKhMcdPDSGBJq6WmVtkGjpS9rif/+vG3hMvnU5yPDXbAy9BmW4JyKc7+EttSLnbAuDbyUdUfVjtkclwlnJmpcxwSIlbYgKSZ4XS0VV0x2pmsFu3OUHhOuthrE3emASx0gDRwQQ3lqcND6DBEtWj9icQTUXij6SbhsDtM4/bE3c2qFvbKw6P6xx5Ei6nCZuLXH7JZAl0wgrYG2D/UcSDAwt5T0Ks9b5zx1Vxpzv+bPef5tqpbeSetDWylEyH+zDalofvNWI5AU18I4iPmLzepRTBS727uJHvxp+Y364QcHV7pC+BDWzI72pN1d706yI3P6kcLfE2WyBL+i+frEplfEHaRmcv/oyF3xuEFA0DrH1B+UbC+Ot3rCzltAC5w6Ci+3viEmvxMbaiGpe5oBDBmafKeweyBXlxP17iOC3UjTWdF3EeQTvU+14Zsc72aVFUX1K4BLGOxFutGj+zk9H8kfoF8FGROjogXSHvEZ2zlI9sHCqsEp7XrgOB8NxntBkc=</Encrypted>]]>&DetailTaxCurrencyCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fCWaFgC/vY2QDikSkCHXizpgD9X2/18Pok63APBoNdYExybmdNjHYuWjTwZpSwAKmwlGSru9gk35f6DrNU7znbp6TcUqJLIRld/gmBsFY/ioP9UrkppPvqsFS5w3eo91w==</Encrypted>]]>&EnvironmentTaxGridFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOpC63l7+O54hLlTPHtTWRAVPGmu0sjkF3rQiFQ05nh/Zw==</Encrypted>]]>&DetailTaxFormTabFocus;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf7G20NAkY16FAxWPu6LdNSF5ueKCOuBvO3hOIbpHbiv1x8mZEirP3U4F8g4pREVnyF2/8GS+fAM3KbYq2Wv4348Ioa/rRf5dXA9Qh4MiqeuvNjNNz3JS1Klvk20jUCJ6rg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/787ZCxlsTjXAbJ9kkod2GP2Zu9QojMODHymH+jPhbAuBg</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKFx9o3nzKz0xTET9X3NSiakIXvzYX2rTUMzK2CCsdyvYvHb1FDkaKGkO9oftFihVtg=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/780aeNPWGMIBHrXoTHtxB9HPVzZU8hGLw5qMinMMx+j8R</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm6prUOHCrGnPl7mgHLoYs5G6PbdnQGr9zG+PiKq5oHji8csUgtqAfrA+HI/o+ANMMVfrmEgbIeCN8F6oNqGl/Obc4X+cJTVM1mh3W+WpE64ub6ZC7bQrEsUZVgjV2TxJVoFosAtJfkGullD8+AUnl8oPV3/mhVR2p9PbSwVNoSIUuurtCiKfIXRF9oWYgqT5CTxgdUQ3fjW0yutham2EG8evkHZgkR4sg17HJh01ehLjkL6OpKP6dGloQCks25tjXDDs050liLnfIn1u2PDRxUfPUja0dX0nOkoIyd9yfzVJ</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &EnvironmentTaxCurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/9rdy1ugwBDeYPHYVJSbxu64JCVQcbS0yt3ABH+SuzHIVXAInccxfg4U1/Sa7zEChtUPbnTRXSXb/i76zEe/caR</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnHYX8vcRkjNxUSY9iS3GCreimFU1CpHrm6+SRvOEcg7+SBsbNXz/88MXi+DgCC+HeqiBjZVmHVYCOmPV1XR3eyr</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnFeW0ndgsoQTwX64uyewU1J0c9Z9CVSGlTJREpOM9aJQ7tLHSSHGZ3BOCpJB1e0a8SkdphrTaIyxN6AfAhTkrTW</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyUb2FNB2vjKEAq2Yui8YZnEKbQfob9VqeUf10BPNsmWBj6WFCUW2l2c9/aS78YcYmfqDrp2isaRA+jkckTTv/gdGx5Z6Ik5c6NHiw3VT04rL</Encrypted>]]>&ResetCustInfoFields;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyeuKwmm289nYweroUY3CKSq6yrRzikk/jzB+0EVs0Opp0LevaG9EVxNyqB+r5U98H//NnECRNuHGEk5t8HlQNRZX8URJjmDWOsGkqd/L1p4qbC1LA9WYLIyFlhq8u40QnaWUFPtfrifel7jQ/e21WpOaUfaFuW2Tu/xrMyKvh5MdDHE7R2J0oMpnvUfvq2jB8HDMbPpon2mVa+iOe8PJvg+8LWneTuRutsIxDVE5DW9EvU52jODvgflz1dIGUtNvmAHWqCYqFElwwj7xyu7cbWiPoDO1yQ6vZ1ZPNZ+B9CJrpf6udP0X0F7JkOWJdniF+JWQBCK2t6APpHW2oxq/+zO4hh9ozweVJiuDXqshO2xprWPgeNe88vcKjTE30gnvjeqLuGx0bjvIjpQFRQA6YjWsuEci+Ovj++DGkimkQ/BdEkFFisWbpstJdy5RawsRc5G7VgAvDfudOykfSBfsGS56GqB8bDmVjb+OyuCSbTiAveJDuOKS9Senp4QCiX+Upg==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWQifBzijL5l/kd4WLJjGoB8ezwSwm+w64AO74FVpj2wt</Encrypted>]]>&DetailTaxFormDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q4kqqmDtqloCaBmCcPI5GJvcDuD9AqdMdRVnjXmGHZ3Xd6M+5JNd5cX7Ki9QqhJSpcyUJrAqg683PJq+yEDFZeRh9E2jP7P6/Bc+Ilwa+QPfCIg0hZW0A9iv7KuTkNuJlm7nnnVVc+mw2r+3NZNDl/I4jk1Djr42x34XznaOud4uPeaBBoteTH1h3yiwH07/8qn3fcOZwTL78isPR+5Q5wn/IyRc9BTks4iHFn472Kdx8gp3puP7JAM74QQwo10rWmx25O+8i/VHkBP9Seb/65XnyVkj4QNUuSZ8ESTAnSIRp/EfLSsuK9zKwa5deM2PntKq7/VrR+hBn17UnwFDr+Oq7o9nyk+K/LHqz/R+zmU7qrLb+H/aPb5n/9wPoiXcCbi9o5wQMQ+xL8WIp4WxhoXsCO76tH0iuaLcV4m4OwcYM+MSp6e72LY4/g+DGWpYzenP0Z1VV3IVzrc4Y53G8uBu4+djs2coXup8dtt3nJP3/pQHYwS5ycmrZEK0sfVxM60BmJs8l1r4gk2aclZMCGxldvbpf8TGyjekFg1X8cuwZmPiXpjGGIKIxyxCEo0uIaxmroapJFBRNGCs6ElXKWzEoxCAPE/FTst/4BlqqFwAAECjvD3Am/gjL1zgn60iJdNkLrtNxrjm2ph9fki0KZ7DbdTyJZdq+Y0Vfp+f58j</Encrypted>]]>&DetailTaxVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
      &EnvironmentTaxFunction;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8BJ/yE2cpeAsA1BTkuH/9HYuGAcuSm9eZlFO6Xwdck2hIdc4O1aEz/zushn4GqENvPaX6dk/MgKi8/ASbKz4ulw+lOrrmgZbkYnYXzel9k8f1a3cH8owxzptS9zFaRqBlqbEQWPSlg0vCpg+WXzmER90V2SJ2jPywWhTOvnu70l7dQUqKBxDqwoQYA6FlLpEvXyOGuyM1FDeICv8nP9GwGNH66kVbf9j9uNI5yXl4h1Q==</Encrypted>]]>
      </text>
    </action>

    <action id="CreditAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7hebNeSzfibyt27Lh/W1bWjpgQc7WB+e4/RJ/h5ucFZ55y84fqV6EUesTvz1k5Qtjg==</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcDum7OgsB+rbcY3J9ELGaF9sWC1zuZNdzJdhFRS5EOiyxdl/SFIJ0qSnM2T95qyYZEmTvWypprFQfZHRltdrmz98Tmzeq/bpkivLBmcpAgEc=</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgCYJGCVVwfQnCKm2KqVjJ1wYtK4Nt7hu0PlxG3pFWKBfcG2m1KZgXnrIsTKw2CWYyqehLzPcUEBboKZ7eGqFCSA==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &XMLGetTaxRate;
    &ListTicket;
  </response>

</dir>