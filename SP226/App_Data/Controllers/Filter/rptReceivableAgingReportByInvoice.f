<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Được tt đến ngày" e="Date to"></header>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tính hạn tt" e="Due Date"/>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="##0" allowNulls="false" clientDefault="30">
      <header v="Số ngày/kỳ" e="Days of Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn= 1)" check="kh_yn = 1 or nv_yn= 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="so_du" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Lớn hơn 0" e="1 - All, 0 - Greater than 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_hd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đơn đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
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
    <field name="nhom" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo hợp đồng" e="Group by Contract"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [date].Label, [date]"/>
      <item value="110: [date_to].Label, [date_to]"/>
      <item value="110: [so_ky].Label, [so_ky]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="11100: [so_du].Label, [so_du], [so_du].Description"/>
      <item value="11100: [in_hd].Label, [in_hd], [in_hd].Description"/>
      <item value="11100: [nhom].Label, [nhom], [nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKciAlXm38KMAUC31+KxsDDUP7oNPnGNGbEex1FzpQBU9XW6a9Yi6k4SM58iUMAuCS9Y2g5oa3U9Pjgps7E28ryKywZ4qjwTrLs96fKXMOob+SAuB6PmWrOufzpirBa/s1FgMuCPgsMp6jSzDR9Yu06jeU6PMGkb/pmwToZZqLI083l5OHOxnYNYDPOOArqY6RyvvdlACjP3/yj5xdIf4MU=</Encrypted>]]>&DynamicFieldFilterPara;
        &ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAsxodt4i3T1nCjZSColJpwBEgtq7UEJcvmmL650SOo5NiOUDWptAuiZ/xgRCxp6kaWN9kCwMaODxe6wq3LmUFf6Ww8DSz4LwyzSlAbzPdx6pz51sNGdDQFh6YCVutIM2yxq9oozV+/Y9GB5HsCT+L7SqXrYhTP3KbgSyJSYgrV9/IEEoXoGr85DvFLqvsU2QErWzaP6rUDJqlwKjxiAkWGzzY7lCkf8EIlMXbNJ9wSL7jt+K+mM80fMJwle5ySZaXsYZ/DMrwqZbN8KcDtH/TaxyB4LYtJF6qP0Mvi/TNcxGiM/Cw0a62Wxl4x/fFTbdyy4wm29nKvCMD/m19TLZPaUupbYGn0B4U0bJuI0s4AH2DGn+HZftyRgY287SrUvf41PJDRD7C/YoOkjrY461adp8mS6wJwl6QEyljkEAQv43l4WtH+C8oQyjdpQWCSPCN8D6oLjYjA1cgt4DRQFJqJWM1a7QWNCoUTUXNZjBhSwuj02+ZAs5nnrggbazMId5qDmLmxMxj0O5Wugayp5vWKBjwgFE+6TEGTJzJf6R9HI8moCc7vrWkWgLJNBRQTLCv3ejgiNlk2QkSbk6WwAnWnCgrb0S3gdp1U5cI/p4H43Zp5cgMRoqe66Sxe4mo+cHL+Zen9XQADj5h2lXr8ooneZOFTr6w9ELLrGzA4sRQyy3XqksmPPncrVWiMsAYPAiSdcCg3KnesujIV7AaZKIgoT3kJKFsrb6StCCSkP+iwHINwGpasCS/N6J6f1I1ysjIslAk7GdwM/LLPiZ2rdxMByCGAlGr/kNbSm3g6VLZw+oAZ/LaM7dGctDRYGXqdajczpIQ6olpoiogN73sPumHQWpf4NIbQtc8XZarIwhUp78</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>