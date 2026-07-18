<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
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

  <!ENTITY ExternalInitVoucherNumber SYSTEM "..\Include\Command\ExternalInitVoucherNumber.txt">

  <!ENTITY % SplitIssuingOrder SYSTEM "..\Include\SplitIssuingOrder.ent">
  %SplitIssuingOrder;

  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d66$$partition$current where stt_rec = @stt_rec and (abs(sl_xuat) + abs(sl_hd) + abs(sl_giao) > 0)) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY IncludeCheckUnderZeroStock SYSTEM "..\Include\Command\CheckUnderZeroStock.txt">
  <!ENTITY CommandCheckUnderZeroStock "if @loai_ct = '1' begin &IncludeCheckUnderZeroStock; end">

  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY ReviseCurrentStock SYSTEM "..\Include\Command\ReviseCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiWz276qMOEvhC3IEVxh5fTCBPJOnMf1zG8tYRAH3YYWhFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$AQX6qKaRp9pprz6TiKdW/Fjpqw6BlAQa6C4+bMYHpd++olaPCJSpfPo1HMVy6xAxMwfZpkC5dYqUZ532n2Hbr11dPbiSBggYNVuwshgO2wnYmL5v5cwkjiPExazdRQ9DJSZ8IZCPK7VCpFM7nxWvNXQlvHrq/P1YYZpgFT3phc8=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiWz276qMOEvhC3IEVxh5fTCBPJOnMf1zG8tYRAH3YYWhFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$AQX6qKaRp9pprz6TiKdW/Fjpqw6BlAQa6C4+bMYHpd/IckzYnpEleL0T8uO8za/2BarXtzk3j4sE2S9SPgefBLHEzyLroLmE8DtAfZx2mnuQSiZvHEm8uzlIrBlM7OvFCgHL6ZT6k37jHlAGyX7nCY4GUKrCeVTgzGOFzwlDz58=FastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d66">
  <!ENTITY DetailStockType "1">
  <!ENTITY DetailTable "d66$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = '2' then 1 else 0 end">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC+ayZOV3an7Br/vcgutxygxwtvC5w4aAoBJNSTg2hbDR0gbxPTiHIObGE67AjBOFykY3as5N7KCIHRo2izoa7VEB8o4JshWdcOGyzmvC7ZGV1yaYQeWIPGKff+9Vm49BNxSiI1jbJW32vsGSqFWjZCF0o/bmJd9dg0ujG4NxOTks=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcMIsd8N/0rPEiqpWJ81a7volcMZ4YdmpFbJCDwsgCG/ZFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiQG8q/Q6mvNBiy6FIqld1CLwjqyZpHmcl4JfFu8pp/UYJMyVvSQKK67mQHgeBAax6fBTZwHJFi2VMuM+3bK+gpFTXFASpIxuy1YOUwL1p7W+AKC1ct68BvGRiXxp9oCg7tUb3DTvBFgLWrdDmRwuqMwARZzrwVdB4bLx7AuD3yJlPNnQ8fGuiGIaZJDtnOjHrw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2iZCsXv172ZQ83Jz1GOo2uVKTra2/TLZab9MlDrOcH8xsNVsFqwUqacut7CgAbgXCGkYIKCO0QNndB5hRdmhjOhmbpD+sxa1SCn2uRT8pY7OzJwZPi5ORkFL5fbgLofEZGTv0k3+ky+ww53bgYdupIozZPfl1f6jBY9Q6jYy4+YDt+UfZMEpIpxCgFldV7aXUIU5PgCiTeMxSqKuaZHZnf17ZccfLTtekkKp4ZhkiyMEfPs4RYByBvSwc6XGKs0fpvQGNgsUuVRGiwZG+QzTBW1YZp+RPOPWTxz1liCZIGCQQVTgiUUQ8lRuppu+F8JLGe8YOohDSM9wqlK1Kxl89uJkaryVwyp1EC1yBtPh2b8lw=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22VbYV9lEDjCBXG3iXXJA4MYibZHgBqtETKEyyi4OLITyiTOgSQe60kIJy6RJoa5iOAknSg265kTkXY0AaKcQshQUe9cM2d64viRoZQlunxWQSBVIzJWqxuTGEXvC4ffbjQ==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuOnqZl2DyUM1Nvf7orQ+2TtpTUR3T0ec1GC8O63otZ31DEsYVtYfkL1IaCBQCCYFXo=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQVChKfWU0ZterbzvS9NGcchfI+ogwKvCCgexQ126bzwa5RhOgE92WKM0zzeTEDJGkBtTOqVf+6AaXulUfOhGsXA==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SITran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="DX1" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất bán" e="Pick List"></title>
  <partition table="c66$000000" prime="m66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'&SplitIssuingOrderKeyVoucherType;" check="ma_ct = @@id&SplitIssuingOrderKeyVoucherType;" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="ma_nt" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="&SplitIssuingOrderPickListVoucherType;">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="so_lx" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" categoryIndex="18" disabled="true">
      <header v="Số lệnh xuất" e="Issuing Number"></header>
    </field>

    <field name="ngay_lx" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="''" categoryIndex="18" disabled="true">
      <header v="Ngày" e="Date"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      &SplitIssuingOrderFieldStatus;
    </field>

    <field name="d66" external="true" clientDefault="0" defaultValue="0" rows="242" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SIDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
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
    <view id="Dir" height="302" anchor="6" split="6">
      <item value="100, 100, 100, 37, 100, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="111000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----1001-1: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="111000-1100--: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status]"/>
      <item value="110000-----11: [dien_giai].Label, [dien_giai], [ma_nt], [loai_ct]"/>

      <item value="1: [d66]"/>

      &ListView;
      &PostView;

      <item value="11--11-------: [so_lx].Label, [so_lx], [ngay_lx].Label, [ngay_lx]"/>
      <item value="------101011: [t_so_luong].Label, [t_so_luong], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 100, 100, 100, 37, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4" split="6">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
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
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2D1ZHWgEXdruCz7j1OpgPTz+0SdA25jGlr4yzgsGVVi3LOn/lhl7ofswUQYnBR4nS7AJkMfw2M/+4K0jdmOcZDDNtT8nOMv+kvyHxiDmUch/ILD2ePckuDaAB6WXRMJi/xWKvzYB7qG8VQMRvWfbhTRF6qXgELbGPlevVzOxBOEXjsnQS/cw8L0qXTSK8O3Dx7AbHsae7I25WQlcuB0FkOq7QNmQC1QVlSrc9seBjvFUdSh3Bh4CfUecDPNR5RwyOlMgCyZPZFIqr3TBsGA0c4=</Encrypted>]]>
        &ExternalInitVoucherNumber;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ09+KuZRCsLMv6WpMUGbdxZuZi9Qh1Dw1cdXg9LUz+a1UjBemtnEj0cm0GbYZc6jz81Rm279aWiEP6cYXbDyi99M=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSx7Vg5lN/0PGdwLlC7n+zOJF8PrcFlSbxYxkjuywYO1+jvLn0TrxBsdh1AyUBSW0Gb1YxyeWeU3e73n2Asa1LOjrfqUue8LCe+bbzsj6BoK2Pc8Qo/4/SRakEdGBnO9jkD1C+558xUkELYn0uDC+T1jQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDsIodCF7NG2rFl9/oxHpT+hSaTah8bv29iSwArWU3D1ur5c5nZFZQ5zoCjtJ/Lg46dWb1o7N256mxqIrclyFZ8=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku2qML/rj6uAFyANY8O5CW572OzmpguV9xaL+NjDHor6kXhMt0XyHZh4Wv4Wlhta1ay2118D8E9zszrtKChwDIG6d+YmTbJoXCuLodk+Zb9lPBmsCEIoH9t7QICENyGROoRviCrEltlMILaUSF5wjPA2/DE9n8aG8ikGMocwH4T5M1GuembrC7qngMi/2IHygJebJD0uaFDF4ioSumoSsnCt/b3QENPphqMY1aB96sRH+/V9q7fLc84XUgBpWM4SoIeoKQh5doFkVJINSREm1aI8PO5edzYoG0mFiDMPDak7jrICtPKWiAPI70G6p1Q3mJZ2j5jZjxqLRESU8456WBgk=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a2I4qCnVSxKSULpU53D8kYyM88VrwR57WXZ9lcdPrxeJkLAaGIFCGg7yM5r+tjRvnGqVJVJCXid1cvTD080TuMSqpS9TqMyHAdfNpKQQqgrQA5wvgcbHIHNyKT3sC2Wka1oDiHGm59hrHq4A4xX9r8wr1JaldRy9o/T6iOSXW49+90lUOG6cANmOOHVAgOZV5DYvtBeAjV+1B8I3wK3b72MPXhywjWb9NRKln0+Nw3WQsADjVLQoMDxqB2ZGuDQZw==</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyF+Wcy1vg7MtIUEgrSFdkma5kyG7Mb9E82CxoOvWNoCxCreE6UBfdyoPD09lUCW8uk07PXl7PFzpGcm8iCTCnUl</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
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
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxHJsfQSAWqubb66kNSEpWAoVfhIjp3M2kqsO8b8dScIrwQRbRQV8bIP6HZmFedjv/3kU0UvZUR/gqwvWitQKfI=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAr04WyRpO4GDZA7QTbPL6wesP3KPsLvaFWgmeeGEicYfc8z6CMUvX4ZfNGoP8Mhcxw5HtiySMH3Dfu1v2zqKjGgrg8Uw649WumyXofH8+JEEegCQXQ+pSepu+KaX8HIlS8wNwtTOkbOS+t9KUVGWGbj0OzFDJFEIolAuNIYsVpIJLbDPkos1m3BNJvwHL6wxQV4Wpv46DcJF9g14+9kVaN2mK6vm+RVbD90+G6Egh7zMSiicHVDdq1vmHFo0B8ybpuA3iF+ZqOfmGEh9pns8KF7PIQRN/3PE/Z3wKNqLcVWC2/1VtrFSo1sfC2hCJdo1scJDYdfldQuoCc/DosxMuyPSq+9IDi0+DnkyH/eiKkJBFl7p3Q7b5eGZ6+LB/ggM/XYzSeq87593suRWtbTBS3nizOXsZZo/WpzvQkk8pW2mbqsEgm1qUQI1XlNhRwBuKbgmCIPcP+Oh+obqYHiPw7lZz0FsRVWcIIRiv3vLw9G6INqf1vVx+4qfS1RLjza3pmdMCg6WczLiFmcJvwiZriWMeWMFs3etFmYDWrTrymbZa+wddCo67lWkTNQ4bQbgXDP6BSB7Vul1srHEeH1bStJKIh4SgtsbtdgF82wtLy/VoOVD5thedxzzvjlEaLocCQ/RosiRGV/NbMHnS3w+PudSmE6kbNdxZp0bSQFFPx85CzTITptDTKESkxM3I+7ZgUpdiInHM7vOqE1isOmmHnIOJuu/XdScCWPTRzfGFKNGJHQJkiRSTDrOEe3VeBiUasjczxjh/GvXrLXYjbVpLL2LGUsjvrYGbM+E5CS2EsDlC8/kKd1QpkWgkSqI3GfHf5KxDMt93k00Kly7n3JA4qxy6iu5qrw4+unXy8w08DOnc4l8wZqPgFL1yQwPLwLw7DGlNhMWNKCVBK+j0KK2G0s2yV9h+Gvvka8GgY76kj2HuB31xo/yOQOOZFMomw45GLhTnqFVSNdaPX50OUnqKJdfBbxzEVB19U9pY5pC53HV05bOR4rANHJtbvOY72JjTfgfyJ8wO41ShgfP+53AULmK4W/XszmkIRgtqH/gc1fX5JQzHI0POMwXLqdvJZOdGyw6N9qPVvCttmzHj15RRtSrTFrn106ETevF7M6dl3Uc7+WTb6GD68AO1eD82Y7Tj5bq/XJ5+gulhhKrL722YMNXYT2jw8h7f97QD6eMgXebNtp3w344jS/9q0Ad+A+Jo6K+81Yq3BmZ3hdHMYaGv4r1y8VesjDc4eJLbc+ALIQNJKs654vsm6lNJKZ5JhLmklcU63HpNFb52iKDXhfK9PrUwtt8W51pWBW7BW6bB7YA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&SplitIssuingOrderSetKey;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxk0MdwakS5Qk/sbNX4j5czVQHY76PYqModkdosj9bK9SLTexZDgkq0S0rS5IO5nUsrc26wlky8I/cIV71PnKNKvf3oyQSa2TOxP23OjqtAKCej/a1jFXCL/cNMEfmXDETY5Np3aR8k7X3A/srxpOUvFtBjKMpRKmctUjBQnUZt1ZBkLN1Y9Tq/BHNJlWJOumn595Z5p/KpsO/NKhlIGFUqTaAzcuQDPP76Ax3RozuUb9WKpduq7b5mV7CRWDkOf34lcbWm05sf++oXTHSWDCRzq7QA8aLNux8qBG7Jt31N+h22xjMO9hvapm7XR6BnY5VZjp1kzE6XWjihAh59EAjnL</Encrypted>]]>&SplitIssuingOrderReferenceKey;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9VRaLsvvWsPTqdF1WOkotiIh4kJbWWMigp4+YwrLkddji7oh++8matEUJc+qOE0idfvmmf7/076KcwXxER0kkLFyiIaCOHH0a8EIfP0VXRQwxlypy7W+s5jZuTugiGn5GUfsVjxG1JYVf2XcxKv5nZCcRB8n89KIGvlMqgb/6kqBLRmZmN2BdlMowjB2lfApag==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezLhuEmp37z6h8AfgOLwA2STlLZBoi+TuU+/vvE1YJXVczweZ2Le6gp6m9bRHvbnoQe6TxLd8d7z5JiHBeIpSJl3n+8ElvtVTNaBC8BZUxUWC/ocEsWshfYNTvLt/7HUB0H5GOjMBfc+I0sxpCGnE5i7NMEgenWY+S5vK1IWpxIadCtA1LkUUANWkFLMYCdAFj</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51kwk8p6X6AwhVqhj/w3oKTaobyHVe9JpF1ZJqmP688RJ7rJxwzUlon9rpiZGw79dCbg=</Encrypted>]]>&SplitIssuingOrderExplore;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf10KLulJys10sQR/HLkv8jOkYoGqh/hJFp5WdYshacWH1cWTOv5daSBSnstSrlWmZSnqANMrtJmq8z0x22uRnXtISJXlUNeZuI8l5FsdVDAcCU9B3Uy7sKXI/43obkGX7gs6yJmTuu19uA3zzdKmS+0=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/780RNDku+SRvXGWSkA5zLPKqNLuhS+lDofjdNMglASC7I</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm+e22mEDUV+WluUjsWEu+z0so/+vOMzCfY7LmrqcUlPAwdVld1UihDNXIuPq9vflqJfFBxR0VzvtnkiTwSz3a8x5ky8JlVR5wAD3OXJS6fuqNAPDIz5zrOdb4ZRvuY8snSNl8ggsHEikay+WI0O0sbr9qYvPCnXO7Pzwwl8R+KmIaq01pQjFJIHs0g3ZDy9LxxyoZ4yuwdWt0Tnh7szyqD8=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUE93vhS7Z6O1d7/MpPvjq/hVNGt6K6XJyxOxMfmrgyJyB4hgbetDfW+Ho4y+GkP3DT0NuJm4q9u/QsPpqrUstVpUTxmqo1Dv6P3/SK21NSZEhT4+EudheINOHGHp2RLpLgMUgSnqvEJ0xbhQuMbNLE4HVqrJK2LiPUGRJmWGjdkdfUaXFwwDwt2jW5HIpssaG</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWdjVQdsPSzfLy3ZGf9bgit4e13+3N+ltSfn2LIAxKg8thX9ezcYvoJHW9S6H/o7UXvhuaGYbe4hL3n02EMd1SOQXZNgRnVS5IVcEO5/+jrR5DOkP2BHcDQhzb9oRWZbhdAGrlal6AyOtUVVdhzvfweg+fJxjFtgW6sLDAypUeQMGfmEKtyOp557W2zeujLfpe0b7xWY9hYyp9gacddzkjgQ=</Encrypted>]]>&SplitIssuingOrderDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YA3nVLwj5GEu9PtE4Zb6iRGJN7zBuQF8ge1VwQ/j9KcUjt331weakEoNlN42JIGmZyk6JINnz2pkmewLTBECkcK6O2Lo/0NmECwvLoEb5VrINzTqODxqCLxX2OA2oQaiZkmBEuxglU8ahkiKaNjGB6VUvHZBiJy33roRFZD39k6x9DLLy+w/P2NZH+GQjqZQPRFTwinKOy3RMx8fLIqvnkc6xfST2FaBt1NYuSDMqofmVgEyZK/esi++Mj7AY64Qvn8MX7oG0/ynagHUFy2cNU=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgO8zDuOl9gN3a3c1nV9VJOG5XjSMXf1Fvhkc2pJPPh2mbbnsL7U7bThSpGDvfEDkCNX0B/nCfeowr53onOyAZVw==</Encrypted>]]>
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