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
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="###0" allowNulls="false" clientDefault="3">
      <header v="Số ngày cảnh báo" e="Days of Warning"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3">
      <header v="Nhóm khách 3" e="Customer Group 3"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
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
    <field name="nhom" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm theo hợp đồng" e="Group By Contract"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110: [so_ngay].Label, [so_ngay]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011-: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="11100: [nhom].Label, [nhom], [nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5JQZ37c3jIKkn61QbwXZmk4LkoVJjuiRUQ7/HT2+0rs5Ru3Qk2Ipo/TpBW6pcTo0tnuQV3bRpx9ZqtqJWJ4+6uiKnDDcUJLUwJ6bGFZiImfWoRCYJDbPWuuGWuEIlB8bZSPPHyqKYy/kWvE6QSAUWzLahbV36p14RlBQIUgE2CHWcCfATwVlR1jp218Wx/vM/SRlCGW66kmOR6NngEUvHpfk4a4QFHanxGmesegW8AWnzLn7uhvA+86Gwct5CnaytIaiYVtpgVqxH5CBol6PP6WSkjJIp/478ELkTLYjfkq+6quBKMjLQEhEDwSuKSG1WN4K+Wgvm10C8hsg48s7ntU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTedUZbOyTyeiZhvKMLPUAKFchPfXiV7Gwu+unkrmxpmDegc7wY3UJrpwZy+tXraMubkWpo0Dw92Rc3a8bnLEJvieCHjS9uzasyiMVqbdIBL5E5qJIPAsNSM5GVE3TjG6VHS6xR4V7aRNiAn3QmmlmjL+V6dfF1Of3W7r3F9O2kNT9EdTVoPiDsgZpa8DBeDO4f7LzyScqtIKXaC+82z2jwlb+Jhh7oitVekjQa2MvJW4DdBDY6UD5S5VXDPazxXGX9BHj+v6zak6yjX/VpQMeEEyH8WuqEqVgyNJ1p1ZwrG0SOwgoMudO6RhEDV0Qb0GfJjkdzWDkPWLqKGS656r83SXIDdyPH709EUMlxfxP6dRtGrKHpWk2OvkoPp36DG3ZTSc7Yqbf0ARzuZT785hChpeT6YjoQzZaLGoJoTMtHCo4GWulCnVQk2iHrGzmp09xoLoCWEe6OvGrMgF84vZhZlZSoNYIN4LgTjAiPIj1EvYgD62bzLz3jqbhOlOUQO190=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>