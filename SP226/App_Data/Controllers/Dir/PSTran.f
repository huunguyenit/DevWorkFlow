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

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;
  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTablePSTran.txt">
  <!ENTITY EICheckDetailFieldName "d86">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY CheckGeneralInputVATCondition " and @outvat_yn = 0">
  <!ENTITY CommandCheckGeneralInputVATInvoiceBeginTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceBeginTag.txt">
  <!ENTITY CommandCheckGeneralInputVATInvoiceSelect "select @verify$InputVAT$Field = 'so_ct', @verify$InputVAT$Invoice = ltrim(@so_ct), @verify$InputVAT$Date = @ngay_ct, @verify$InputVAT$Code = ma_so_thue, @verify$InputVAT$Serial = @so_seri from dmkh where ma_kh = @ma_kh">
  <!ENTITY CommandCheckGeneralInputVATInvoiceEndTag SYSTEM "..\Include\Command\CheckGeneralInputVATInvoiceEndTag.txt">

  <!ENTITY CommandCheckGeneralInputVATInvoice "
    &CommandCheckGeneralInputVATInvoiceBeginTag;
    &CommandCheckGeneralInputVATInvoiceSelect;
    &CommandCheckGeneralInputVATInvoiceEndTag;">

  <!ENTITY DefaultReportForm "3">

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPjJUL5wa9JGA9AYw0FAE38z6JfztQ2zo6ruHUkPYrViybEYdhZtN+mKhP0w/0qm+YaHRaQpy9olBVY1ZJqmVEU2u1weZ+1hqWontIBGfernxqzjSZ3JUQ9rbQNVANUnoLMfKsiN0HeWogmXrAA43h9XytxvoBOi9ICBNxAU6NVkj1gERkgKM9GqKE9stoRlIuU+yWA7LTOz0XTtkIVlyXRwloQRh8tJkzj/DlbAYrrblAGqU0hFSXiPll1nO/jT0nf4Oda+mns7fj/gx9t7JDCiFastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTdxdKQSrPXDWtZIyEmQiPjJUL5wa9JGA9AYw0FAE38z6JfztQ2zo6ruHUkPYrViybEYdhZtN+mKhP0w/0qm+YaHRaQpy9olBVY1ZJqmVEU2u1weZ+1hqWontIBGfernxhvt7mJjgAudyV9M6cnoeGGhZ+fl1p0HVM01ZUSf6fXY99Vp4I7GTO6aQ7jOxxsVSTSwRogz8QbIkraL0ImET6bqZYml00EANWwu7VGPcHhlxtPDVVHBBEYffXHlTVGdaG9mx77eV/UTP728EUd+3SBd36w4tlMTfztmKUpbxs1ZFastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d86">
  <!ENTITY DetailStockType "2">
  <!ENTITY DetailTable "d86$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock int, @vCode varchar(32)
select @stock = case when @loai_ct = '6' then -1 else 0 end, @vCode = @@id + char(251) + @loai_ct + char(251) + @loai_ct">
  <!ENTITY DeclareStock4Delete "declare @stock int, @vCode varchar(32)
select @stock = case when loai_ct = '6' then -1 else 0 end, @vCode = ma_ct + char(251) + loai_ct + char(251) + loai_ct from m86$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updating "declare @oCode varchar(32)
select @oCode = loai_ct from m86$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updated "declare @stock int, @vCode varchar(32)
select @stock = case when @loai_ct = '6' then -1 else 0 end, @vCode = @@id + char(251) + @loai_ct + char(251) + @oCode">
  <!ENTITY DeclarePost "declare @post bit, @vat int
