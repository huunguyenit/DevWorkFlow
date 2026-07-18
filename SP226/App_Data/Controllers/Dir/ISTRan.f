<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
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
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY % InternalTransportForm SYSTEM "..\Include\InternalTransportForm.ent">
  %InternalTransportForm;

  <!ENTITY % InternalTransport SYSTEM "..\Include\InternalTransport.ent">
  %InternalTransport;
  <!ENTITY InternalTransportTag "84">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableISTran.txt">
  <!ENTITY EICheckDetailFieldName "d84">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY VisibleFieldController "ISTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY DetailVariable "@d84">
  <!ENTITY DetailStockType "2">
  <!ENTITY DetailTable "d84$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">


  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2ij2CM6ZZCQyHItwTQ4sDsbZIyihW9pWOME0lx2ccoRrOGH/Bgg0g2PFdmTBQmSS0I6vzJccEcG8c0U/y5EuflPw9SZGu6bonC7Q06OC/9Zj8LQOfjiicbJfhyKdwMxX2ySUPUSBJJzHfdH/5XpY7RRlFtdEqJCAWwWgOcPx6h5RohSWQZTNFFKgOuU9G0cWkdQ84JZDJfkhnp70cGFTKBeYmaIrbZNO1lMVHs7FwyXQUIxYXANLz2zxAEOPxgIA68FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2iBxv02JErqFBolhZJaZBkne393P1Gm+j/ySueoYOjCLEs4OEefP+u/HCchZdYEP2P6wI7PfIdBdej6XH7XV16xNKgChLQzOPsEiJWFB1mNBA3V8O6L69lrqiEqB+IeDuVDx1cehAW3F9OmIfTtfVwXAsW1h+eBaW3RuV2CqVw86XhxyKavT2c5TEShUVVZIW13JL/mw8nAAAIhzjJ3oDKI5Ud64DWt2kqFyrhwy00i+ZsoRo7UYW+T/YKg7XBlF0ZFastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCBzEhEDo+OLBk/TzAArqaYFiMqJqbDZxOe1WCNXDe11Irhk+rZ9sM8w3j3N/0AgjBS2U17GJvDGm9sOlGFkmojxzoK92lbUN8vPBhNvJ5DRo=FastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4QE19TNIpfUG0IarzCk1TqgQOgz28IN8CkuGI5lhkagDDV/urK7rpfGBPZA3nOqGqjsesnMHKxq9zadI2yQ5K5m9xp6n2ce4xhM0YONjbZ3rIF65uXvH5Sb8cI39cgJ5YRo8GnfK+ihAAYOYEJvCEWQGBhvTDG78+R37EmWL8vR9fKweTgZTNHigdiyWtH7SXuTkIaBmm7VDiSoKNvkP6+owj2V2/7VU7lxLgaoM7hVR/g6qgVAz3NZ2+XTwWG2Ir6OjM58DQlCeSGzXTHDjEOYbUm+BcSDsAeBNoSvvVdA9zCXzm9OihS8L/reK64k9J6yppMKClPJRqiUlrWqN+Uwo7rJ6D5iLCp6rowesHIGOcXal2Xy6zRJbWp/Ytd5esTNePqh2DGkQySJgdG+N2JEhCCAzmtE+4k3wqyVtbZl+qFHoPj7SJrvBJ88fOt0eLg==FastBusiness.Encryption.End&StockType;">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRUrGtEO5gRQksDG6Qr2zbnyvbLY0bfDQ8+uA1qgISkIdRfbaritbiId9cihG885mzrbkMuEK6LZF1LE1Vv1LstvIjlLb9+eRt4k6ABL6lLgAyJWLbSYHvrva324O7E9P2+zvH5XTYEocyTPj2IEsP05BQnKE+CT0IZP5tawvwddB795FOl5Q13++5OGh4Rf3IYVhxos4V3p8A/G9vSnRqyK6fVK3QxaL7lMobOKfNOBE=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUmN0gBRDhTrXoVuGh98qeTfIMTleNHRvJAs3b46HXI5w=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Vt9BawnTeSfw8diY9T4uhk+1LdXzZxaoSBGZJM4V2aEU9k0hOKr8A6TFgCnSLumw4uzJXSuT7hx0Z9zRyiPCZEr1kabJozoTRGWfW1HMYoong9fampEDS5AI+QIdl7wYFnVdIgY21NHzgS2eZj0wlYWlErnBh4zwIOSHvUigVqj+DIJp5QP8DASfsAvfKSDZK8isCsk37PrjWFDq+eFKDl5bR+0TNM9ZZXwzxzl/4aXqjoFZIpAHtfUibVlRrFHwqzfqn9YI6QKDVi0a8kYULCJBfiMcZx0xFyFCfbRiOaDCPAE0vP4UZBRv7MODuYUFOeOtTD6rOoWT6nrUedxNT2uUsJwqPt1ISIUTIEpd2uaT+CJM8zEkMnlDt8w8t6u2LYv0OclGKAlaPQMb+7JhSw=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaW9h3de/odlahDs2ttCRjo7AKKjBd5EtwYe0Dsg+Nyw1Dyvjtov0mWI+zS5Kdd+WPLGB+eV3o9u6JPzQr2V/EgsFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUdJdy/vBMw8eDcCZQerUnogOA0ZZozSVfTD7Rt7FS87DLXUk3Im+MoKWknBD5rHbZHljvTaKpvxPa7VeYoGLrK4=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.ISTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m84$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXA" type="Voucher" uniKey="true" replication="4" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất" e="Issue"></title>
  <partition table="c84$000000" prime="m84$" inquiry="i84$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" readOnly="true" clientDefault="Default" defaultValue="2">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    &EIFieldsIssue;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu xuất" e="Voucher Number"></header>
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

    <field name="d84" allowNulls="false" external="true" clientDefault="0" defaultValue="0"  rows="216" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ISDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &InternalTransportFormTotalFields;

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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

    &InternalTransportFields;
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
    <view id="Dir" height="276" anchor="6" split="10">
      <item value="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11--------10011: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="111000000-10011: [ma_gd].Label, [ma_gd], [ten_gd%l],[ngay_ct].Label, [ngay_ct], [loai_ct]"/>
      <item value="110000000-11011: [dien_giai].Label, [dien_giai],[ty_gia].Label, [ma_nt], [ty_gia], [cookie]"/>
      <item value="----------11001: [status].Label, [status],[ma_dvcs]"/>

      <item value="1: [d84]" />

      <item value="----1---1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &EIViews;
      &ListView;
      &PostView;
      &InternalTransportViews;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="5" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;
        &InternalTransportCategory;

        <category index="-1" columns="100, 100, 9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="3">
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
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &ETInitExternalFieldsSet;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzIMCTWDuuIoDhXFptnBai+5FCTZ2wrkXVkJduUTznY+geQfJK1Wry6K+jT0jcYBFu4IhAZY8phO7gumCH47L6HZvI6ITGQEZSaCRJgSh1vHEvj+2ZBJvHSZBqUXNFy7Dd4Ne1F7QsaLwIZWI44BAPog==</Encrypted>]]>&InternalTransportInitExternal;&CommandExternalFieldQuery;&InternalTransportExternalFieldQuery;&EIInitExternalFields;<![CDATA[<Encrypted>&TStonzNIPLtkzEJ81P9J6MO8+27j66ZwA+UiAsev1TskpEwWEeBzVYlIAeSyOAqPDG1B1PjkIz/wv6MuBk9gyfF9zW0LTPJ78E4WTnmt/FrWlg06WDdz1NCtVxdN6inD</Encrypted>]]>
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
        &CommandCheckUnderZeroStock;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslV+AXx2vRmqgCg34SLx7ediYstzRTe6rNz4VeSkYPkZ4lUZBKShPsgg+Sy2gMbbbud1o1qkbXhrudUl8rP49FA</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH5AbCcD43R1+tlwE7bVUmYq5hzd1Sp+6zP0sU0b7N0SnV5iWb7fEvRIBhaAZJgfMfGajQhDzkEfLjsW/LbQ7WvZrqSSNC5muepxWkN0ge3eMKQ7BWoWdyVRdWqmfV+UjxU1vAkpgHVpG9ej8epVVEJ5+NJ7Ylu/FuCONuliz7XWAyvt/gLvsSDQkoMEby4yLQ==</Encrypted>]]>
        &InternalTransportInsert;
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
        &EIWhenBeforeUpdateLog;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDUoJWjpvfgpYo1BVcP6HtFIJenu1noVmFuTbpD4LNqU+q3UaKEXb7q96CVeHUa+E1g3uk59bK0dbr8frSDr4kya6QLEk2MNdiFi9WAd6wZqYxMO4UvJFyuT4xQOSWjrjkK+aZqeWenKlsgH6AKtRbYRv3MRSKAw7hExx9Bpnai4B8bAleGHcnPyw+ILAonATqcoUykBnAR6pWmUBJBit8NhuTyYc8fnP68FmEiBb9oPMOfudqCoEhmFNgR6PyKrXp9eSHXRvt/oOAGfjMLPrEPjifjHZdwdFiadZz6ZpGVLsXvY4TE7uUNX/1rs5Q0LV8yfl9dO1a60d/4fZqeaYeivOwPv7wvYWMPE/SDxBDqDia4ILX1/e17CUdG1CjHgUZjmaEqpR0JoAKynL25TKGJ1Q1pkJtGpL/zp0PWRBaRAJ854Hits8Vh+b4gz3QrEE8yTwUy/gTg4OdpomBCmWwgU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SPW8QOkYsQG/eVNsmDQzQfBzNJ5TVDJ4u/IzZb4yR5vvJNqJGsJFzxNimS6scz3GYVNETXd31wGv2eOt7UPd4EyS58NmeuD5aCcycBJadTGEz7ZENDoYzIhrzQPQjuCxzS8lKgxhAkCp3l/jw7ZBe4j0pTzH8Fbdlglhk/QrTC6Jc1dejRK9+RphfE5JjS157eF4JqynLQOZSzZq5s82CEk7HKs3NWucfEWAyLlBcX9</Encrypted>]]>
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyEFor5NW3nvT/qDiigNT6F27lpAMiELXspP1+It6Gbha27Y/KyoFd3OCbUBwOeyDQ6ZpL2C1EV9o8YvzvH8cRUT</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ed/xu+y7jBn/kiNRQB4g5Ilg734AKkQnK7bu8D6SOczxEKp5cMDxRWFFOGNsNqt6Q+Ohcc7Z6c6jVkeN11AlYs48fLBolq9Gj37FhLQmxGb9ZPIkMxub0B9lq8OWEJqI+3yAJzXyF2Xobnow/ikpe9q0mRx3/bW652/3H2BUX6KrioMNn+dTG6Kpv0kfvoP2xiOg3BunGl69MBEr/R0MrdccKAnbvpRkl9kwh3R+QJX9BykR1m3BQ1JzEicOP4K3ni7T4JgpDMv1RHXQ9Wyq4E=</Encrypted>]]>
        &InternalTransportUpdate;
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
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+lINVUwIgVkd3OELEAkjvxUqQRTjM9Cof3Gr1hWwrcPxDJyrnDirNX2ZXbFNiNzl8UQO+/90+/7s+n4V3jVZJE=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+saLoCjKZPWodd8++6ZXpRdx19AaCQaKyW0L1GQG3ze3Zz27zg728Pc+6sIheP7KA==</Encrypted>]]>
        &InternalTransportDelete;
        &EIPostDelete;
        &PrintPostDelete;
        &DeclareStock;
        &DeleteCurrentStock;
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VJvj7NkwuBcVNTyepJpRGwmYmxjrA5StX1mF+Ggawqd+o8SChYWXtyPbjq3ftHuXMM3AQPqf/VrL0g1DlSlz9u7YUHK1QtYScyUG/fd6/2eeuZdy/m0NCaTw3m5ywXiuw==</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxd+oRTrM4GbHldzXTxwSKs8</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&LoadFormVisibleField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;&CancelStatusDefault;&EISetFieldsReadOnly;&EISetFormButtonEdit;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezTAecJxWBEoX1qfSe+BI488NYe6bAIoYGvXvfWpeleZw57cWWlDxLvaoTI9odpZej7+pTJkRV4qCRMyaQJS/HKC939nCNsKJ3lyxZnWrrNcJEKCZYzdPcAY4vNHJVuXIoK5lZSFtUCyAC5nQLMiY4ka8Pc33uIYQ2wMCmHvMX/sTfLyguLZs72FWI7Ie8TcaH</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAFb9fkgEZoZaf2rg0BsqHF6M/U/fsLTa256tAch3ZmxBN8IZQrrMuYK0zLoFb5hSOb5v6Vi5Vo/Rm8bC3Jr7PBUIoYfWFive34sEPtt0oB0URuL2UUMgjoyK+6AxU6JbOeBK7XumHneeCd8YgXdIa+7LMflNCny49WuYoXq5xeyLwkLhDh38bpIVb5Wv6nfBvU1yzEy/LY6sCHARbAICPcp2c0MpOvX5wSYxQXrm/J4edPdkAjEFyJDi4qMItqAAf</Encrypted>]]>&InternalTransportFormMasterForeignCurrencySalesAmount;<![CDATA[<Encrypted>&Ua9VMlNUO0V5iRaitVZE8tnJjMUPprj3uwEi7bXDCYA=</Encrypted>]]>&InternalTransportFormMasterBaseCurrencySalesAmount;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egREw4hFuUwtkIMkjvPcmIrSEc9jAK275MkkPzXyJN43Uy0hCBH12jSGS+ylv4bM1qw==</Encrypted>]]>&InternalTransportFormDetailForeignCurrencySalesAmount;<![CDATA[<Encrypted>&V46JBzzwFqhZ6RTLEdfFnLr6XW6IquvPc4yMXNAtEFg=</Encrypted>]]>&InternalTransportFormDetailBaseCurrencySalesAmount;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egT0AKqQBEj5doOoEdxbV1XlXddW9YfrTi6yirn7J1beFa4tSh4INZkZ0NKOxFsD5pct/XapvgjDxWV64U1Ya3nl/KcDw4zep6pNthfaj/9gkJWZ4kVHBsB3yUqSGAYxvsw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurQRD8XwjUNqcapjNp6gHr1GCr1iQnBs7CrJ7UARHbaAEQ6EodarkoJkQYgL5j8bhEH+gRVpUcOoImRw6CMbeFU+q9SYhqy46PMubFowJrkCId09Hkdy9qYxlWDNdy7DT3Q=</Encrypted>]]>&ListTabChange;&PostTabChange;&InternalTransportChangeTab;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP7s6m17oy6HgUWIc0AdI1dLOlbfA84Q5Rt1wigyQoBZtkn2QDaiMVfOh9rPgOSj41S5ODchcvENjpKZUHyYisxE=</Encrypted>]]>&ListTabChange;&PostTabChange;&InternalTransportChangeTab;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5VKcm/ftNpsgHVPiGXPUJsY2Wn7NBm4+hq46YkY2I1AsZeMGj/pyfB6qPDMPcXxkGHk1sktgW1DsjG6dktHZ50VT3g//0TCyBjqYpY6ARmuXCm6sRTX+QiFXqfuadhs3NMBGtEAau4gyg3YZlgNtrV0GvgwF/aGFBVQlVNOjdLDkyZcn/kkBhfff6clXQq5Q9nsqVJKy6wnbQvcydL1HD9+Zy3qOF98OftWUM6xj5KHTrlKXWnn9IAzQ5BqSZ2So3U06dQ8a8LVOSpoGswFJICrDg1JT7U3oXd4GMnSAqpw</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUE93vhS7Z6O1d7/MpPvjq/hVNGt6K6XJyxOxMfmrgyJw/yeGXUSV6QvdGtVwsxg/97X9+6/Ux2IipWoQfbv4W7w==</Encrypted>]]>&EICustomerResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z1zODGtJ33Gpb+V+wQ57sV3WKyJOksGno2j8vPcBHXE8XrBejLzX0wWQiEviRNZpEUIqYCVE/th93+JCVHbTDtCGBElyYnMwoAGIq6GnCsd1vkEKHpS0hnuzss9VeSz49QKWT5gt+FljLCl/zMamWPtRelkUrQmHb8cUJbH9gnq</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q2El7xl2nclV8dy1aEwdR2A8DQP1vJ3VuQM2YCkPIV0k/cWXkWCVdPQpef+k7t1eA3bRBBijtbr3h2WyHw1ai1s2BCbW4GE/Ox97obQERywcV1ABp5TkaKmCz99MJflsbR3sZWfJLWB0xpwPzwQDq1HDM/jbAerSnU4fsL2+Cv5Yzv4gpIa1Vz9SxJtKlfUnun1X26T1qDf/KotdpuDPZs=</Encrypted>]]>
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

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5Sq9cyOTi1ZiZOekePlc505a+6N5UiwkjGQ7It6HkLrYoq8RNNyAWlNBeNWCIfNnKLE8pCdPxW1/Azq/4Lbp629vnWhzhEud0A9ZL09tJvtYYHZyjueBmg4eupFGRv2xLQ6Ob9IB3pjshysUYFNhwv</Encrypted>]]>
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8vPhS5lLt7k6XT2IoXdCWeJ37Qbt42J+K4NzaaEIgwgQ==</Encrypted>]]>&EICustomerResponseExists;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4R/iIiT9wVMZWBpGApLDPPgufUolCTZ7MO+dMSg4FwLa2Dr9R823IR6BhEml/JJQ7g==</Encrypted>]]>&EICustomerResponseValue;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSCa2FdJoW668i7qYdKMaVlZgF+r9QmDmm37L4EyWvwRrB+eU4o0gP+nu999B7TGeg8=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>