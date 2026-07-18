<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "rptServiceReturnToSupplierList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>

    <field name="ma_ncc" categoryIndex ="1">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_ncc%l" key="(status = '1') and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" external="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex ="1">
      <header v="Mã vụ việc" e="Job Code"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex ="1">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex ="1">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex ="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex ="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex ="1">
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

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161" anchor="5">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1101--1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100-: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
      <item value="110100-: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100-: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5z4AF82WhCObXBQg2qgeIKPAa/QYlDVE8+qH1hyJUuz2Orh/ORz++U09gCTfeAkCjlhUgBGY2M7cawT0HKw3mTkGyMzTRf2u5TlliL7abNDl1XhHxiQKrRUQldqadgU4bpZneS5Xt8nvF6tP6ZqB/9bMqkLrf3A1U2+7ERqAXgyOyBy6IPKCgclyLp2S88Sq2XdeJu0pr8qzzFyLAD8FcYSw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
        &ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwDX/nfPe4a9RK36vcKOpg+zPFTI/GYhfWeTjvyUae6HBj/B97VZMCVvpL8KoO/EY+jwI4R8DKQnkmSpq1RFwOZhwHrARpxE0ps928UcotXwXI+ahVBqyLrBJQep+hIouiCn0xQgYLQx7Ha5oSQVemDbIBBMwlf7L74uj90AgJE/hn7khxtrRmcFhXrSdphJRj71CcHzMIXUCfieK3rqR7ixJRmsbuID06k0npNVe6MkBbg+BlcX1tHYgYQM40b81mz/7L5f/kOWo0MG5EkYEM5wmfxDxDxFyTUI5FOu1JLEefNGgmGQp1gzU9yNRKITEuIZY0fBdf+d97ppuHnQxy9oJwmiX/Di/DTxV4ZXo50bKXZAQe8PhuL49Wy8P7lJpcdtB0UDiVYnjeYXKRCR8ermI0p3YCddKU+Jp3rNCFS5uMKGwzW4FYYevVsRi1Vf6fL1I12dvsG2RYX2iMPNKpf16ylnudYTstMPRrxmYWADdal4h/ziHoxjt2Qt9KTWKrerKGOwEwzRMz4mIyl66g1VIxxwL1OJ6HgkziUrc4BI2qBU5vhBW+xprBsJgw3SH5SyKWYT3WYwfMINmkgUtXQZH8Og3OUjeLOTkKWw11QnEr/7Y1dfZiYtcNUGQM3yIt0=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>