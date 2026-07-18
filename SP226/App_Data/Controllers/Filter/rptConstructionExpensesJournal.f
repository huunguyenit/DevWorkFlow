<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "DTSOCPDTXD">
  <!ENTITY circularForm195 "DTSOCPDTXD_A04195">
  <!ENTITY circularForm200 "DTSOCPDTXD_A08200">
  <!ENTITY circularForm133 "DTSOCPDTXD_A08133">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99O6fPjFYFikFrSjmxSSX3lAxAPubpjyR5IDRJ6z57PrNayX0rzwroqvNNI81jGNrAg==</Encrypted>]]></clientScript>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"/>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name ="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vv" allowNulls="false">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99B7zBU7SNj9O0wD3YbSV6mj6P95125hDmIOJos5xSLPiMmlY5borjw3QBd/3HrjPxA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Ref. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_du%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &CircularTypeField;

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
    &ReportMarginField;

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" hidden="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101--11: [date_from].Description, [date_from], [date_to], [ngay1], [ngay2]"/>
      <item value="110-: [ngay_mo_so].Label, [ngay_mo_so]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1pVRHR80siB1o0jbGLunY+r+TgyQ+5zs0BeUpyZK6zADUaJCj44hrseaqQocvRhrG9lG7lmWWm4jvroTeduFxfgdi6w/khq1W+k1b3d0U3lj0v9aaStCLvT3o7BWQL3giqzHvjHyK4lrm++K2rwzobic+jE2WLd+VS35YRRGozmD2YRzLrLMZr6rk4lFLzwaLFpxcouMcl+apmVHvf5tpw=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBZLRMKmDIAlpYfnMklmAp9grkEiTukUgGarEMHCfqv8vQtWzG/YmH/HtxpZb0NBaYTa7kdiWb/FsmH8q67i69fo1nNijbNLB/ZQ8Kgc3obg/eB6S5c/gihGSBLYNLCoLg</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7w5cpqmX3EIKPVuu1wM3MsyEcf1YpcGre27NP80MoPt8ZONQ7dE35PkXeQkrawhfyBjrfiLB2RX0/HfghLS7q+kxVeCFQeYBlQToOmUmd5YAwXduqQtDRtTxI386IrS6GMgqJp8zClZoDePYNxXHMuvHbs37wI066qevaXKtWwy3vPYr32aRttrfaHurwNvQRi2EoWa1bpshM2EtSlQyUEUlsFuK8Jb4oIZXu4spXv6aKw59XLq1Iud4HwSe+hwt1Isp4q4guRnju6VZjNlYv6yanPhbGDcX7+mLAz/15E8G2iauL6xQwCl22RKYw1VgCnh2Ulte5Hi01WozSANzrsIzEDI6TH2RNnz+hfRQeuvRigahteShsGNmlla2Xs3d/ZMlRGBVTYDUidOiL45kD47OTPkH2MLxI4rR1W8R7tH38d0I9jcqEqPHv68rg9X/KIVs/KGXFLBQysOdm7Pgb45MLLe652QxzE+KR7HC28V</Encrypted>]]>&CircularTable;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RrB+WpV4oHm3FG+gU1EuIqPbbLbwpbONmErQLjJlS9mKx8Zb+r2wOd+vhCV2REiMhgWjeucbM2pjnfowAXSRCwocwYLt36I6m4MqTFazpUOhscwnHRWUps+pUb4xPZG1N+PXxZC8mbkIdrX5+gvsQsbEVNR4V3oKNfY3I6FDkixgBg1qR0sdMeD4OLy3kOAMi3qdOY9eEnvToGHq+cPUHtbXCM0Qf+eeyO9R8UWpLZw8nbAFWaPk/EyE6jC/m5l7rGLOt9H8scCN89cS07nTqMN33CXrM1ngr1Yq0azJLwXHwrfm/RwysB9wBHQHOuzRAbokTJdWVvfLLqdxS7sqEIaKi7wq2hei+l4dXYmEJRJWsfH+jboxhsfDt/9+S5LGWbvPly8qwYbzvryJsutCaOxBxMTy/PBVJIssDX7lokn9wlgrFVhDNCEMwDK7FTnNJEA4tyEVeP6zKQUxKIVCiTJZLStghewkUI7H0/wYWadQRx/PqgO3xA2N/QQ1MESVBcWzMVAhNANoXzH5hZyp+I=</Encrypted>]]>&CircularForm;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Y/RRvZd2z2+xpcE2sL7WfvylhmgFQI+NT7t/tqbeVttaXTmSw9TuwtqdoSrmSF6bREj3dbIFgziFl0J11d2BJqWQPToFJYr+RPGsQu8AWOCsw6qxD2poTsKoofhVzTR3o5yn6w/t1I7KJsnJYeRHwPGPyKYozrm9JjbtcbdNOTCVGmdq/p2QiTaAjRRGkCjCdkM2d8adgCatk8ZVAizKLGd3veYHkUOxjZ4ssQx7E1Dzsguk3FHOgQtnOCK/K8ieKPai9bVZT6NRmiP7IgqdozYwJLx2QK0WwuKNA6tcD0oorqG/kg5pHoIBdh32C5Z2B6/4slma/W+fRY99L10A0Q2bmc/kBRtqdUEDb2NqrCuzDFzx6ghGgGJVr+zxxNdekyji35ty1cwNWkt7JYrjUQ=</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v06bTwzXOCxy8tJk22TzuMcWsSKbzXS2TAPHP5irXprNp6TURCoQPOg4QWTT5B41ON+lRPU3g8YmXIBv+6pjUqSNS93Q0y8oF+Nt1qFnfDMN14OWdL+R4EqargK2jtjI5leBm4cuCN00GczXL5mZWf/4yh6k6pQ73fhNwo0QpXRUcjjAW7kDzz+Sur/VH5KpkFsnNUxhxH3lZntY7LvVbtKvlw8iUcFz0kaALx0nDxxeDeBjSCVpalDMxWv9/ZPaPTVu2+zgmiloX8Maft5TD89etniiX2et+t6gNorQOmhTlAhq8joSF/2JXB90I8CspT/HCm9cb5m2OuU76kVkzymw3QzhslJ+f5+/TD4Autvn2IlQ13mpd6vAgXeETT+TEypAK7GR8VW5297z33lVlywDxSxWwL+kenXkCrH3L7lKQ7av4oVvLoVjcFbEXwwcByXg2iondzp4oGVuygSLolII8BB4zsFZLvpjm+XnROWfU7ZQ34SwnLs1vO4v5najFUq3AoYXEsHr3TWVvoaqhKw35lzzNWSHnRepebykjM8LQD4Au/NCPv/7E4FPAkzdvFecRE3yuDNWf8Rt42y8fGdgwZf7vNwGdnhPtcLnKQhn9k22vul2zcOiakQNy80Z2WMsfld4uHzjKp5wfyJotKv</Encrypted>]]>&CircularHiddenForm;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fgVA7qXcaJj0jTYEpKQHeSZoY03lb2SSFlHZhOZMy5iCL3rZqXgHjMRWgmgvPiYoO8QriPIdqps4d6Om+0ezCWAv1SJDS3F+0U4MULhb3ag0HEIy/f1AoXQ91DrSYRUqUocykjW3gPoKtH+qKx3GRo4eeIHksVo/qotEomX0ksZm070uKlO95y+vMj4JZNax1pcR9My/Iqvppps0xOYXN8d8THVriGOAW3eKTB3Paur879DZvzhRGOikf2CGIO8iq83zu6ds/5J/2K2jOYRvGc7Q2RIowC87diU0EiO0+KHGqvdyxoh71bJb3QuF1MzHBohvHciyxMLlXW7dhf54MaWGlDt7xu+YFoy4q7cTiBr</Encrypted>]]>
      &CircularScript;
    </text>
  </script>

  <response>
    <action id="Job">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8AUPMAQEyYTAoW+b/ECvX+xUZTUCNqLYcA/fMmnEIHF82YCLpwr8HqgdaVWsiweNFOseXNRuYJefLNg0JvJ7eGVwYL8gCBc94WgCD30xszgY0JcdIhoT1CSmm4YytnBlM=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>