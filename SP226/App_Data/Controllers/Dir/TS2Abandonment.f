<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ToolSupplyTable "tpbdc">
  <!ENTITY ToolSupplyField "stt_rec">
  <!ENTITY ValueDate "@ngay_ct">
  <!ENTITY FieldDate "ngay_ct">
  <!ENTITY FieldFocus "ngay_ct">
  <!ENTITY ExternalKey "">

  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeEdit SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeEdit.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeDelete SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeDelete.txt">

  <!ENTITY CommandToolSupplyLockedBeforeEdit SYSTEM "..\Include\Command\ToolSupplyLockedBeforeEdit.txt">
  <!ENTITY CommandToolSupplyLockedBeforeDelete SYSTEM "..\Include\Command\ToolSupplyLockedBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ToolSupplyLockedDate.txt">

  <!ENTITY CheckData "
exec rs_CheckTSEndingQty @ngay_ct, @ma_dc, @ma_bp_dc, @so_luong, @$xvalue output
if @$xvalue = 1 begin
  select 'so_luong' as field, @$invalidQuantity as message
  return
end
">
]>

<dir table="tpbdc" id="CC4" type="Voucher" code="ngay_ct, ma_dc" order="ngay_ct, so_ct, ma_dc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo thôi phân bổ" e="Tool &amp; Supply Abandonment"></title>
  <partition table="tpbdc" prime="tpbdc" inquiry="tpbdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_dc" allowNulls="false">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1)" information="ma_dc$dmccdc.ten_dc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRFaIWNmPVZq/DEVydeZoHzPzNiiX08vs1daHNwnJm6JkLsl45Ek91QZ3DVsI0wivQ==</encrypted>]]></clientScript>
    </field>

    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp_dc" allowNulls="false">
      <header v="Bộ phận sử dụng" e="Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="(exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')) and status = '1'" check="exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left">
      <header v="Thôi phân bổ từ ngày" e="Abandonment Date from"></header>
      <footer v="Ngày thôi phân bổ" e="Abandonment Date"></footer>
    </field>
    <field name="ngay_hl_den" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left">
      <header v="Thôi phân bổ đến ngày" e="Abandonment Date to"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="false">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="110101: [ma_dc].Label, [ma_dc], [ten_dc%l], [ma_dvcs]"/>
      <item value="110101: [ma_bp_dc].Label, [ma_bp_dc], [ten_bp%l], [stt_rec]"/>
      <item value="1101: [ngay_hl_tu].Description, [ngay_hl_tu], [ngay_hl_den]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="110001: [dien_giai].Label, [dien_giai], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOHRVT9ADLWXiO4hRv/+S+fKJqAQX0IDumV2Xe3LXbo/lgakmmvQZber9gRxIMxRFf</encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOHRVT9ADLWXiO4hRv/+S+fKJqAQX0IDumV2Xe3LXbo/lgakmmvQZber9gRxIMxRFf</encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf45jcBGp/NRA96x39HqskOnvX8ISC3DMFYjhaJaZwwYsIqtdlhab9zm3GwPBnEKS3ODBAYumc6bh9TIsdFO07cs=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLxbcvroOZ3eWZ6aYQgWVBNOBGjLJNkYhqihYE22ouaJFcviRrvByXPXibznNrGS7/u2CMfdtTRc8Q1N5S46vGwNnndgQx5+kwEHxhu+qtRA6w==</encrypted>]]>&ToolSupplyTable;<![CDATA[<encrypted>%J3hZcNH+5AoPDSecUXSscK/FxNqu+FSg1z2aFHBvaur5svcnLPZ5rJCvPXOIAKhYZr6wq5gSLe3WQZ23Ud0F+w==</encrypted>]]>&ToolSupplyField;<![CDATA[<encrypted>%AyKM0JsLz2siGub+f8OUFm7AB7gPnWXWd8LCdQY6A+Y=</encrypted>]]>&ToolSupplyField;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5RhxtFmY+xJYnZQ1t8vVgqDaNKqfayZvHQ0CPKY7KFi</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregwrc1c7tGra/SDuOIpE6H2KK5r45i18+q/08pCc+4JS/NyAPkS3BrRXKffZiJlGVRKs+wNrIxvzSRHTCD1xMqgDPt7a4adXO/5Nc0UOU36TvN/TYY3W/yx4NfeBXIov7s4PSj8pOgcOqDFBo3NTPAUsYFD89Er44EH4gVbrLRVEJAyhDndNY9cgOYNDI9rP2RgNrByCnQ6bvtVYT6qB298/FJIaiYznZpoHS86vQDZeAuW7phGHV8tnZ0WHty7NDcln4YRNGnPUnwKrxqV7xbNdACTck06GuXUvK1694X0BpqKgO5WQ+Fv2rhbPb4ZIfHKOTbq2gouft55v54rdBAafemV4zsDBPSHxHWFR2L/xq6VDmDnsVcBORNrQU911lruNhBbmq0f5Umb2HSUZYJZxOU0rjTWVPlvNZtSbVX2RU4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF9dXGe/sf1r7GO+2W9zslGgv5K/xHj43jArdlMwmpw7Sa+9dahLcQptqk+vzIR0bhpRfP0ffH+Unt33P+6GqIfw1dX0nc78SuUvbLMNLEBUU=</encrypted>]]>
        &CommandCheckLockedDate;
        &CheckData;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5znaRgTZe3bl7siNb/t/T2FB1rL+criLZyp/28sEGV47ni0ozcFm95G/oPL18tRT5iSAfWQih0JTkZIt3OAYsXRPOgGnVUiiq/G4KsJemcIX596UQRRh+njsQhKZm94A/M1ajefW8jV8ybrYTgiyPU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/j7JvfGk/5wDyNsftuikB+fMlntUCCCS3Cw7o2nvwtkv9hOHJXaaBzcS4IWu1gP3Q==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        &CheckData;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7Al2/OISrmNUtDAn9JGfif6pBhhZyx9Mb80uoPEhD5ygZHO0yDFNZ4S/zz13BjJU+uzke0tjIKCz2iHP3h9FUZTi8JDRGzqNVucy0VqWF1V9AXBn4BUw+NYBNsWU8B3Uy4npq59pYrBLeGRv16rtUdmqrJbxjzqRtBBqmwyC8zR/zETRZBXy+ycnd84NJ1uvHy</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiialzaul5bqSp1t89ZZe4MJXPWAhyeamXlhGHMJurpg</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VjC9fcT0//RLaXg2kg5GRF2PhHxRbrQwP+b65XmSEh5tPqFkr9Xlqs8ERBtuVzXuifeo7qFxwKgHLNKP//JtY1A4VWF9GzICrLNDjfTu9Rk</encrypted>]]>
        &CommandToolSupplyLockedBeforeDelete;
        &CommandWhenToolSupplyExternalBeforeDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Hw5Uh6FT8yCXTOZBPt0DaMgiOH4aI6MTsyDmlrruZjSkDENJMUvG01xK7EqYDDy/9LEvt34KM0CsDB0eQssVwEX27ER25J9bdtZs1ybOJmfgFJyMTz4AVY/hPwRAS+x3FbcFyNPCNbXP6vklzkYqlCFi5UKxigk3/2gJEhXp+GD4tuSSsAlZU5FhaXs9s+Molpog4IemWFOImRgmIfnmnwNN8e4en64qP4/BuIc28aIuAx2kjb1xKRgzrpb13qHjEgToYXv9yNYSDMz2usNy0yIU0C474mdHiO4ihg2sx2PiVm9H4ATqx1Iw3i7KApT1w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HClhESvJDznWRj6gc9EeM2rMahz9GE1zYcz7B/XoUY9h9Q9USBIo0pdDLWgqasi1x5mf8zYz4LMjwtH2hpcQoYSCvtTb8HTbC6aSD9DhsNXr4XmsLb0MNpN7cXRT1WlhR948VFBn72XSEYDHiB17KxDySFVqQaB5RM/IKSyKhnE6JomBQ1I8XTTaiOwh59s7GTvNYmOA/h6Wyj7yogW5ASS/1g6UkNzWL7sLMN8PnvzUusNSkNp8RaWblUV7RA860kGG/X5G5hz12Nvq7Tf56j/LAmnu1RtCbxsA5lQ31h+y9QPfIqJBsu51vxJXbmfL3Mc3fqFVXdvw6MutSsK6TZhVSEInlwtMgVYnar28wxSJNmGtfoGTvXhbgI3SQo0lFFcGCV385NYftIoTaBSDFEycMzqmMw3284x41FaQSbiHqHZyY4/hB3hkcNz0elURUJTlAOrDWaLLGIrJK/LZUGrMkKZgLQf0m1ODdttxXGqTR9S8gNgdjxbp78cyhENySCMPa/mCJNih6tqgvPIjOU=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TSCode">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7fQI9F8EM4Mde57mtBgNXwq3nMp5cSzMhMQcnKsW1W6BIpYUPen6kI/s7/EJb1gmwJIdPD7sc9x9OLhSFW6bmOE7f/3upjZivp8Wv1lXfQhA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>