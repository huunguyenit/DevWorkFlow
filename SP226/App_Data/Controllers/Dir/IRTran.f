<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
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
  <!ENTITY CommandCheckReceiptBeforeEdit SYSTEM "..\Include\Command\CheckReceiptBeforeEdit.txt">
  <!ENTITY CommandCheckReceiptBeforeDelete SYSTEM "..\Include\Command\CheckReceiptBeforeDelete.txt">
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

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY VisibleFieldController "IRTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY DetailVariable "@d74">
  <!ENTITY DetailTable "d74$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int, @vCode varchar(32)
select @stock = 0, @vCode = @@id + char(251) + @loai_ct + char(251) + @loai_ct">
  <!ENTITY DeclareStock4Delete "declare @stock int, @vCode varchar(32)
select @stock = 0, @vCode = ma_ct + char(251) + loai_ct + char(251) + loai_ct from m74$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updating "declare @oCode varchar(32)
select @oCode = loai_ct from m74$$partition$previous where stt_rec = @stt_rec">
  <!ENTITY DeclareStock4Updated "declare @stock int, @vCode varchar(32)
select @stock = 0, @vCode = @@id + char(251) + @loai_ct + char(251) + @oCode">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">


  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbidCS6oQYUXGEsLAvsklpz5IYuNse1iRAdSu58dUUSzqQZX6y29WxaQ0pIFiVlRCPmoCHJhM9nSSvJriqbRRj2XNogj7xfA1YPME6UplymnQy3MZvfswU8yLIph45s+RaNUFgOEyEtl80qXCBBTjPa7lWTDhnfNbkhNPszVojhs39/u3In5Afg8aUPMDUJ5mlww7O6UztVV6FGoRglnvsk5hSlQJ9No2XhwJH6nBtEQFZstxViC/26MPBTIZme/7fqNBcGQ9I9iAPU2d14Emdt4zeo3qS/ABuoXFnoTEnxwjwRBPRms2jPRFLzhpn2F7ynuX5wYPIBARjLINA2mcvbPs=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbidCS6oQYUXGEsLAvsklpz5IYuNse1iRAdSu58dUUSzqQZX6y29WxaQ0pIFiVlRCPmoCHJhM9nSSvJriqbRRj2XNogj7xfA1YPME6UplymnQy3MZvfswU8yLIph45s+RaNXrPHWvvYM2ABWSY5r/Qw+5aG7NP2/UK++Y/UgPyYtyEadFwRbQgGp3HE4C34mIN5XO2Qbk+5mCrbuvFIi0Cb2pvbG9db/2khwkzIrqVyZ9goC924Q6bpgK/jSyOd1zHRXhSQks3jbcujbVRdn2Uf5vtsZEBeeC6HDPNXfO/VL0zsmgB9UBNw75FJMawxeQJJQ==FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC8xJv4z5MImGOHJZFtT6KMxenCYd6aelo7M3kUdBs9miJlIiAdY0WttUOfEsHIzkHuMyinhIegMmbMt4ATne+R08E+bHx8LNbWirhkgl9cr8=FastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSCQNeuJkDt2V8k5zsbQ0+Fv4G8NjP+wDDKh0k1Dz8wwS7rwvHcT89zEMBLWavDaZnhqDZCNwBPirKegUuJQlPU8LpuFy41PxsSk/PS6ZpGhbs9zrKWjRufW2iNQjzZCzkfmjI3Dk0W6EB06YCFkxkF6ftn8Q3V4dnYsIVxW9XwSkGM+KPiHZZokY4c40/CsmZKPsx8++jcbpXgJgFb2n9fk0Gz4a6rin24rIKJAKeAqVQ1j7uQ0m248uSuvKIDUEvCrYkASIuAaxRJ4FtVb8+J1KROf9m6qlpR53vHEe4XBHCdRBsIKGRw5zE841pdJ72axW5hfWN8yiY5vIK8hSFDY67D3KDK0qEAyEBLygy0OdLTbxRd3XARGTvoa6hDTOwvtFLPNeE/f0i4ZuaFxL6rpPIpUI6JiJ+7uy21mxhV/w==FastBusiness.Encryption.End&StockType;">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliRUrGtEO5gRQksDG6Qr2zbnyvbLY0bfDQ8+uA1qgISkIdRfbaritbiId9cihG885mzrbkMuEK6LZF1LE1Vv1LstvIjlLb9+eRt4k6ABL6lLgAyJWLbSYHvrva324O7E9P2+zvH5XTYEocyTPj2IEsP05BQnKE+CT0IZP5tawvwddB795FOl5Q13++5OGh4Rf3IYVhxos4V3p8A/G9vSnRqyK6fVK3QxaL7lMobOKfNOBE=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUmN0gBRDhTrXoVuGh98qeTfIMTleNHRvJAs3b46HXI5w=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Vt9BawnTeSfw8diY9T4uhk+1LdXzZxaoSBGZJM4V2aEU9k0hOKr8A6TFgCnSLumw4uzJXSuT7hx0Z9zRyiPCZEr1kabJozoTRGWfW1HMYoong9fampEDS5AI+QIdl7wYFnVdIgY21NHzgS2eZj0wlYWlErnBh4zwIOSHvUigVqj+DIJp5QP8DASfsAvfKSDZK8isCsk37PrjWFDq+eFKDkRDxmN3rITjXcE75lfDn2v66QacQ+Rl/MJ5UYbMps0jcGz0T2FgqSUYHAdOzhrQaxf73ZUlB6lJJCgXlxFCucDb19tLFT1qU0cCxjLD6BzV60UM6z/0g4mKzjx8tAO0l+SeCMawMMf9AcIshzEViwDN50VTRSDD6AZ2mKhBWexRHNOYF3V8CeOwIqJDcB6Ar22/CdG53A2nNQsRotWVOjSFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu4/cEKuiQwEL4y2onv0mJ7znw1ON76nBmH0Uogu8mUE6b4+6vZt2VxWcumJou5qiUVrjOO+7PYsbE9DQJMaLc9GJX0KLvHBr47P2ePmslOCkbj5vgN/PA+bP/LZoE6ghkw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUdJdy/vBMw8eDcCZQerUnogOA0ZZozSVfTD7Rt7FS87DtSJQDRpEAphYjsNICTQTxXubG06fRlDu5aQZKKstXic=FastBusiness.Encryption.End">

  <!ENTITY CommandQueryRefAccount "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3dE6r2wxeesivgpKuIW6S5mRJ9UeapnlfMtV1HTJHlxLIkDenGg4ex8pCvi0+uc+T/Wc/nib+yEbFMo/8bxgRCnM1FCEhblaCBnl5rMk8FcuW3b7++Fyi/p+tsb6/Yhi7Uy11XurqejsLkXxlnrH8huIDzjvHTGVZUI/ixnWbIFZGAyXYr+0oBbK6nTzA2FLOiXEUXTDwhuRSvAKl+qMYNxivYN1XV0izbPthZ2QGA1Jx+0gPj5PqwN8W9XRpfCSc+J6APyeL9KmDw4QDajb/cPWuJo0bQLZI45kGNhie+ORzOjogzfX0D8Udyoj70939B5v6Z0yaycfB7PdGlPtrjXOUnhdAMUmRkB8BAaF21jFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.IRTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m74$000000" code="stt_rec" order="ngay_ct, so_ct" id="PND" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập" e="Receipt"></title>
  <partition table="c74$000000" prime="m74$" inquiry="i74$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
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
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu nhập" e="Voucher Number"></header>
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

    <field name="status" inactivate="true" clientDefault="1">
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

    <field name="d74" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="216" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="IRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền nt" e="Total FC"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct_goc" type="Int32" dataFormatString="##0" clientDefault="0" external="true" defaultValue="0" allowContain="true" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" external="true" defaultValue="''" allowContain="true" maxLength="-110" categoryIndex="9">
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
    <view id="Dir" height="276" anchor="6" split="8">
      <item value="100, 30, 70, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="110-----1001--: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000-1001-1: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct], [loai_ct]"/>
      <item value="1100000-1101--: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="--------1100--: [status].Label, [status] "/>

      <item value="1: [d74]"/>

      <item value="----101-10-111: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien], [ma_dvcs], [cookie]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="3">
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
        &CommandQueryRefAccount;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckReceiptBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandQueryRefAccount;
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckReceiptBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7RAoqcW2gaQOSaoqf6bUVVj/w5BIc/qhqogwjsR0byzIMCTWDuuIoDhXFptnBai+5FCTZ2wrkXVkJduUTznY+geQfJK1Wry6K+jT0jcYBFu4IhAZY8phO7gumCH47L6HZvI6ITGQEZSaCRJgSh1vHEvj+2ZBJvHSZBqUXNFy7Dd4Ne1F7QsaLwIZWI44BAPog==</Encrypted>]]>&CommandExternalFieldQuery;<![CDATA[<Encrypted>&TStonzNIPLtkzEJ81P9J6MO8+27j66ZwA+UiAsev1TskpEwWEeBzVYlIAeSyOAqPDG1B1PjkIz/wv6MuBk9gyfF9zW0LTPJ78E4WTnmt/FrWlg06WDdz1NCtVxdN6inD</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsmVZ0zPSEIwBJ3YgWPBJ66FdCjLppqvcGUOqL4xQVJ/X4FUoAGb8KPQ0TqrBvc9s75/4s2wc5x8lKvPYBJctB83</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLpShthywpYQnCxUrzwRXt2KhNILu7e2vkBMrbM8b/TwtRsi/RGWCdN/WADQNZOaaP5n6mzk8vUr+4r80jIHuuRzLoIqrSpU/mktN5lSOtsrG3WbSLvm3zu1rUza5wlONoeR9A74dTldQza0A9PIQwJu3wwBZ9hQC/bScNROuj+VCVVbX4kFiqvtZcQZfq8Amg==</Encrypted>]]>
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
        &DeclareStock4Updating;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5yNcvOV0X6jJhCvtkI4kznZWgHdglQD/PPQYw3XRRLPFY/iNtQNV1uPi/Wt6KeNDRXSSOLnAmpEmGmbvNiJizgtLNS1ksXPvq0XWcVZc8dopwEBQwv8CT6Y3bo2KqJRuf4bpbrAyI8wzqvTFzueshLGtw9Jec/0BdhORNTfDrLJteQosgg9qHelJHdd8nJJQZYHz/rfbTdeoVu7s33g9pqPeY7IhvX66UQmfWtlZklhK0KXPLwolKCRPFhnJpJJCOlvGJqbRHX+zkD2oN8BvKqW6ansEFn/fCz9svvjnifwngFpKmuvI+Ty3erVIGdAACDrI9kU79QyukSQxWXeiKp8k7Uau7IXZpfMGex8Xqv+YispDgf6raJVb1E8hfB0W2NTL9WcaOS6DETMhrd1I0Y/MxdpWRRQIMo1xAU/ZEAPuGW56aQa9GL5jdLDzHPXuGRG8x5zuK0liRG+TCHSxdjQFIxFf0ToLMQAEWYVa3ZJUT40BgjH+Fn1HdJ46hyAzg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Sud8Ul0BXCFH2lv0EjVJM8yKgMAaAwekqplI5R4FkDXlBc6kvAuXt7lCplgn0xtu3VnIsu2QjSARW2cvD5B39xfVKG2dbRNQTaBpdPrMN33j+g2CD4+nNLGph/KnyjZXbvA9rfJEg8M6jovwbwO2ySqSL0qLtoA1ter+pllGs1nDM8oPm3lWyxrclSMdqEDxco7EUcwnIwNoPv3rmLIfaq2vQRBkTmdc3+LQEoSMTDrlVdDDVYJwFzNSDxO4mHGMMFkuBeUHkxu3NivPMMu2o4aMuBShqfaiosvufswBEl6af/Wj4bTjPcKgAfDbfjw1X3/OE3qIb/HCXpRSgQhBViSXY2zOxMGK155hNR3tORog2vPQ4d/jYDL0qCfrOZnxg==</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock4Updated;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyGbXxyLVb21p2TgArrMQFR+ZB1jAddvEOJXVj7+r2MI4WTKGsR6rlHkuHf7BN/d6XtXHS9zrP/eJMHjK91aAvwT</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
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
        &CommandCheckReceiptBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1083NHHupcEYL6mfNQKeHBWhfGPCvIz6TDTWhcs0qqX6giBPzzZZyo8kT/vU6JyRQXKlsTf3UG65Td7VVGediI=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3hVE6P6UOoVfhzyPwUF+khGxj/PjEwWGcgfSdBehggGpBmlC+ZMXpEbl41/ns1Na/OvUMGua6KjUheUDaW/weA=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+saLoCjKZPWodd8++6ZXpRdx19AaCQaKyW0L1GQG3ze3Zz27zg728Pc+6sIheP7KA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzBycFw70N1ZcpZaJ8pUSTg6GfJR/q44vpvahD/gdkQi3+NwAXQf+nBoz2ZphAXYqzz5CF2/Pezz315O0o9uRfzXjOi0W81JEipBO0QFBFY3GSxVtWGxy88Glx2ZmPunfQlqm5L0OvH8rxSLj2lIsMaHX/n3mLF+pi+1zK6X6MD/TkhkLaWLbd7QlLiaucNOR9aSlFcydBgbRePzpjYKYwfkuFskYgLaf0OU77FnqcxdWJ+Z00FXEDsBeODvFaYl+klKCsUh43FT3INtprpDczBQvWJjINmDfg2NVzd5sBIKTIuXsjsV+aCq5qwjotc3HPpdbro9CFl7ZuokatCwTXqh0pNm7fkBaMdiS7A0coa7c6fo0mqempw9iGVReHIc5dqLqtlx8FftUMaAZq3xBdZ24lts/paBg88O0pI5gAoYO2Z2vZy158+lbyPxlTTb47yzmYVTYXqUOdgLlxnnI5RFVKuYkh1lPPK73bGCzhYri9z/VFSii87gghvrJs14enL0KNVItu37Ro8BWiDcmhhaCmEEVgr9LRUqkDFZ08FyYYABGZ3+3pU4WNbsf9xeSZ7EsKjYvPHUiR3FhOaPOBQvrA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+Wnkm+cM5ndaXGz2udIkr7N0s/sF3w0VqMqnIbuw5EvSw==</Encrypted>]]>&LoadFormVisibleField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&uGHO1INig/bVVI9tiETWT93juS17Eg3zeL5+cw5rKOgKM1T/9q05Y12zCAccNesAwLWkAfehalQZ17gFxltWUuinyyGCwpsFSe5/s8ihVhaGLymQeY1z4pUWl08v3Fnx</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezWGbfAW3Gc/m38Wh8ClnHAKOpGLIWuuwBw794zgXwL4gSF3s30np24ra5AmwomsTSn1rJkRE3l3NHHmQdOx4RYY8giVPYhN/20D1vEZZ+mlbzInDn9UAfxvzM1qxMWS2DWJtDenfIcwhd7U+WBSC/Gl6nYekkoqNYY5Ra6rxHVi9YzUmAMk9F1mVM0nPOp0Db</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbo/yTCyAMWooTWL3jKhqNe0FOCSLx5wBmC6CvDI8z+5gO6ZPrIvWj0XUxpTwCL61PTrr3jr/KB52MSJG0GJH1BVxlmogF4a/3sI6KNOroPkQCA54kWKnn7jyX9A+FJZkIoe7+odn895lBTcrIN/32PSe1f4WPaYzNssU4OcEeigm5nIotvf/HaKlhshBMFt+kj5ePlTPBQs7zzSauBBQyAqgqR1H0XYbKhQCLZK9rkF9DDqV+Vjcd7JqWQoT3A8HbXkaz02SX/2RywJp2B5DHtM+/BH5Kcd0YFD0AHxT0YMuLZ7DKKP/HnSIesj6GwocPE2vF/M5Ns1Y/QFlJU2xx8Q==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8r/wNwIoh6ANRfy7Dn5qXRNixMNJfKYvCVi6sTjIp/d1TjQlOG3ELbTfb70FccdGOP</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKGozF1bXhB14LBZ+qzQL4wRIhFw7bhfow5WbkklDdKh9TLxS8KiV6PmMAI1qrL/vmo=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm+e22mEDUV+WluUjsWEu+z0so/+vOMzCfY7LmrqcUlPAwdVld1UihDNXIuPq9vflqJfFBxR0VzvtnkiTwSz3a8ySzWaBxjogXTxftm1ca1u2dh42PlScBkB9TP/KdqVbKSiwPBji3UkLt5MEjLe9Ph+ISM6hKJSwOZHp2QM+RD0w</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUE93vhS7Z6O1d7/MpPvjq/hVNGt6K6XJyxOxMfmrgyJyB4hgbetDfW+Ho4y+GkP3DwkF3ieGDV3BczybMvzDmOTlBNbDuUhX7sDmI8dw3Wdhccz/Ai2cvBZWgDdTRR982FVEwwJKFb0R9O20zq8x9GilodW8Jq/PX0jdZ6ZzgG9bBzx2hr/3ASzyRoIrXjXxvzu0tBc2xKF5b3dgNiER2Xo4BC0dM76HH+VM6g7NwGd4=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmoGveA6Hn/NaavSvu4yKOtAKJoz3gsKIl9wYO1rH1rx1By2jFNULnfByvziAPjRmHE5Kfqt3nrnqp+XwLOD/koaMEedyoDRxGBklEJ8b2wNZVv/x23MfRIrr6JtJAQN1vByc+/yZMTz01qvK6DnDxT0MK4FKAGxNmO8q6VARohzDGk4GgsRnLSfhTvGeuoLY1XEESzR2mpffAWlT0oL888ue+fVtISFn5u6ALrrUba+siHU7CSBvPYQoG91W7Vo6Rk1czhF1jJxSaaw/2ExLDPxnPmEBO5JmV5EpF0Fo7qJWm1N5hE5gxhJjbf62B9B693kYe8HGpm4x2DpkIy9PzyOQ1yujEh4dbE9iTP/fe0JU=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgjdNczH8TPfepAbaVrMqx3qPiRNvCXjaxwPQZWjFHzX/noVTvbOG2rQ1YVgPRlSSxU+mlAPzFJOIYOqcaILkS6w==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdeLzOsmnLd1f1/GeKIgMjl9lAkI+k87NFBTzzcbwN57eYUmpNRcjOEM2FfiHNGA6/Hiu04Mx1j/z6uKmu2r/mHejJrG7GAp4Sg8wE1T80zJXFNFRU+gejXBJrIf0boQevN3rtZVVXkxtQbjHyyXHIY4D/YhdnsWCYMmJBxlu2A3CKuLClhjJb1Kx8DBncOeHcQ==</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>

</dir>