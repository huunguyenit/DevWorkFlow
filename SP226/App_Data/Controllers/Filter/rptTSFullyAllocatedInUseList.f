<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 200, 130"/>
      <item value="11---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1110: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1110: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1110: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLRIcjjnZl5IAfSRZje65uJeCq/yuUo6R8ISNezqRSozDlQeoJ86O9VooONqctvSL4P9VObDI02XgK4bbQjs5Vz6XUxgkhGcopJ4oeRs49WPTxJQXqf1R4GuRIF2Uakv8Uq8eUSZjaRNjGkMP9odyi4IZzfJR1kDBzMlUurGOa/ZcyoqNBcOsixZbCILYcY2keSfC76WEnywqzTh3fhrQsXE</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTedUZbOyTyeiZhvKMLPUAKFchPfXiV7Gwu+unkrmxpmDegc7wY3UJrpwZy+tXraMubkWpo0Dw92Rc3a8bnLEJvisc+4vtbr/31aCfFgOVP1Qd0E4FGxpvY+lLRvgemuOp5st3fm3LDZ5o3E4zNZuzNHuTkc4h06daOExwx96CHC2Y+AwWF8Fn6SHlqN6rkQjK//5edUIiXaGdjiwvAdiN/iv3cw6Haktl364+eRLbRcURVqXpLfzWb0aUM9EC3RsVnwHzFEKz/knG9LRHEPss7NYTHcqU0PmUbICEVFu+ogQlfccHXEcFp8+LzSPVDMrYLv0xPmPBvw6ovrWKS0l108fYVkNx6m8jWMVMCbR95VLKyTVT0CTA+1MqvbYNn4wrBBL0+z9qJFlG8jOhhk32Hc</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>