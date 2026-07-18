<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">

  <!ENTITY Identity "rptOutputVATList">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" dataFormatString="@upperCaseFormat">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" clientDefault="333, 133">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and tk_cn &lt;&gt; 0 and status = '1'" check="loai_tk = 1 and tk_cn &lt;&gt; 0"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="phan_loai" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nhóm theo ký hiệu, số ctừ, thuế suất, 0 - Không" e="1 - Group by Series Number, Voucher Number, Tax Code, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10"  >
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
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="110100: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="11000: [tk_thue].Label, [tk_thue]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1110000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>

      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XC7q3/4/UmmtZWkeKS7hP7hp9dtVKP2i41C9h19f+E6v3uHYLtMy+ijUomMg6okHM1i+08CZTUFTJVSyFroAaP9b2xqxPkHLa5V7d1kCVQ0+KGy/MCD3VnXUEdrAqjwRQuNnRRGnnqXcGYpVQm+6g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7/lSPqjVqIWp5s8GnDto7afarrr25TOqH7WFTO4MWet4yZiNAS6Vs2KahMPzLKzjkOasPoUyqLHqhiX3KCRGamg57YNFEV20MdmXcYJXzkkJOu4dZsrbClj876aAcNz8V8eQt6wP34ZLesqB0mJGQK87j/MzRiF4omftM9ce8Rl/5YUthkk/fVmSD3zK1Fs7glmrQcLHs9DPUqzHPKUJ5JkoyR+vxf0WesefG2tF4XCCmKyt/XOb1j1MXxuK8CYOnH3y9ILEdKL2kKkkMumtZLorFGs/1sSHDeuIsbRqyikR</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU4Dbeg8rqsRhDjOx9PjE5aJbFtOF7PU5lQ0pXqYZPqFaKWxHxjYF8aStuxUfE8wSqxZlK5Lp0voHrkauqHQ62kt2d7qrvAkZBWlehWGZHIZdqSHouy9gz7TKXrTdwwAnBT88V+t2ZmtQuj+SSh2+PQedEetVmH7VGIHxnnqrymHUJ2trRAHod674spXP5i7PHB48OB7qA3wj8D1WIHnwVlFJhQxkGJte5fgCVitgYbHSU6pym2CW0ny2N18RhyDeVuuKm0bHjBnl+bgcin5uYH/qStrxKCMOvXMeolERqxccMLkgGTY/3IJYSgcEy2DR04/VrZcnzvmX5pIXQ4ZvkwcSHR8qREuTwBagQWKw0C5rFgFIeeXXnWFhB3Bm5pgiZZbzAwEJF3Jvg193piw4N6r4eBgb0waBnXOdkUmKNW9XRX6xUj1Rn2GZlnCLXbr/GjPQQ0E2jgr7uzfTmZXFQi5oL7msz5HOZ6wnTHN3N+UlR+fCihb+WWGk8VIrl1O77UxV6CBzqSl9vdRYgOn5jV7tQAmVj5PLlyvK+C+SbeaxZZ5H+vlpHmlBrZftI2SRreHJ/TvDBlN04VuhV/hyKzsqsjEF9eSb1cX/5d12Ak0ZBfJobh1rgtLiMBq3c3ytz</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>