select @post = case when @status = 0 or @loai_ct = '9' then 0 else 1 end
select @vat = case when @outvat_yn = 0 then 1 else 2 end">

  <!ENTITY f ", @taxRate as thue_suat, @taxType as thue_cn">
  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC9a+b4Wqza7wu6vgT3Ip/YU9ya+LNVx8nYEEdWvD+ABpf2gSf6KwqP/53PEUD+fnanCyDJWSGMb5jk19Sqjl6ZuEc7t1MDKeAcFefT6eMTKGveHyHFsd1ZcOXKWzygjiKsdII9M91yW0u1rAY7vRi4/tx3SCZF6e++EAK8Atx8L0w7YmJsp97tIEfIhBDBNgpHQnIrMnPNjLGD0kWXx/F4Wkoj0txt6GPFR9z0kd6RT2imHhHpoGIFbGVuwUJvueWtVPxx/Mf3w3AGjZgJtY052ZS2LV0GOV7p6VHC9M8RlPm0rs3PgwoFB1gZ71HU5KYwV/7zvzIGQATrG7qU/QSavCmk5PAbEex2R2ZpBFM4iez3KolKkn7eSp8TvKMDHE8FastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSCQNeuJkDt2V8k5zsbQ0+Fj3a/omvqPzgFeVD3KnfUxtVHXSVEo0oIHJStBwWFT7wyEq4pyzUkrCD7mOpCV381/fiprT0rev5blosqFUbct5eX4WFakS962PBom9US5DFABPMaG566p2nksaTa3M3X5bYFffkYeHD/x9fT1PowQany1JrS1joSDQMAF4whvt22SfRUTP93bP+/QJURn4bJvWaOVd7eu6JfrnAg9v6DSM9OuVkp4VOB0cWgxtw9bAOoSrlm23/8vauqoiGTFQXe2QuGtmosnkQPDKuelrop1k82V2v4XJWlMRNM1RehZo2jaFtcnX9uCRUTyN2oZwjui/80fSNRHQxYR9+q7OwiKQdTMexBuU7krBmzcLOwq4yhZW8LNeuFKYkNmCOlC9nYpBSr37/j+lLidTpqjV+LktNi2i+gpF6PLuKVoBnCE1UZwPMIKJpNBh8DdpAWkhVVKdaNLm0hyTdsW7gBPyBLMf9WpQgjxiB2L2hJJGK5n3o5ZRdYkmoe89wPm0ta7Y2ZFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcIjW4B9FgDSgsf8k+n0ZnXm+6Imh34V0E/4ZtlBNMA6KfQIIoyU9X6kTdo4JW9ArV3dIa+jw5tvF1AV7K5OGr3vBBSfcqj2XDy1QU6AsiD/Hlwq6DceBJjwmPaizgf2jgQ==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRUrGtEO5gRQksDG6Qr2zbnyMQxQIGbTSpwIzgVlGq08VTitiQYID7AWuW3IOAaeUu+vbiP0CT05I+55YICMXrIlD7WmQYalLnDOujuMg30/XCHGLQgd2vhMgYMwAS2XJ7U/ziwkFP0YtdGMTe5Ocjl0mJGF4gMwYYytE940//AxNlb922iDgd9AmtujXXd2+JUgWA3jRLZV5s1P3VyDMGNAWOS545clc2NC8jxwWZ2JQ=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$fJTw9Vw4Elsn0BtK0cIs9PqEXUSzh185GjvpuJe4U3RV37Ser6mz15GVrl74by+sFastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUz8US4IYXCOQ7H03t1kryYpO1iVrZDVVKea8/7zeC5C4=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$fJTw9Vw4Elsn0BtK0cIs9JljyoBXWETojOTG/trmVIxFnvFGZcQ9mrfMcZJfPRxcFastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4doKMcX7VN0mHpnhE+z0bP8FdPLqZCET4oX9A/M8seEzFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8gmDGjzHpLqQoJz5u4lTv6tTE/X5wURpzIDPUdMmPohko8kA5FZbm8PrcEpZRNiZEClI9GvNpTVwfNdq0TWwsrqPaELiA4r5081hhwlOYRje7hvLE2d7SXBs1/2LDem4JjpK/gaH7/+unYehcnVehl1s1B4eGA/rX7pzMLVCnFWkyB3niYItxtxEM53YU3uKD34rmZehXz7peTe8YhIwI//GNZi9pZHqSBxaOaSdh6u+omy+vmnDvmxIU8htpT+sfENGRSYu9HQ5nQq3SCdzlqy+CIayQdPQGIHj90IAkdouCrMjbde8s9JiWbvT5A8MiVudVzBItw4S2AckVtZnqdJV0933BOebKrYWlK0Y8LkQF/9x4Fb4hc//dgiiGchXX3kEr9gEclGWxv14VGFA3nHxA5WB5jLAQO+vwJl9sUpogWEwg4asL4UKx5DpGQo5szaE9sMjoWgl6lKDa0dgKfir+OWWulvQ0Tjoj2DRsfel9oTv5ALrQxWpP77IdWmqoNt+wTCsdcmJUI0zvcQ3HOFGdEIrmPzztsvUtcHYK48wFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXKYkVPDH6iwFf2hZOjif56gPaZmbOiwQ15IHuUnhXrWc=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu37+jrfsgyC2qZL5IIGCW1DwkiRrpJEJdWbipHeKEhBKzlVu3mJk4TJYFqg+kKro0A54GBIiXmf+sp3+OwtgNz2J9ZFLhawYKVemaaG1V/5OFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSk7eGZzjhUCKPR/Mh1DNUiqb/kgT85EjJCpymbfv7Z7OoRkc4fIvG1kN/vvEZIbUYT8iLD32Wny8Fp6+q3iXY5CyniVF3b87HtSvBt9BrlaFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fakWddQ75q0S6i+Veg/RyY=FastBusiness.Encryption.End">
  
  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PSTran;
  %Extender.Ignore;
]>

