<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V20GLTC3">
  <!ENTITY defaultForm "V20GLTC3">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [form].Label, [form]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cG4JTXLbN+0UUnLb5+RVLtWAUjGWclSbmF0OS2dsOOSpdTdF24FcafJA0nkW+l6nV7KLMYUMIzWRIaeLEkadzmVK5JCl5HI5Nbf2YkK8gsX6FtTUFwm4niHscEmvbulnBC/HfwCe7hWm8TfSH89OUZrg==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77V5xpLVeNny0BSZJxXtN3KK7KAisAQ01pw0oJE+1gA53FLJ88zv1l/zcAeMi5Uy5BDuBXrVPpo4G6buXHLyP0eNAMudIoaM+5TpyOFrxjcwazNvjcKpbR1T1gDJp24+KWv4HWb7ygCRO4Uw0uQDj73gBsY4L139BY0nBtjmi0Y4wXVIV/mVfFh/Kt8UjsYHvw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlpv/gv/lSDqjHkFWO2OVMu8swUO/iYonKcmj9Dz5JRnYDPHvTpqDsJe073PLDlOXeW+KJhXdMvYUsXrTj2k7zNAHQGeQLtAK7aiDfjRf/42vIw==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOe/kCw8rD3NDPOy+mPBmuqTQpyyhKOJD0z7gPpQf7ZmckfK5RrQNpc7eeAnofvPwookh7TdNqeA+iDVSfLLgKd6x8RL9ocV0/98NojtTb8uqg==</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9DBpDVFHb2k5cKmIGYBPgSlkrxTrW56WpuOfd2V2g2+NJdT142MaCyW7VXkII473rhVeCnf5B0mxqymuntg6AV/UAEU0hRf/HPUvf0YOx/Z5pMPHJgritmEWlLD4OjFNX0q5fMHAVb0cmEzAbwJ20Ge</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6ss0KvCYRO2QGLSVwbRy0uGiIArsJytzf7Ybx+jSn1iPSiPN0b/vLHL9MjZrdVbnGeHEOB1jAchq3f5wUFxsKIKQWGfrkmi1kys/aFypjFrfN3rh29iOf6KA9aQMExUU2c0lZcFSYIHqE6I1ahjSg774MesIx1dOKcVKtHZybNLUQ7oPlHXIyJb+koKLvi+0kC/4+rXOTCTBPm+sIPzn5dawa+CEZK215OLXXX9MFDKoDu/Ht6+d0YTToNbpG199nVi8ILOjY4YYn2WLHENpvI86eI5ucyu5iEiMN4F1eHhn3qWVHpnRFI0A6HWAMTIWEygCHlhDfJ5qeNPmrZ7Fue6Qgb8m9/56pgzz8mn+4/LsUYkhLLR+kX6IW/G4wlQE2RSh78+o7vHXWT1u+7O/JwTcx6U7UuXfOTNlbkmUhFOiiJLdyvY9jrMO2nracf6eSOtiEXdHI1rWSRzy3AtM8DFrjmuDYooHXfrDSV4OZgrNcmRucRy1fDKC5f6GRHXKh3yqR4qY3H5L3Ep4yfM0HrDax8pOUMOZkySzkj5ID7nylZ1sChP49Ib33e5efLC4Cb3OZd+AKXOXvW08+ltYBFyc+yL0IViDWvq5LAfhb+jsFm0d8p4DpA9qQfHkKSvR+b007N5O37YgkfPMadau8s</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>