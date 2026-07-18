<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY defaultTable "BCDTNGAY">
  <!ENTITY defaultForm "BCDTNGAY">

  <!ENTITY Controller "rptCashFlowForecastingByDays">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 30, 40, 100, 100, 130"/>
      <item value="11001--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRWaPi/k0UKc31v6z1oVf+r6JkJX2vZ9KqqJ8kQU/cewqsTOhUaBVdVEdm49LB47suo+1+9rAFuo+tLaB5bgUT8IIROVB1eqG+ypGAzcMXoP5mM6aMB05Cmb9T42RnzNSIij0kaBS+ghnu7eU+GMUI6YEpCwZtiHkT60TA2/9GM+E</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf2gQ7gaBuaOtf/eIMEUF/kgsfHvp8fDfxIBj4KFaQ/ms9z24RnAQ9FdcLx5Qq4wrq6FKlTnxjoi6LCn4We9wP+Z8hMnk+FlKGk6xXrT11HBCTRO8fhFJx5cnrZeo1QSXgN/iklcn1MV+PaXDPQ6Q5Is=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUTWg9NKASLgzeosF5/CmgDMhna36bK5wrQEJDIfqy+6KwboaRrQrx8ypjGmgiLRZnpPxGwM8eQqmCzHhJqrniRRU38RTz7CTEwk8xLhcOlhqPVWqkUiV4MgAXBIRqQuZuv7q9953Y5K5+uojluQu9pBSzXruOZ1i95ntEOLtEcfzufp/0GCBFFSCnpPBK8qs+g==</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUSh7H+W23t9yJtcKtjQs8+Rrb6ZYk2PQfk9TLTi30gfjNNz9z3z9aDHvnhBdHzOny+RRwgILNl7TqzEHoPiCPgZCy88NlN1Q20y3gSJt9ZHT9OqvLLYFjULcbz/daSGkws2eDe74lvS5VjZBgQuBeu8H0nHaomnbhoZKAAwzb6AvmIH8cKpOLEdAS0a+U70gK+YJY9wZk8o5qbhVQE77fMc=</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTHwlh4q8Mn1z/7zPV5ZiNd3am9YWk4aPKB4sF8D+aDZLWtVegdidJKC7eLYsiSEPHA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2tXCL5wrk9qNA625kuXVvSpwxLXpJcYv95OP8VR3JJkQFzV+aCEC7vmkMmBBm0nFsJpzU4Of1Q9qC5jRn1+0bIuA4UJIkIFcrmH15j0vZztdCWRHUWNrPo6+fHsHnYevD/dlRfvg9nkCeCXs0WxLVoOYwon55jDApdHfwSSVBeEQbzetz6klgw5sabxEAFX3Q==</encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZUB97IIwu1WmyMtW6TmAXH/sweZ1kru+px8kmLwshxb1</encrypted>]]>&Controller;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lbamtouVvYQR/z0sQHzZV/eUz7jxWb/OKzegwictPgiw9OUN85Flgah7WT/DdLh3TRcH74bzAtV96E7hFMcc2RI8CAoiCepR/neBs/7r+WjV9VFZAZseX4g1Z5P+XTYaGiOVXKqD3A+bjQPAlDQMOc3</encrypted>]]>&Controller;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LQsV6CVelrJyOleUwhZ0dKPo2DZQu9ePkZ9/KdcskrYgKteW9PiT7YzqA1UtH4ikig=</encrypted>]]>&Controller;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRq06ni/lbRGBVt+6oQYHRfx3UzNT2Xsl8AWrgot2naZ+Efc6nQwZxAHRb2rqW8vXZBSWFNUQpSJsG7EVQTPq7exwd2FT0rTWn8TwGEJN58+F5XFChfLfHB0c5/BE9KksTR7qM1XYKVwnJZmDwy5z12g5N1r3veAPZ2JyXYP5al0t3D00l1DgNrRspCiU20+Zwkg5Q/vSr+hXRyMiAks6udVZkmZLis8MG/ja0Q3VLdWLZaarOee9Sv1iX8e8PX0tiBI4oZ+FeGTRkwktR/RSC8fsVoQUcnTXotlg1CboRMo/I=</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTL/2OEvE+5ZD332p0T/saM7OMRYXuh4rrGI7FfKiKCiAe6A+dsEdYBCYv4XiADqMUHWNXNdKxV3lzOyTa2gxkCmXkdjPf5jqj9xZrVmgPGBa5qcFUt//92aiJkit2xDdlx5bSukh1bWq9m8AquO1GfmNoLoH2dWNDdi1fYgTAOGsi87EAfBWARCoMIHNYrR/JS8Gubh/jv7VNiR2XiycCnMzfcf1/3yHJZ5HsCRgOziLBUKGm6h248DqsMrkqAu7gpWHDEBMUuQHLDBLEoYUM+OCzN7FlcJ0ogEK+ahFFdr69qc4pJ9hHr2sSiV64p3U//METQunrr8t24xvzFBj2tdplisZ8lbTYB8PW2/c4yMXDtQLxyAZtHZcQb/wafJf2w==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>