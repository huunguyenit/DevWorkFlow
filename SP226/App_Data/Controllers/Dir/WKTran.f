<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
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
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY DetailVariable "@d36">
  <!ENTITY DetailTable "d36$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY CheckDataCondition "stt_rec = @stt_rec and sl_ss &lt;&gt; 0">
  <!ENTITY CheckDataBeforeEdit SYSTEM "..\Include\Command\CheckDataBeforeEdit.txt">
  <!ENTITY CheckDataBeforeDelete SYSTEM "..\Include\Command\CheckDataBeforeDelete.txt">

  
  <!ENTITY f "FastBusiness.Encryption.Begin$3H7kPWBUT0Qgbr/0jUL75+xKJW+n7Qc7TQfRKbOSbBNknW+6ecM8aRY6qNFo14VHTSpb8MlBK0mT7B2bM1vA3rX0qfEkaHU8Jd4SCCuXLLZgB4j0UwzPDXtDXlX5Pojo8NZQiPCVj8BqIlwx5qOcWA8wq114ZTBr6ckirnyu6LRBQlKjG7iP5iohq+KKulX5FastBusiness.Encryption.End">
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/T7OgITssFoMGtX3+HaF2K2V/NRa4KygiGzRMnDfiOkt/BtGiI2JJwEUykZ1Qmvmq1rvL2DhOzhwHsuAO0j4QyzMpM10VRChlZWj7Jf1T0660=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dQL5bAhFwPEWWbDrrqfWlo+iRPLLjMtR1Lf2McyRVz5jzcil4/QlYbwFRHWUAdNKfsbRnn0uiHYXiTpxVJ/erf84FM5tJDatBukylCZHNDb0=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCGhSr9JD7Tpw9i7KC6FO4UdexGZte+OgiaOwBcUPiqmVMGAzRC/GdBG87D7gN1+6maXc6ekA2E6aOWuWU6ow58OyPlRJUiftypNZebMcN3XVoZIc1zGM35nEwiBh22c5WFastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSCQNeuJkDt2V8k5zsbQ0+FNRRCETbQCk2Z8OYdFHl6IjAXJMTLsZHG/ggx4l6WqzMZ4EGy5l1spg5VaMyw4PGNoPoOCGAEqhnxD4hmLktJcztreXKVL8CxPOxnIBvF2INa8gE3vhpkLjFtWfjpsuX8pbRBPvb+ya8+LD+Rb+KL4wsF7470gTUemhAE+BDz7HZ4eNTkwOpbDYtpY54S8hlSy31o7wJuTDNtFhb6I70XXth1n8jmt11xTZxcCw7aHEL2iKEctl1Fd1/kicPPbF1qXZI9NcDNeG9j/7ZUsV6b9BeMosaSArTeJfJf1TUMbToPYziCiFZa5G0fv6iB20FgogkJUkb52LSRhjL0ciuA0VtR1jPkUk1TzXYhIZL4Az1Dck9VFDsJogDRZE4LiLvBa5YW7cucN0E0DVn50pblNigQfE0SYTEXOXdScNMxFfg8B5q781ODwyD64ZU7KUT218gWuyCHyEEZ8dJuASnflkaYY8/mpfVWSxHrol3Qs0NoqF5epariipmigd/pSQRk5pu8RaViR067e6NQCKK8haiqoT5wOU1Is04nNzY25c4=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcMdNTlQcDU0RQxWjUJAqZnt2mMtuvXZfY9GIRskefqhABh5rIp81SGk+exqCNt1/ng==FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4UhYH3Sg9hXHx4L7apxJCxFNaoUyEArCts3oYs2oOfH4sSI83YxPLUNChLlblkx171hWdgnHe++B+j1z0eiAFk+fBHZTPb7QTisL+kZh9yGWQ6XqZdkgGw3S6qgXgzJTOg==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuNKWF5CmXqUoJhJuAiDmlXTyGwvbvDCg92KPKmwqTiU26TT7j/K1y9GOCif/RfH1YNmcnalYNYMT2MybnuCL7arFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQVChKfWU0ZterbzvS9NGcchfI+ogwKvCCgexQ126bzwa5RhOgE92WKM0zzeTEDJGkBtTOqVf+6AaXulUfOhGsXA==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.WKTran;
  %Extender.Ignore;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m36$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDR" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập" e="Goods Return from Customer"></title>
  <partition table="c36$000000" prime="m36$" inquiry="i36$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="1">
      <header v="" e=""></header>
    </field>
    <field name="tk" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" hidden="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
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

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d36" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="240" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WKDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tt_yn" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
      <footer v="Cập nhật đơn hàng" e="Update Sales Order Status"></footer>
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

    <field name="so_ct_goc" type="Int32" dataFormatString="##0" clientDefault="0" external="true" defaultValue="0" allowContain="true" categoryIndex="5">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" external="true" defaultValue="''" allowContain="true" maxLength="-110" categoryIndex="5">
      <header v="Chứng từ gốc" e="Document(s)"></header>
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
    <view id="Dir" height="300" anchor="10" split="10">
      <item value="25, 75, 100, 29, 71, 29, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101--------100111: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ngay_ct], [tk]"/>
      <item value="1011000000-1101-1: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia], [loai_ct]"/>
      <item value="-----------110011: [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1010000000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d36]"/>

      <item value="11011-1-1: [tt_yn], [tt_yn].Description, [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="5" columns="100, 100, 237, 100, 8, 58, 42, 8, 100" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 229, 108, 100, 8, 100, 8, 100" anchor="2">
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
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ07tIUlJeopr8NJk2+Lt/lXfFk1HCFNKiJ0jbj/7eM9bm0Wot0KhwZ4+/Fl3WgZildQ==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA3Dm7XuKNkxGEks2cozl+E8O3IufiCDwCGiHFVYqza8FgJKU3A9Bwy/FgLT/yl4D7Ua+vDxnKw3s380AJpzv19kkA1sAoMVeQusu2CuqkaETQPKPM4lO9cYIGOJac8hh1LDgSkqEVrtFAomp6cKsGE=</Encrypted>]]>&f;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxF3FoHyhEbdvy/IhnpqRlZjOLbobm5sp6lazgjoVTog/qhmAwFLPnj7rOwFB6NSyU7j+kd9InzxYHHaYbkLOoCtppEcAa89X8uXe01jTySQ/SdA1rJylL6F7/5Cw5ZbAax0HBNygflf2LczXMkJbDt5io1TzC6e4AA65HenpbaDc=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH5TeasTosMnIl+ufKfD5Sbb/rPd0iEHJSRTk56lSWVCbB+5apl66bHiEkFyHhlFYpOk4jxEwOqeN/vA9yEWDEEjrV9Edq9/C8T43sbhBgYPDVNh9MsK4gP2+FskZzhzHiABcPQU4caBJtrhA5gHEq+lcCNJZ24irV2LyyOSowtb9R7X9PEe8N/dirDTDbZYmQ==</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDeu4eKw8WsnyAH9aUEXpuEDNrOsSbGpZIWWwSu5gJWYbRsMLlEEoNtnT040oaY6uMF+OgzhUrPGDAqFCo74mGXCRv5q4nrRXi3v4s2Cv2mnrHQpmzuxhYRQuYbPU6IE4SoeFrI1jskCVibAKTnRO+bvHOLPLSRggNvHU1I7vWiHldqXj2tjsD94mAGoQicyBnwIe6c8Y7moykoF4VBYjuZIAq+OiYK8HnQ1CbgMqyHm3pJUYdeMykzVKeDan+tbnelH51tU3Yr+mC6OrT2ofkAOmgY1jYt6oOdQs97xyvRVXkF0CLc2s+BKk4/nKjJU6gXlOF9rqDdKsL1FFqPU6gbc=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UOliyrf9qAPHatswZm6zNtw/j0IQdW0OhFD7/Ca22iIxocpJaOhKssVg5DS89oWbS6cILJ7NEWr0pFNIq3h3zKe/Pw/THf9RBrjwXEeK4aXtsxp/Op/a0KUI8rk1vnZeT4rt8R3EFGeTp/xVj3ybF6MFE67eRpoqB1WYcnDkza1E86/3HNBjpDkJmdzlIZ4RqiCDI5K4EAmK+DdI8BTlGMIlP0bKEEMf03gZF6kRfC1r0fTI3DTnNoHSq292c+y57ezYD1mTwzmfihITOe2JDK6Z5Xe6TOKZGl4Fc2EAQJSGaxve9BjiCxQZhD8/MS8/7dh8FrtasLW90wLKL9/CnlSZKK1MZUBEGS8ORrjSauokpdYDSKzalp2qupKJeNnucm7BnRCp1kUwv/HP3HVr4W7vF9lGBhIW/h3dM3ROGrj</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyGDK0dLAaxlSdHnOP3+XhclbF62j2Vy4xSA/YFaIxYmYjGCA+R0X5jRKpMq//e3gyYXnrhWmOb3sCpaLUvWMknh</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
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
        &CheckDataBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0ha+zfdXSwXe1/js3IV/jXDp4qSGvOcCpusuojDvP4nCElg7mwHgdS2YQGrgohYIbBACn17HGV54258gVacRgw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAYjjbCQqmLFMh7B9JOyKX52rd0XL8/Mvypo+MHtZIzwDtMZMbKHMsEBaf3MAHcVLkJpOCHevNMpbPzJF+weCjtX7PFjdS4ckuXJW7yf6WflNe/EwE4WwRK/rQvdxjee9TrMGw8A4C/Q9K782ChhBrPYpisUoBXQ5QGLx7ZpNaQ5/nzEZBqdjgUUOTS0YGoBCt/O1G2Kl1QZ0vUt/H3n073b4hJeavXtCCoXhr3Z53Zr+NCbrTZWDQuEs6z4WqQ4kv7WD9wyiyJ4DoMjWDRy2ghgHfWBDbyqgR4KFfndczdT4MXYZg1m2X5gBoQaxsoFhTdl3shi/oJrdh0IQW5xEKC2hErStnwrpIUaEo+r8INTMwlmQr9TbH7jGWn3CVYhgFoIVw2A7dffXBIhACCfn7rlJ8l2LGEneGk3qhwJOrdbiYQdBamxBQlPyHQZfsYIEM47QYvIKVrJxTEa6zaZONa4DVLMVlczfcXMdS/bCt2q0syiDFxpbswK/E1WyAUUYV152XsLJpki5Y8xX3IF3qKcQOTIaFR0c6QnEChjKAaspBuPRN+5v1xgvuIeHijR48WXGHJ3/KhU39pMVHADR5Wwt8/CG1Dbh/0Cq51JU6UFgeltAw9E7ELQq91pZSu7navBKcWYstqJyQTeKs1w+HOdigJS4noSC+iM0sDGAQjKYdz46HNTe6tALbMfB4HIDMP9GgGl8h0GTCE16G0gvDjgX/w5UT6BtBi8EcINUy8r2cIbYVLzQIDIrk6mZSSpo28P3lp4AfUXRZCku7+fJ8CYbqjmNhWhv/oMBrX1p5Jhh4f62U12V/bI8oqvJf7NEyMsVJmyd/Lxd3q1/Hapo/kdBaUNXrTS2lX3HO45HqSiBQxKCzBW25sr9R7GniQBJ7Ezi3Wk0y9I/Xn1zTjDZOR9VfZkQsB+9Xf9NN6h+FuPQc2oL1zHXywr+YY3qF2kj029zh7nnWcjJuscTcXwJ/vwUDTY30Gjw49FKv8ykujgElE79XI4SDUkpV0DX+GvbOlza7ucAP5Vjn4U0PF5K5mDn8HTgU1ja3KtSJqFGqohw==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpWhQoUpad73yGdQDMg5nLt1K4cGdln6SF1SuZSG7epIY/7tpV4cywc7RHgVAY8mbV3a5YJC8bBh91x5DFLb6nQg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfFqbasTrwijT16WsKacufGuRKD50IX3h1/ujX78oP2dQ==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X5BZFz+6oPX53jVowLWXvmHOrtcU3NOGMz6r/uEc+3VzoPGsUCJiWNHzRtJdAJre+hlL9k5xiHEBV1GQZa5L8U=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fTMxXZVGShNDpuDZgrD/QBm+EH8ZAaFtWDH86JEGYbXhLU7r7+Z0cAE9+dpAC7+dcl4y+8GUyQmtWbcKW8hiqm07lutgrVpKOyJob++kq7nX2Yrmc/n0XC4S2NIYmUjzaOA9Kr7fYEHi/ub+TG93ku1pTD8YeEFrNz258yqh7HQCXaDGBlMlXCNrCX23OripsPfNy+hraANvhuc8kOANeTwGRfQJ4KMnW9Oz7rSA08q6Q8MFMbg9dcRnoqOT1XqWtBQU0hx8sc/I4JZhyIE2FjVpR9cgPwVtD8xr2o0OHmbT7I0fkA54lu3vVD/dLMyKs6uxy2SNJi5xGBqze6LCPNBdCW5LFfj7MANm6xFPXa5P1ps8UqKkyRACo6lmEfFwA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAE6pA2HXTytL3pY2cGRlGZMFr2BvEsmQgkim/6CSGg5Ma+ZHWLFYev/2ojhraAqj+k/4TtzqMd49S1tih4/6aqKOQ34jFD9u1baQiJBHfMLeVcoxSED+gUuSVwSifTdbkjvvt034vHBtsWi4pNlrEI3Qk6n2xob1tyFexV09CW0pp4ow8F+i2/Aq1jUJaiMUd2rH8ZLdrnIRoDc39W7HozBeOEHXF5WKU7W9Fhm8VoZE/Lf2tEjqU36mfMIArj9q5ACJLVehXdJSFTQIwzdCP/yUcNmVZuUEQZ/DQ8Ku1V5gGNVAY+8jMqa+mfaCtIB4Njt5EIP8dJYJ3rKzsx7HHSg==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8r/wNwIoh6ANRfy7Dn5qXRNlS6l+gBOtSGsZlkcE09fPGOWRV0LsMBZAdB7cxr3qU8</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHno+CH4NCZ1KF4e8lN9fcC/olJCH1AkPvXku60diCASNpFO+N7v73CNMw8XlNbYxM=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm4n4yWbOsfyxqjmCWCqEfBY=</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SIR480k4nZZleZ3mmNTKZfC6vJpNFy756J6iq18Ux77</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8pkxlgRyiP1OiDveAqNt3A5TvW91ySQu9NeVWhv0PNATJuM1k2bDbSjQuvhfm/89KRpUCdCDZIB+jpsgys7b5s1Iyekfzga2e0R42kCkrN6Dbp843S3S10N759/3f5kSvdjuLqBxwmgfMOE+W61TKfaA=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmEphKpRa0WUxaijYYpe7wb+p/hj6BqXaZYgwtRMEf8+a4N009kTGcg5YK/2FpPDkvwUY6PfLGs4sla9+fbwznOg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F8BJ/yE2cpeAsA1BTkuH/9HBzh2wJvz3Ns3Qrquy87ogPO/P/oSpZ9VAOREELNOsHcVwQP7G19TUp7dNHMTu3l0TWT38EBGQWMp5K1kkwBjcw==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgsQ761fIxgB6IJ1Ha4vx0zTHMtZgEGyYkSjMfdJMB1URKid9ecKjvYaL3mKRROiGiDCrP1X5q5aYro5bA3Vl5EA==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>