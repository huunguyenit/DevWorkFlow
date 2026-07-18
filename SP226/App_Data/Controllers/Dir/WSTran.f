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

  <!ENTITY DefaultReportForm "3">

  <!ENTITY CheckDataCondition "stt_rec = @stt_rec and sl_ss &lt;&gt; 0">
  <!ENTITY CheckDataBeforeEdit SYSTEM "..\Include\Command\CheckDataBeforeEdit.txt">
  <!ENTITY CheckDataBeforeDelete SYSTEM "..\Include\Command\CheckDataBeforeDelete.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY f "FastBusiness.Encryption.Begin$3H7kPWBUT0Qgbr/0jUL75+xKJW+n7Qc7TQfRKbOSbBNknW+6ecM8aRY6qNFo14VHTSpb8MlBK0mT7B2bM1vA3rX0qfEkaHU8Jd4SCCuXLLZgB4j0UwzPDXtDXlX5Pojo8NZQiPCVj8BqIlwx5qOcWA8wq114ZTBr6ckirnyu6LRBQlKjG7iP5iohq+KKulX5FastBusiness.Encryption.End">
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/TRvjyQzTAbfCK+rtn9tJDbjsNSySZvqTQUx7/Gia4XesPz59cEVRozoi/LrPuVBfQ2slZnJkFtsl1mPrEsyNUYMUz0AJ7+ChgoOYKA9jCao4=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dAWq94q0VoapcoamOJsiLjvcoAr8bcw6upkLFi+a2SCLwe5GP7l8K+1o7qk1kSMnXhIWwcdZaFttowYZOytb2YZEAMS91BMLWAlFq9Rh9EeQ=FastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d68">
  <!ENTITY DetailStockType "1">
  <!ENTITY DetailTable "d68$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock int, @vCode varchar(32)
select @stock = -1, @vCode = @@id + char(251) + @loai_ct + char(251) + @loai_ct">
  <!ENTITY DeclareStock4Delete "declare @stock int, @vCode varchar(32)
