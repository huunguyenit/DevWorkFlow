<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo sử dụng nguồn lực theo yêu cầu sản xuất" e="Material and Resource Consumtion by Work Order"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ma_lsx" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Yêu cầu sản xuất" e="Work Order Code"></header>
    </field>
    <field name="ten_lsx" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày chứng từ" e="VC. Date"></header>
    </field>
    <field name="ngay_bd" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_kt" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày kết thúc" e="Due Date"></header>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Số lượng yêu cầu" e="Order Quantity"></header>
    </field>
    <field name="sl_th" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Số lượng thực hiện" e="Run Quantity"></header>
    </field>
    <field name="tinh_trang" width="120" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Trạng thái" e="WO Status"/>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_sp"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx"/>
      <field name="ngay_ct"/>
      <field name="ngay_bd"/>
      <field name="ngay_kt"/>
      <field name="sl_yc"/>
      <field name="sl_th"/>
      <field name="tinh_trang"/>
      <field name="stt_rec"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDhBgAYL+RdNFvuL1xCL1hoPxCMByl52ka8luSEoa6ZtoSLztUTyUxNJejwXTcEb7/hzOamQ1TpVvcCdDlr4LCFeLLsJtDh+7dAQv/lvfkcipDf5+lbBV/HAdNP3uR4Ix1woK59uNlz5z1fAxweNJF88ToHHUh/pIz16YL6uaD6awYCOha1U/Ix2yMnFrMrEMEmd90J7YYgBTYZct3xw8VGP6esfriDheimIWwBbEg5/k8kMVjbzE+m4AmXKEq0+DOsflHWfAxMJAGLJ/Lhsc+2DH8yTCU/6e9y/Ty4gbx4FssLWHoiolJc1Zvtp5oJ5Ydo4dda33SvotvjE3JUzkYP2nZ09BWZLr3BpgiEjeCmQ+</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>