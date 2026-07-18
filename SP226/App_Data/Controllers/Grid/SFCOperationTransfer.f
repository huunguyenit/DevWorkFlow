<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandControlLocationLotShowing "
declare @$tracked bit, @$lot bit
if exists(select 1 from options where name = 'm_instock_split' and val = '1') begin
  if @@id &lt;&gt; '' and object_id('dmctvtrlo') is not null begin
    exec sp_executesql N'select @lot = lo_yn from dmctvtrlo where ma_ct = '@@id'', N'@lot bit output', @lot = @$lot output
  end
  select @$tracked = 1
  if @$lot is null select @$lot = cast(rtrim(val) as bit) from options where name = 'm_kt_td_lo_yn'
end else select @$lot = 1, @$tracked = 0
select @message = @message + 'this._tracked = ' + rtrim(@$tracked) + ';this._tracked$Lot = ' + rtrim(@$lot) + ';'
if @$lot = 0 select @message = @message + 'this._fields[this._getColumnOrder(''ma_lo'') - 1].Visible = false;'">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ms4$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF4" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chuyển công đoạn" e="Move Transactions"></title>
  <subTitle v="Cập nhật điều chuyển công đoạn: thêm, sửa, xóa..." e="Add, Edit, Delete Move Transaction..."></subTitle>
  <partition table="cs4$000000" prime="ms4$" inquiry="is4$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_px" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã phân xưởng đi" e="Sending Shop Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lsx" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất chuyển đi" e="Sending Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_cd_tu" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Công đoạn chuyển đi" e="Sending Operation"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_pxn" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã phân xưởng đến" e="Receiving Shop Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lsxn" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất chuyển đến" e="Receiving Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_cd_den" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Công đoạn chuyển đến" e="Receiving Operation"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã bán thành phẩm" e="WIP"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lo" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã lô" e="Lot"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dvt" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityInputFormat" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd_tu"/>
      <field name="ma_pxn"/>
      <field name="ma_lsxn"/>
      <field name="ma_cd_den"/>
      <field name="ma_vt"/>
      <field name="dvt"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ialCjbZxlL1O9/U7DD1bawnsbLDOP+8wiXF0BLS8BzTIfi0cCxEycPkePtFVhbjUxHWQqwpDwMO2dwoWYIclISkkCE006eVCRnKqH9DiNjOfrrrpAW+r88DreyfqeMdrwkSiIVdI5r75LS/rSPzE/FobRIqrxySi6SBKK+Vl9sgBm/hbjE2N7OBSPjY2sTRkF232CX/oZoKvcSmFpP5fVGlpvVG5bTvN+ydyuzOhDzt2SpvHObrHuVBUyniBnn22S</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dP6LbRlnfVjEPGgE92txYBaJsLhhS/EuApeiSYw0sSASjI5jiSbx4RCfxYYCqn1tA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00FdrV00uPaT7HuwBz6USXVzKxyDzdLa8X2gFTUPNZfR00uxxYowM2qpz3adRbDcjRSbCxgiEnjIGjcJFCVO7z/ncZ6nU9zLzSUn67hos66NlhkIh8Jom/pdNxA4SoID9MLTnBz8VScTlm9X0wHezz0MW2gKggobgx1n8oQJh2GAlf4ffxDoRQ/4aQqJ87qd82</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2GKOgHIQaRn3LQ7MIojxA6xyCzK3nq1nrG9MkKGJcFQsCOoBfwpoYxwzY5QPl43hPfeCPzDyJnaavrlXEi17Ta2CFyVrQH+5iiu1E3mJB4S50+/vwQ3pn1o04TLdBATuSCWrCE7+8LQUM0uupGy75ASQnc8uOu9p1Iw0neQAgOXSMUWoFT/yH6F3GNE3GF7ba235dRVJQVQCrMKBvZo9sV6WNsGtYdI/pp1h9HzuEI+XuGHFY/7bznDDBf8K4EWaVNlK4tZFYNCtcJSKLY0iMCYFUzHE2hvu/MVEYKnY/uFMGanjJZmrkmmwfoTrRRgr+jrr3D3lx3HHUIUo9Rv6h1iZzksaRfGiE3MYl3pLjaGNhSWtyPO4jbAw+SDPvBGcIVTle7UVmAptssT1wXdPoWuj/B6TVgFYVhY62StLXfg1oy8V5CU6M5GuZ6pOWcDf8uPA7bpVewNj9/zJiBFbiBuVZXDnoXKskXWKEYCKVzBdt7WUpo/QpURm/i3lDS58x81dl/03JYSpIMt4UOlISJygtSOQBwtCp5FmLuJ5G7Haafg53zK7tkUx727tcHkQF6fkP9sKmuyyP6Qrb/E1Hr7msfiGU3KvQAd/VmaHX6w</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>