<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>

    <field name="ct_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết theo mặt hàng" e="Detailed by Goods"/>
      <footer v="1- Có chi tiết, 0 - Không" e="1 - Yes, 0 - No"/>
      <items style="Mask"></items>
    </field>
    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir" height="">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>

      <item value="111000: [ct_theo].Label, [ct_theo], [ct_theo].Description"/>
      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwYr2yQAbtOXS+fWW3PkYhKU9/DtSyaxJBahsRJOhhEqiePZMuzz/Qar1R/AK3SnL5xa8JCOrOYgC7lR0Le8Y05QdxYCMw+ahfgnU85MbwdE8E4irI8JVuRAQPqRLc+UrkWVwKT1zIcCouTlZG9M65LY7ZxPoktIRoWGLE1ECHf+MCeOT/z1xEOMbiH4wNwHPTE9SaBCSsisF2GWmHkHLOimioFJlky7C2Bn4OmI+HC5mRafTkG7GZEZB41E2vtSOYxFt28mFHN7yiAAexfGMrI5/StOeoW8++kqiBCRnuwGwkpiJk7TvCw+XHGOV5ZkAVEaiKtOho37YFglKE6HtiqRK5WE/8mBqgPH29ZE/25qo3ykL8zFcTZ0bNUW9vVQsA0psKbanLtQXL4St2Qo4YnFcaxq8Yz3/1Z5rS3apufgchWvHElYg5bSQNXIuE7wO3Zg9V2pzxNsB6+SD+BoM8ug/AOnD1IaJx1E5L4p7WmikGCS2rnTFUU0f7lH/bv+3w==</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzoFQzpUtyxRKhl7OwrbUCkwxvjs/VV26AQvwNMS7RQkkl7KvNoowpRX8dXrYLR58Lw1OKu6Cna++DSmT879sDZvJBd6xq+3kf+fBZIz/PmvzeyPK7WT1ANvG0qQvdZBOF7bMyERpJh9we50i6ODMBQ376e/9WHy/VeVJGIv+1xFIFoh6LkOyIHMuIU0El6yd+3O7gzxM5vxBypEgQLq2Bm7NjMpthJBUWBC9qe5kLZhcVA/Zo99fnqYC0aDgBDDz9hhKgwLxO24SeITbzXbSxots7Zl8Uygg+XCDNgaCFyveWUc5RmviOLsEAt0W9frGkjoS5TxDHRdyT71mqNj/80mCQ0TA1gCGwZpFiBX3cVIHpjvVyExLU+m1YXZ92kwfPPlJkcUy+UfzKlVzT1bBt0dQIdutSm1yaqxExIMwyLmhDLhh7qIT4Z301OYrJbeTOjOS8S2HQyYVIOwsEmUqIOu1E9+j/QkCVORY939JD1zB/dtgI3aplBZHKqGeJSyA43Nzt6yIWyNcAqu+w5Rv5z4PVqYvRutRTPwScOuJCoC7mq+gtryq2hqbJvTpKIiDbloEQRKpueR1YFr0quX8z4i8e7CDAMJhiY1a0t0ZAuf5ra1Uo2YmNTDTZhjw6fkA1JBQYEcC3pjyQuY68LDiDe/jLcraU01yqa6n0Qju10R9yJnM/Pbh+i0B6gs5Y8i/fOSj+/l8Wnfmb+IozaqyCnB42fsqLa3d8Waen9EI+nxgV22GNoizzVDC5n4RzTFOrhSGHwrbtR3lUPVo6rtivqZM7gBU2/2Y67oyw6iYA5fFTr70yOHp7yCdG9GHFl8x/Of5OBQz7+SYSwYZvpjI39x7qLHHquGIWkUkwCTXWsCr/gjbSkjYWFfWQQeHwkyH9ttLIg7qOuME//dN+1PmyL/EKKJtch4KkuxMFLhja6FcGB38svJI5RhxXB0Me4gkBIFIkApJbkCMzKRe74Sjz/06EmYYuFM2V1CyKgg+qCUzDBR3ACQknYxU456mnJX3orfjJLkxditTf9dImCpRT+IN5tOn1HW1w+sKd0djjsYK</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7xKEZGsXIxRPOy6zGx/npW4orZsUnBYQbkChDF3zwd2IQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>