<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPurchaseOrderList">
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
    <field name="vc_type" dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Loại đơn hàng" e="Purchase Order"></header>
      <footer v="1 - Đơn hàng mua trong nước, 2 - Đơn hàng nhập khẩu, * - Tất cả" e="1 - Domestic Purchase Order, 2 - Import Purchase Order, * - All"></footer>
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
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
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
      <item value="111000: [vc_type].Label, [vc_type], [vc_type].Description"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KdS+XzUGFOaU4CoSrl+7+/94j06FCUTM/ZFJuRNmxNeX+J4AwAtPDxgkoqq3lK/jkjvHePggiFdAvjxBli7Rd2i4YO3Z5kFppsj2WUPQrvEw3ZxFDXS1MSwgPiblr55prkNO9fCmFEUysEM1oqKP4OW4rBONmdUKceYWv+CZawI1RJ8b3O48LWBN7qMy5d3IlXBKE8r6gSAgVLdhwQQC9xst97WhMdR0ed4/ngJvanDOVmZpo837mnqT+3Nhf11MGc4nBqGD38HkIhmuOu/0BqJvFhcFfBl5q/C/S0C3GsSoL/9TK+jUCmlSIk+n3nQGF/E8YbVvl9Vvbm9pqaxQoE84ndFFiErcigEOqZC59dZPMgTxbMUrBDczecD8eLCZ8d8HVr2tvqkrl1fnBlRzHFjLuLhtpzwKSrxXtMwg0hpz4bA1evk/FANCwtcfyYNanY4af5YAkdJyfVjhH+OFbFbakB2xLL/vRzCY5XOCPANOKfd7QMBPmZMsOYfE3kGBYrZHGBRrrls7dQgam2BCtopCWGznumRlPZzkAVDwsREbJSXs/v8AuFs6tfGSA8glHc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm7BW7KOEZf7Q1irz7mZ+vlcidc83inaxq9ZPNVkVNf4c55Q8YkjoNYltwl1qkRdgtDm7a5Y7XlPHruld2nxKQJUN86AT8Kl/AYWbU4pNDoWLLo5n66Oc31tVYrhpEsKuV849AmKBaRUOh2B3RPrOG6oVMDp9/EMz4Zq6E0Y1u9FNzqLhpsCOzu+KrvqZRsoaBiJNSiWfbGrCmYMlsVevkppjnYCSdtqqrN009lcWSz5Dh9PT7nu5Fdkj4kgx6PCc6CYZ4kWmCW1DhtrkH3XE3wH0oAt/W66E5F8rQPM6SshmEYXjiQRphgUXaoH7OP1SnhuypaLDNZaD+42/ajJG0iy02LGBhAds8RajFMvTJcdhf9e89l38tgbzB4bjwPH3tJiledHAOWiaQ9cXVr2q6mRgPFftdUaeRZx0y1fscy/dlH/1djyfo8zNQRWV5iDdpuIFk6yJ+LTtkGesGz9pSly5OFuSoDMk4ii73zZMWKuVdyLG9M9Nz0NVth1ka22vgEbKp38HVMgLQVDGWpFwrBNhJpfQufjHaXYJm5ojDT0zs8O5dubTseyHRG2k+zHUx/rAbkrzCP1/mvg+1NSGAUnHfowSDI5wXbgAaOt2nrQUlg4kmBVOUfel2ztU7nbjoWqFED5VcaLX031mQYrdyEmC+JpLUeKE6UnSuBUpNhwOX/CaqjrFI96rrtNR5X0MmI=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>