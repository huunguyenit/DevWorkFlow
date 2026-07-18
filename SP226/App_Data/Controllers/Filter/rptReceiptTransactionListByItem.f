<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptReceiptTransactionListByItem">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
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
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_ncc" allowNulls ="false" aliasName ="defaultAPCustomer">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_ncc%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Inventory Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key ="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa - vt" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="150" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="reportType" dataFormatString="1, 2, 3" clientDefault="1" align="right" categoryIndex="2">
      <header v="Loại báo cáo" e="Report Type"/>
      <footer v="1 - Mẫu thường, 2 - Mẫu nhập mua, 3 - Mẫu nhập khẩu" e="1 - Common, 2 - Purchase, 3 - Import"/>
      <items style="Mask"/>
    </field>
    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Mã nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210" anchor="5">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="111000: [reportType].Label, [reportType], [reportType].Description"/>
      <item value="11000-: [ma_gd].Label, [ma_gd]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 20, 80, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
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
    &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3yXYiTxTS2VMSHYV3xkiIQN7bh9kQ0X1z/X3+bWX60rycGiM9q8XxKCWRf3tgMq5OQ8vSCm7CRUH6IMw/MJtIDulCHUkRN3UuDjQ5IYcjJTrZxxk9JgXb6UU5XuhiutiGFN8Ltmv9fDSVkozIIr0i5C+BrZJ8ZoAwPqVRC6900IIYliQoBVPKrqViMPafloa86NwWULukqmYBRJLZBVBrrvfpVDHNVRUb8XaBDCXZY+ocToxNrB9WtVKpBAq0UhjvbXi2lPKkniB0jCCsQsfI0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7ztMKKTBY8RB2cJirOjsyK8V5qW9sELcNvTXogbUpSL0WPynGkFlHkvoeoq/xEYrs8Nokr1Cytyvl85adYuvr2dCYOoG8g+cOaaAWjO3g09PYQNfAF9JWtTWC4M8ZIBzUcmrmV8C04Sstw4DAnXo9zuZiaDYvVCe2WjLCSASjYnD75QI/6YFX/L37ZR+3Io2YIB6M7xgMRB+DhzWfyXz7tjszTA970Eq3Dp3l4toDmbyFr7yqc3dMje1zOsENXQUP4mcRtbuqQPrv+X4Tp5FE+jCqsB0Y6leAY0xk3OBfZsUmWO4b61l9hrxF8n2tbmumTD21JcL2YorD2fYRKYZBXo=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2JymKk1gnT4v9+i4qK9wdz+AhEyqvpkGkNXHZVlktOsDEDFOxOCPmqzdaB/bR43MOgGAMqqdK1njC76CmZCRQfQ==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bVckqCWpLCEWLXKpgOqo8rE2ovsRhv2+DTXczHqE1awYggfK0Rc7WBIoG7koXM1fuTXpMeMWdloPct6Egn0xx/QxxQDDvtTJbBdiRW4YjdqisugRtY9MA8qYdc+DD4dHxjYdpGGzo8hUk4MmlZfF5U3ZTsU7V0bKTCq3jNOYmFJSdBah+Oe31YfysS1IpKjCAgmXGq/5feBhDqzst7bGcbbRnRFBkUGPpLSNQ7c30hNHuc5PrzOJL9GbfkiqodSTlbSRt1UkDBxOqm697hpNZCJZYaPWn4wCeAWVRDv8BVCTaFC9NSz1DXmzj2ZQR05QnalfV1/s6uGwHi1dtm9FZffw4L5gwEOxGMk1Bp+5zbqJIMvnoByIzBCEsPe1o6X16RIv0WOa+v+OsOcA7slYFtsxn08a5r7mO/TUuJLZ6045+GiPAOGGGbjpr5dUVIDtfIbyiadZyI2xjq7u+w4KlMuf28fUYEl+Xs3XlnioYHa7w7ZNktibUwFyi4BQF3t5qO2VJaMmGqnRMRfzyn/f+cHlySmmLQHrL5BK1zzF0YOjzWVQRmoM8NzrDw3iraviSCUIcae8C91spJZhTei6eGW8X6idBElW8con+aox/dn+exndp5RlHxTR1K0mcgpsSv/5w29iBVylZguzvnBSjjdn9glZF9YzgpnyVEXiFirzU406EMvvCKDGCz5q1lVMxTAShPUoQ4UVtJDxqwJeqSSlv51KMprH+F2VoP7KWeUtMS3Z2805ps/9yP55CZ/gjio6sR5LXvzojXNez4Qm7BxyMhCpkz5Ea377MEk5HilOVGSrOzOuJlPa+UNWUBZQdLJ0tCWJa7GzZvpJJUPESJtZ/PZaxoCnE9qCuUYogfA6/LzoAxaSNWTa7bwHVjEV34o8gJJ8XX+mMQ0jM/ZBajeI2upS+wFTMiuJlmV1CQELMtiApS7UEch8s9ARbrFYM6yd6suxuo+5zpv1MUwcX97jEyJf0QvqBfuBc5lEA5QGc5u8ggMHc1Lx8dT9qwUhDdl2Q7UN82alnY+L8Y4Sdu5J4zUx+d5oVJ35Ouv3Po+tRAYQyQo7c41UqzeMbUgSVGlHvwEuzdkOW/fTO1It/P6z5FUJh/ycMbZob52kmYgzO89/dmH+av9LSYvU/lXLKztTPIEmMXaro4mvs59IfhAJa1KZiKiLcBl2shpgFFS4DkxBIl9P+KgH/RfdPFCMAP8EJBihEh499G8jYNgdysuZE0hfkjsnJO7thi3r7jUgCi2703/TjtMH+U3VTPev5WnEGzN2sUHy5/bp4vt8eRG0IRxd+GapAra1DFZrmySiLvXZNguDc4uSZFQBS2zHU9LxHyeQAJuK0jTk9iGfRY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OthR9eO67QSqiPINLsmM4GGNA6sorxaaKyZ4w0VkzRrZX7UAelYPqP/Xrtul3dH6T8O1orGpszlf+fg8Nte8PFjDv2l/XNovgUncy3R+5rt0=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>