select @stock = -1, @vCode = ma_ct + char(251) + loai_ct + char(251) + loai_ct from m68$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updating "declare @oCode varchar(32)
select @oCode = loai_ct from m68$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updated "declare @stock int, @vCode varchar(32)
select @stock = -1, @vCode = @@id + char(251) + @loai_ct + char(251) + @oCode">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 or @loai_ct = '9' then 0 else 1 end">


  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCuzOn6nkDfDQToHK0Ru+dz0GNf3xKuM1dbDRr2aUlw5R4swZ5AYWjQRrFYnzNoaGGyBr7moWHw7EvPNVbhVEGpcCvvFQ5sGFNJWZ8+7nNxbH/xhLW641Mk1eVnRdZRllgFastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSCQNeuJkDt2V8k5zsbQ0+Ft8eR8fIPmm3ee7TgPhndQHGDm/r5WAb3aUUTjmGucbWEQu2tSBVA4XdjK863lKgDcPMUn6/yqza1vykuHBBCxmgO3McKu0GX0SZtRphMt3PJU7Cu0qZnf2zyAA5KyXGXLj0bbGS64hlimCBru/1NmhMaZdoUh6OQuSoZfCKxGwbPxH4zAWMnc7bSFJAAZxHKB2APCpHCSAde4rkwsRUHXy7wCGbAM+onw0h+JyfMwvWI8AlR05k6X85ZFLJIA9tFX6YGRRLyINWZIQF8MKoN8t4lQDDMK/XdY4orv8CPhBzSHFpbu2cze5mQqHLxKx96LXBEeFk1l0MAfAeNsELSgxB8CAtu7J6gTCb2JDsQFzdFYGUJ9oWTiIH1ZL267c2S202U82RWZ+nBleIGoXKdJhw3Qdl0d4kCZUv/MBxm+O7jfjNv9fRwS7ORcV+k2uMfP9xorDCV/CrMRHgdAL4t2jjdoMZFcZiNEyb/YhnSfFr3DZ6X8M0AgwUYoTjl4XT697b8feD0lpa/m6CwRg67kwOyExlSq4c/mrSEz6GjOwnUzrxKb13W9lyo5surc/IyII640WmcLZD2utpTHMrxbA==FastBusiness.Encryption.End&StockType;">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcI8xSHazv806Ya+5BQeuaPU7cPmaLt+xYDagn5zDd1XE8mPNEuvoJtuzyOBIakYd8Q==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$fJTw9Vw4Elsn0BtK0cIs9PqEXUSzh185GjvpuJe4U3RV37Ser6mz15GVrl74by+sFastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4UhYH3Sg9hXHx4L7apxJCxFNaoUyEArCts3oYs2oOfH4sSI83YxPLUNChLlblkx171hWdgnHe++B+j1z0eiAFk+fBHZTPb7QTisL+kZh9yGWQ6XqZdkgGw3S6qgXgzJTOg==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuNKWF5CmXqUoJhJuAiDmlXTyGwvbvDCg92KPKmwqTiU26TT7j/K1y9GOCif/RfH1YNmcnalYNYMT2MybnuCL7arFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQVChKfWU0ZterbzvS9NGcchfI+ogwKvCCgexQ126bzwa5RhOgE92WKM0zzeTEDJGkBtTOqVf+6AaXulUfOhGsXA==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.WSTran;
  %Extender.Ignore;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m68$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXR" type="Voucher" uniKey="true" replication="2" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất" e="Return Goods to Supplier"></title>
  <partition table="c68$000000" prime="m68$" inquiry="i68$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default" filterSource="Vacant">
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
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d68" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WSDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tt_yn" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true" categoryIndex="-1">
      <header v="" e=""></header>
      <footer v="Cập nhật đơn hàng" e="Update Purchase Order Status"></footer>
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

    <field name="ma_dvcs" hidden="true" readOnly="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="6" split="8">
      <item value="25, 75, 100, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1011000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="101-1-1-100111: [ong_ba].Label, [ong_ba], [cookie], [ma_dvcs], [ngay_lct].Label, [ngay_lct], [ngay_ct], [tk]"/>
      <item value="1011000-1101: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1011000-1100: [ma_nx].Label, [ma_nx], [ten_nx%l], [status].Label, [status]"/>
      <item value="1010000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d68]" />

      <item value="110-----11-10-1: [tt_yn], [tt_yn].Description, [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

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

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 100, 35, 65, 0, 0, 29, 108, 100, 8, 58, 42, 8, 100" anchor="6">
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
        &CommandCheckUnderZeroStock;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxF3FoHyhEbdvy/IhnpqRlZjOLbobm5sp6lazgjoVTog/qhmAwFLPnj7rOwFB6NSyU7j+kd9InzxYHHaYbkLOoClMhbqudloLR8GJGGAup85tufH2eH2cfjUH9Yu/jAKe8blxicm/IUmkQPaJD0LBsXfMMkzJ9YmcDh9u1RN4977k=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAGra473qCSfcNfmmfXz8w3UT1gfxvtuzwGCGxFpIP0JcMj9gf7ud53iWO1PLzU5MY4Gx9lePG17TcbPGV6a5Pqwbqm/VP19J0Ir6f1bGnQ/kIAtvT6cu5Vk4Foegzb2ycbVWhRCDCDKTMNJH4B87b8X1SP7ORojSatuPnZOwutZukib1Vs9sfzu2wVTO8TGjw==</Encrypted>]]>
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
        &CommandCheckUnderZeroStock;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &DeclareStock4Updating;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDYQtzp+hDvbfGwShRFhM4yptevTnVtSAqCPupt/ZM1x3pMoyEcW7d6HeRgkQIGUF4B909dnNl2uhmHpVOim7xSlhY1aJsTBlmJqumI5vkS41DEc9QAFScwYJk5X0o01UjTsaVJEG4SAtCoOISG88wXwyPdiBZ46zG2Izi889+ACTjwLz6IaGD7MaqZ8+0TNIENmcFsLNfQHSNzcqmxxXrxb8dpHG3f0wnRzT237bmMhVZxaoFUvlGlMUdsm7iaWHNk88qUcoVf3yRM8aWPSWkpAY9AA7Fu7FNmDmoTjTzrsLU06wW55uEQYKBPlAa5UjTpeGJYMxnZbpW0HhdLgMPm0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZrNNqw36MOtONL6zCmHu34Stm6KPaS57eVaWf/wCOCx0Wy4TkUR8G98u36BFbFeNsezv7H5j3k+SQmascw2VzdqpMqQSQLF7mwPyuqbbAdTaUmnTwYz3Vrv53WPjogxmItjgSxo1JyBk27tA2adckTG7S5KivSIWzM6pDWgDzvWMgcVooEzEE+Ej0UO2fcncmBL7Ri4o6EMhM9caRHgQwHsJepmrW/vZI6pgOayHHfsD/tUqdIgvbXP0aMoHVshmA==</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock4Updated;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyHMSfvBno8jzOdLdgr7YlTQkLtZWkBh49kxjrdNQCZEO/0BTGR24UtZw3hFSLDdmh+5G3MQ2ZrT/1+xEcjTg1nm</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ed/xu+y7jBn/kiNRQB4g5Ilg734AKkQnK7bu8D6SOczxEKp5cMDxRWFFOGNsNqt6Q+Ohcc7Z6c6jVkeN11AlYs48fLBolq9Gj37FhLQmxGb9ZPIkMxub0B9lq8OWEJqI+3yAJzXyF2Xobnow/ikpe9q0mRx3/bW652/3H2BUX6KrioMNn+dTG6Kpv0kfvoP2xiOg3BunGl69MBEr/R0MrdccKAnbvpRkl9kwh3R+QJX9BykR1m3BQ1JzEicOP4K3ni7T4JgpDMv1RHXQ9Wyq4E=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwGl7183Qm9wLqwIEHWpC1dcA1r5RRooGmTasHOC5go2gwRcqj6wboujkw4FcljRWi2aVN/DeXaz/m0VdxGi2xw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DeclareStock4Delete;
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKx+0ZgooVR0OGD7rMK4B4SITn88WeKFkpUKHJiW9Qu5ZsiZL5GjVvc3PPx9vnZsHWDyxXWJO+aplvMH6DFMk/qkd84cIFilezvNNRFp/VCbn7dQYiTyCig+98bW5iFoKnGb2Dck/VSYLW7iF4o6Nx5DbFXfHTWRqNg8OsUITvz/P7N0ekPyk6QG3nVJgHpXBPvsy7uO5SrlS7hFbmyvLwO1PZ7tBz0qI4CK7LhaLp6jYdD14ozvnPZbwoq2Q0fgTUK3WufnuZJa1/SH2j8TcSStfK0iynMh2N1+N0EUY9XNCNp82sSJr9Me+PZJ52wpq1HGpqXzSULUHd5qdYFqqwFkd/ufS5ivsS4er+/7G8C+S+5sPyg1THUMb4y4CP4gT+W1mM8JkvLCb5rUMmj59VhSlTuO6QSjUQYXj4jE4DNjlRp8RiV4V9JMSznKFjqmhvyswPAorc6iSgZmS7FwM4wJ3NesrVC/qF54wphUAVFvnfST80T5OCyOUnKNPQ/fgkMpnXOMxdOYe5mpFpi4P3V3DJ98rT8pVo5dsRl9BPPJUnIPCZqc3yOOO1UOLcoURs+cIB8JzkOZzpzDzCAa/rXsuYFrMH6DlHMXnDTPe/7FktZfGex8KI4n7Kc5FhouZKbzD02rFCS8ZrLvzqqP1bEbpbB0Rq3Gmu7ILAp6xqCZGKzmPBY+1pg8NPvGrzcHWwzixwKwDoVohfUubLXP9t1PujLB4MHnGV1so+YkgJNXxW8Leg2J3Qy6QckChuqC/yLaJVJ/HqU7nfOIGdIF992ViE1gCjh9x5SURDNy1UZ1xOVESdM0PtZLfuhVM18YeXVAOikmauwhUk1kCHq+0x97RVa+QAgI06H/40VejLIDULsNT7tD+iLUa4decGUXVNk3o1ex2YRCjTnNWMAon4gvF2Hqg+Tbp6Ibk94I5IpXxMY22NX87k42VKyM0ZVoDIfQGt+UobPjQPaTKOBcsFBIql249fuK6HPB4fjuxIx0w4TmpARqloJgnqU8ZsKdBuLDQxMWx5xftTage5uykwBe8nKn/jZK0SetT1lTwp7i5/0ZoPNxjaC1GWY/oiLst/isbjeIs6qBX2gOOSYlj9pJw7ilc7xqjzj0jtC6S0mFAHujt+DHyFV+/TKvltW35n8QrM2GrzEfDw/km32G0PhT7r/ahdr44rZqrAbkTPkICgm+YKLG2YZtLMQMPTGJcqSND3Ki3mG8cMdI23f/bUQj8/Qqf3Xix0nGXVyPgkrxz6REplC1w2ydRfOkX4oDO81XkDw0oo15kqEBaA+dVCY+</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxe/WQx+bwj5afl4LxyYsF4ecNIkJ2/aq7KnDDtd5tO5abLns0VahAQgBgISR2CDH7rf34sQtfeKVcbZIyztEbUB9Jx6zAxAGHouBxt0uwDXsQ==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUj/fkXwJyaW3plvGsCjbKzAyey4S32rNg6cr9hOxkLeFwcnM1hvlOPcmCcxBRJ5T+rp/T/AufR/h+l21859V46Q=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezpkdR+Bw4Uxp113lL1cXRTlpR9VNfXciVbhnVPgohPSJwy3EB6KSDlWqvT23yHRNUh+K8tHfF28EfOcrXsjFBlbSgCCpYOI/GGzD9h+nqpeIIzOhWNnpqcWeTWbb/c2dukrgSRhVrEweeXVBE+pAORsrfpLpeTsUgivdgYmrowO1xOPKZqrPpGbxovLYzn+1j</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbr3SHHPriEWe27FBb/ztTp+mo8+A2VoPAnPNwAbsPvCRNT2Qi77/b0xPILa6ZjUcbvZ/Ng0wWcZ6GZ+S8hP+W9J2m0T+fUsjnpLwgCuxsIzPw1Zvp+WPHKuIWHhxSlecXnBhwfMn26kkQPG/gv7VoI65CQjmoNWcEf7N7+DhTRYr7dan7QkLrO1HzYE0FsjFLXiiMemMLkuFVtl9QklWOX7MnokTaDqLV+0PDCLZwGbIhmY+LZFzvMf7knp0pIH+s593LjbDi4Vrk+9iZz58ypePFb57HCo/eHxUWZvQjbjzOaeXzqVNTBkwIPlIvftmsloBfcNGEtN91Dt2JM7RLjw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8r/wNwIoh6ANRfy7Dn5qXRNlOmSng12icpeee4g8jBZxanMGAmdfnJR8krlXlzjtq6</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKFx0HdO7+TZLps6Hm3dV9W4k24/gLduQUqDvLShPSVVRIlR4cdQwXeVyx77UZDW1oo=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcfEli7+EETDNDwT8dt/2Q1xEyGFaT4U34qWPkyu9l7jxE0J+3ASaPjlHkmqY6PSw2QE7YqSv83v1QMg6Z8kzC2A==</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8pkxlgRyiP1OiDveAqNt3A5TvW91ySQu9NeVWhv0PNATJCn/zVuyY2WUV3QmWn608EF8K82vZPT8t1rvFgD3xwChM1lvpSfHd/m/rS7jrHCJ3wGBOb7Fhl4FlmhJ7VDHbwClMdmvkqY5QUs9pWCkbEeu41KBq7it277ntyJMhR8r6</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmEphKpRa0WUxaijYYpe7wb+p/hj6BqXaZYgwtRMEf8+a4N009kTGcg5YK/2FpPDkvwUY6PfLGs4sla9+fbwznOg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGkq4W7OP571jRmvm0/OLjKgalSxJRXoz31VcnVjwSXBNbltwQPMQ756nbR7k9PnbBEWylSkGNdr0qpDVnbhKmnH7mCzPnW/yyTAJFPuMysLf</Encrypted>]]>
      </text>
    </action>

    <action id="Reason">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5WL7a5liEWX4YXsPx9wgxhWpi5sHCTfKKudo3EmoGU5BzTRRMXmlEdXcuKoAUGf/GxCKfKgTXKuHIDzpjMKmetkCZ3SbK3m7LJoHGlsXG//A==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHg02b18MnrclX8vGRZYui8ZjIcOTWmWjGzxz4AYbQTqggB8J8yboh74QAS0/hSi4tITHNb7M68jPEG2QvfGAlvzw==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>