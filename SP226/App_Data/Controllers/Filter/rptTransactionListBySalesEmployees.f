<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_nvbh">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_ct" categoryIndex="1">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="1">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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
    <view id="Dir" height="257">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>

      <item value="11000: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM0sib1TVJ9TVaesQ88jLbCmQAHAV2PDZcT/vyyeEuL93SfpT+QcLi8DgseSNG6rMhWwVVDZFVVgOIqOeye8zaqz4RLW/BbL6+1oGKAZOtFyvTCo0vWETOYFueBXcPWR20yNTNNmoQcC7rHAUPa5dZDIu7dWppnwGa/sFYDibIcWYpnyppqIwTtyYfxXrYbhcgKKWOkPomyfMgaxR7GsbpSUiXNy5faTgdTKjvj3c0vYkJ9jfo/bEIZFSQrZ5EWfsjNAdqsieq3cMBSkCg0Iz+L2zZUhwT5HdiHR/GfvOmMdXIdFfRVR55aGrHRXHMuuQuJ18SnIDiqWzIx1Vqk+qmUo</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUA+H7iIC6o7eOD12QsQqSX0oiCvXzZyTHW+2RJDBjOv4vCtZS6fsuiVweivvtxVyK+tfUxsnvrI6ZMm/BJYlnWCHsgw3PwkQPf4H98vQI5GsyzrJza2snK1Y4nYg3XTXF65inFA0WfRiNkRbb4HwOhItF2EPwOKKE3plWdmOUjstYn8t3DRyUdrrZAGNIxAAqzsAAKJQWHfNqqPmGiE92TWp0O2Z6u2gCC0cFYatD+uSUOUAMfbWnjxK96mhA/NQxibqKeEF4c7ARuiyQaU4pAHh9I+GyPK7WDMiOsaJppIOx0j4mCwLQZNTXx+k56sE58L2eYb/tgGsAfx7mRjQGzGvARs/LOsk+v5nd8XHPfB0I3BBI/Iy5lHULVwSTIrYE/r8gldwsXt4Jox3zlusdQ0VHSMBDsYxXVzkwc/BZfvU7FUpktBOzO2Qss66otlGf</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>