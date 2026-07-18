<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY ProcessLockedDate4Unit SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">

  
  <!ENTITY CommandCheckLockedDate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcLUTc4fOB4n+wxFXnnShSNN9aBlw0TThp7+qlmkAPE49AfcDmWBjRkTwoReD2su5YA==FastBusiness.Encryption.End&ProcessLockedDate4Unit;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4QjAQLRKLgk7mi8yeDMliYOMptiLWLBP5bd9pB3RdT3Jsuh6uYRMFfMqgpQSwkpFRCnUEBH3s1G2J7Lnw6USOSA7tkcaYWE1QLk+OKB3cUGgB5slDfU/ypPOA5A70sZM1iOUykm7w+tK92rs/vtHv3JFwspWgxd4Zo6cSPu15mOwjauF15990QlVNItM28Rz8pshFzKDpYGEuj/KjJcv4s1HQ0Bravvw15EGZK1KJSAGOVE1AvgD/8shL6VGLa1Gkuh1mzxoZFgu+huP8odqyfPaug4LxkbdDtdF1cmdD+7EJEzA1xy8QWVND0m/tHzbBwXmrv7+d7xuNmBK7AA8nraHVm/5ge3MX0LFZ3qMIOaSIj4ZKsPeGpCuyxJ6CxtfZz4Dt3hZ2Hjg2G9ocr6mz/Kba9m6SRMnq1ugVkc6BAIDJFY7y5TP7/NA7rodxHbGWATtJX6/GF8J9bERPYZfqXQHkTDWff0YaSXTMzGFqWzr1yyY3em8Ke5Yk4RZ3x/PHRfYlskiEsX6O4BaXB83kMLUG/SUC1J5V1Q8MfhSn47NJBpqku7JglaOE5LJKk+0kz/LFfT2+BPF1+ImNjoNFo5qGy4raqEE9NQ0g0ZQGEd9SDhohtvGZYfX11vJ43TUGA1cDREIVBwvnyeyAKTRyCtvFD2AFir2vxx/vZoVOzD8FastBusiness.Encryption.End">
  

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính chi phí phân bổ" e="Calculate Allocation Expense"></title>
  <fields>
    <field name="ky" type="Int32" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/Năm" e="Period/Year"/>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Int32" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dc">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="Lookup" controller="TS2Tran" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1)" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&hxQZi7YW/1Ceh+oe7YlshxhJ318cjq/XGA9xf8gRcwff39pTQ/1bIRaw01Vd5bzMuWj+TvgKJxkkIjhTuAX14dTdGUwPjrVdSVadxFw3yIzX6cgJ9S14hGpppBOou+xW</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_dc">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status = '1'"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc1">
      <header v="Nhóm 1" e="Group 1"></header>
      <footer v="Nhóm 1/2/3" e="Group 1/2/3"/>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'"/>
    </field>
    <field name="ten_nh_1%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc2">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'"/>
    </field>
    <field name="ten_nh_2%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc3">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'"/>
    </field>
    <field name="ten_nh_3%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1) and status = '1'" check="1=1"/>
    </field>

    <field name="tao_cl" type="Int32" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Điều chỉnh chênh lệch" e="Rounding Adjustment"></header>
      <footer v="0 - Không điều chỉnh, 1 - Điều chỉnh" e="0 - None, 1 - Adjustment"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0, 0"/>
      <item value="111: [ky].Description, [ky], [nam]"/>
      <item value="110000: [ma_dc].Label, [ma_dc]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [loai_dc].Label, [loai_dc], [ten_loai%l]"/>
      <item value="110011-111: [nh_dc1].Description, [nh_dc1], [nh_dc2], [nh_dc3], [ten_nh_1%l], [ten_nh_2%l], [ten_nh_3%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1110000: [tao_cl].Label, [tao_cl], [tao_cl].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YNS1Ot0XidDjCPmv97ZdVAu3qmrAgWssg+QeEUdX8N6Bju8er0qW3X3YopamDVHw1oplt5d38GtAN+WiU0UO3hA1BTvojhDgjcaFYY7iNVO5AP3zj7y1t+Qh57Coy17z1DS0+fsnDFCJKf8QetS+leOTzuFU4YT0jQ7k1bIYB1U</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xgjRNcVlicW/0GqjC+uzAs21DqZRSlebzU+dafAZigsncWXMR17+1bxdpzwFDZ3GYpwFsguGP+mwiAdBnD/71A10cxUlA4BTqKr0K4LiDuBvDvd++a7aedxu8rAD2MCkC/apGS5AK14mEiCFi9G8CQdZPfHdwyV806kieFwbFO1g4ns1YdORImoCunWCAALzLEzr5AtlhI0XAOCvIf9x+5iOn9mCbByHC0dYwUCEGAFarkoGfN9YSzfG8MAgLT/GOrFP01oD9o/cRcX6EzOXVu/VvEx+xCceYy5bCut/AogS8Uz1JR8DxSbHNx96kbWXC8E5TZY3/JgqwLREjnL+m5SHWvMbwBQwWGKe6Gg/SEcCSMwelG/N0AfioIUAJ+xIp3O2RNfEjF6iwD9jlLjRUErv8xcbmfEOjWQebRxzFdBrZhk907O3/RDSBACuAaGTg=</Encrypted>]]>
    </text>
  </script>

</dir>