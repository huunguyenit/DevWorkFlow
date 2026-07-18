<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "rptSalesSummaryByCustomer">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="tk" categoryIndex="1" allowNulls="false">
      <header v="Tk doanh thu" e="Revenue Account"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Tk đối ứng tk dt" e="Ref. Acc. of Rev. Acc."/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_thue" categoryIndex="1" allowNulls="false">
      <header v="Tk thuế" e="Tax Account"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du_thue" categoryIndex="1">
      <header v="Tk đối ứng tk thuế" e="Ref. Acc. of Tax Acc."></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_ck" categoryIndex="1" allowNulls="false">
      <header v="Tk chiết khấu" e="Discount Account"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du_ck" categoryIndex="1">
      <header v="Tk đối ứng tk ck" e="Ref. Acc. of Dis. Acc."/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách hàng" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nvbh" categoryIndex="2">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="2">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="2">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="2">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv1" categoryIndex="2">
      <header v="Nhóm vụ việc" e="Job Group"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nhbp1%l" key="status='1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_vv2" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nhbp2%l" key="status='1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_vv3" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nhbp3%l" key="status='1' and loai_nh=3" check="loai_nh=3"/>
    </field>
    <field name="nh_hd1" categoryIndex="2">
      <header v="Nhóm hợp đồng" e="Contract Group"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nhbp1%l" key="status='1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_hd2" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nhbp2%l" key="status='1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_hd3" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nhbp3%l" key="status='1' and loai_nh=3" check="loai_nh=3"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011-: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11000-: [tk].Label, [tk]"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="11000-: [tk_thue].Label, [tk_thue]"/>
      <item value="11000-: [tk_du_thue].Label, [tk_du_thue]"/>
      <item value="11000-: [tk_ck].Label, [tk_ck]"/>
      <item value="11000-: [tk_du_ck].Label, [tk_du_ck]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011-: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011-: [nh_vv1].Label, [nh_vv1], [nh_vv2], [nh_vv3]"/>
      <item value="11011-: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ialCjbZxlL1O9/U7DD1bawnsbLDOP+8wiXF0BLS8BzTIfi0cCxEycPkePtFVhbjUxHWQqwpDwMO2dwoWYIclIShI+LNOAQ/R3ScDLggDopOy2kmEdRfeRLMuEdAQEZp5MvoKQSLweojKoaeGYGdgIBYKyACXpIBd0fxtlNFoA0oQs4G8pSMFyEKMu93hp3G82kbKzVROrXwgV1JDCtXhMmg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3WMOipSce6VMWLqUzEwJPDvYfGe33HnuhrMQ0zn8t2ZkPPViecqSKsfSdllHbKwJuTWIKUeQp+3nV2n8JAdBuO+W21vEDL/HUGWCLjpMGL7Zd9KPvPBM2ou250RTKcSQmX70oHD1wV1Gd6zIGn+7dEXVSeA6D+z5BIJv3g9/WgtG89Kkx67x0k1/d5IVrSlHGkU/s93UdvhV/uPYvfle4cOsAlajaJUEjc5fNjuyfMEeVXjibFu9tez4itV7wZNqFV16VbP1drbtmPQwA9CQu3K74Z8IHEwWB6NkbGv2q0WPd9FvmVu6w4xJeYhOIh+tl4x094d0gXsv+JZY9qjjr0=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XC7q3/4/UmmtZWkeKS7hMq72RWFl8lPedMFei/QOlceYWAxUBFYMHMz/xe66hIAAaY58r3tMPuA1QSMvNVqf9ei+bopOD1vPIPSRFoWyAuYv5qvsMYUDm6TADVzjQD+SkHEmoL3wJ20OaZvNiEx2rlXCkbYDWC6HOh456Hti0l</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7xi5q9D6JQ7f9/7h34A2HnHguzrx8WEd8ia7+mNZ9YaA3K/BULhmZix06iGz57BnbNZBc+6Uc+TWUUEqr/3vzj7ZiKwCiYydAZ/K1FN9ZSXTcy3kkJTBPcV0Zgev9tTGw5YeOzPYaZUD+iX26UjpJDS0h1ybuIbNeO9rUzx3J6HJf8Xly2LpUotrPQ+YDuVamzU7uyBrDPcgcog+GqtXn7JSwqE5GeL6m17s/TZmIA9gOWuMi0TZGPzacAn2YqB33lGoypFUgCZkTV07kogTHBGm4Tu6wk9ItIzb9gI0gteq8Ju/Ljm30LS8zRZtZHFiXjWUcKEPdX7tcNw4lA6KoCBle2TE8RH+XmOx9pp8RN/JnB4ejM9wjMIGVwIPUErTkA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyrR6PdEUCd9mvrnxdf02JKo80dPxvWXjyx6j2UG/Su47/AkSqdYZ5mJDW4Y84dAyQB8IjBRxEyH/abjqYeC6ZWdCAuLZNbUsKecOKbF/UoKvGBBV4Vm8GVofTa1YkR5CD1Wc76mi1lWCyv2/2uwiZBwAJKu4//05NxC/ZhzKf5YSVCHFY4nIZ0rvm7w70HClCaIig1e2WsKKhjY2W6zB1Wy2Zw58yHEQRtReITWqlIaWWx4oR+glz+fkgjPmO1BXoDtVDSolm/NQk4/DgY3g4R0L9EALA0xTKIX+fqvAMifosJOn5xdfB6BlywkhiTSyd4haqlDFDuWe/RSek0al/T3CWH/yKJ1nd8q89C4t7VVPBJfrLW7AtBTPUFtVQuzSCS1/bLUHMn4sKEXNKhcMbBVx3G+8MFdb3SaB/gwx2KqG25StbWyPA6tyLfH+tgvr6B4rhLW7izFDTT48W27X+OVhHJOJKaSSRAVXiFJXzODP0z0brmUfk24vR78uoPd46kLeUP12vLjV/DvdSJnnYCdMEoX4YsEoOck5D/1hRG4+K5JCJ3Ga5I36VXnQxwa6vyL2DGEa4m0zDSLMOyeh0wHPrB0Mi/SAsofdPkOUO7OPcujpteD1yLTrVSWh/+RoBjJF0QzylMhJn3u9XbU6eObro6iTT04LcnLGS8BHuupf8KSWneRPHKsOYXY2+5xYGkYhicFmBWu+j5G0K/H2ck+wYnje/eVpOJ0MlYhFa02frpNXAdXsuMyDaeBe8F1ghLvcKcJG28omQXoSx5HvtQcW112Uo3YtgX0UDBM5fWHM0E4pEKFHpnP2rEMn3Vx8W97dMgA4GC3iXGUSsT2ybW63SQhcLMqd+TqI3P2l4Y01SEN1vN+jAqv71T0A/tP8R8M3dv7Dhbvew1HprfB9iEZGUrAA9lXanFyXLdfcaHXQ=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>