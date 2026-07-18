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

  <!ENTITY VisibleFieldController "IPTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY DetailVariable "@d75">
  <!ENTITY DetailTable "d75$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU4SbipKxGkQLhVEVmO0YJml/S+KFM7rnyA3BMcQez5PyDav8rUBrr0KxI6aKu0kGKuKkutPJYPeQOQgZgm4kMCScy0eQI+unKeS8RRAShUXPj7LNKWcEkidcBSCItXKITJ6yvEqy+apZtCeWkQ1sLly585200c+XQWxhiiDf+PgvLmkpDrdu+lzYnVVjEdsL+v87GtL6u6SLufSSyfl8kCMFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zuXzTyjsuXkjZ4506i6V+e1FATFYVD68nZhOOc7hBOSbsWSIhcrC2/LEH4p3+qYiZR2wbdAgwnuyLxoBUDM0Op+BEmNjzcM8SWZl+r1Y5ydyOzmrq9BfH4b3NIyg8PN5aQ==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqTUSy7ktjjXN/aKikpyVpm63fuD5yjHUMTPVym2jAYd9vfVcvOIMYjisUmUoO5eTtBiChMkXfFemqTwDGUDG6jExBLqoWXcz1IpwXFxlFA6xzqy6c3NjjJS2C6VsV9bPA0JyQj6jF0o3xvfbUCEovsS2R9FCXNZ2TH20TjFeG+DFx3rRVqJNflf1AsahA+2bPUuNRA7sNyrht79to5AP1yU=FastBusiness.Encryption.End">

  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuyng3w/X3X9PV9tpzg3z+nTB/M8myVIlemCfTMJHqNrBB3xmSlVwh6zgY6h5OrlcIQ/llzEq67kkCtDm2g+nxVmwXXDYWgGCJ1jgSh2GW+U+i3QRgDXGQ9DpRgqdof2mgSiQoq2Ecb8G5XHFKx3gcPgYgmdDvdy1qbxXGkl/lp/FP4B2DdauFAEi/KKR+21vBurhmGf6FCV+oOcb1nOC/OcvxrBS8xXo6B83NrBZPrqxiBsU1xEaOS8pShMYk8h6JA==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zqapu62ovRnFC1f3wGwu6Lzgw4qZCsVptiKCLsriOpZxBIQ+TkLGjsVmEwTTW3Pb5VR6UbgZEwIM4Clll3Lq5OhG4Zr7uzaFiGThyDjG5B0WUHGvqIr3pLLF82ZVxLBvpw==FastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbzI45hKQW8qdbqkLCI8SutpN4jvWP+us8pnE2DnDW01wjkosiJalO6NlTSxoT5jTDdBffW7+INA/rG7rNHyjLNuACbuIWBqzf4o2qH3ANDwbjhB33cBQHGgM/QgV0fstcDL9GZjjmZJ9pnDd9PR9l3H4rD3KMSdSgOIY9cVKPZckIPDKhpS4Zd/BxE61wW9lJ8oirjbDzo6nPH+jUOqA+XRg==FastBusiness.Encryption.End">

  <!ENTITY DeleteCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU7QnS+OFX87B4omEs+NrKpHUdpxlHaNS7G8mYU9xvMyeeHrXvbbMTdjim3HByiV+TLr9zDHTYFDFeDe5PljcjnqyXv9Vw6Hxkwx3BiAoNjZ6ZMVpHxFDzgh09vcvXdx0R9Dce9HOrQzZCug+ynW36mR0wpZhYoJYD8X8MnLuTJkJA7bAAQ9Zkgp6BsQBHAyiLV73vQvsCJuLX6Pq7nyGrUr7THgB4rUzSHb7e9rXvGBacudHEQiSUyCpBR+ypQn3V0COstuLA1L8mje650x+dRTFastBusiness.Encryption.End">

  <!ENTITY f1 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11YyySZqScJgrCBFxByOV/cCmMew2jwM0BvZzcZWQDm0OeUzlU7NsHXaGjHAhktraFxHs5PBP0zkNww9rPM2BTdxFastBusiness.Encryption.End">
  <!ENTITY f2 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11ZoMRRFgLZNlhPUFrYopuez/iTLvL6VoUBYbcPOzapvdU96arN7W92xUtSpXkv/oWKpWCg5vAWG9sY9wMMvlMThFastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCjMFKShu1+jUbc98tA99iwUTOPCaUW+JwbV6RUZUVEZwIZ/IwTuMoACgaWd1SKwmQTLR3ojDq8GWlM6NDB9NuAz1N7K2GB4YuXsgT+tcpeqpsp685DwppRdpWsbQE6kXLwrMQQxpwtDwOA+KqnPvdGw==FastBusiness.Encryption.End">

  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4fF4DWFm3CpQ5nYO6xuvNHzIcG8s0uY0kDYRSg2KjdVqHhuTGOpA1npJIhek8JWOq/nn8Y0ikGWUBHO+flqPV8XO3mM2YEzp5P2POuzqhlqR5aqvxi3DL3SNukWLiFGaiwEth+EGt7/r8+fmUejnGtSSxVATgOnz8gDSzaAYgLLI00KN2ApjEGswBwJI9R7rknzjE1BTqLMi5J0OK1tULReRHHS6du/oj3rge++K/Uu7tp8R9wjUWbIkzKdQ0g6LwHPI6NUwkeMFdeGfj7SZ7x3xbGE/dh/z1Vfjrx6Bw2V+JEU9af1+UCNf2ho4xsPR52SKvDNiMi2JM4polBKQhdXS0kCHNNCTSKqm5zX1qqOTz9nbkmlfDXeBr9pqlf5Yr8Hvt+A6F13B6VhnOV4bK2TmRQScTZ2IToAWtAmvWMEkDCYjcRKC4O65oLtsGHzHqh/e8cdyeyVLdwCGm2fvN19w5HljesJYj1SgqslufQDjCr2rNjsPTN8AkeWTEjjXJ++V+UesjWAlTYPAa8PvhRPnkoZ5a+ca9uCtm4Pd1nBYno6XIovP3LRBzgbKTQjp0nncW1YVQUhhEhu+miimk/VltifyR88UjT842nbAUc8hwgopPW0A4ojibNYDqaj+jg==FastBusiness.Encryption.End&StockType;">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliR+51Z+Y9nM5DOJuuTdONIku4jHBgbec1ZlFq/VKpI2e3+fPLxO1hEOBbYIlfd7zyoTgFL8G2IpUdOGc9tC6F6mWan2DcVxau/uwayUAwwbcKl7yTJJhh4Mlfw+gjEusBQUipnpdt9WxDCdiMwZf9D4h1eXWTQdAIfJOxIiRxV5CTFk3tDGqxIZCxAEgCc5mx9aQp53G318wGeE1GJy5+/erB9RxOlOA7L41sBni6pRJU=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUmN0gBRDhTrXoVuGh98qeTfIMTleNHRvJAs3b46HXI5w=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Vt9BawnTeSfw8diY9T4uhk+1LdXzZxaoSBGZJM4V2aEU9k0hOKr8A6TFgCnSLumw4uzJXSuT7hx0Z9zRyiPCZEr1kabJozoTRGWfW1HMYoong9fampEDS5AI+QIdl7wYFnVdIgY21NHzgS2eZj0wlYWlErnBh4zwIOSHvUigVqj+DIJp5QP8DASfsAvfKSDZK8isCsk37PrjWFDq+eFKDlMp7666oCynkw/uWXeL9d7uY7ryAVTuw2/NTUWkjoNTTO001iYA1YseYTe7/IVwQVlgvFNM5X7rBUZfuT6acMf++bi0R68INvu++h8Y7Xf/lZrXoVcB+QMdzdIc+NxCxADJku6bV8Wlnp+cf/H6TuS12PM7VsV7UG2azjrZUhPG5h7d+GfsXYf8HCd919lD9A=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaW9h3de/odlahDs2ttCRjo7AKKjBd5EtwYe0Dsg+Nyw1Dyvjtov0mWI+zS5Kdd+WPLGB+eV3o9u6JPzQr2V/EgsFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUdJdy/vBMw8eDcCZQerUnogOA0ZZozSVfTD7Rt7FS87DtSJQDRpEAphYjsNICTQTxXubG06fRlDu5aQZKKstXic=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.IPTran;
  %Extender.Ignore;
]>

