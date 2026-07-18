<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"/>
      <items style="Mask"></items>
    </field>
    <field name="tk_du">
      <header v="Ds tài khoản đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_gt">
      <header v="Ds tk không tính gt" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="vu_viec_me" onDemand="true">
      <header v="Vụ việc mẹ" e="Parent Job Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv_me%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1">
      <header v="Nhóm vụ việc" e="Job Group"></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="nhom_vv2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="nhom_vv3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" key="status ='1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải chứa" e="Description like"></header>
    </field>
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
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [tk].Label, [tk]"/>
      <item value="1110: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000: [tk_du].Label, [tk_du]"/>
      <item value="11000: [tk_gt].Label, [tk_gt]"/>
      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="11011: [nhom_vv1].Label, [nhom_vv1], [nhom_vv2] , [nhom_vv3]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQww3q08fuNcQISGpOyZtsSMKDcKgp7IRIaCNHaIcb0mnkP/IouaUprq+IEcH62VxMSt7VD8MNztexwn//rJy/da/hxvQeRpBx5BjRBXsIv8h7ZxrBWHsp8fp9c/Dpr6Qv7nJwQ/sasl2bXhbvcmnKt/ue0jdcKgBftu2VqGiat+58V5TXOC/2ZtyW56Y/pByy+HcIwOWrYA9nMZKZ55TFrMecQZe6fyzD27PIGpmXis87nIUoJx2mtSL6MR9GC9RlPbKapTVYcCCxz4+bHWwFn</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUily8JButIE5hwjDlU5Ug321HOPravw+LpdOrqgXYUZs020eQZJj9nyuVwxrl5VO7gtRs9qC2X23fYZ9IR1PSffubLYiFlZ1WH0vUGTy+n8cdYhQXG3O5ZNvuPzoycp7LL9fgAMWiZe0baZlXFSQ4K/lGt0ihj4m+mBy/Ohc2gYrZm8KuyGGmprrTJLy9K7nKKDpJMyGgjq0zPe/F1YxUmXn/wg4abNssHvGELUa+4nmhb8JrsgHlirU+/hvOfo9cs5Osbu+pfg6/c2GQSeZHrLsBxhhaSJ1Ap3U+lq6BBO016SMpvApd47smFpPjaonYSi/JbIHZZT9uS3pBmy/J8lguDkWuQuAD+RlXEbuqmd6Yh4hVu5cUOV4ZJBD/9wUnRw8SL7pAB4iY92znt74u+iA2dMKK1qzAisYt1KFSjxIFPa+7cl3Q3ar/emA8dEl67NshvYzKwaRlCVesF1WGE4MKZqRArMhTnYmkKQ2W0GEhNs8A+lzdvQd3tA/0iEjpmAoCo1A99lvZs8skJ0sOHIs+nzT/3nbXXfFUvz2HW4w=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>