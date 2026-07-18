<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptAccountSalesReturnList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "&Controller;">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicReportFields ",'&Controller;', '@@sysDatabaseName', '#$query'">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
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

    <field name="tk_tl" categoryIndex="1" allowNulls="false">
      <header v="Tk trả lại" e="Return Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="tk_du_tl" categoryIndex="1">
      <header v="Tk đối ứng tk trả lại" e="Ref. Acc. of Return Acc."></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="tk_thue" categoryIndex="1" allowNulls="false">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="tk_du_thue" categoryIndex="1">
      <header v="Tk đối ứng tk thuế" e="Ref. Acc. of Tax Acc."></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
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
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11000: [tk_tl].Label, [tk_tl]"/>
      <item value="11000: [tk_du_tl].Label, [tk_du_tl]"/>
      <item value="11000: [tk_thue].Label, [tk_thue]"/>
      <item value="11000: [tk_du_thue].Label, [tk_du_thue]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011: [nh_vv1].Label, [nh_vv1], [nh_vv2], [nh_vv3]"/>
      <item value="11011: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu00c2NP/XBXiX7wzaoxIfzJ58Tg7QlupMQx7q1npuYxz2/yEL60eRtLOGas3avwzUinQr2KlkDB2VpUIKvrce69vo6ZnLEyI9n3vMBhdCvTF9KWmRwrNJNnkaQ7odsD9rzC19nOPJYO5c9e+31S6dZZb5yYjboOjYKqN0wg2kGJVH8lFZ8ggjz96HhWQCT73vfZcqr+oqeWWSbBtbNNcx/azjoliu6ag/r/mpFOsYJ+6gTNXKWOfuaL43nXzS62Ow3Gi+uFzl5ssngiwETFj4oGi50on0T4HvhdChJXpufqA</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XC7q3/4/UmmtZWkeKS7hMq72RWFl8lPedMFei/QOlceYWAxUBFYMHMz/xe66hIAAaY58r3tMPuA1QSMvNVqf9ei+bopOD1vPIPSRFoWyAuYv5qvsMYUDm6TADVzjQD+SkHEmoL3wJ20OaZvNiEx2rlXCkbYDWC6HOh456Hti0l</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7xi5q9D6JQ7f9/7h34A2HnHguzrx8WEd8ia7+mNZ9YaA3K/BULhmZix06iGz57BnbNZBc+6Uc+TWUUEqr/3vzj4WlAOJ5xsh78DZU5GK5qK0Qb8zAOuuFs5sg1uQHbhND1CCmoEHrr3s9gobROx3RSK7lQBx1+fYELEFOnwSHy6WsWejV2nY4MXb3Hz9Ni/okHIHH4VlkLlhaVmjELIT2cpx2nneNr1GPTE7xJ53SPyD8mo6tyFMgonaN3I8dUGDI8Vbwl9KJtji0Z04S82nyxY0YzcHLDEb64UzqGwEZgnJyDVxomG8BWorC6jXhFhXkGxT0VI/AkLmMMr3i3AcSN9wWm1NPm2KqiuhspYEbW/QGhBGzYTYatIg4LgDwHJ0XA==</Encrypted>]]>&DynamicReportFields;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyrR6PdEUCd9mvrnxdf02JKo80dPxvWXjyx6j2UG/Su44AJ6AlsZzlvliZPPRpjfVLEUoZbNJ50avlOGzDMJdr6JbGm3l9T3x7ylsJ/nCakvm03dDk3osUklAxxGZlLc0D0JY/IaByUlBQCDWuYlzBqEgiHskjSjUY4E2KR5m77r8vUghzgE/itBFgfaYhrJQ9oMj5ohHdQirP591FTOroyte3nUQijEWP7L+XPsspGLEIawOj6cq6XiKFtAVGu/5qBGsXsV4ALpsryReKfggz7EeFHJUyrFC8qYequbmlD7rKYIW1up0JLkdVVJGDkFiQgFBQjFQVR+PBat9D3N0DM1WeQ3vU2nV/oB2OL1fKuNNyOu9TxSsJgojx7riuYsVfap6phshMNsjDfP1oMuqazsnND8jUC1i8zYsiYfBJIQx0KoJAdZxbgjNXTW5I3sNzysCnB/4/3OK6UiKyZezAggQN9A2P0X81TLWmes50jXbV7lOtVAAQnaFn9RUov+PGIq7ot1ZonQDe7c3uyVxNs/mB43pVUv1nU2PmxyUbODRbNYyXiAa+GSADmZTl7BQnNavLJGUtmP1sy8nuCLAy7cHK5xPNsFI+3BiS6SVrlQo+5sTfRVgAlvDNs4zbdb33LXBmuQ5ad+bUoGyb9JcvmIxpFxdvXkxzM8ZZjKb3rUZmFLzcaKLoxUDlQq7tU3BB5zmzzODFcFqie4bdKc5QLu8/a903Vv63DddCn193gHyoY9sJQt41VLYjV9T7anjf1sEGd7ouMn7qJAagkSNBtO5tTWLUT9eR3Ow6YcL4+s8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>