<dir table="m75$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNF" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập điều chuyển" e="Stock Transfer in"></title>
  <partition table="c75$000000" prime="m75$" inquiry="i75$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho nhập" e="Destination Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_khox">
      <header v="Mã kho xuất" e="Source Site"></header>
    </field>
    <field name="ten_khox%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
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
    <field name="ma_nt" clientDefault="Default" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" inactivate="true">
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

    <field name="d75" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="216" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="IPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
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
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="276" anchor="6" split="8">
      <item value="100, 50, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000-100111: [ma_kho].Label, [ma_kho], [ten_kho%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1101000-------: [ma_khox].Label, [ma_khox], [ten_khox%l]"/>
      <item value="110-000-1001--: [ong_ba].Label, [ong_ba],[ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000-1001-1: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct], [vi_tri_yn]"/>
      <item value="1100000-1101--: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="--------110011: [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1: [d75]"/>

      &ListView;
      &PostView;

      <item value="-----101-10-1--: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 20, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4">
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

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Fi3AvPh0m+IRW6MxNXBU/irBnSLDSDdUuRk/YbQIOmAvZlyyNAF5I7ut/rzs6pNxDjPKQ1tUbxpJBexJKsMyBuguX5jU7ddnlLHKRj+CO+</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05p7W0ruORmEPEL9GtjcKlCh+symbwhJLPpqXN3EYRLhmpvnnKExvbHAiWQELJbzvYDp8M9FSCkeN51zFltJ9LoEVYb1D1kkGS04jSZuIAM6XmI53GpGhuQe6g/xITgzBdqORY7JBbOo6sSaZp15Y4Eo8uEWTYSrPbHdOy1YS1YrN3yrgnIXDDxss166kW6s3LYAHC6SIKyRfU19AaOCA9Y=</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aY+dnvA9CGTIMe2GSSkZle3W9DgM+z3u+Fmjwi0db+Z5X8QYa6tA0Tk9qSb4RwOIEu9r7j0ZrLiyLNRdNCi0D6SeC+MIInS6TwiV0YVLsjnodWKoF2M5LN/+SzfwTzYLHZOt3fspljywE4uGiMPWQI=</Encrypted>]]>
        &CommandExternalFieldQuery;&f1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ejy0vQeeAUs4EyjyvCDLwUVT1Kqjgon5AU9r/cDGZS1/TdXfXEgbILr273CDULyyxfbF6xoZd3YVGj3c9Ta3XDlVEwZxFTee6WaBv06xlTcL0bS655BLtqX2JzbiyIHdQ==</Encrypted>]]>
        &CommandExternalFieldQuery;&f2;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bOk5IqXPHv7Bu63rzY2G6z4Bzy8ErXV5ar0Tqf8haZ7</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku89iWk9ijLYMYVed91SVXbW8aeHdrmmNf9rgF1gAWjjMncNAT/TeDfBpW/ib0+0wbE8vGW3dmP2lBMa5xd0oRAIt1+nfW9KU2Ysz4kfYaJlFgTeA2yr9Q+8c33IgNmTl3TIxOiYHz/KfIoLSPb8MF51nM67n+UrrRXHaT9vXmGSWSXALZZhOjb25TnMtPSA64yv4pcX3A8u3O5hZqJOeKWBhtLvBJy5HMK+EAQBbMzYoK2i122XvP0BpfOSsagI++jrUzW97a4g/SHHjeHNDDiKDMlmSOhhwYF0vmzTjdc6RnKH4mKd1yXTYUQOWsgLO8pTfiPNQ/L3dVJJ8Mgex86o=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Xx4VUuFRHovWSmUekyj6YI6uEqz3tgu1RFPp/ybmZCOU8JAmfHfKSNpzyyjiFE2IoQsiXH+RcyijDoFRqh6BRsWGinSJAEz/BN6C00HPuNeFbG1elaBhkqmMPYRw7q22ecYpOnusZUq7+XsTE8V8a0ev2axrRdXd403I1YrSkg+UoRABbGKRH1GWOTvhGnyQI7MCydg8MLIm2319msRZYnX49LfBUqon9EbULytfT1x</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyFEfF+idGNQ15CAaF/Sv2kdjeY07oUTS+p4FhL0Ku93M7YczOmdndzhC3ygA/8nEcp7TNmSEbQXg4ZUW7FGJSQp</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &ListDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758Fep+k/xlMRtKIcdPXjvqdOiF5WEYvGq3QhIs6AcjgGl25IKOemyqFGLJFdghH0W/AJjNfJnXbBjKonUCK0nJY=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTiQ5mZYJx9ZCZuWxDUj7TB3ZDFpvAdWhB44rL/RTPRAok43Q7RBUAICXMm9n6E5Ig8=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxeirW9/Xkq1MO7xdYiC/aQ+GxOAgNQnD7k0tf/+IlslHuBmPXnck+N7Vkn+/9xiHNLxAny1ISmaEnZtWTBqE1zWmzoglZ7k0FAUn+SE5JYB9Z8/ZDWLCOYgZPwsI7LHxLm2Y6Q9MGmip9qJNr65ohZoTCfRZalHAxZZ9vNXkqq3K58s/KFvUjq1PTOEyc3X+Av7vCvuCWt7lf/Mv+B5CA7WAmsO0CXKClUWGP8AqKZNEQ==</Encrypted>]]>&LoadFormVisibleField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&lWnqTZZnbWWHJm+kKbHLt+MbPlNqf1GB0rO+zwm24e2Ptm4PHNPEq10OBQKmQ78PJaORv6/nYINABRFvGUc40DCUxzJlM3bnAFFus4v3cFfohGk3YnwwRzuJm62a8QCO</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez6pEPNLwvIgHn2vxIs8HU3DhZ896xF9KL+SLnbLGcqWKG9wvm9je2mlQ7UJLIS2ywl6soE3JbHA4RTLpvtH6siUGPnXjD8b7/FtyQWUuAlCmO1IGnMeHC6ma0Zx9BwP9jfiaGh15SZLjEIRlHYM0woqoCtZMGWsVR9xxXm/TInuchy1Vfs3pHTDz1ZUv1tcdl98I78/T8vD6ivk5IvaiN9Q==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4aTOZJ87/74SfQOoCR5sBVOUSgClHOJKAMjuudWGgahc0Lm79sFnpzt3MG0wpVqzydky4fUzm1ZbHoFtJEWUoZVpUP5+C786S5SQz1YtDx6EPTt5hL2ZVBjnk5+wCBYYHGju7Em5dK3RuhsoWq6s9Nz1bo4g6Oy8xM/JeUgzldRlqv2gWnJsQnvaG/ksV2gy+A==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbf+FV/bCerakFYloIU4P3O0OnyRRrf9pz6pmbUmr7i6PZP14t6W66sNzC9BuftNdHAqfBSdWVMz8E5ozY0eIz1nnmyZi+yyD5Xh+QQpeswehPlOw1/L2XibD6IqJ4Vbute+P35RxqVgbNXEB6K9ZSCSw+Gu+1Hvx/NsFDWq8lSHLAxtMGv8HMF027qBkd+WVENexnYiyF8qID4zGthIvz8ilBuhBzdQa7lgnxj0qSuKMw+Fm3U0ul2oGlcwRVV6lr+IvYuYVT5INx03xcHxF/wmtdxrozHIuskrfpPoUYanWBdfqXTgzRtspVmUfKrU2Cc++KHKPQO3329Y9GUCIybQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSlVeLhmDpoZCffv321FbC+WElpJDUUhiyoMIS5g46tbH</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3dQIXDlJ9bXL9gAENcRuUveJBLr0VlHNEQnP0ub/hwMTq6/TBuLs/UqgkMYco27bbw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL6KNZMyYzUEyU3nIiAQfXNqChXMlpeOR9KCnwU33S4F+A==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WQ2llnL3aocsUmADDbRJ+oTCUb97ex7/FoCqJWEDtb4KF1okwJ8j1nsoFH3ykZNF1DNqvaubOCrRV+S/PzNm4YlaRGNfn8v2mDGqn5SxXMFFRePZAjNBU4jeK1iqq4/3oKC/OvA+H9bK4sc6KxT8yKyP1u2NAfoYgEhTetScNcTS57ok/jJZn65XQY3GUWvnIssurRpQDN373etdg14ow3tr+TxdMSx8UxMtHOCgZEiasCc6EOgnPHSLMC5xqFi6sk513vbATOs7rzheZbNf0Pc5RwUfOMZDuI1r8TNPmKNi16c9wuRpbIg4M2yYEWX/+FMzN883A2ss38+J0m6hSU4rmqhtU043+UB9eHJOd7ZeMkOcN6MwthCaP8Llv7S4Jgk1xSGCyvRtoAq0W52kpdCerFU78SUQNGa9bIJYax57kvES/lR1WBTrIDmo14Sv4fA/Hed9aUVOgtc+Pbj6MM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgX3uqkFoMsvDXTtrgMDiLrh1RSZTA/QxkWePbln3msH5gk80AxiyWy8h8flp0vqzpoMkh5GS16Mp2/CQLfLWwaQ==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+cJGZzGJXyk3xcoQtv3fcxSmHs+rKRPGFHHV7LU0p0NsoONEdG6tYunHkRVO6+yDA==</Encrypted>]]>
    </text>
  </css>
</dir>