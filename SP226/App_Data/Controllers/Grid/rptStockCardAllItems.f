<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thẻ kho/Sổ chi tiết lên cho nhiều vật tư" e="Stock Card for Items"></title>
  <subTitle v="Kho: %s1 - %s2, từ ngày %d1 đến ngày %d2..." e="Site: %s1 - %s2, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>

    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_inso1t', Controller: 'rptStockCardAllItems', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ton_dau" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn đầu" e="Opening Q'ty"></header>
    </field>
    <field name="du_dau_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư đầu nt" e="FC Opening Amount"></header>
    </field>
    <field name="du_dau" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư đầu" e="Opening Amount"></header>
    </field>

    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl nhập" e="Receive Q'ty"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>
    <field name="tien_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>

    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl xuất" e="Issue Q'ty"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất nt" e="FC Issue Amount"></header>
    </field>
    <field name="tien_xuat" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất" e="Issue Amount"></header>
    </field>

    <field name="ton_cuoi" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn cuối" e="Closing Q'ty"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư cuối nt" e="FC Closing Amount"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư cuối" e="Closing Amount"></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ton_dau"/>
      <field name="du_dau_nt"/>
      <field name="du_dau"/>

      <field name="sl_nhap"/>
      <field name="tien_nt_n"/>
      <field name="tien_nhap"/>

      <field name="sl_xuat"/>
      <field name="tien_nt_x"/>
      <field name="tien_xuat"/>

      <field name="ton_cuoi"/>
      <field name="du_cuoi_nt"/>
      <field name="du_cuoi"/>

      <field name="sysprint"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFediiV1f7we7zXVySD7VYofePQokWSethRAf38MlgREipn4605eBMJImgjVcX0PABHFBqrn2mkVisrY5AHdjX3tW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDiWD87dIHYgu8DqEzS5+jBAcViT5896K+xoqNOelQwdMgri/Ug7BLDe4O2NHK4HRurX+VShsHu0X18pO3lNG/tfHMRJQ4jaKUSGgmMAf1dSQu+mwS2SjnXb7pKDZGFQNidNUBgDKR7LAOBqk/AD/A2SldoUpuKO23dghbq8XgE4fxHA+AlGN9RHKNDICgNcerHZI1dcCApmm7nqxyU7TSVANH41/Vb6n12xYxx/j+B2pWbyp+TcNL3BVvxt7AR19nVN3jVQyeoPw950RBVx3PfVsS29Hs48SwYZTv9I73xgILZDKj7YDeyHOB88/y+rPjJ3ooUO+HqeCgVKz9V5kgi3qbzbkFdmXB1Y1Apr6bP0CWdLZCCQHaw7cJ41BCj+bzA==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>