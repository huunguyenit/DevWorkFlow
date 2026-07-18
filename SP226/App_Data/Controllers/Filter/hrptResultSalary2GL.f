<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_loai_lg">
      <header v="Mã loại lương" e="Pay Type"></header>
      <items style="AutoComplete" controller="hrPayType" key="status = '1'" check="1 = 1" reference="ten_loai_lg%l" information="ma_loai_lg$hrloailuong.ten_loai_lg%l"/>
    </field>
    <field name="ten_loai_lg%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_no">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_co">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_loai_lg].Label, [ma_loai_lg], [ten_loai_lg%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
      <item value="110100: [tk_co].Label, [tk_co], [ten_tk_co%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T2qoTfeKJgrjs9oB0NPMP0aMRei6Baqn6Snr0FIhPHpCQbQAjSndsidCAXyPNZ8PfnAshZkZxMJ67B4kIRI5NVVvwaW/bQG25AI/GtdAR+9eH3bvsSNzTU/Jw8PLOJT3Q==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7uLa74LvmOcrpSMcE/u9qtB90bcuIxaXGyrcIWzrEPBHMPqhUkrHsAayxUFtpMBjmJ4l7a17vBbSD71vAFzZBsk5LyRRR8M9sdaJYqgkjZVqtXDVxzRol+HbEhwfawVfwrC59PAa6iUuMxoRL8CPhMwy7YtPDOSjNJiDY616vODDMyNC6E0HVGiwsdGne2/EhQRkjQKNBwwmpCKC7m3G+agQp4Iv/tGDTOyTRLWJF+xZPLGKMgUKzpaCJhMS50Xqs=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>