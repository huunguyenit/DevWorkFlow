<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "rptSalesSummaryByPeriod">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="3" align="right">
      <header v="Kiểu báo cáo" e="Report Type"/>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nữa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a Year, 6 - Year"/>
      <items style="Mask"/>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="##0" clientDefault="3">
      <header v="Số kỳ báo cáo" e="Analysis Periods"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Date from"/>
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
      <item value="120, 30, 10, 60, 100, 100, 130"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="1100---: [ngay_bd].Label, [ngay_bd]"/>
      <item value="110011-: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110000-: [tk].Label, [tk]"/>
      <item value="110000-: [tk_du].Label, [tk_du]"/>
      <item value="110000-: [tk_thue].Label, [tk_thue]"/>
      <item value="110000-: [tk_du_thue].Label, [tk_du_thue]"/>
      <item value="110000-: [tk_ck].Label, [tk_ck]"/>
      <item value="110000-: [tk_du_ck].Label, [tk_du_ck]"/>
      <item value="1100100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110011-: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>

      <item value="1100100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1100100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110011-: [nh_vv1].Label, [nh_vv1], [nh_vv2], [nh_vv3]"/>
      <item value="110011-: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>

      <categories>
        <category index="1" columns="120, 30, 10, 60, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 10, 60, 100, 100, 130">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3WMOipSce6VMWLqUzEwJPDvYfGe33HnuhrMQ0zn8t2ZkPPViecqSKsfSdllHbKwJuTWIKUeQp+3nV2n8JAdBuO+W21vEDL/HUGWCLjpMGL7Zd9KPvPBM2ou250RTKcSQo99sDQyKS80Mllb0SqrXjh2T+X73VvcBbJfHV5/u7OrhpnUuN3j/CHwx0YRQYcd3ijk+x5+WAvSBF+PVs+uLhK+M9tlfJD5ztn0Zb0NTeVJQqlvsjB2fBWHzYfCZ7jC3tb8t0OV3xMUcosR9vTJJascz29RuWpjqCyTkHL8LphWozgrHwku2vk7Y/dGApBIeg==</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzp4y0J42zrl8q19KGnKiusitj110mzfs273RvlUHs/bfggxZsv9xmtIMVarguJhyHXzUtkpvDeBP9tFJcO4cKdtx/ramo37bsnN3rk/ocHoVQM3Dg+3OYBSWXJipJBEuKU8YhXS3izLfCEang2E75cPBXpuGbf/B5FywvndNGHf/4HfZI7VH7vsKLSznPfqadbqqe2i2ljKhKbsz8ttF04Qr27yngHGBInEtT/anfFUX/qRkKPdUEs1A5SI68v7F1QWs12Mv24nY+G9Us5NkEovyynmAJ9NbWEDpSichEn9EhQ/iu2SnKCzewCxb1KjiDvDmhGdwSsAND7YvJp2MBbLuYIocQu3cYmX+Eqd62m6ScOblO1XeNmyolaJIBnGusLa/NgOM+Y/mtuyKjao0kaUBt2I95KDwYwzISV53dZsleOtdKSEgD3ZAXkJPRPhSwLqrE9M5yyw6z7yZlAj7YA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR75eMxEqP9ltoXNyhlzdxQ2b9MANAUpD+CspdfuqGlS3G9K6ZEfJvJtnqRF0FoxA02eseEoNLT3MwPxY0UlqiDaYJ88UivjEvbWow+VpxylpoAZ+nXuAeuLHvP2LKdA4IuJSashAFp16yDdUiCe4eivneUjgaZmW31CeL04+xgdy8DyKypn/keWl2h+M/U2n+Y2vB4r3EY6tX8fN2ahinAGXBnJq0hmWCVaLa1rMsFefwC+tZ+05obEipswXOP8//winB4Uhx+TUb2zJks3BiE1CuW0h7y/tnMqBjN4K9LFsXtIxsPWI133X17irMEyjnNKAT8djCCFcfTmKgXsd7Uj8iyj34NocV0+G1PZ9ihRLcLWqoJZSR84R4Jjl7IaeItS0RBxKQkqu1ahzEa5N6E13cDsvpMGn5p5sCx69GEhjaNhCiyO10EcOXRD8bBjYp4Q==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyrR6PdEUCd9mvrnxdf02JKo80dPxvWXjyx6j2UG/Su47/AkSqdYZ5mJDW4Y84dAyQB8IjBRxEyH/abjqYeC6ZWdCAuLZNbUsKecOKbF/UoKvGBBV4Vm8GVofTa1YkR5CD1Wc76mi1lWCyv2/2uwiZBwAJKu4//05NxC/ZhzKf5YSVCHFY4nIZ0rvm7w70HClCaIig1e2WsKKhjY2W6zB1Wy2Zw58yHEQRtReITWqlIaWWx4oR+glz+fkgjPmO1BXoDtVDSolm/NQk4/DgY3g4R0L9EALA0xTKIX+fqvAMifosJOn5xdfB6BlywkhiTSydkoIX/b+YBQlK7TdA4aSYV38jcRuShLCIWaPDkBDPr2CjzKdEkpNwhp4wCMDeSfw7cE/oM5+A4VFQgNmuwGpvrYVSS9F6qeDHNPZgsjwzlT/bjFftHCHBmkuUnbjs+Pz7M6w0LfBy7D9yWPuV1bQlzhLUUF0bhW/UnL4iSzkFE14h1H4a+MjK2MIke8b0IrKR8XJ3MB1C3aULz3FbtOMnJISUboUPCSXuv4jw/AKOpCRR9XO42kafsMEo6Km2NJ1ZxlLQngVg3wd2pvR1a9vW26VkLihZTtUhfedAJhjElVNrPoJZ/kZYJoP4gyJE5BkxnnRftvW6qdMUuQpd0S2P1nEKGnXBqe0EEYxGASInBhdcY6jahIE0f9iyCB8wc9PWA0nV9ns9/M0oVU0ZfLzJxwRCN3fpumGlgC882cA4lfkc3XMJqyKzVG0hhn3fJF5PhDNJ5fKKEFYs/1xir3Qysx/mfB5t6PvJVCqebU/wusoYdqHanN7mj2cyuDWWsK+kfdj8wJd2e2m/x5NDYZuShywqloXC0XK3CBW6Svf0KvFwqoF568hmzumnEsdpix+HhWQ50nLfHDu12J35qRElTCXlsvzxwrwcpopT3+KvM1GcgvehAfek9uhfbjTQZiIc8X72rAYv8hqqY/ay6hfjMVSRxsHVKolIxPqr00b69P6wwuAC/VY2u1dpv3ChT498zS0vBRxCVE0ygAHe5bj6SLL94el9ukorGKosJU1FwAkPQ7iCzrU57+Rnebl5FrP1azmbopariVJDOjzxt0nc8VTcUZJp32hl6wq/SA6UHLiRuX1ThRmpxfEiAjOXyY2Pvly60UF/fDZkU1vLiOStqaDQVTc0dCG3ny4XhJBT0g2aneJWFuvmhghDmdbAooE7qXFxZhhfgz63BmV2iCxfuEkFIRZqDMo7ba11F5wePVI=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>