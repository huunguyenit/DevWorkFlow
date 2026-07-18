<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit "
if @@view = 0 and @@action = 'Edit' and @@admin &lt;&gt; 1 begin
  declare @$denyAccess nvarchar(512), @$checkVoucherUnit varchar(32)
  select @$denyAccess = '$NotAuthorized', @$checkVoucherUnit = ma_dvcs from @@inquiry$partition$current where stt_rec = @stt_rec
  if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
    select @message as script, @$denyAccess as message
    return
  end
end">
  <!ENTITY CommandWhenVoucherBeforeDelete "
if @@admin &lt;&gt; 1 begin
  declare @$denyAccess nvarchar(512), @$checkVoucherUnit varchar(32)
  select @$denyAccess = '$NotAuthorized', @$checkVoucherUnit = ma_dvcs from @@inquiry$partition$current where stt_rec = @stt_rec
  if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_del = 1) begin
    select @$denyAccess as message
    return
  end
end">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\InternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY AfterUpdate "
exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'ds8$$partition$current', 'stt_rec', @stt_rec, @@operation
exec FastBusiness$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec, 1
exec FastBusiness$App$Voucher$UpdateGeneral @@id, 'ms8$$partition$current', 'ds8$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">
  <!ENTITY Post "if @status = '2' exec fs_PostS8Tran '@@prime$partition$current', 'ds8$$partition$current', @stt_rec">
  <!ENTITY Delete "
if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete sfctpx$$partition$previous where stt_rec = @stt_rec
  delete sfctnc$$partition$previous where stt_rec = @stt_rec
end else begin
	delete sfctpx$$partition$current where stt_rec = @stt_rec
  delete sfctnc$$partition$current where stt_rec = @stt_rec
end">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S8Tran;
  %Extender.Ignore;
]>

