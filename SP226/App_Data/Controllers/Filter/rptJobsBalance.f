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
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_vv_me" onDemand="true" categoryIndex="1">
      <header v="Vụ việc mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv1" categoryIndex="1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv2" categoryIndex="1">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_vv3" categoryIndex="1">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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

    <field name="nh_theo" dataFormatString="0, 1, 2" clientDefault="0" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="0 - Không, 1 - Vụ việc mẹ, 2 - Khách hàng" e="0 - No, 1 - Parent Job, 2 - Customer"></footer>
      <items style="Mask"/>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>
  <views>
    <view id="Dir" height="185">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [nh_vv1].Label, [nh_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nh_vv2].Label, [nh_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nh_vv3].Label, [nh_vv3], [ten_nh_3%l]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tnjm/cNH2VK0Mz6pH8xI9Hj5PQkn5pT9k2wb6rjeSSQkt0zrOvTlVqMUPU/eXi7p9UroBgpcwfnoS5rtjlgnodaV3hQtk9deDi01evjKcsfxOH2Pauakjz9IskJ6UcimNWoawqlEOSWlGGUH2WaO1XTAiJww3rLPy1ZMecoeAh+1lptOUb4ixv8+Q5KwIp3b/JIX8UGFGJxrgwCZSKhpAz5jH4z61oE8mwe0SbUNM/bI1znO85MkDfPa2mnTgtJ+TUOYi+h5A88K/mc1uCo+9IfIwAanf5jCWBikwUu4H07m4eep6KL0uFJbIqXRqfg/6TKWiJcF2zt92CFm5Cm0hPkNiDTE5VC/dbWmFTgniHfUzexjkdw0Vre/TWFxBiry+vbw5uy3JuIKlENnp92crABfcJMURcwXS8sL8GEzKAmm9P+a0V/lKtzMhbgY05IZhYLperaoskPzT8ozZRMgA4UvbyhOe1DUVPJIC/A5mwURrfpZxel6zK4rWeNp8YZFGU=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EeKL7qb/04iuraroARBQeYbTAeKU1SRCWUXisbykImIgmfvDMeiPPvRi7OZBLduVfMkCzbtHvEV3w8EILJnY6mVMSJZw7eKUuD1qIDl42p+kUjvfxwjhbZnmrdVzITPFhwD5RdEQrFdyLIRlzeAXwyxnydUFv72d8MC27c4+bIxDbgxyFxstAUOSeO77A35tLZo5e1Jrawc1uuf2sRjPoM3EujBGt4+d4lHBg8pNS1PLiVNW/owjB6tedu6R1o0R2YtE+5dr8DF0hphhxKB2tgfccSSqPssDHeK4QOLDtZQumUeXoWq04xa/kEpbCXiCFtvljx1quJq6VOXCdlx8hPQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBQMrwjbFdU+ia5TbwNy9U2qRSdCVhDRAcqiye9GcLeXjuhEnJA05QDaQEMmQnlAOj8Oozc43d+YskGOlm1nZ/LakMBeVAkjNDzHSNO79li2KtprRPQ7hjuZggq+PNQykQx4U1cY4TOcEuQmQIxrv17/NUzgTwvCK+wpV2Tu00hkw+aghrEKnJ4u7vejOyTwtI4SmfuozEY6Ki7xysfY4NuLro+1OgE/RJj/Oek4wBFQE4mG/d5V1G07bFLiPVO1M6XeZAMEfClGvyO60HdIjA5Le+l65Mc8rZ5DtjvDYnDWxeHMsbcBIm/8XSjYfDy53y4+gx06dC6QVfP27cBbsvxpl83vQJxtRoGzsvu8cEsokOxYHzBBMO8oKXWMEBZnJz5u6L46IoZ+37oSvMOHUeCDePsgB1D2PRF4nrKMOrlDvk9cU0jdPLDBXG5Pla2g9inDhlRac8JThvFJMh4dMXCr7sHYYEVLlXi/iwEHwKpcHoYUChDh65nd5BiK7J0Af61hNU9Hhait5LsCUsWaLsdltctKVa0LcnNm21kzMeXop+kxvyawnQKp6qLSyTOaX7fX2PZEqBl6SmVXuMDPadrzKcQ7myTXidUeC8yNjE32nbE/9qK/M2ifqDV9qvwbjhzsRDWk3raQjhqnYrka+Cadak1r+OcbZ5ELD9MGpGZ40zS5pOxlvZubIaTclMyUBsih1TLjpkxStTd6DdgUW1DUscpriuQVCVmsAr7F7Xe7K+fCEQR6yNJ59a+Uw1ILX8vo9LD5YxCGfzjlNJkRQEmvf/VYaF0O5I3fYTpO+28JA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>