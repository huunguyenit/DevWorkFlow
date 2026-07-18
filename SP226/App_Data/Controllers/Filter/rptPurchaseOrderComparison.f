<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPurchaseOrderComparison">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đặt hàng từ" e="PO Date from"></header>
      <footer v="Ngày đặt hàng từ/đến" e="PO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đặt hàng đến" e="PO Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng từ số" e="PO No. from"></header>
      <footer v="Đơn hàng từ/đến số" e="PO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng đến số" e="PO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_tu2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phát sinh nhập từ" e="Receiving Date from"></header>
      <footer v="Phát sinh nhập từ/đến" e="Receiving Date from/to"></footer>
    </field>
    <field name="ngay_den2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phát sinh nhập đến" e="Receiving Date to"></header>
    </field>
    <field name="vc_type" dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Loại đơn hàng" e="Purchase Order"></header>
      <footer v="1 - Đơn hàng mua trong nước, 2 - Đơn hàng nhập khẩu, * - Tất cả" e="1 - Domestic Purchase Order, 2 - Import Purchase Order, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="giam_tru_yn" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính giảm trừ" e="Calculate Deduction"/>
      <footer v="0 - Không, 1 - Có" e="0 - No, 1 - Yes"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho nhận" e="Receiving Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn giao hàng" e="Due Date"></header>
    </field>

    &POFilterStatusField;

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>

      <item value="1101: [ngay_tu2].Description, [ngay_tu2], [ngay_den2]"/>
      <item value="111000: [vc_type].Label, [vc_type], [vc_type].Description"/>
      <item value="111000: [giam_tru_yn].Label, [giam_tru_yn], [giam_tru_yn].Description"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110: [ngay_giao].Label, [ngay_giao]"/>
      <item value="11000: [status].Label, [status]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KeNrnqnuE6odzQAfMyMEWqWlJjKoFfE+oXDaDm7dxIkCAhKOL2GNMkazZpTB6PJl2dYBDErdXgeTa2IpMqnzKj7u/VmrxUvPioj/zVEpIDMz07/uYQ59X4IjcmSSnuhJat5ejSsMEftiWi9McUtW08W2riAlClvJtOvxSwyq19+qDqtjx0ku7bbX6Z9hX5LEqPQQJYDGzfBjPYbPS5T6Q7X0YggnLjA42dFWIHuNZeK2MKaZJz2dMJ3K38YAdBGPSXyri1cyigqBw5g7tNtYdGen9tY539HDyeH6yY11yDp2UaNRMBXQ0wRho4+wGsWIgvX+YrGEOmideRs9w2FtcBM02SuomcRNtO8rThc9IvSEDRqgnq0bvzG9Kj+OtXdh36pROsOqfAChS9Db+RcAvtnuh9f6UEtAWOMe2J9hAblbu3YLl/RJPG9C6reYXw4qQtFYkfTZD5NUtu6gGyRFVR77WTsJT0SAYT44/jcw9FAgHYST9sJ0MA0smVj1xJbNcb8L98NCef/qYGHRL/p1T37p5NtyYgrpnS1Wg33eqgfmJQCc+veupoEBb2wTsmI+oUqg5izpAsWi2DNhFA0IHaK7kMXnAgz50HAT4SmuwE/rQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm7BW7KOEZf7Q1irz7mZ+vlcc810mImkS5DutjZgQOMjxph/opUKJ+1nkoUruLJDbfSvpO5+xU/NFbSw+AqiUAPkcDYTvH+bYIfM7TbOmjFhiQSWCSI3odLHJtF7iqkdwwoh5HbS/G0WJZe3rFaqA5tX8xM0yBmcwfBOojZKkyOIiMyheF/I37fuf4F6epozqR8x/YVRE2mnfYUUaOCojO/2Kg+MW8wlhin7vNU3NhNaqhdVzAMpdT6hEN6SlWsDUN0a+vDxnPJSsqlCMBtMwNT5jVMSWwa0/GDc2oE2i+zhcPFgKAMeCVDu5CSfN2gkFqstoh+mYJcDdKmRatheY0sC099mcvM+g9dXPM6No8nvA9KSSa8pn4T039Mr3Ent1nJMOalK4nrDbpzw5k4azvoLRt8xBDoQVjxFja40c3mUH644paiXOiNMeUQRaWc8wuvjpZo8UCD8xhZx5UoVTrGpRTiBojd3reNJ2nW6a+Owvpun1hsdD3UgVVLOvmXpkMBCBN9oDxgsX4++hIbOCfqZe1Kbl4Qk1cgDZqsjlMks3al0a/A/iEsADz1DOF9eZi67jYRmqGhWx8W8g3MKMbL84M/zxT2VFMsCEOsrDG2wVxu/finK6mjkyiMcMUlumSYIWfkHY44jA87WH8BpLU2DmpV5b+Dxsbv033cYMIDYQA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>