<dir table="m86$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXC" type="Voucher" uniKey="true" replication="4" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất trả lại nhà cung cấp" e="Return to Supplier"></title>
  <partition table="c86$000000" prime="m86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" allowNulls="false">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4cO69KvjMIE3BMTIrGvbL/WAWB0Ho0fcT0WEGXIiPBBg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
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
          <text v="1. Xuất kho" e="1. Issue"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d86" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PSDetail" row="1">
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

    <field name="tt_yn" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true" categoryIndex="-1">
      <header v="&lt;div id=&quot;tt_yn_tieu_de&quot; &gt;Cập nhật đơn hàng&lt;/div&gt;" e="&lt;div id=&quot;tt_yn_tieu_de&quot; &gt;Update Purchase Order Status&lt;/div&gt;"></header>
      <footer v="Cập nhật đơn hàng" e="Update Purchase Order Status"></footer>
    </field>
    <field name="mau_bc" categoryIndex="9" defaultValue="&DefaultReportForm;" clientDefault="&DefaultReportForm;" filterSource="Optional">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" information="mau_bc$dmmaubc3.ten_bc%l" row="1"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" width="80" categoryIndex="9" filterSource="Optional">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l" row="1"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" >
      <header v="" e=""></header>
    </field>

    <field name="ma_thue" categoryIndex="9" filterSource="Optional">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="status = '1'" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7a3GQkVRqHv7wGuR9MIrGCPYkpzPJsbrsLjxLrUDZvfA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" categoryIndex="9" allowContain="true" clientDefault="Default" filterSource="Optional">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6GY1C3pnCCmrtN16UexKCvgh4bCLk3luR6gcyHKeXAzg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" defaultValue="0" categoryIndex="9" disabled="true" hidden="true" readOnly="true" width="0" clientDefault="Default">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" categoryIndex="9" inactivate="true" filterSource="Optional">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="ten_vt" categoryIndex="9">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="outvat_yn" type="Boolean" defaultValue="cast(0 as bit)" categoryIndex="9">
      <header v="" e=""></header>
      <footer v="Chuyển vào bảng kê thuế đầu ra" e="Post to Output VAT"></footer>
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
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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

    &EIFields;
    &ListField;
    &PostField;

    <field name="tk_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="9" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true" width="0">
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
    <view id="Dir" height="204" anchor="6" split="8">
      <item value="25, 75, 100, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101-1-1-100100: [ong_ba].Label, [ong_ba], [cookie], [ma_dvcs], [so_seri].Label, [so_seri]"/>
      <item value="1011000-100100: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1011000-100100: [ma_nx].Label, [ma_nx], [ten_nx%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1011000-110100: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1010000-110000: [dien_giai].Label, [dien_giai], [status].Label, [status]"/>

      <item value="1: [d86]" />

      <item value="110100000000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="110100000000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="110100000000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="110100000000: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="110100000000: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l]"/>
      <item value="1100000-----11: [ten_vt].Label, [ten_vt], [thue_suat], [tk_cn]"/>
      <item value="1100000-------: [ghi_chu].Label, [ghi_chu]"/>
      <item value="-11000: [outvat_yn], [outvat_yn].Description"/>

      <item value="110-----11-10-1: [tt_yn], [tt_yn].Label, [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien] "/>
      <item value="---------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="1011000001-10-1: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &EIViews;
      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 25, 75, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="7" >
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="5" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 100, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlp8b21aG71Pz+WyKdihaUwsziokAPrkTAovqPSEPWIyctH9MbDMp13c9qfBe5zMcH6qJcCNYwZmgFy5Y3qhMFJAEgDlKEsiR2E+z8Z2k0u7HR2vtop3T6Bu280LttCaSQ7JT4cszf7iOPqJ0s12c+FvbJZRQbwFsckg0ToZrNnig==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]><![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKMAds6aqnmxULF40FeVOjKI0Dv1LdqG8lfFl48R2ingkO1+Id4qlmdE4vBDTw+wV6PBdZcVQdDJ8k/mhPfSVLpYqmf/XQmwE/hgyimJFEa70yV7CR5VyaibAioWsRle2h6IOmVFx5ERA/mHihPhVcoZoaOqzNmrp492O1Ib6646hfUyXFCnNS/uSedq+SGgxColczDGmDVGTHXz+jIHnTvv7qVvggNRDb3PVvyRIwaWp05bJy1LHPPWov9IVwuQ3g==</Encrypted>]]>&DefaultReportForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR79MMjgMMed48qw/yIIamPeI1nIw3+wkARwUM1zzMzOisABiZVFcf49jQvWHGMv0UUw36Zx1cCxPWkUtOB4w9eVU1ReMeKv8ViTQyfODDpzyYQAdYJJ71iWo3WjEcSip6e6bDIWqXcdifo9tYGNCV05uai8izUBFaIhQZKyAAH/zwL4zc611aAMHhOEv/Uz9sAqF7EkdpfUGHyR9z/xtH/ZkVHP5B7UA4sDANYgWFKTNIUc7jQejG3n0D9R06ul91uTwKl2YRv0VifwzWGsaNKif4Nw+DPeyHps8viq+YLeP5tRlG8/zVCprcuZdkQgxOvmMBjGvurXbJaPhxWNKQ6CCQgOMLyTnmuLlnoMR9LTfHjVHQT76/Dex7WqBD5jC611sWrMpCIzvbyW17hqJeNXUEPNh3On59MKKPRsS8ZY44k/5kmVfskgVPKTJoldwie6Tm//sLOvTTtfc2Hk2uUfk3/ZesASHpywh91x+6TvJBGboDgGuZeQU1lH1OFdO/HUtEIeo4cBlUA7Gbzg2Q53q2/m/B3G6MTfWeVvlG0JEt</Encrypted>]]>
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
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHOdC9Wwdon1n9pLwnB/xAtTqteWbmaTsYsY/FFh9GmC+z659yupBEUFbmiO5/vXaBjCBxjkIoxmDD7bkNJ5vIapkfRERAmtRUfO1loRzSmTKuaTz+DXZ5R7/fsL5WHSzeUfz0yA5/wZpivdp2/hDnzFpEaOwyQCnHXwPDKQ1uURoilaYfyrnNLiV6wukiMTkA==</Encrypted>]]>
        &EIInitExternalFieldsSet;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzIMCTWDuuIoDhXFptnBai+5FCTZ2wrkXVkJduUTznY+geQfJK1Wry6K+jT0jcYBFu4IhAZY8phO7gumCH47L6HZvI6ITGQEZSaCRJgSh1vHEvj+2ZBJvHSZBqUXNFy7Dd4Ne1F7QsaLwIZWI44BAPog==</Encrypted>]]>&CommandExternalFieldQuery;&f;&EIInitExternalFields;<![CDATA[<Encrypted>&TStonzNIPLtkzEJ81P9J6MO8+27j66ZwA+UiAsev1TskpEwWEeBzVYlIAeSyOAqPDG1B1PjkIz/wv6MuBk9gyfF9zW0LTPJ78E4WTnmt/FrWlg06WDdz1NCtVxdN6inD</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &EIWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock;
        &CommandCheckGeneralInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asm9q9jJZNaqZrlgwt68qWNuvU/x1S8tLpyIfuppoW0qTkSrscbfEo9qFE5JLo639OuknF2A/0W+Xn6D1UWvSGwp</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOeWV4/UooaOKJcUqcWUWrD1PITIK7UvC9Zcch3PhT8mofDZy2jkWP1kLCmkM9ZfHI9dBI/h1rJQrKT1w7dTO6Zd9tFPMDiTv+YNG1k+/CNo60hPxWYXkPGrPY8xR3NVYdHkwAaGNypffrFyGhd/4CSpwyWWp/PpW17kMTORVFLnrwlGpsWLwqF6RBJlMBrxiw==</Encrypted>]]>
        &EIPostInsert;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
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
        &CommandCheckUnderZeroStock;
        &CommandCheckGeneralInputVATInvoice;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdpHeMY0hZzLlD1wfY3jE0VkczA0zmhbuga1bqT5aPAI62MNz7Ta81C5I3U1HL46biL29fk50BAjX20I0KQ29QEe5lRejgnLv3YpauG6QzClgdvz5FA5VsTn5xEpb/3HSM</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &EIWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &DeclareStock4Updating;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDY55NwgbIp435lWGCzdLR9MDEueF+RdsDrTRc1sXrgOa/2zEx/yH0f8f8TVLIjs1y2vS6nLcFDLZm1J03wYO9ptwh1zcu4pNEjhicL832zcFUdKq77g6z0AachhMINPO9a9AEmp/M5EaSG/tBuloIYIYwkV0NHr1uUDdoyooDAoP8ek6THmUoHq7ucEphP4e/uYD0z9mGmPmXJfewJXweD6rMl7UrG7hRvRNVVwllScAz6DKpvUJOTNBVNq4Dt3q1swaLTyXV6f+n33xUzNlB0CFcd1Q8sMGAepg0frerRrKB5wuQPSutn00EwZyW6UptO1SSinmjmW9xNeP25vURGk=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QKyAXQCOsnDn728Sfs1+0Fqd0NZKdpYzRpsj3LDzqYb6o4miARQO3jmgJoDa5icQYj8/o5H/NlN8ah9JIB1l6tU75+Mb/tRrNypPLrSXhxFczK0GecLan/jisKbfvEFvSdHAud+vS9s6LTveixJfGDBBRCJg5jSdDZHJAjJEriu++4IUrkw2j1SFoKM+E+DQVOKMg9hHyz5QEolGd8PwGTTvBzFmj8i+fFYdBhiQ1k7</Encrypted>]]>
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &DeclareStock4Updated;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyFn+wtk+MqjxMUYB23mmxo6lSTveL/SJK8KU4Vl+YjgG/S7r6FxsmQl2J4qumj6huxBCcoEJ7hRND0xi3CYlUHM</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ed/xu+y7jBn/kiNRQB4g5Ilg734AKkQnK7bu8D6SOczxEKp5cMDxRWFFOGNsNqt6Q+Ohcc7Z6c6jVkeN11AlYs48fLBolq9Gj37FhLQmxGb9ZPIkMxub0B9lq8OWEJqI+3yAJzXyF2Xobnow/ikpe9q0mRx3/bW652/3H2BUX6KrioMNn+dTG6Kpv0kfvoP2xiOg3BunGl69MBEr/R0MrdccKAnbvpRkl9kwh3R+QJX9BykR1m3BQ1JzEicOP4K3ni7T4JgpDMv1RHXQ9Wyq4E=</Encrypted>]]>
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
        &AfterVoucherUpdate;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdpHeMY0hZzLlD1wfY3jE0VkczA0zmhbuga1bqT5aPAI62MNz7Ta81C5I3U1HL46bifCl0m/gZGbKPEEIkdyuVfwYAsRR03dI6f8agfwNSQzuGZ2hVRBQoCcXJ4Z6M/1gY</Encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLJFtoxQKLsYXWVqUkjED/hxNKYAdqGSWgtKyOp69IOWoF2qxUgpgx8WVseuz2almoHfScGFO4JzR5oPBgozpEfA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &EIPostDelete;
        &PrintPostDelete;
        &DeclareStock4Delete;
        &DeleteCurrentStock;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rfddzMWLxVw3UoyGPhJv0lMR2AXm8dvwVjXPNG8C8caW</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKxvW5UYXguGRTwbWazQ33C0qhrwqMCmJKHSiQNsF6UXomSov5ssZN5do4D9RkqVN9loMEcOZPDwPyx8gR3lBUXMRti9YhdVp8itz+AKT1kWcSfFKttJEN/67EeoC49qoLP3xa7J7TD3HQ6PF8ly4RNbJsbChufL7oAheNR2XIb1pqFngfb/MA0TD2m6ySrupwpXyye5vRF0HHou25r8HEA68knmkSUqSlz5Jy0wxeq8R8c6K1fck5PeEmeZFfKlTLCz/yx2XkB/iW/UdoRA8Z8ppvqzAIIJTW0r25ycBwt/mlDhxAfoIBitbzZORddZpnjVvaSM2jjezgV62CqwCBJ25wsuRbIXkVPtW8s8GNbRz/fvqPNxWp2kTLU7+Gt1zKyg1ueROopMlEFy/R55C8PQWufOm6fofGnW9NsAl5SSUVqDZI4hncyBg2yOuGK3JAoD12D57OqqqdI+xVXKCRQ1odXdqkVZ14gP+RLan7PeeHbvhKkOK7xcAdGWV53cc2jxXQwSfYPXd6PlkqBEwj5c72xgJqZQR+jmr2e96R2uHCo1QI26VhdZ9BtkXDW7ybsH06vfdRXBh5V+iHYD51dzfKo6tHtDxEilLBDvoGMveMnIhWibF1KwZXeJ7tbekXrvn6DGmRePQ9ber/JJvlwFxFyun0C4nYYgPZ/h2eL5AN8c4fTBt393Mc35RIlnpcU9IzonIGC65IjP6NLlz1QC1hF3s7WHRgsie63Lht08m06x/hqP1bEa262GoIAIm5wCQiRryGlrUMaXd5TtxqK5c8u1ALw3kCEoMEQhcQaxSBaIfhuJWk2YbHqmuIeMIReJLLuyIFaof4aKD3hsbK3hlIaQWRRCoQ2DMLH0wjw5Yr/4hjm/piHwliD0Rte9DwNdL2rDdcNDwlcdRURWedsyTT5OgjMiw3jjTSJpIrb8GjYTxBTEBqdeeW6YbAowBN9nflIIdLPs8pdyvqotgy+bUpS9jx57hV62Ib/LBB14DS61JYlwcS0I9/OKFVUSW7rSw7ofNufQ0o/YyzbKR8P/BrT7DCOR8Nxr/iwxgHoTF7d8kaS6rbzBEPH/Prm1E/s=</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxe/WQx+bwj5afl4LxyYsF4ecNIkJ2/aq7KnDDtd5tO5abLns0VahAQgBgISR2CDH7rf34sQtfeKVcbZIyztEbUB9Jx6zAxAGHouBxt0uwDXsQ==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&EISetFieldsReadOnly;&EISetFormButtonEdit;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUj/fkXwJyaW3plvGsCjbKzAyey4S32rNg6cr9hOxkLeFwcnM1hvlOPcmCcxBRJ5T+rp/T/AufR/h+l21859V46Q=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezYNXS21LkGHybIh2x7mWxcNBbu07OwJBzbzJY+lnfjXPh0aZAThTewXZA8wNFBo4svyjtz6XHZ4SxHL/gwhbfIcmwCHyDbt8QhSxSjcNhmCU=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUUTexsBacGoigdG19vBp3H4GXLgenFniOq7TKpRnZrdT4sacW12UOzNSOZrJIvSbPjee+JeYMbs9EOhcnvkpsDdAl4Ixrx0I693wnRuupkZsn5FIx8O/m7E0Ou0oByH0qCdIqlTctYTy9Y1186U0o/W1GD2MEq4ObG5USAOfhPVIUNfLxnmIURNnQPrGtXqpo6LfHUDPndhdjrjXfZFdM1LNEeNgcmiNkJzz8fddjAcfj80UpHj8/tUzBWRcmRoqOYRZDXpaPUTk1D9XSTSd9sJOrUdtEICn/YfOzVAjpjttUgt8NBeCJwmh8RkE4Iyo3ABgf+ZhSr/aa7DCQzzd3JPJSl8AWTa+y5WYVtUcgCvw==</Encrypted>]]>&CancelStatusExplore;&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAsszo4sNmj/3YNywqv08wZecbP9sgTUXfI6EAwddhk3yJHbqEqQAL9U8s/VW8BiFo0KP6iuPvCAO4IPGsUvseDKlkOx3xOto459McTD78BH3tyzgHFiLiLFmqoUbgcKnHfsmtRlkqFzLGgJmMK8D4B5bvDMip2npw22e0QDULmo7NDUF+eUCl8o8IBz9LtGzi2wxeOfcoPBM4HHqJpJ06IA0fOkblV2nZPRmBulRZ93Ph9Dvt/pcGOyyErq1PCssGwmnC9tAEFy/Yv+B6eyBX+d+DKDCG/j7q0VbxTKYA7EhxujzO1Rconn6IkUOoOmeby+bGp9IYbjRsq5vuwg3NM1yiaEd+j6Bhisz4vNCnARt7gettLNKD9FNfVO3kKQZTcax1sbOk6T2+LmaliAxsw32FV2dGclaG9qBvuIoZ0a4j+qG+kAW112eCsULttoD5</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaRj4/4LvJuYCUSBp7SaDO31pFqO+zwdZENvOUL2u8NSCi82gXZ/JaHghX6p3EGsOvsXuBxpyVf58kP4x3kIjJO2LNBF5sOwO/vLx/VuYLp+aJfy9Kv6iPQHox2D4lbKf0w==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxa/BpRUQRMLeU/60rDzmYaHY9n7Y5pcBbtoSHqkeIQ75Jn72yobM+AOe1LRy+kJHoMayb0jqC5+mkv55V/sUeuNo/8645WwzhMACR0TjseNG2OVRh02ayVC53CMm0DHLn</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W2+9RBrh/eJsIvq6SkVcffFtSjxjQppjdJDhoGK42gbAgq5VE7Y4drGoZMyfaqfEOIdg6tdB2YAaQPgifVchbe7iDelvxCvrQAYiaCEVS9hwh8sFcXgKJQefzRfpneNzA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHjDrPiA+I0GaLoj2Sm8YzC+rYt06OLk38yuLQVFhZwQyk2MbwFi5FIlKYaOABAbEyva+IGcNmEIFKwuuCDmF3VmopinGmjzxGAr72Tljo4qKLCVt9fUM8qUiGa5bu5gzFE9aPl7Lql8vmrn2G/A+3Kxkf5QFSY2q2Tw3AQtSp8aqLHLddYU2RxoKtkHnKEIdqSpsS+orLaqfWk+V7EBLhLUmt48ImFUrGmiqziJWO8A4M3XrC9oyghvJpNXqFPD+QmsqRr7ds4mJY6xnoMdt2hg35yEkMX4Wbr5Rap9ffmgQ5UZE7EGRw/rNW8tJJyvwplltX93cy8hbNp9ot+O9cfidhg8zDXSlteHtN2RvxCbFi+YP6cv6K5+1Gpy7GiIvrKJok72xfnMOQQ0CZwD53Uw48NJz23lhVYbNKcXQk0nK5HWGrHW4qfSUSPj6ue2ckRUxQM3dhBZclXS8lkAcDgT7O63E/r1zEABQc6A+D0AQcKFruFgL/o9bFVK4wg12pXqdOUGnhQFwQSZAVKUQIAnsagvm4s2YJ4N3tK574MpU</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4UK15f3MUTXsv6blKUQdQun7I3omA7+RjXRWrH/BXVDC1osMWNf35Hc0I0TCbnNOu</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk/+ndAN89eqxyJMY0nH/5wCTEb1njt9nAfIBY1VsT14sKzjypxJZnl8Ha6gC4GjeKto=</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXEFBDz2RQtDkGWPbCq7r+0JY30cUWIki0vaafDqU9N3jyPOnT/aIwWD2SuMa+4tU31Z8odWkpOwHmGX8L9L4FsUjaRthWYRd905DbOOGSxSIS1yw13hJCG4v5Ava5wTgykKsKTcPCDz85s7WGs7mYZZtyAw1YFTcJR40MM3a5EkQEPZC0hhhkYm7p+K6wzAwBO/pTdXR0xil7S1sCJbxh0LL7xIj/Gp0yPiEy0WWamlW+xhRIwPCh0Y4ddZBgwP2qSrROSQ+J1hT93YkiSQfk+uwo6PL3n5qWTvandy29PuSRANJqX9FLdOEaGHABpxKfQ+eBnom+e7GfYuUZV/78Hc6yWCm5A/O7l5MAYuKpHUVfk9QYuzyr3KTgx2OorJZPE</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzj0eweKlQD4pAq5Sf20H3READlOFvyEo4EJmmm/BpzsF8s/lVH380yzvldbiE24iT1lvNBgfYPh0WdCw6AkhSULVFFysFGEqP0/A+wcoWMLlRr+0xKUf4qut32KBqUwUdPyKPRnvCfSWQxSXAmIQJ3/HCLhkgNkMPzMuHLIxo9wbJq2HyXZGopfMp7nOG1YHQgITNCBk13WfmBYKoaE/OXDg//nlDOwhaVfltTaMPLXDcO2QY21GSq9YlkAURAi3hS6dzBgGaOiZIUncjg7HMBQ+DGpWnf/bX66OZRq40lMaQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGjyg4675u17CsTbA7Ec6b521Xzv+WvtJV1zchaqPkn7t</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4anGmzLKQnuNqtSxOBqkpbpl2ErVOwttbA0Y5nr/YXrn3Vaa6qL7qjB2Z+xKIPATwh6kmvBHKvRzGGNqYDo7Y4E=</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Rl6rnBdXhs/O4KhrfS0vekNrZjHqubvjrt97/i55Id9XfUAKyeiPECqkPZx1IGtovQ6O6vugwW1DSh28BoJf8hbvO2HHDpOeCfYg07oqTkP</Encrypted>]]>
      </text>
    </action>

    <action id="Reason">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5WL7a5liEWX4YXsPx9wgxhWpi5sHCTfKKudo3EmoGU5LWTlqYSQMyWzx+/d11vetlySYgb1vWRmK1uYH6yH7sqMM+kp70Yer1+yBbPrJEdK+oUDQxzD0+2e298PbV40bpFnxvLlXNiu2LdbXeedge6720xlQo3OeuTOlkK6pdTvg==</Encrypted>]]>
      </text>
    </action>

    <action id="TaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tCfT/ftxAiyPeRoYoBbqOxhrwKk56mJVZgSlE+zL1VEkH7LThGcQQa1RrGXH28aEOUQw4zv0yWWtFRVQtN0HdWfVdvaUn++sHJbHogaKb5m6FowfYvO6xedFONBvYPo/CnTunYdEJpEwaOfIkcF8xxR</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTxzFygLBjuVkDfVn7wIxz3sGcSjzh8S3crd0maZFYO2Og==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgZSqPHUNUZMH+/1FK5UZsvvDMenY4Xkrdq0h7FaatOHzZPs8FrsOnETSUS8tYvUpThj/9JTYQsj1UdAa5aYx8Dg==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>