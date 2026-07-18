<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Controller "hrptLaborFluctuationDailyReport">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" onDemand="true">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ImDZagNihz57ml8yiZEUOKU/jxd41VTkSPefdhbKq43</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqIz1lKqqXb/WKyUmafUrdY8nh9Edo4C64OT4ypqnH1Y5</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" onDemand="true">
      <header v="Phân nhóm" e="Department Category"></header>
      <items style="AutoComplete" controller="hrDepartmentCategory" reference="ten_pn%l" key="ma_loai = '{$%c[ma_loai]}' and status = '1'" check="ma_loai = '{$%c[ma_loai]}'"/>
    </field>
    <field name="ten_pn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_bp" type="Decimal" dataFormatString="###0">
      <header v="Bậc bộ phận" e="Department Level"></header>
      <items style="Numeric"></items>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0, 0"/>
      <item value="11: [ngay_bc].Label, [ngay_bc]"/>
      <item value="111001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="1111-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="1111-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="11100-: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11100-: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="11----: [bac_bp].Label, [bac_bp]"/>
      <item value="1100-1: [mau_bc].Label, [mau_bc], [ten_nh_bp3%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzON/nEjNFoizXWtO3oOE2/zwW34IcaQHaHrpFXPG5XfNFz6oitxTwph5y7l4k2/GwJenLrMS0RwQPwUifaTmt9D611U4W5sO6ExmAi/CsdgpGK3rbQFX25WG88fQlXQL9hclVlSkLi1u7S4ozGVISjAnA+iieq2z8h59iofokK2IPFaH97QRkzrPC64sv3DGYGGw38FW/4nA1tec6/wyjuzArpU1IzArPp5xep1iG/gjilkis1Hoo1Xca0GuZlo/5PzQLy038IKZJG2c28cWoKTJl4znqTP+U0kuWPeLBOTrRRJDcR6XayjsVY6mB879Bco65Jh9lxiA8PCOHxeVYEeZ0qafCXASkVNFaFoVXXmUsMKfzgt1xdHTn4g6uZ1fwSzGbpPd1OCufzR3cTkZUAfNu6MRYRWIyHzDBwOwd1FLyoQV3bS7E2fASTNwy9LFEHSXMkXtrtXZboq1LDd+txjRYlhxn07EZBoMP8EWw6UICTQjuxYBRZtNzhnpI2+S6UP7ExVeRCS4IB+X8bzXX7OF7DP9WXkAv4dzWm0erH5oIoglww6lzbnc665pZWN01Pthv4G++uNEtfiG+zpJoIAS8tolAcA405VxQ6xQAbFdxwdPGAls+oSj3jcfibQBQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTjjKmjMurRNum+CqoXAFjH0Pk067btTC5FAWDAjgLdak</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjLniAaBb5AjhriaAlZn04Dz7udg62zkh2TPumTW9Xr/qRxiQn62SO2mBRbq8171xZughPuuuKI0wZ/59r8uqJpHAT2bYnjCsYsu9wg5rDXY1qdwe3O7lCegB5GlX7yTO/CP1DlMVulpXWZM45Kem2WssbUss+EFUoIArWXAl7SjduDwm7hDJxlJNYbxE359pE=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpGGDGCO4/WAVhqjSWXbU8hA1In9UxfBTjCS71iwoDKBo=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wk8iY6kSBHZvABhtF7Zw3+bqTA9/z96QxnGnIdmRaCt9xhDsvsiHIqE7j206k0Cm/vnu79W/vOkSVtS8m/N3UA2g64MKhqEPVxWH3YfMqOR7t59qWhwXLXX5btnmS0UEIP7EPipIcVFp3DCRSyIW1civN5a7WrZkyY1ndwwZWaGMWWVaDt2S8BTV4CXIB5xuzBA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKmGBK+E5FBayKMWp0axAUEHz/jcAKygftUuuspT0qX/EsF0VYJ1dc09/D0q59MD5Cz5SoCQ1JikqU9qvG1Uy8fTq7CTbSau7kQbLHe6PlPC</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>