<dir table="ms8$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF8" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh phân xưởng" e="Miscellaneous Shop Floor Adjustments"></title>
  <partition table="cs8$000000" prime="ms8$" inquiry="is8$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="2">
          <text v="2. Thực hiện" e="2. Processing"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ds8" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="264" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="S8Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" hidden="false" align="left" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="324" anchor="5" split="6">
      <item value="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11000-100111: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [ngay_lct], [loai_ct]"/>
      <item value="------110011: [status].Label, [status], [ma_dvcs], [cookie]"/>

      <item value="1: [ds8]"/>

      &ListView;
      &PostView;

      <item value="------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100" anchor="5">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
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

    &XMLWhenInitExternalVoucherNumber;

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AskFyQG/VYOGi1prSYb7337JriH9/EFqBDMqnLl4GqxmLht9TFVFtTqL2xZdf1TBDaeG0qS1rWevFLApX8PkcLG25oMkJMbaaJLoGkwHbxWrkjTe2FcOiytFeJLsCG4frnpIq6Yry3SbznKPzV6/smyn</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLwDkrYEQxPASVo0RV/n1uz/OTxIDwrNz11kTN2riruvL6K1ZsYwWZLylB45ctnGAGTdGiqMU+F5ZjqX4KQdB5I=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUujmOPgLEKMMl51XBI/7r35FT0Y/NL2EJgx5a/PW1Vc3F6tqkiQpgIaU2TzovpFAwR</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku2IIrM9IU4Qk9BZZL7yMSBFdzQvJl/oxrVB3VR+JYAMieX0/mWK/oXyBzYims2qod3p6GZlFN8pRGfKc86PdqaW0ETGjDaacslWK3GnEAXW+QDvrA/QK2A0bnnQ2b6FnsuQjonjFoFfySTfw8opWjZsAUXLy2J1cH2naz6PCTJsn6bT9lQWZ1nxB6ub+nASqYYkR6HUFy/wu9R6S9HlIPwJYskh7J4IrPEg30/bayUzaf4vSf/QlYjSV5zWOjrlBcw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fPhv6dDVh5L1oVIM59WxePEQmyBFBpcwg6B21bzPyx2ah6GuvCfcEE6r48k0/Io+aQrAMgmB6+FKe5pVFtb6gt+GWRXFE5gMIet0eGJd+8og4P3xWT2Y1BtbyNkH0cy5o75j+77zXcP9XqNKIuuoYETAYk13MvB/CpZy2+V85TYOg0295MWvU/fJMXuHyhhzAixCULEn14uF1/mpZlrB4OT/J/NwvrAZ5oVOKZQEApa</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8O0tF5ldsSW5Fs/UvjOC+/ZIn2erqfnjtzFBA2SVwE8xYOVpZBRwTLjv75JjqZQL2ottghzcM0nyMSJQyzxQeU=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb97V3wErUdUSCGbNKHfHOkMl1waQa0AZsUVEhTlbtZcQ8eS+nDXCKrqdVEYwCIxTzZ56y5PO5Njr5pD9M7AoWdhVAvg+8Vo1eYcVS1TndmFZXcXCdVB9Gf7XRRbmGFu0jSnTjZYJhKM5zGGTAXxT++3JNysJznu/4LS+m6byRxLZcL1hqGEMVsG6wF3DaPbZP+MdCH7PjBssqAGWreJhXgj236my91frDn1Wt5STkBhHoPVKQMXb1MX9crNPz0Fehpmw51DOK8SUGkMYjC3d8BKNWuus/YVHD4GLa9OPykK96Vj0TtUlJkpPdCGru7jPXnI8R18db9cI3EGFAYq02BPN9y+AQuk8lfQchII5Pvo4S1DS27FUOkxgcbQYnzwzQAtKmiioVEUAmTJHXBseNCNFsu2IvdgcOXqK8OXqZ3dOY=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cJBEXG7+jAvci1Jt354JH328nsiAkCDvew5GL57DsilgQdnwR0A3vVad4q6bqAUrFDEo0XcyyPG8K3HvySRv9mTn7G6VOZJay24IXWVGoPoPdA2B3eAz9c3hNehAPC7e9AEJBWrEuSlY4ty+fW5qgNblXglMnxlXW5yQDQrKfUHUvoKpeiw9h0AOGLhIp7x3/gNTHT2xGBIBFYiC+GL6T8qTjcVFz5NmBfCydx1UVoHZlYb4hOB25GEshCSDAop/IxQvCB/5p1uPEz5FWD+1isQ==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezv/Hwy7wrXvqYJzqRmuA0Q43RSTon4MWjyKTQZ16LpFmu067kH82hjJ20UBMkOV21fo1VKy/iOuzqYokftflhdrf1Bs1iOIVY02xuL49Gb9hmurojr81Zs43Lf8+pg2vO9y9bE/lJOSymq9UlBn/gaR8x1F9moz7G8LKMMV0pRKZwRoaN+/ZSOH254LSW1upO</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3rbRaPgVQbyaAWlvav9QHubWFH5iVMRCDBQVY8vreNO8</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUavLa7Z5ygTEU3d547EBnqT7DEKO2Sa8akHF5XWArGJ82bSfuDr+n+bS5JvdaqVAmcYnr5sm4zDkLeo691A+xeFqVdlRWqhssWbcoffq9FnKa46k1gIKqm9bzNYebHQU9BjbY9/P9EQSU2EawXlrnsXFhO2Mwwd4JFgC6AoWI7y5ySqrAgTipdCrICYz2MB99t9c2N2AiNYJ+j/atuls+cm0wUAsN6DBey31yOn9iV0aEildK/3drxVN+Td4jBjlbz68cuZfqER/rILapEzcOTU5WN6Lsn+tlWhP4ZH21NIHuVdAZ4mk8b+jpZtytTvV6N5TqySu7milzR4hZzoJnOntShZdrXZkak65zP2HFtqwXpBCzv8+kbYvac6mk/BTqQ262l1RFLPfGCB6/ug6+a75HmWwpY93DFexpt/GMN3L0=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WkO2Jyt5dCcfvzAylvsDZ42Wo4b+RaCbLHB3VKmyaPG</Encrypted>]]>
      &VoucherNumberReading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeuNqiSMvZ44o4LQsSjE7ZoYF+5T+FPRIN52eVsiGCs6MQd3mPM109YvBBNvNtxM2WOj9LLz6+4Rp6RoMdbWJfNJcvtkhm6qFyabFVzU7DZ1pHZOwJF06W83Fg1bgg/ek0X6b1qTxCSYlXcmUR6huDfvHCZUU9MNl/0DMBJH/tGRA4eQBKep+megbnUuZFSuvg=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMAUI94BfGWqMAzATWVXhCogDQePIipazvJgXVMSCx0mQ8WMrzcKy7vCRCgGiDq1V/Cs/SCG2/41TlKAt4HqLIeTIah7DwW9WupIVQDIHciXcbgWCY8WmfuY2IF0P4+k6SMy4LZm9T0ZnsTgn5oHER4GrkCZfCASguvfhPHvS/aWOXSmvEMR1N+Cvv3Bk3Dw2P5mzdc6Jkfi1ncV2Xg1riayK+NifM1JmkaENUuStltZyr3WN0Y7tqetDB4JUrF/B4mycJiP+kbvTf04tFwdToHfb4FiYPNlY3YJHHbTYFdgWlh1zvnCxc37JvhYVtoaBL7SM9UCek8GoOTjjHqnEelzFbrL4nw7CtbCEizOnlpfjmYxiAnzXzmiQb5hcqjgOwJfT4yWJ7vYq6JBKQJk9+bZFBKCwTm9CB4LGreruJQPEk9xXGVceY6PKrWuD6EN6Cu0WMkPCTXijphE+In8J3ew1tWUaMxjTpx6qGKcQc7ZAiY8mQ9lnh26IsR0r47ufMQBk0OM2Sj7qgrd4nEudkxX7FOP8TEo+08CAfxpOfmuqE=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgoNx1x8xLoKwZ1bgzPh1dkU1OodSI7p/W9W4P72Woqmx1yiyf2pQjhufNNVuaaj2q9rXgJiPm7X+eyBiuieB0cw==</Encrypted>]]>
      </text>
    </action>

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;

    &ListTicket;
  </response>

</dir>