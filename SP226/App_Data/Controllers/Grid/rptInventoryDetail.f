<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\SessionInit.txt">

  <!ENTITY k "ma_kho">
  <!ENTITY f "">
  <!ENTITY v "">
  <!ENTITY e "">
  <!ENTITY Url "~/Main/rpt_inso1.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "">
  <!ENTITY Fields "">
  <!ENTITY Seprate "3">

  <!ENTITY Parameter "">
  <!ENTITY Session "">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết tồn kho vật tư" e="Inventory Detail"></title>
  <subTitle v="Loại báo cáo: %t, vật tư: %s%u, ngày: %d..." e="Report Type: %t, Item: %s%u, Date: %d..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
      <footer v="Mã ncc" e="Supplier ID"/>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
      <footer v="Tên nhà cung cấp" e="Supplier Name"/>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="Script:">
      <header v="Mã kho" e="Site"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe9/yg7GiBHLAPDwcX7hGN7PibRCJLp8wsaL6qJZ0Mkml96iSM4hhVrVkpSC43Rgrw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kho" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Site Name"></header>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Hạn giao" e="Delivery Date"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn" e="Stock"></header>
      <footer v="Số lượng" e="Quantity"/>
    </field>
    <field name="sl_dat" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl đặt" e="Q'ty Ordered"></header>
    </field>
    <field name="sl_nx" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng xuất" e="Issued Quantity"></header>
      <footer v="Số lượng nhập" e="Receipt Quantity"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng hóa đơn" e="Invoice Quantity"></header>
    </field>
    <field name="sl_cl" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl còn lại" e="Qty. Remaining"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="sl_qd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl quy đổi" e="Conversion Qty."></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="ma_kho"/>
      <field name="ten_kho"/>
      <field name="ngay_giao"/>

      <field name="so_luong"/>
      <field name="sl_dat"/>
      <field name="sl_nx"/>
      <field name="sl_hd"/>
      <field name="sl_cl"/>
      <field name="dvt"/>
      <field name="sl_qd"/>
      <field name="ma_ct"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP03PMdXgyuJwwTPia4zeDtbQiI8C3Op3LSVs8rghzXrnekTiDo+aBQ0NUFLrqPEuuL939akeK41i/jKSaDz5tBD8o6UOepwgy3JiPrHz3dSehKq8iWO/pRt20ZROOmHeaOoppGb7omq00GkfiZHfJrdjzz34ybWhi7MMYfEml+/uolzK99o1aF3PfTdUMbzztyfk/BNSd6ODzL5rSXMZKKA08yehCA/aeP92J4JDuf+Rar7mZa4C4UNPnYM53BIuqZvElbVvz7YUpxIFG1/FXdZBJgsAQZm56FU9FJVPT8Y0N9yLIMcsc4difdXZ+8Bnc5s4EmU+mEoctxkuOAsY2OPIXNjJixzPgyXvYLXRgiLPazrScbsJYsyyi6ddDVKGHtclOnyq8hHsAKqfSJjTZfLnZCcZSv0X14xi4YM+V/CCZeirhp7Co2L3IFNCiqiFaTm/PiZxbHqRB2CNN3TPMvyYQz1ni1z67UmUo4AE1cZBgWAjgRlBLvBiY4u9u3yD1UrfmWa6lgtX/2LeddxAtkGXJw6QkB4j10IebOLGztk0ad3fQ48hd15cOItVtEPTwBClFSpyZLbGDpjVFwdaSTusWntreAVHze5KhgTYD40DYX1jM8nJZSX4wI+NjaftVx9QX/j9+dpzfVM2ekmdpDqkNzEvjomJrCXkDrXMdk4rG3KrYsze8YDsrgEoXryxT9dOZEx9TczO8L7PIZnaY00/R7rPU+y/O2BHIxuuGMdL/U2rppy5kkm9x6M2ido+GW+T/+wpm+k8NzUL/LKvmKbTX2hSdgjdjsjvdSo01SkcWxVh1APoltNpsFb+yNbJn1</Encrypted>]]>&Url;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162yaV0ymCL5CFU7BHL5d7lrHR96mWBLKwPHWV3dd+w5bvJtSyMD+AxFzgE+b+esZUc=</Encrypted>]]>&Parameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b6NLcXTQ2DGzyerl2XM/ZsCummkIlbYBQFE8ypYiSRasBxFPDC5MmzY2DDg2dDlrY+lo6AXlgzSVNJQ2MXVzVudNUnx3xer410JShP2hpBt</Encrypted>]]>&k;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egWSNpkAR+ayQE+MG5S7pKHzjumUNHuEOuPCqnR01OxKacLCmmEq4WR6uduj527FObwmPk6q5T4yP2RSyLuqGDRV2IjI26EQhrsH1HeZTTrlX5XcCBOQ1DWEiuh4gl7iKIydhRMkljl+UHl0s+YjXDKXcZcZEIIFAiMT3Ks43rV7ddp1FKqV+0eJnGtv8Z9zXBMgvuLgyB3waLYybCLH7rO5SQy805JEUgANJh1G0bXp9THpJEObSoVlB3RN+W8v2ikT83UWXEp9cBmiRn3A+QO86NN7ei0TFvDPPTt/CQfjqkzdf+ECtCeUIyzVSN8+RvFBfw/y4wYkuSempDgK+/G0dzxTbyiuwToGFTctMg5h1P+e9UW1YtfmL1HUwap2WGPaxl7waiuwXbomj1EWJl9/VLyM5i5TKcGdhazCpPAA2p2yaCHHTgZLZrLpNcPyV39Uz25RPdUQdDPZ9lwEr91g=</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOh9fSlrltstSa6fnkSQIJ3fimIcQmLwHDv58adSPt4jZw==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>